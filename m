Return-Path: <linux-arm-msm+bounces-73817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E2B7C6CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F3DA2A56AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 00:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BFF2032D;
	Wed, 17 Sep 2025 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5QdSf32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D710957;
	Wed, 17 Sep 2025 00:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758068009; cv=none; b=S4gIIWY4phkHzanywBO4PJfV1dvZqE4KNF3B36OjKGWQYdNqptYLo4xPmTrAZVUSBmmdply1P5X5hS4CY2L4ze02PDF5+iZxXRgn0tpLnS8Edy1CsoQUODVrT0H5xWw85E26730FiyDZ46jJSbHwpBL43vN8+H2mKmg/Vu3FWCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758068009; c=relaxed/simple;
	bh=AVtRgyAp6YKXrouegrdLq68/eAdn/Y5q/eFh0ucbZuI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g7P34TezNBaKLWUZtix7R4chr236/MFSotpCzPAz1PXZwZGvz4rOQaBbwBOzAwmI2f8B4CKXZZm5iKjk+d257v4ZUnQIACXvGGToWAvBJMOWJbx6XifNGYXR8qQq58BsEKdQUE+rM7p0ezwN1O/KeQfvRw80lxcWWpCcug7MIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5QdSf32; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF02C4CEEB;
	Wed, 17 Sep 2025 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758068008;
	bh=AVtRgyAp6YKXrouegrdLq68/eAdn/Y5q/eFh0ucbZuI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=u5QdSf32631y5BNH+zhYQ109tpyHxtWfzWSO4+0wBJ9uU50PGHFO/gOwWUKtZ5kML
	 M/M47zaT0gKjShnj8aSCx13Qex8PriqL/lR2FH9yY5M85ER1R4qWtpVimHpjV7rnSu
	 /BKrZ303HPKaGq/rDvikPR64xA99d/z8v+YFT7e/t5E7VN9Bm2+ua8b4LW/BuVpoMN
	 XAZV0ASLOqduQH+RkIKzFJ5/jxKDrzskk8UQkd9Am5PYKhpFh5BYme6ZkPert86VS6
	 x69uUGbze57yoNWemsCJypLUbHDRD2rt9LMprw1vjQ8GBG4c3tiuX5NI3V3NfEGleZ
	 w2JURb279Awxw==
Message-ID: <991a3732-dda9-45c8-8eb1-5f5dfa49b289@kernel.org>
Date: Wed, 17 Sep 2025 09:13:24 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Fix pinctrl deadlock on runtime
 resume
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Praveen Talari <praveen.talari@oss.qualcomm.com>,
 Praveen Talari <quic_ptalari@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
 quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
References: <20250908164532.2365969-1-praveen.talari@oss.qualcomm.com>
 <DCNLSFVPCKMV.K1UE3J3K6JQD@linaro.org>
 <DCOJFRU8KNFL.14VPXK9QZC9T4@linaro.org>
 <5b7b8c9f-48c5-45cd-8366-c8c048eaa757@oss.qualcomm.com>
 <DCPUJPHR8NUB.1SRB4D7ONSRBY@linaro.org>
 <2c5fd01a-543b-4108-ac54-80d1d87b65a3@oss.qualcomm.com>
 <DCT9VWQYD4VM.1NV5FJJCJG4PI@linaro.org>
 <cb96f3cd-7427-4644-b7ca-26b763867db4@oss.qualcomm.com>
 <df05da7e-fd9d-48a6-bffc-e84749cd8e96@oss.qualcomm.com>
 <aMl2hOYTjBuCo4AM@trex> <aMl9Fbuyq7hdXvQC@trex>
 <DCUE5AXJ99BG.150SRQMY7EJG6@linaro.org>
 <0d644b94-c674-429b-9ed8-64cb89f168f8@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0d644b94-c674-429b-9ed8-64cb89f168f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/09/2025 02:05, Krzysztof Kozlowski wrote:
