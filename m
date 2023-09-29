Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4E47B389A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 19:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbjI2RZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 13:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbjI2RZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 13:25:42 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 658B9CC9
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 10:25:34 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666101FB;
        Fri, 29 Sep 2023 10:26:12 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96DD3F59C;
        Fri, 29 Sep 2023 10:25:32 -0700 (PDT)
Message-ID: <70d975d0-8ee7-9f08-7fae-4652a18df598@arm.com>
Date:   Fri, 29 Sep 2023 18:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Content-Language: en-GB
To:     Will Deacon <will@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        David Heidelberg <david@ixit.cz>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
 <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
 <20230929154507.GA30764@willie-the-truck>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230929154507.GA30764@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2023 4:45 pm, Will Deacon wrote:
> On Mon, Sep 25, 2023 at 06:54:42PM +0100, Robin Murphy wrote:
>> On 2023-04-10 19:52, Dmitry Baryshkov wrote:
>>> If the Adreno SMMU is dma-coherent, allocation will fail unless we
>>> disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
>>> coherent SMMUs (like we have on sm8350 platform).
>>
>> Hmm, but is it right that it should fail in the first place? The fact is
>> that if the SMMU is coherent then walks *will* be outer-WBWA, so I honestly
>> can't see why the io-pgtable code is going out of its way to explicitly
>> reject a request to give them the same attribute it's already giving then
>> anyway :/
>>
>> Even if the original intent was for the quirk to have an over-specific
>> implication of representing inner-NC as well, that hardly seems useful if
>> what we've ended up with in practice is a nonsensical-looking check in one
>> place and then a weird hacky bodge in another purely to work around it.
>>
>> Does anyone know a good reason why this is the way it is?
> 
> I think it was mainly because the quick doesn't make sense for a coherent
> page-table walker and we could in theory use that bit for something else
> in that case.

Yuck, even if we did want some horrible notion of quirks being 
conditional on parts of the config rather than just the format, then the 
users would need to be testing for the same condition as the pagetable 
code itself (i.e. cfg->coherent_walk), rather than hoping some other 
property of something else indirectly reflects the right information - 
e.g. there'd be no hope of backporting this particular bodge before 5.19 
where the old iommu_capable(IOMMU_CAP_CACHE_COHERENCY) always returned 
true, and in future we could conceivably support coherent SMMUs being 
configured for non-coherent walks on a per-domain basis.

Furthermore, if we did overload a flag to have multiple meanings, then 
we'd have no way of knowing which one the caller was actually expecting, 
thus the illusion of being able to validate calls in the meantime isn't 
necessarily as helpful as it seems, particularly in a case where the 
"wrong" interpretation would be to have no effect anyway. Mostly though 
I'd hope that if we ever got anywhere near the point of running out of 
quirk bits we'd have already realised that it's time for a better 
interface :(

Based on that, I think that when I do get round to needing to touch this 
code, I'll propose just streamlining the whole quirk.

Cheers,
Robin.
