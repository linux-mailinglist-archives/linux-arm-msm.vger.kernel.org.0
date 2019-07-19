Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA29B6E059
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 06:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfGSExy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 00:53:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43202 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfGSExy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 00:53:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 748D160F3C; Fri, 19 Jul 2019 04:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563512032;
        bh=kydlOlLzdT00KlxryrfYZi8VP2BTfr3KHtAr0lNrPpQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=atXQYRdnDJZU4wloBXOmTIPqkWTKZ0AxjpDyhpWjeiqEw0dV3Q7HoLW4lZ64d577Q
         bwc+nHuYWDfXz7HVxvQkCDoAPxZUQVeVKHEz9J7Gea5wW/Vje2xiwLGIJrF+Ky0mki
         XvsCyoqkj3t1fj5ALb419etiFH5CPrlTLzft1dO0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.204.78.89] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: neeraju@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 937D160588;
        Fri, 19 Jul 2019 04:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563512029;
        bh=kydlOlLzdT00KlxryrfYZi8VP2BTfr3KHtAr0lNrPpQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SHynQWOswiEe60bSxOs8Hp7BRQuBePtvIoVz6Y0hv84Dm2+RN4W7Tr+DvONip8k8D
         9u58WsU9M9euo3CBwcWw9K94FGcpeo4iUildt1RAMeV/4c1GUydY2oLX49YWOTycr1
         luh3SphL6UVqjke1VRllkG+AqGpIpjyx200VfpHQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 937D160588
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
Subject: Re: [PATCH] arm64: Explicitly set pstate.ssbs for el0 on kernel entry
To:     Marc Zyngier <marc.zyngier@arm.com>, will@kernel.org,
        mark.rutland@arm.com, julien.thierry@arm.com, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gkohli@codeaurora.org,
        parthd@codeaurora.org, tsoni@codeaurora.org
References: <1562671333-3563-1-git-send-email-neeraju@codeaurora.org>
 <62c4fed5-39ac-adc9-3bc5-56eb5234a9d1@arm.com>
 <386316d0-f844-d88c-8b78-0ffc4ffe0aaa@codeaurora.org>
 <f65bb888-b623-25e4-4f01-ae4fbb635e94@arm.com>
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
Message-ID: <5ed243e5-0116-6b32-0239-ae05119dfa27@codeaurora.org>
Date:   Fri, 19 Jul 2019 10:23:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <f65bb888-b623-25e4-4f01-ae4fbb635e94@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc,