> On 17/09/2025 19:12, Alexey Klimov wrote:
>> Hi Praveen,
>>
>> On Tue Sep 16, 2025 at 4:07 PM BST, Jorge Ramirez wrote:
>>> On 16/09/25 16:39:00, Jorge Ramirez wrote:
>>>> On 16/09/25 12:20:25, Praveen Talari wrote:
>>>>> Hi Alexey
>>>>>
>>>>> Thank you for your support.
>>>>>
>>>>> On 9/15/2025 7:55 PM, Praveen Talari wrote:
>>>>>> Hi Alexey,
>>>>>>
>>>>>> On 9/15/2025 3:09 PM, Alexey Klimov wrote:
>>>>>>> (removing <quic_mnaresh@quicinc.com> from c/c -- too many mail not
>>>>>>> delivered)
>>>>>>>
>>>>>>> Hi Praveen,
>>>>>>>
>>>>>>> On Mon Sep 15, 2025 at 7:58 AM BST, Praveen Talari wrote:
>>>>>>>> Hi Alexey,
>>>>>>>>
>>>>>>>> Really appreciate you waiting!
>>>>>>>>
>>>>>>>> On 9/11/2025 2:30 PM, Alexey Klimov wrote:
>>>>>>>>> Hi Praveen,
>>>>>>>>>
>>>>>>>>> On Thu Sep 11, 2025 at 9:34 AM BST, Praveen Talari wrote:
>>>>>>>>>> Hi Alexy,
>>>>>>>>>>
>>>>>>>>>> Thank you for update.
>>>>>>>>>>
>>>>>>>>>> On 9/10/2025 1:35 AM, Alexey Klimov wrote:
>>>>>>>>>>>
>>>>>>>>>>> (adding Krzysztof to c/c)
>>>>>>>>>>>
>>>>>>>>>>> On Mon Sep 8, 2025 at 6:43 PM BST, Alexey Klimov wrote:
>>>>>>>>>>>> On Mon Sep 8, 2025 at 5:45 PM BST, Praveen Talari wrote:
>>>>>>>>>>>>> A deadlock is observed in the
>>>>>>>>>>>>> qcom_geni_serial driver during runtime
>>>>>>>>>>>>> resume. This occurs when the pinctrl
>>>>>>>>>>>>> subsystem reconfigures device pins
>>>>>>>>>>>>> via msm_pinmux_set_mux() while the serial device's interrupt is an
>>>>>>>>>>>>> active wakeup source. msm_pinmux_set_mux() calls disable_irq() or
>>>>>>>>>>>>> __synchronize_irq(), conflicting with the active wakeup state and
>>>>>>>>>>>>> causing the IRQ thread to enter an uninterruptible (D-state) sleep,
>>>>>>>>>>>>> leading to system instability.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The critical call trace leading to the deadlock is:
>>>>>>>>>>>>>
>>>>>>>>>>>>>        Call trace:
>>>>>>>>>>>>>        __switch_to+0xe0/0x120
>>>>>>>>>>>>>        __schedule+0x39c/0x978
>>>>>>>>>>>>>        schedule+0x5c/0xf8
>>>>>>>>>>>>>        __synchronize_irq+0x88/0xb4
>>>>>>>>>>>>>        disable_irq+0x3c/0x4c
>>>>>>>>>>>>>        msm_pinmux_set_mux+0x508/0x644
>>>>>>>>>>>>>        pinmux_enable_setting+0x190/0x2dc
>>>>>>>>>>>>>        pinctrl_commit_state+0x13c/0x208
>>>>>>>>>>>>>        pinctrl_pm_select_default_state+0x4c/0xa4
>>>>>>>>>>>>>        geni_se_resources_on+0xe8/0x154
>>>>>>>>>>>>>        qcom_geni_serial_runtime_resume+0x4c/0x88
>>>>>>>>>>>>>        pm_generic_runtime_resume+0x2c/0x44
>>>>>>>>>>>>>        __genpd_runtime_resume+0x30/0x80
>>>>>>>>>>>>>        genpd_runtime_resume+0x114/0x29c
>>>>>>>>>>>>>        __rpm_callback+0x48/0x1d8
>>>>>>>>>>>>>        rpm_callback+0x6c/0x78
>>>>>>>>>>>>>        rpm_resume+0x530/0x750
>>>>>>>>>>>>>        __pm_runtime_resume+0x50/0x94
>>>>>>>>>>>>>        handle_threaded_wake_irq+0x30/0x94
>>>>>>>>>>>>>        irq_thread_fn+0x2c/xa8
>>>>>>>>>>>>>        irq_thread+0x160/x248
>>>>>>>>>>>>>        kthread+0x110/x114
>>>>>>>>>>>>>        ret_from_fork+0x10/x20
>>>>>>>>>>>>>
>>>>>>>>>>>>> To resolve this, explicitly manage the wakeup IRQ state within the
>>>>>>>>>>>>> runtime suspend/resume callbacks. In the
>>>>>>>>>>>>> runtime resume callback, call
>>>>>>>>>>>>> disable_irq_wake() before enabling resources. This preemptively
>>>>>>>>>>>>> removes the "wakeup" capability from the IRQ, allowing subsequent
>>>>>>>>>>>>> interrupt management calls to proceed
>>>>>>>>>>>>> without conflict. An error path
>>>>>>>>>>>>> re-enables the wakeup IRQ if resource enablement fails.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Conversely, in runtime suspend, call
>>>>>>>>>>>>> enable_irq_wake() after resources
>>>>>>>>>>>>> are disabled. This ensures the interrupt is configured as a wakeup
>>>>>>>>>>>>> source only once the device has fully
>>>>>>>>>>>>> entered its low-power state. An
>>>>>>>>>>>>> error path handles disabling the wakeup IRQ
>>>>>>>>>>>>> if the suspend operation
>>>>>>>>>>>>> fails.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Fixes: 1afa70632c39 ("serial: qcom-geni:
>>>>>>>>>>>>> Enable PM runtime for serial driver")
>>>>>>>>>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>>>>>>>>>
>>>>>>>>>>>> You forgot:
>>>>>>>>>>>>
>>>>>>>>>>>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>>>>>>>
>>>>>>>>>>>> Also, not sure where this change will go, via
>>>>>>>>>>>> Greg or Jiri, but ideally
>>>>>>>>>>>> this should be picked for current -rc cycle since regression is
>>>>>>>>>>>> introduced during latest merge window.
>>>>>>>>>>>>
>>>>>>>>>>>> I also would like to test it on qrb2210 rb1 where this regression is
>>>>>>>>>>>> reproduciable.
>>>>>
>>>>> Since I don't have this board, could you kindly validate the new change and
>>>>> run a quick test on your end?
>>>>>
>>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c
>>>>> b/drivers/pinctrl/qcom/pinctrl-msm.c
>>>>> index 83eb075b6bfa..3d6601dc6fcc 100644
>>>>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>>>>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>>>>> @@ -215,7 +215,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev
>>>>> *pctldev,
>>>>>          */
>>>>>         if (d && i != gpio_func &&
>>>>>             !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
>>>>> -               disable_irq(irq);
>>>>> +               disable_irq_nosync(irq);
>>>>>
>>>>>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>>
>>>>
>>>> sorry Praveen, didnt see this proposal. testing on my end as well.
>>>>
>>>
>>> just tested on my end and all modules load - deadlocked before this
>>> update so there is progress (now we can load the network driver)
>>
>> Is it supposed to be orginal patch here plus disable_irq_nosync()?
>> Meaning changes for qcom_geni_serial_runtime_{suspend,resume}
>> + disable_irq_nosync() in msm_pinmux_set_mux()?
>>
>> It seems to work here but let me know few more runs.
> 
> 
> So this bug, after 5 weeks is still not fixed?!?
> 
> This is just and should be reverted long time ago.

I will send the revert, because this is just mocking the kernel process.

Best regards,
Krzysztof

