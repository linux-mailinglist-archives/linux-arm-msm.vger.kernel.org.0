Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BAC244456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 06:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgHNEfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 00:35:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55358 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgHNEfD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 00:35:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597379701; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=O+YXpiXi1aKhvrMTEpWfpAywLALFnaHtIH6SlbxpOfw=;
 b=ujtO8vxcPBPV53JIcokgq0bppGt/bNlDzasbMdzxEwspGMbCZNmNKfizOCr11R+kjS1RL8QD
 h7nVMZtzADetzQ9q4RdbPnSA/V5CEwKHI8/hm7Mb+zPtiPGAOaiMZHHXKdDB1vSxYYqXndc+
 eCjMBhnDS3yidbyLy/RPCk78ho8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f3614754c787f237bb4aabe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 04:35:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8FD6AC43395; Fri, 14 Aug 2020 04:35:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E7B9C433C6;
        Fri, 14 Aug 2020 04:34:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Aug 2020 10:04:59 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add KRYO4XX gold CPU core to spectre-v2 safe list
In-Reply-To: <8ffd22d5926aedda0c9fa6ea429fd84e@kernel.org>
References: <20200813081834.13576-1-saiprakash.ranjan@codeaurora.org>
 <20200813090324.GB9829@willie-the-truck>
 <89f0f41514e547533c3fa66364e5a2ac@codeaurora.org>
 <20200813094041.GA9894@willie-the-truck>
 <ff6fa7bd817d49e8ef9bee5c1e13d99c@kernel.org>
 <368280026c8af5b5a58a52c1e19cfae9@codeaurora.org>
 <8ffd22d5926aedda0c9fa6ea429fd84e@kernel.org>
