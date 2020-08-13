Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E25243782
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 11:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgHMJUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 05:20:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45007 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgHMJT7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 05:19:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597310399; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rqTuz315PIl0OvWEUQPSIGL8Yokr6Ob5ozpoNbkalTU=;
 b=rL5RVbFK5Rea+CS5JPIpfnfobNiIg0Yne0zYiekKQSv4b7/Yen8By4kHWhxbxg43O3JOKUR1
 3oRaM0SPeZz1eGnKKOniV5+2o5vZpUH0AtWMmUUWjLoLWfHKwm3jt+OolDMgI8ROFUFboAMi
 LjyLDb8Fiz+pqjPp9Eabz/urXRk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f3505aa46ed996674c77ea9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 09:19:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E961C433CA; Thu, 13 Aug 2020 09:19:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B43BC433C9;
        Thu, 13 Aug 2020 09:19:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 13 Aug 2020 14:49:37 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add KRYO4XX gold CPU core to spectre-v2 safe list
In-Reply-To: <20200813090324.GB9829@willie-the-truck>
References: <20200813081834.13576-1-saiprakash.ranjan@codeaurora.org>
 <20200813090324.GB9829@willie-the-truck>
Message-ID: <89f0f41514e547533c3fa66364e5a2ac@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-13 14:33, Will Deacon wrote:
> On Thu, Aug 13, 2020 at 01:48:34PM +0530, Sai Prakash Ranjan wrote:
>> KRYO4XX gold/big CPU cores are based on Cortex-A76 which has CSV2
>> bits set and are spectre-v2 safe. But on big.LITTLE systems where
>> they are coupled with other CPU cores such as the KRYO4XX silver
>> based on Cortex-A55 which are spectre-v2 safe but do not have CSV2
>> bits set, the system wide safe value will be set to the lowest value
>> of CSV2 bits as per FTR_LOWER_SAFE defined for CSV2 bits of register
>> ID_AA64PFR0_EL1.
>> 
>> This is a problem when booting a guest kernel on gold CPU cores
>> where it will incorrectly report ARM_SMCCC_ARCH_WORKAROUND_1 warning
>> and consider them as vulnerable for Spectre variant 2 due to system
>> wide safe value which is used in kvm emulation code when reading id
>> registers. One wrong way of fixing this is to set the FTR_HIGHER_SAFE
>> for CSV2 bits, so instead add the KRYO4XX gold CPU core to the safe
>> list which will be consulted even when the sanitised read reports
>> that CSV2 bits are not set for KRYO4XX gold cores.
>> 
>> Reported-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  arch/arm64/kernel/cpu_errata.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/arm64/kernel/cpu_errata.c 
>> b/arch/arm64/kernel/cpu_errata.c
>> index 6bd1d3ad037a..6cbdd2d98a2a 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -545,6 +545,7 @@ static const struct midr_range 
>> spectre_v2_safe_list[] = {
>>  	MIDR_ALL_VERSIONS(MIDR_HISI_TSV110),
>>  	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
>>  	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
>> +	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
> 
> We shouldn't be putting CPUs in the safe list when they have CSV2 
> reporting
> that they are mitigated in hardware, so I don't think this is the right
> approach.
> 

Ok but the only thing I find wrong in this approach is that it is a 
redundant
information because CSV2 is already advertising the mitigation, but 
again
CSV2 check is done first so it doesn't really hurt to add it to the safe
list because we already know that it is safe.

> Sounds more like KVM should advertise CSV2 for the vCPUs if all of the
> physical CPUs without CSV2 set are on the safe list. But then again, 
> KVM
> has always been slightly in denial about big.LITTLE because you can't
> sensibly expose it to a guest if there are detectable differences...
> 

Sorry but I don't see how the guest kernel will see the CSV2 bits set 
for
gold CPU cores without actually adding them to the safe list or reading 
the
not sanitised value of ID_AA64PFR0_EL1 ?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
