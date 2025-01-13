Return-Path: <linux-arm-msm+bounces-44885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EAA0B68F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B45631672FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781E022F172;
	Mon, 13 Jan 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoOfbyUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF622F171;
	Mon, 13 Jan 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770614; cv=none; b=qAGeVAXo9q1IJEAHwumYCe8+rbnnGK+iL3tfQGIVCtwSxNApXTCwZEAT78j3HsR3KJYdsfiQbEeF7kjL7+5wO7ZQsh7PAiuDTfyCbJfakCuJtdk4xfiGlHPRl3mXMNRLLQvwngziH+R/BBxFGSZ7MyX6GLEBuQO67tWBJD8GE80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770614; c=relaxed/simple;
	bh=41SLTKC+nb9PCd09tF+CzOauhXsk0pD/q1mC/ocQehA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzqMGd/JVyHrQyO7YYWbAubCbseqLrMDyw24rPoCspUZh2mts7opos3xLAbLmp1xrJ3AWANvbs3ARHg1bRgiz5SJW4mhz7w5hQrg1J4sWUHIyj/iQ4gQZ8Z3mamrLgZeCiCSp/phnoLkqlHD2HVEzLOV+GkbZ2MU3BcYEtNCZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoOfbyUz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF999C4CEE6;
	Mon, 13 Jan 2025 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736770613;
	bh=41SLTKC+nb9PCd09tF+CzOauhXsk0pD/q1mC/ocQehA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoOfbyUzUiQEy7/YLao2q47R01DL/1ZgJfHFHTALS0or6fim+e0PZyL+JBDgj8r07
	 pJhuPPSBaoGYDwi5baPDRvqQOhWg6hDQhk0uLrBfK/ki5Vl1Lu1zaghe7+P6hkA0Gb
	 hcqUceCckZ/sTNqZ1JcHe+Wr25wgK+t11b2MNuT4L9BuyZk4xlNgZXqgAxzNV/Bx2r
	 1cMtDaeXr85HGUYH0avVeTENkPD3uTRZbiKBmd6P+h46XQ3LzQ/Woya03eOuibyFWB
	 unJJcLazPq/gX3tRHZ5MQyokmmGLECWVi/2bptlo+8TGVa6cMXZHQhh69H1VpKyAP8
	 tXHPNEmBBZ8Qw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tXJNF-000000003ap-47LR;
	Mon, 13 Jan 2025 13:16:54 +0100
Date: Mon, 13 Jan 2025 13:16:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: pmic_glink: Fix device access from worker
 during suspend
Message-ID: <Z4UENSdocAo4uNjg@hovoldconsulting.com>
References: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>

On Fri, Jan 10, 2025 at 05:29:51PM +0200, Abel Vesa wrote:
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

You forgot to include:

Reported-by: Johan Hovold <johan+linaro@kernel.org>	
Link: https://lore.kernel.org/lkml/Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com/

Johan

