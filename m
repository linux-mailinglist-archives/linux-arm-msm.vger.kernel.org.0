Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89FE6E8B16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 15:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388712AbfJ2OoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 10:44:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42362 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbfJ2OoV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 10:44:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 745F860AD9; Tue, 29 Oct 2019 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572360260;
        bh=Cmr+zKAVQ6jEvDIP2LI+oD7q9FkjSncbqXOBHRCuysY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SEjue9U9SRO4eJHpVe9e4OyUEQRe8vErELE4q31TV3sox1UCGlZDZMqcBUW0v0TNy
         FcOZpFnGN2SwBdrfBem1OxQflxB+1sd2Twcc3BqAUWrKpxclMhLY3rcnS7GVneW2fR
         kAkaO3u03hD57HP8m9bPIk+s3u4PdfCpua4s8fT8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB25360A74;
        Tue, 29 Oct 2019 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572360259;
        bh=Cmr+zKAVQ6jEvDIP2LI+oD7q9FkjSncbqXOBHRCuysY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T3PFd8CYlF/5yVyrsNv7Vom/zoW4OT85zY6KbACy6cWMqjQWapOEMl2KDqrG7yDMP
         iNdIaP8P+in/mqWlqfMHAVL2Ua801W+3EYWbKFqO65pIVInQNgxmYEzld/mgRxEH3K
         jbCJwu4Uetu2e/2s02dmeFVrWL5tpS7Wc93C6gyg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB25360A74
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] arm64: cpufeature: Enable Qualcomm Falkor errata 1009 for
 Kryo
To:     Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
References: <20191029060604.1208925-1-bjorn.andersson@linaro.org>
 <20191029115008.GD12103@willie-the-truck>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <16ccb343-8253-0224-e957-c73f51f110a1@codeaurora.org>
Date:   Tue, 29 Oct 2019 08:44:17 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029115008.GD12103@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/29/2019 4:50 AM, Will Deacon wrote:
> On Mon, Oct 28, 2019 at 11:06:04PM -0700, Bjorn Andersson wrote:
>> The Kryo cores share errata 1009 with Falkor, so add their model
>> definitions and enable it for them as well.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>   arch/arm64/include/asm/cputype.h | 4 ++++
>>   arch/arm64/kernel/cpu_errata.c   | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
>> index b1454d117cd2..8067476ea2e4 100644
>> --- a/arch/arm64/include/asm/cputype.h
>> +++ b/arch/arm64/include/asm/cputype.h
>> @@ -84,6 +84,8 @@
>>   #define QCOM_CPU_PART_FALKOR_V1		0x800
>>   #define QCOM_CPU_PART_FALKOR		0xC00
>>   #define QCOM_CPU_PART_KRYO		0x200
>> +#define QCOM_CPU_PART_KRYO_GOLD		0x211
>> +#define QCOM_CPU_PART_KRYO_SILVER	0x205

These are not Kryo part numbers (8998+).  They are Hydra ones.

> 
> Can you double-check this, please? My Pixel-1 phone claims something with
> 0x201, but I don't know if that's what you were aiming for. It would be
> great if Qualcomm could document these register fields somewhere, especially
> since we're trying to work around their hardware errata for them.

I wish I could point you to public documentation.  I don't happen to 
know where it is.  As far as 8996 goes, there are quite a few part 
numbers.  The ones I could find are:
201
205
211
241
251

281 happens to be QDF2432

> 
> That said...
> 
>>   #define NVIDIA_CPU_PART_DENVER		0x003
>>   #define NVIDIA_CPU_PART_CARMEL		0x004
>> @@ -109,6 +111,8 @@
>>   #define MIDR_QCOM_FALKOR_V1 MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR_V1)
>>   #define MIDR_QCOM_FALKOR MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR)
>>   #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
>> +#define MIDR_QCOM_KRYO_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_GOLD)
>> +#define MIDR_QCOM_KRYO_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_SILVER)
>>   #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
>>   #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>>   #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>> index cdd8df033536..315780e7bee7 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -627,6 +627,8 @@ static const struct midr_range arm64_harden_el2_vectors[] = {
>>   static const struct midr_range arm64_repeat_tlbi_cpus[] = {
>>   #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
>>   	MIDR_RANGE(MIDR_QCOM_FALKOR_V1, 0, 0, 0, 0),
>> +	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_GOLD),
>> +	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_SILVER),
> 
> ... why aren't you following what we do for E1003 and using the
> 'is_kryo_midr' callback to match these CPUs?
> 
> Will
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
