Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A3C2C10F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 17:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732961AbgKWQlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 11:41:31 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:22789 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732868AbgKWQlb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 11:41:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606149690; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=k1Ws3eLYJmyc8Z5gKvjwQtLfC/TAMUMLGzx+OItBEXk=;
 b=Pc7qboiO4aXMFHOYS4q+A/krXskkPOI2p7mtuCIZ3Qz7nC7dpWIz4YMc+k0wXAgC/Q16nkEj
 igq8TcYe9XyCbUuSxi6hQdQYDug2XwIyBUlR73/TCFcSxCREEw12YdXuNHBg9SGOckT5uYg5
 97a0HOmeTDW22xfoAt9z03lhTkc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fbbe62fe714ea6501160930 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 16:41:19
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29C68C43465; Mon, 23 Nov 2020 16:41:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34592C433C6;
        Mon, 23 Nov 2020 16:41:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 22:11:18 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv8 1/8] iommu/io-pgtable-arm: Add support to use system
 cache
In-Reply-To: <20201123150616.GB11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <699f30cd6b3d69cebbefd0e73850694b9852c5da.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123150616.GB11033@willie-the-truck>
Message-ID: <fa32d9c8f869a5d96729d534ec26490a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 20:36, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:40PM +0530, Sai Prakash Ranjan wrote:
>> Add a quirk IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to override
>> the attributes set in TCR for the page table walker when
>> using system cache.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/io-pgtable-arm.c | 10 ++++++++--
>>  include/linux/io-pgtable.h     |  4 ++++
>>  2 files changed, 12 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>> b/drivers/iommu/io-pgtable-arm.c
>> index a7a9bc08dcd1..7c9ea9d7874a 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -761,7 +761,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg 
>> *cfg, void *cookie)
>> 
>>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>>  			    IO_PGTABLE_QUIRK_NON_STRICT |
>> -			    IO_PGTABLE_QUIRK_ARM_TTBR1))
>> +			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
>> +			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
>>  		return NULL;
>> 
>>  	data = arm_lpae_alloc_pgtable(cfg);
>> @@ -773,10 +774,15 @@ arm_64_lpae_alloc_pgtable_s1(struct 
>> io_pgtable_cfg *cfg, void *cookie)
>>  		tcr->sh = ARM_LPAE_TCR_SH_IS;
>>  		tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
>>  		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
>> +		if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
>> +			goto out_free_data;
>>  	} else {
>>  		tcr->sh = ARM_LPAE_TCR_SH_OS;
>>  		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
>> -		tcr->orgn = ARM_LPAE_TCR_RGN_NC;
>> +		if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
>> +			tcr->orgn = ARM_LPAE_TCR_RGN_NC;
>> +		else
>> +			tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
>>  	}
>> 
>>  	tg1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1;
>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>> index 4cde111e425b..a9a2c59fab37 100644
>> --- a/include/linux/io-pgtable.h
>> +++ b/include/linux/io-pgtable.h
>> @@ -86,6 +86,9 @@ struct io_pgtable_cfg {
>>  	 *
>>  	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>>  	 *	for use in the upper half of a split address space.
>> +	 *
>> +	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the attributes set in 
>> TCR for
>> +	 *	the page table walker when using system cache.
> 
> Please can you reword this to say:
> 
>   "Override the outer-cacheability attributes set in the TCR for a 
> non-coherent
>    page-table walker."
> 

Sure, thanks.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