On 7/9/19 7:52 PM, Marc Zyngier wrote:
> On 09/07/2019 15:18, Neeraj Upadhyay wrote:
>> Hi Marc,
>>
>> On 7/9/19 6:38 PM, Marc Zyngier wrote:
>>> Hi Neeraj,
>>>
>>> On 09/07/2019 12:22, Neeraj Upadhyay wrote:
>>>> For cpus which do not support pstate.ssbs feature, el0
>>>> might not retain spsr.ssbs. This is problematic, if this
>>>> task migrates to a cpu supporting this feature, thus
>>>> relying on its state to be correct. On kernel entry,
>>>> explicitly set spsr.ssbs, so that speculation is enabled
>>>> for el0, when this task migrates to a cpu supporting
>>>> ssbs feature. Restoring state at kernel entry ensures
>>>> that el0 ssbs state is always consistent while we are
>>>> in el1.
>>>>
>>>> As alternatives are applied by boot cpu, at the end of smp
>>>> init, presence/absence of ssbs feature on boot cpu, is used
>>>> for deciding, whether the capability is uniformly provided.
>>> I've seen the same issue, but went for a slightly different
>>> approach, see below.
>>>
>>>> Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
>>>> ---
>>>>    arch/arm64/kernel/cpu_errata.c | 16 ++++++++++++++++
>>>>    arch/arm64/kernel/entry.S      | 26 +++++++++++++++++++++++++-
>>>>    2 files changed, 41 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>>>> index ca11ff7..c84a56d 100644
>>>> --- a/arch/arm64/kernel/cpu_errata.c
>>>> +++ b/arch/arm64/kernel/cpu_errata.c
>>>> @@ -336,6 +336,22 @@ void __init arm64_enable_wa2_handling(struct alt_instr *alt,
>>>>    		*updptr = cpu_to_le32(aarch64_insn_gen_nop());
>>>>    }
>>>>    
>>>> +void __init arm64_restore_ssbs_state(struct alt_instr *alt,
>>>> +				     __le32 *origptr, __le32 *updptr,
>>>> +				     int nr_inst)
>>>> +{
>>>> +	BUG_ON(nr_inst != 1);
>>>> +	/*
>>>> +	 * Only restore EL0 SSBS state on EL1 entry if cpu does not
>>>> +	 * support the capability and capability is present for at
>>>> +	 * least one cpu and if the SSBD state allows it to
>>>> +	 * be changed.
>>>> +	 */
>>>> +	if (!this_cpu_has_cap(ARM64_SSBS) && cpus_have_cap(ARM64_SSBS) &&
>>>> +	    arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE)
>>>> +		*updptr = cpu_to_le32(aarch64_insn_gen_nop());
>>>> +}
>>>> +
>>>>    void arm64_set_ssbd_mitigation(bool state)
>>>>    {
>>>>    	if (!IS_ENABLED(CONFIG_ARM64_SSBD)) {
>>>> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>>>> index 9cdc459..7e79305 100644
>>>> --- a/arch/arm64/kernel/entry.S
>>>> +++ b/arch/arm64/kernel/entry.S
>>>> @@ -143,6 +143,25 @@ alternative_cb_end
>>>>    #endif
>>>>    	.endm
>>>>    
>>>> +	// This macro updates spsr. It also corrupts the condition
>>>> +	// codes state.
>>>> +	.macro	restore_ssbs_state, saved_spsr, tmp
>>>> +#ifdef CONFIG_ARM64_SSBD
>>>> +alternative_cb	arm64_restore_ssbs_state
>>>> +	b	.L__asm_ssbs_skip\@
>>>> +alternative_cb_end
>>>> +	ldr	\tmp, [tsk, #TSK_TI_FLAGS]
>>>> +	tbnz	\tmp, #TIF_SSBD, .L__asm_ssbs_skip\@
>>>> +	tst	\saved_spsr, #PSR_MODE32_BIT	// native task?
>>>> +	b.ne	.L__asm_ssbs_compat\@
>>>> +	orr	\saved_spsr, \saved_spsr, #PSR_SSBS_BIT
>>>> +	b	.L__asm_ssbs_skip\@
>>>> +.L__asm_ssbs_compat\@:
>>>> +	orr	\saved_spsr, \saved_spsr, #PSR_AA32_SSBS_BIT
>>>> +.L__asm_ssbs_skip\@:
>>>> +#endif
>>>> +	.endm
>>> Although this is in keeping with the rest of entry.S (perfectly
>>> unreadable ;-), I think we can do something a bit simpler, that
>>> doesn't rely on patching. Also, this doesn't seem to take the
>>> SSBD options such as ARM64_SSBD_FORCE_ENABLE into account.
>> arm64_restore_ssbs_state has a check for ARM64_SSBD_FORCE_ENABLE,
>>
>> does that look wrong?
> No, I just focused on the rest of the asm code and missed it, apologies.
>
>>>> +
>>>>    	.macro	kernel_entry, el, regsize = 64
>>>>    	.if	\regsize == 32
>>>>    	mov	w0, w0				// zero upper 32 bits of x0
>>>> @@ -182,8 +201,13 @@ alternative_cb_end
>>>>    	str	x20, [tsk, #TSK_TI_ADDR_LIMIT]
>>>>    	/* No need to reset PSTATE.UAO, hardware's already set it to 0 for us */
>>>>    	.endif /* \el == 0 */
>>>> -	mrs	x22, elr_el1
>>>>    	mrs	x23, spsr_el1
>>>> +
>>>> +	.if	\el == 0
>>>> +	restore_ssbs_state x23, x22
>>>> +	.endif
>>>> +
>>>> +	mrs	x22, elr_el1
>>>>    	stp	lr, x21, [sp, #S_LR]
>>>>    
>>>>    	/*
>>>>
>>> How about the patch below?
>> Looks good; was just going to mention PF_KTHREAD check, but Mark R. has
>> already
>>
>> given detailed information about it.
> Yup, well spotted. I'll respin it shortly and we can then work out
> whether that's really a better approach.

Did you get chance to recheck it?


Thanks

Neeraj

>
> Thanks,
>
> 	M.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

