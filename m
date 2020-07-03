Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9B0213DD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 18:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgGCQ7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 12:59:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37608 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGCQ7U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 12:59:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593795559; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+gnWJZLQFOi3Y3xgbq+Jj83g8jf7HMQgZHy7FN5ldrA=;
 b=fDmiVC3/UUDh81x2fPLdbadyxJH4jm5fhdKF2HrnItzWXJY8XBT/Ox7Y7x+ggbt4KMtzRE6P
 pHfnmM8MegU/7n+BxWqEJBhkf2K8SfULnDHzyQ4zgSLw/DK+ABSYaCPL35oT1uQehqPrZqSH
 S0c/d1A8odRb5I4O+O31CZbeTVA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5eff63e7356bcc26abeb13a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Jul 2020 16:59:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93A4CC433B1; Fri,  3 Jul 2020 16:59:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CB36C433C6;
        Fri,  3 Jul 2020 16:59:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 03 Jul 2020 22:29:16 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Emil Velikov <emil.velikov@collabora.com>
Subject: Re: [PATCHv3 7/7] drm/msm/a6xx: Add support for using system
 cache(LLC)
In-Reply-To: <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
 <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
 <20200703133732.GD18953@willie-the-truck>
 <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
 <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
Message-ID: <c925406446bb2f6c7aead8e047672cae@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-03 21:34, Rob Clark wrote:
> On Fri, Jul 3, 2020 at 7:53 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Will,
>> 
>> On 2020-07-03 19:07, Will Deacon wrote:
>> > On Mon, Jun 29, 2020 at 09:22:50PM +0530, Sai Prakash Ranjan wrote:
>> >> diff --git a/drivers/gpu/drm/msm/msm_iommu.c
>> >> b/drivers/gpu/drm/msm/msm_iommu.c
>> >> index f455c597f76d..bd1d58229cc2 100644
>> >> --- a/drivers/gpu/drm/msm/msm_iommu.c
>> >> +++ b/drivers/gpu/drm/msm/msm_iommu.c
>> >> @@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu,
>> >> uint64_t iova,
>> >>              iova |= GENMASK_ULL(63, 49);
>> >>
>> >>
>> >> +    if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
>> >> +            prot |= IOMMU_SYS_CACHE_ONLY;
>> >
>> > Given that I think this is the only user of IOMMU_SYS_CACHE_ONLY, then
>> > it
>> > looks like it should actually be a property on the domain because we
>> > never
>> > need to configure it on a per-mapping basis within a domain, and
>> > therefore
>> > it shouldn't be exposed by the IOMMU API as a prot flag.
>> >
>> > Do you agree?
>> >
>> 
>> GPU being the only user is for now, but there are other clients which
>> can use this.
>> Plus how do we set the memory attributes if we do not expose this as
>> prot flag?
> 
> It does appear that the downstream kgsl driver sets this for basically
> all mappings.. well there is some conditional stuff around
> DOMAIN_ATTR_USE_LLC_NWA but it seems based on the property of the
> domain.  (Jordan may know more about what that is about.)  But looks
> like there are a lot of different paths into iommu_map in kgsl so I
> might have missed something.
> 
> Assuming there isn't some case where we specifically don't want to use
> the system cache for some mapping, I think it could be a domain
> attribute that sets an io_pgtable_cfg::quirks flag
> 

Ok then we are good to remove unused sys cache prot flag which Will has 
posted.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
