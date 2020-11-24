Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C312C1C75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgKXEC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:02:56 -0500
Received: from z5.mailgun.us ([104.130.96.5]:25234 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbgKXEC4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:02:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606190576; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FoFdssz2mmWQah99fW3jkhC1o+yA5snIRe1I3agQdNA=;
 b=iyfizJcYh9Qxw6k07RHXTW1oqe5vATSFvdAbpHUgrGa5lnyQtIkmw8UsGtXFqljsWsGgREnL
 /gdhyRfb8EBzALhziS4LdVHTDkPlNW0DzkKBzciZWb4Ln1ow51oSP/1dk39UdTHdxbrAQan1
 8vCDI9BfHRBTMWtJva8X+nycKw0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbc85ef7e9d874dfc25cbff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 04:02:55
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37898C43468; Tue, 24 Nov 2020 04:02:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19B4BC433ED;
        Tue, 24 Nov 2020 04:02:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Nov 2020 09:32:54 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
In-Reply-To: <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
 <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
 <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
Message-ID: <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-24 00:52, Rob Clark wrote:
> On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> On 2020-11-23 20:51, Will Deacon wrote:
>> > On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
>> >> Some hardware variants contain a system cache or the last level
>> >> cache(llc). This cache is typically a large block which is shared
>> >> by multiple clients on the SOC. GPU uses the system cache to cache
>> >> both the GPU data buffers(like textures) as well the SMMU pagetables.
>> >> This helps with improved render performance as well as lower power
>> >> consumption by reducing the bus traffic to the system memory.
>> >>
>> >> The system cache architecture allows the cache to be split into slices
>> >> which then be used by multiple SOC clients. This patch series is an
>> >> effort to enable and use two of those slices preallocated for the GPU,
>> >> one for the GPU data buffers and another for the GPU SMMU hardware
>> >> pagetables.
>> >>
>> >> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
>> >> Patch 7 and 8 are minor cleanups for arm-smmu impl.
>> >>
>> >> Changes in v8:
>> >>  * Introduce a generic domain attribute for pagetable config (Will)
>> >>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
>> >>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config
>> >> (Will)
>> >
>> > Modulo some minor comments I've made, this looks good to me. What is
>> > the
>> > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
>> > the
>> > MSM GPU driver and I'd like to avoid conflicts with that.
>> >
>> 
>> SMMU bits are pretty much independent and GPU relies on the domain
>> attribute
>> and the quirk exposed, so as long as SMMU changes go in first it 
>> should
>> be good.
>> Rob?
> 
> I suppose one option would be to split out the patch that adds the
> attribute into it's own patch, and merge that both thru drm and iommu?
> 

Ok I can split out domain attr and quirk into its own patch if Will is
fine with that approach.

> If Will/Robin dislike that approach, I'll pick up the parts of the drm
> patches which don't depend on the new attribute for v5.11 and the rest
> for v5.12.. or possibly a second late v5.11 pull req if airlied
> doesn't hate me too much for it.
> 
> Going forward, I think we will have one or two more co-dependent
> series, like the smmu iova fault handler improvements that Jordan
> posted.  So I would like to hear how Will and Robin prefer to handle
> those.
> 
> BR,
> -R
> 

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