Message-ID: <d4ad5ade9815632f450374c9b6bbe9d2@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-13 23:29, Marc Zyngier wrote:
> On 2020-08-13 13:33, Sai Prakash Ranjan wrote:
>> On 2020-08-13 16:09, Marc Zyngier wrote:
>>> On 2020-08-13 10:40, Will Deacon wrote:
>>>> On Thu, Aug 13, 2020 at 02:49:37PM +0530, Sai Prakash Ranjan wrote:
>>>>> On 2020-08-13 14:33, Will Deacon wrote:
>>>>> > On Thu, Aug 13, 2020 at 01:48:34PM +0530, Sai Prakash Ranjan wrote:
>>>>> > > KRYO4XX gold/big CPU cores are based on Cortex-A76 which has CSV2
>>>>> > > bits set and are spectre-v2 safe. But on big.LITTLE systems where
>>>>> > > they are coupled with other CPU cores such as the KRYO4XX silver
>>>>> > > based on Cortex-A55 which are spectre-v2 safe but do not have CSV2
>>>>> > > bits set, the system wide safe value will be set to the lowest value
>>>>> > > of CSV2 bits as per FTR_LOWER_SAFE defined for CSV2 bits of register
>>>>> > > ID_AA64PFR0_EL1.
>>>>> > >
>>>>> > > This is a problem when booting a guest kernel on gold CPU cores
>>>>> > > where it will incorrectly report ARM_SMCCC_ARCH_WORKAROUND_1 warning
>>>>> > > and consider them as vulnerable for Spectre variant 2 due to system
>>>>> > > wide safe value which is used in kvm emulation code when reading id
>>>>> > > registers. One wrong way of fixing this is to set the FTR_HIGHER_SAFE
>>>>> > > for CSV2 bits, so instead add the KRYO4XX gold CPU core to the safe
>>>>> > > list which will be consulted even when the sanitised read reports
>>>>> > > that CSV2 bits are not set for KRYO4XX gold cores.
>>>>> > >
>>>>> > > Reported-by: Stephen Boyd <swboyd@chromium.org>
>>>>> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>>> > > ---
>>>>> > >  arch/arm64/kernel/cpu_errata.c | 1 +
>>>>> > >  1 file changed, 1 insertion(+)
>>>>> > >
>>>>> > > diff --git a/arch/arm64/kernel/cpu_errata.c
>>>>> > > b/arch/arm64/kernel/cpu_errata.c
>>>>> > > index 6bd1d3ad037a..6cbdd2d98a2a 100644
>>>>> > > --- a/arch/arm64/kernel/cpu_errata.c
>>>>> > > +++ b/arch/arm64/kernel/cpu_errata.c
>>>>> > > @@ -545,6 +545,7 @@ static const struct midr_range
>>>>> > > spectre_v2_safe_list[] = {
>>>>> > >  	MIDR_ALL_VERSIONS(MIDR_HISI_TSV110),
>>>>> > >  	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
>>>>> > >  	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
>>>>> > > +	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
>>>>> >
>>>>> > We shouldn't be putting CPUs in the safe list when they have CSV2
>>>>> > reporting
>>>>> > that they are mitigated in hardware, so I don't think this is the right
>>>>> > approach.
>>>>> >
>>>>> 
>>>>> Ok but the only thing I find wrong in this approach is that it is a
>>>>> redundant
>>>>> information because CSV2 is already advertising the mitigation, but 
>>>>> again
>>>>> CSV2 check is done first so it doesn't really hurt to add it to the 
>>>>> safe
>>>>> list because we already know that it is safe.
>>>> 
>>>> It simply doesn't scale. That's why CSV2 exists in the first place, 
>>>> so we
>>>> don't have to modify the kernel everytime a new CPU is invented.
>>>> 
>>>>> > Sounds more like KVM should advertise CSV2 for the vCPUs if all of the
>>>>> > physical CPUs without CSV2 set are on the safe list. But then again, KVM
>>>>> > has always been slightly in denial about big.LITTLE because you can't
>>>>> > sensibly expose it to a guest if there are detectable differences...
>>>>> >
>>>>> 
>>>>> Sorry but I don't see how the guest kernel will see the CSV2 bits 
>>>>> set for
>>>>> gold CPU cores without actually adding them to the safe list or 
>>>>> reading the
>>>>> not sanitised value of ID_AA64PFR0_EL1 ?
>>>> 
>>>> Well that's for somebody to figure out in the patch. I'm just saying 
>>>> that
>>>> adding cores to the safe list when they already have a CSV2 field 
>>>> conveying
>>>> the same information is the wrong approach. The right appproach is 
>>>> for KVM
>>>> to expose CSV2 as set when the system is not affected by the 
>>>> erratum.
>>> 
>>> A sensible way to fix this would be with something like that:
>>> 
>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>> index 077293b5115f..2735db21ff0d 100644
>>> --- a/arch/arm64/kvm/sys_regs.c
>>> +++ b/arch/arm64/kvm/sys_regs.c
>>> @@ -1131,6 +1131,9 @@ static u64 read_id_reg(const struct kvm_vcpu 
>>> *vcpu,
>>>  		if (!vcpu_has_sve(vcpu))
>>>  			val &= ~(0xfUL << ID_AA64PFR0_SVE_SHIFT);
>>>  		val &= ~(0xfUL << ID_AA64PFR0_AMU_SHIFT);
>>> +		if (!(val & (0xfUL << ID_AA64PFR0_CSV2_SHIFT)) &&
>>> +		    get_spectre_v2_workaround_state() == 
>>> ARM64_BP_HARDEN_NOT_REQUIRED)
>>> +			val |= (1UL << ID_AA64PFR0_CSV2_SHIFT);
>>>  	} else if (id == SYS_ID_AA64ISAR1_EL1 && !vcpu_has_ptrauth(vcpu)) {
>>>  		val &= ~((0xfUL << ID_AA64ISAR1_APA_SHIFT) |
>>>  			 (0xfUL << ID_AA64ISAR1_API_SHIFT) |
>>> 
>> 
>> Thanks Marc, I gave this a go on SC7180 where the issue was seen and
>> this fix is good.
>> 
>> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> There is still a problem with this approach. A late CPU could
> come up after a guest has been started. If that CPU identified
> as vulnerable by the host kernel, get_spectre_v2_workaround_state()
> will return a different value, breaking the guest (or more
> likely, leaving it exposed to Spectre-v2 attacks).
> 
> We'd need to disable the late onlining of CPUs that would change
> the mitigation state, and this is... ugly.
> 

Ugh, yes indeed and here I was thinking that these things are 
straightforward :(

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
