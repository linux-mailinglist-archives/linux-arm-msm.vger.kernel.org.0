Return-Path: <linux-arm-msm+bounces-44811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D530AA0A593
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 20:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A855A188934C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 19:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A9D1B422A;
	Sat, 11 Jan 2025 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJMv/YUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D924B22D;
	Sat, 11 Jan 2025 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736623335; cv=none; b=Dlaj+h/Cb0rrMvJbiNIaof5stqGdUPRdsBfe7z6wJEVMPINUH3daFlWYYRzf8raA8u4Kt0VZxXK/VXj4V8h0iJ7tqC2AZfyfGDLq4/gQDqcMUsQ0YDw9EdSQJhGMxjSk6XKO0szw1Ks1TA0M//RrbFBPbHJgQ9AiTRmtpfHPvLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736623335; c=relaxed/simple;
	bh=/e5FDN99gWfBInfzBGO1197vamqqg73DW4lFsWkB5ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDCLXZA74dOMNxsDtD2hb5DwKfJtXaCTxUOs1c908DHnsYSLniM/KfeXNixMzIAUOxEC/wXrBLfP6tvL+n6XXbwnqi+123D+gxaKT3FTsX3yUX8tfZs0NF6Ty/jxNWKRN/w9y6pf/CtKRH3HwVmXt++2t7OZP5HUyVxGQ0Tgd/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJMv/YUz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536FDC4CED2;
	Sat, 11 Jan 2025 19:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736623335;
	bh=/e5FDN99gWfBInfzBGO1197vamqqg73DW4lFsWkB5ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJMv/YUz9+zklA6dDlJZTBkelc5k4xsDF3kYw8+bSC1Alw+plaEg2ttJE2+04Rg/U
	 akS+Z14MlNe0/SsPD7mt+Ss8Blcyo4duyuuW36n12VmIJzX7NKKjujKTWVePxlsBT5
	 8YFuQntTlnTsLoJFqEZUF5oi99IlUblx0/glmb7Wgr9i1Uo0cI7L7ItdhNFTdLgmU3
	 9/vZJ/M8zcXhPJIopjAXRgZNzOxXomnipga913VBnEHYGZrzSfmWA84NjWb3zfFGHE
	 FBjrQC/QPocB2Ku89OQTGT2xuoE37IZLlvSGCuzqWbHqRcxsPpaqHliVG+pemajHjS
	 K+oR1ep8n4kcA==
Date: Sat, 11 Jan 2025 13:22:12 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: pmic_glink: Fix device access from worker
 during suspend
Message-ID: <7nce4if7gowtbvenqhwzw6bazgfcgml6enwufomqxs4uruj3vs@sgagkj3zpx4t>
References: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>
 <8aef8331-662d-49ee-a918-8a4a5000d9ec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8aef8331-662d-49ee-a918-8a4a5000d9ec@kernel.org>

On Sat, Jan 11, 2025 at 04:35:09PM +0100, Krzysztof Kozlowski wrote:
> On 10/01/2025 16:29, Abel Vesa wrote:
> > The pmic_glink_altmode_worker() currently gets scheduled on the system_wq.
> > When the system is suspended (s2idle), the fact that the worker can be
> > scheduled to run while devices are still suspended provesto be a problem
> > when a Type-C retimer, switch or mux that is controlled over a bus like
> > I2C, because the I2C controller is suspended.
> > 
> > This has been proven to be the case on the X Elite boards where such
> > retimers (ParadeTech PS8830) are used in order to handle Type-C
> > orientation and altmode configuration. The following warning is thrown:
> > 
> > [   35.134876] i2c i2c-4: Transfer while suspended
> > [   35.143865] WARNING: CPU: 0 PID: 99 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0xb4/0x57c [i2c_core]
> > [   35.352879] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
> > [   35.360179] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > [   35.455242] Call trace:
> > [   35.457826]  __i2c_transfer+0xb4/0x57c [i2c_core] (P)
> > [   35.463086]  i2c_transfer+0x98/0xf0 [i2c_core]
> > [   35.467713]  i2c_transfer_buffer_flags+0x54/0x88 [i2c_core]
> > [   35.473502]  regmap_i2c_write+0x20/0x48 [regmap_i2c]
> > [   35.478659]  _regmap_raw_write_impl+0x780/0x944
> > [   35.483401]  _regmap_bus_raw_write+0x60/0x7c
> > [   35.487848]  _regmap_write+0x134/0x184
> > [   35.491773]  regmap_write+0x54/0x78
> > [   35.495418]  ps883x_set+0x58/0xec [ps883x]
> > [   35.499688]  ps883x_sw_set+0x60/0x84 [ps883x]
> > [   35.504223]  typec_switch_set+0x48/0x74 [typec]
> > [   35.508952]  pmic_glink_altmode_worker+0x44/0x1fc [pmic_glink_altmode]
> > [   35.515712]  process_scheduled_works+0x1a0/0x2d0
> > [   35.520525]  worker_thread+0x2a8/0x3c8
> > [   35.524449]  kthread+0xfc/0x184
> > [   35.527749]  ret_from_fork+0x10/0x20
> > 
> > The solution here is to schedule the altmode worker on the system_freezable_wq
> > instead of the system_wq. This will result in the altmode worker not being
> > scheduled to run until the devices are resumed first, which will give the
> > controllers like I2C a chance to resume before the transfer is requested.
> > 
> > Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> > Cc: stable@vger.kernel.org    # 6.3
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> This is an incomplete fix, I think. You fix one case but several other
> possibilities are still there:
> 

I agree, this whacks only one mole, but it's reasonable to expect that
there are more hidden here.

> 1. Maybe the driver just lacks proper suspend/resume handling?
> I assume all this happens during system suspend, so what certainty you
> have that your second work - pmic_glink_altmode_pdr_notify() - is not
> executed as well?
> 
> 2. Follow up: all other drivers and all other future use cases will be
> affected as well. Basically what this patch is admitting is that driver
> can be executed anytime, even during suspend, so each call of
> pmic_glink_send() has to be audited. Now and in the future, because what
> stops some developer of adding one more path calling pmic_glink_send(),
> which also turns out to be executed during suspend?
> 
> 3. So qcom_battmgr.c is buggy as well?
> 
> 4. ucsi_glink.c? I don't see handling suspend, either...
> 
> Maybe the entire problem is how pmic glink was designed: not as proper
> bus driver which handles both child-parent relationship and system suspend.

The underlying problem is that GLINK register its interrupt as
IRQF_NO_SUSPEND (for historical reasons) and as such incoming messages
will be delivered in late suspend and early resume. In this specific
case, a specific message is handled by pmic_glink_altmode_callback(), by
invoking schedule_work() which in this case happens to schedule
pmic_glink_altmode_worker before we've resumed the I2C controller. 

I presume with your suggestion about a pmic_glink bus driver we'd come
up with some mechanism for pmic_glink to defer these messages until
resume has happened?

As you suggest, I too suspect that we have more of these hidden in other
rpmsg client drivers.


In the discussions leading up to this patch we agreed that a better
solution would be to change GLINK (SMEM) to not deliver messages when
the system is suspended. But as this has an impact on how GLINK may or
may not wake up the system, Abel's fix is a reasonable stop-gap solution
while we work that out.

That said, this backstory, the description of the actual underlying
problem, the planned longevity (shortgevity?) of this fix are missing
from the commit message. As written, we could expect a good Samaritan to
come in and replicate this fix across all those other use cases,
contrary to the agreed plans.


@Abel, can you please make sure that your commit message captures those
aspects as well?

Regards,
Bjorn

> Best regards,
> Krzysztof
> 

