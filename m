Return-Path: <linux-arm-msm+bounces-74116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B41B877EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 02:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655111C24AF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 00:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B51D2561C2;
	Fri, 19 Sep 2025 00:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQkPxmXb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C8246773;
	Fri, 19 Sep 2025 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758242014; cv=none; b=d25c8q2ZbqDPSYrS64PNREWE0fZPn0pLaBLAq4wClwWkUqMyOeeDCjmzzmmSLyL+iXYOClCixevQeMRyrJQrkTSxlIbjfJFXjeiVTeNUlzHE62EjMhP24SUhPxPpHqknLerAYeleDB/abLbvMkP++gEZDxDZcC1Svb6Gc2fZ86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758242014; c=relaxed/simple;
	bh=MvqdhfH2nX/TJ4+5NKKfQ+8Xw1soS4FUL5ceqWBJjCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3NDshJTO4sGCHZ764J1MrKs2DH/Umb+rf3MIiNnP+TeqjqzxjuQm57LkxWseVAJ4ZKD6NnWpfMU4R1ZGgYX5mFPyc82j9wj1tR4yDEmyS/pyfRJS9V8mEzqP0uNHBh/VV/1XUKnOmO4cgwmNwRtnRIP/h4IH74uQa2KAxE+Sis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQkPxmXb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D45C4CEE7;
	Fri, 19 Sep 2025 00:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758242013;
	bh=MvqdhfH2nX/TJ4+5NKKfQ+8Xw1soS4FUL5ceqWBJjCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uQkPxmXbxwUl6cwbOOZBY79XW1iBBiitcmNCoSjVxOKC5FXvBY1M8kA8bu3xdWn05
	 gnCysPWjCfb/rPVS7CjgqsJ/W54JCls5HYXoABZZjCum1nCkEuct1rQksqauvHtFem
	 lTkMZblVerTEMb4PuRVHeZN2BKaYkRsgZ9+y1/a6pw9gB6nghW81Vo81EO+D6jH+oF
	 GtRGkx0aO5XK7y4HNXn3Bhf1n9NWIcdkGXZ7KSElncIgT+VQwF5i9yh82sIFs/sh5t
	 Jfe4hzP5d5gMKJXB9cXFRLRYc4DmGQnbRdGGMYtLkfLgCZMWja4qCGsyJBw5dEDMdk
	 8xklEUnyAfWIg==
Message-ID: <4ca07bd0-d44a-488f-a97b-47774f253f73@kernel.org>
Date: Fri, 19 Sep 2025 09:33:29 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom_geni: Fix pinctrl deadlock on runtime
 resume
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Praveen Talari <quic_ptalari@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alexey.klimov@linaro.org, jorge.ramirez@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>
 <dab18f70-4017-4c06-92c1-91cfd2229540@kernel.org>
 <8e2781ae-34d2-4009-bf8c-56aa1bb6fe85@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <8e2781ae-34d2-4009-bf8c-56aa1bb6fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/09/2025 12:55, Praveen Talari wrote:
> Hi Krzysztof,
> 
> On 9/18/2025 5:28 AM, Krzysztof Kozlowski wrote:
>> On 18/09/2025 03:51, Praveen Talari wrote:
>>> A stall was observed in disable_irq() during
>>> pinctrl_pm_select_default_state(), triggered by wakeup IRQ being active
>>> while the UART port was not yet active. This led to a hang in
>>> __synchronize_irq(), as shown in the following trace:
>>>
>>> Call trace:
>>>      __switch_to+0xe0/0x120
>>>      __schedule+0x39c/0x978
>>>      schedule+0x5c/0xf8
>>>      __synchronize_irq+0x88/0xb4
>>>      disable_irq+0x3c/0x4c
>>>      msm_pinmux_set_mux+0x508/0x644
>>>      pinmux_enable_setting+0x190/0x2dc
>>>      pinctrl_commit_state+0x13c/0x208
>>>      pinctrl_pm_select_default_state+0x4c/0xa4
>>>      geni_se_resources_on+0xe8/0x154
>>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>>>      pm_generic_runtime_resume+0x2c/0x44
>>>      __genpd_runtime_resume+0x30/0x80
>>>      genpd_runtime_resume+0x114/0x29c
>>>      __rpm_callback+0x48/0x1d8
>>>      rpm_callback+0x6c/0x78
>>>      rpm_resume+0x530/0x750
>>>      __pm_runtime_resume+0x50/0x94
>>>      handle_threaded_wake_irq+0x30/0x94
>>>      irq_thread_fn+0x2c/0xa8
>>>      irq_thread+0x160/0x248
>>>      kthread+0x110/0x114
>>>      ret_from_fork+0x10/0x20
>>>
>>> To fix this, wakeup IRQ setup is moved from probe to UART startup,
>>> ensuring it is only configured when the port is active. Correspondingly,
>>> the wakeup IRQ is cleared during shutdown. This avoids premature IRQ
>>> disable during pinctrl setup and prevents the observed stall. The probe
>>> and remove pathsare simplified by removing redundant wakeup IRQ handling.
>>>
>>> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
>>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
>>> Tested-by: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
>>
>> Where did you receive this tag for this patch exactly?
> 
> Since Jorge was involved in validating the change, I’ve added him under 
> the Tested-by tag.
> 
> Please correct me if I’m not supposed to add this tag myself.
Yes, it is wrong. You did not receive the tag! Which process or
document, suggested that you can create such tag? I commented on the
patches, so you will add now "Reviewed-by" with my name?

No.


Best regards,
Krzysztof

