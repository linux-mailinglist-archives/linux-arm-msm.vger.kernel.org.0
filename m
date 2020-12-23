Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214822E1DC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 16:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725267AbgLWPLt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 10:11:49 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:35854 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgLWPLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 10:11:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608736288; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0aAZ/bMuIrvzWM9gWlmih4RGaEX1HT300DY+Q/rbUMw=;
 b=VebNSxyLTvD4kufvvlMtJCSnfwRYCEgFe7Ec5Tns1Z/gUL3i7eKsr732Bt6k//C8TliQYw4n
 o1nG5VUV69l2ZLEW9WrftLDP0QK1jaDNZMdn9QjTdJImqm8bDfcjjZLnmBrMKR2TCBwFoioi
 jsC/bTnFyeljH0VDUtVmXlG6DeQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fe35e02b00c0d7ad475ea3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 15:10:58
 GMT
Sender: isaacm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7046EC43461; Wed, 23 Dec 2020 15:10:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: isaacm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E4CBC433C6;
        Wed, 23 Dec 2020 15:10:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 23 Dec 2020 07:10:56 -0800
From:   isaacm@codeaurora.org
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, pratikp@codeaurora.org,
        joro@8bytes.org, kernel-team@android.com, will@kernel.org,
        pdaly@codeaurora.org
Subject: Re: [PATCH v2 3/7] iommu/arm-smmu: Add dependency on io-pgtable
 format modules
In-Reply-To: <b86f5972-2e9c-20bd-eee3-ee3ea53d5fe6@arm.com>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-4-git-send-email-isaacm@codeaurora.org>
 <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
 <e47f14b81d90772346ef28c9a7fd3365@codeaurora.org>
 <b86f5972-2e9c-20bd-eee3-ee3ea53d5fe6@arm.com>
Message-ID: <d2af5f0b1543ad374bc419507455a3cf@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-23 05:05, Robin Murphy wrote:
> On 2020-12-22 19:49, isaacm@codeaurora.org wrote:
>> On 2020-12-22 11:27, Robin Murphy wrote:
>>> On 2020-12-22 00:44, Isaac J. Manjarres wrote:
>>>> The SMMU driver depends on the availability of the ARM LPAE and
>>>> ARM V7S io-pgtable format code to work properly. In preparation
>>> 
>>> Nit: we don't really depend on v7s - we *can* use it if it's
>>> available, address constraints are suitable, and the SMMU
>>> implementation actually supports it (many don't), but we can still
>>> quite happily not use it even so. LPAE is mandatory in the
>>> architecture so that's our only hard requirement, embodied in the
>>> kconfig select.
>>> 
>>> This does mean there may technically still be a corner case involving
>>> ARM_SMMU=y and IO_PGTABLE_ARM_V7S=m, but at worst it's now a runtime
>>> failure rather than a build error, so unless and until anyone
>>> demonstrates that it actually matters I don't feel particularly
>>> inclined to give it much thought.
>>> 
>>> Robin.
>>> 
>> Okay, I'll fix up the commit message, as well as the code, so that it
>> only depends on io-pgtable-arm.
> 
> Well, IIUC it would make sense to keep the softdep for when the v7s
> module *is* present; I just wanted to clarify that it's more of a
> nice-to-have rather than a necessity.
> 
> Robin.
> 
Understood, I will keep it there and reword the commit msg. I just tried 
it out in an environment
where the io-pgtable-arm-v7s module isn't present, and I didn't see any
warnings or error messages, and the SMMU driver module was loaded 
properly,
so yes, it's good to have it.

Thanks,
Isaac
>> Thanks,
>> Isaac
>>>> for having the io-pgtable formats as modules, add a "pre"
>>>> dependency with MODULE_SOFTDEP() to ensure that the io-pgtable
>>>> format modules are loaded before loading the ARM SMMU driver module.
>>>> 
>>>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>>>> ---
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>> 
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index d8c6bfd..a72649f 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -2351,3 +2351,4 @@ MODULE_DESCRIPTION("IOMMU API for ARM 
>>>> architected SMMU implementations");
>>>>   MODULE_AUTHOR("Will Deacon <will@kernel.org>");
>>>>   MODULE_ALIAS("platform:arm-smmu");
>>>>   MODULE_LICENSE("GPL v2");
>>>> +MODULE_SOFTDEP("pre: io-pgtable-arm io-pgtable-arm-v7s");
>>>> 
>>> 
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
