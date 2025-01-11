Return-Path: <linux-arm-msm+bounces-44795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD5A0A463
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 16:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2F53AA259
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 15:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFA31AF0BF;
	Sat, 11 Jan 2025 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPcslEvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB218FDBA;
	Sat, 11 Jan 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736609714; cv=none; b=pqstog4g/jUvmPXgpixk+dVcXoavJc0BfTQqYJtlO+4ggebDxdbDV+SY9bS7pFkn575ZoI53EBqfrU21Iv62w6iUsmt6BqtLU8WWAfi55WF5mdWh8yDpTAlqBOv44hDf7qH0/vjctOPStToRmRIBEwgdKz9NLv3xYeHuXrx41Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736609714; c=relaxed/simple;
	bh=DkYnECulvi7qQtGWYQuoQyyVrOEXO3B5RNTc9nE2whg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+GhkYUwxSfJDo9LLKn2phoy15VU9J5vrIsi8vIOXRGRFdEzEwLnkw6Ywo2B+UiaFG7z0vyAEQ+AIb06t5JuG6Q+UaUv6cq7Axde9P4nu6rao0pbx0BDfAZg49bm8VXH6XaGoSqRZtLoZCcH+jJ3SmvIPX/8XgNEQHUsRZQKRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPcslEvg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDE0C4CED2;
	Sat, 11 Jan 2025 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736609714;
	bh=DkYnECulvi7qQtGWYQuoQyyVrOEXO3B5RNTc9nE2whg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rPcslEvgLvba+RvIm6rQ7oIKgHxKqHZ4PzpfH9FSLyM8tNI0yi8c+tO39b51BIbBr
	 rLKaj4TeAOF9bZyMGapuYGwKAJWQVon8FARH3xwMH0mhxMCZcUQ5TaTMIpA0zpem7L
	 NUEJavFf0Nm52jQggYb1/c/yU4eiX2ayORZ4kV7840GiMEwDB0lqwgZYkiorjrdcUg
	 sR3nyuFAHR8xipipP8g4XPyyVRzyCcsk6FWkqDfFS0CCaMrjybZH+bDc8ALL1H6usd
	 Rs9F2qRf5t4tYX8kaiWZUjiNg6/pq4LKGAddBhKOXafBkQCPlmt7DEi9DrW/oRr/iX
	 Dci4X1DVn8r5g==
Message-ID: <8aef8331-662d-49ee-a918-8a4a5000d9ec@kernel.org>
Date: Sat, 11 Jan 2025 16:35:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] soc: qcom: pmic_glink: Fix device access from worker
 during suspend
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2025 16:29, Abel Vesa wrote:
> The pmic_glink_altmode_worker() currently gets scheduled on the system_wq.
> When the system is suspended (s2idle), the fact that the worker can be
> scheduled to run while devices are still suspended provesto be a problem
> when a Type-C retimer, switch or mux that is controlled over a bus like
> I2C, because the I2C controller is suspended.
> 
> This has been proven to be the case on the X Elite boards where such
> retimers (ParadeTech PS8830) are used in order to handle Type-C
> orientation and altmode configuration. The following warning is thrown:
> 
> [   35.134876] i2c i2c-4: Transfer while suspended
> [   35.143865] WARNING: CPU: 0 PID: 99 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0xb4/0x57c [i2c_core]
> [   35.352879] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
> [   35.360179] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   35.455242] Call trace:
> [   35.457826]  __i2c_transfer+0xb4/0x57c [i2c_core] (P)
> [   35.463086]  i2c_transfer+0x98/0xf0 [i2c_core]
> [   35.467713]  i2c_transfer_buffer_flags+0x54/0x88 [i2c_core]
> [   35.473502]  regmap_i2c_write+0x20/0x48 [regmap_i2c]
> [   35.478659]  _regmap_raw_write_impl+0x780/0x944
> [   35.483401]  _regmap_bus_raw_write+0x60/0x7c
> [   35.487848]  _regmap_write+0x134/0x184
> [   35.491773]  regmap_write+0x54/0x78
> [   35.495418]  ps883x_set+0x58/0xec [ps883x]
> [   35.499688]  ps883x_sw_set+0x60/0x84 [ps883x]
> [   35.504223]  typec_switch_set+0x48/0x74 [typec]
> [   35.508952]  pmic_glink_altmode_worker+0x44/0x1fc [pmic_glink_altmode]
> [   35.515712]  process_scheduled_works+0x1a0/0x2d0
> [   35.520525]  worker_thread+0x2a8/0x3c8
> [   35.524449]  kthread+0xfc/0x184
> [   35.527749]  ret_from_fork+0x10/0x20
> 
> The solution here is to schedule the altmode worker on the system_freezable_wq
> instead of the system_wq. This will result in the altmode worker not being
> scheduled to run until the devices are resumed first, which will give the
> controllers like I2C a chance to resume before the transfer is requested.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org    # 6.3
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

This is an incomplete fix, I think. You fix one case but several other
possibilities are still there:

1. Maybe the driver just lacks proper suspend/resume handling?
I assume all this happens during system suspend, so what certainty you
have that your second work - pmic_glink_altmode_pdr_notify() - is not
executed as well?

2. Follow up: all other drivers and all other future use cases will be
affected as well. Basically what this patch is admitting is that driver
can be executed anytime, even during suspend, so each call of
pmic_glink_send() has to be audited. Now and in the future, because what
stops some developer of adding one more path calling pmic_glink_send(),
which also turns out to be executed during suspend?

3. So qcom_battmgr.c is buggy as well?

4. ucsi_glink.c? I don't see handling suspend, either...

Maybe the entire problem is how pmic glink was designed: not as proper
bus driver which handles both child-parent relationship and system suspend.
Best regards,
Krzysztof


