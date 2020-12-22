Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F56F2E0F16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 20:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgLVTuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 14:50:21 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:26192 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgLVTuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 14:50:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608666602; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1/n4spgUgB5z8HHtSAnD/C3uM02O7wS2g73gRhhMe3Y=;
 b=Z2P/8SeQtisXnK1YkQdZD3/t0JjWaSOkGBs/ONtEZ2fPbVHv4YRh0yRQ35Mp3Kt77q+17SbG
 5Q6M5zqf1AJfh3fjYqsUWJH+lo9Ht29nCbbcrtxGZWMqosb+F99/UPS/Y/76YTdxYqeirbjw
 akmXVNF2XQOqPaRE1TqyF8Z6UWI=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fe24dcd7036173f4f7d6266 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 19:49:33
 GMT
Sender: isaacm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27C43C43462; Tue, 22 Dec 2020 19:49:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: isaacm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43125C433CA;
        Tue, 22 Dec 2020 19:49:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 22 Dec 2020 11:49:32 -0800
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
In-Reply-To: <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-4-git-send-email-isaacm@codeaurora.org>
 <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
Message-ID: <e47f14b81d90772346ef28c9a7fd3365@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-22 11:27, Robin Murphy wrote:
> On 2020-12-22 00:44, Isaac J. Manjarres wrote:
>> The SMMU driver depends on the availability of the ARM LPAE and
>> ARM V7S io-pgtable format code to work properly. In preparation
> 
> Nit: we don't really depend on v7s - we *can* use it if it's
> available, address constraints are suitable, and the SMMU
> implementation actually supports it (many don't), but we can still
> quite happily not use it even so. LPAE is mandatory in the
> architecture so that's our only hard requirement, embodied in the
> kconfig select.
> 
> This does mean there may technically still be a corner case involving
> ARM_SMMU=y and IO_PGTABLE_ARM_V7S=m, but at worst it's now a runtime
> failure rather than a build error, so unless and until anyone
> demonstrates that it actually matters I don't feel particularly
> inclined to give it much thought.
> 
> Robin.
> 
Okay, I'll fix up the commit message, as well as the code, so that it
only depends on io-pgtable-arm.

Thanks,
Isaac
>> for having the io-pgtable formats as modules, add a "pre"
>> dependency with MODULE_SOFTDEP() to ensure that the io-pgtable
>> format modules are loaded before loading the ARM SMMU driver module.
>> 
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index d8c6bfd..a72649f 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -2351,3 +2351,4 @@ MODULE_DESCRIPTION("IOMMU API for ARM 
>> architected SMMU implementations");
>>   MODULE_AUTHOR("Will Deacon <will@kernel.org>");
>>   MODULE_ALIAS("platform:arm-smmu");
>>   MODULE_LICENSE("GPL v2");
>> +MODULE_SOFTDEP("pre: io-pgtable-arm io-pgtable-arm-v7s");
>> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
