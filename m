Return-Path: <linux-arm-msm+bounces-46555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0CA22542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 21:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2355B164311
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 20:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36621E1A3D;
	Wed, 29 Jan 2025 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rB3ETID+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE851DF979;
	Wed, 29 Jan 2025 20:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738184277; cv=none; b=LZ/JabSHlzb2yGssLWzI/2smqIJozfJe/Ly9h+1eO30cwPfScV+kEEol9TsXq/5y1w7ru9jmnmeoAvZr+GvtwmlFIiGNHoUoAiWzUcV0MxJs8QJFa0YTvuVqIbXsrq6tTJybCgijWZgYhWRJWff9v0EY/kMCTwdxV71HF3MW4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738184277; c=relaxed/simple;
	bh=z2oxoG9hjltUmRX9hw1gBiIleQlCKIR1GujwB+vX9Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZgHgcsfNx3Iowa70dFrN+FESAlHB89nbduEhY1GYJasndT7ZL4eBn1KJ7x85WrTRJ+RxRBA/9sQamVK48BoIOil0EGbYF2C5r7x6Q0DAkgQJubHrgWNiTmGvgEjm8q474whLt5YdKZ19TbQXFWRXnB7TunaBZIah07UM4sO0rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rB3ETID+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC76C4CED1;
	Wed, 29 Jan 2025 20:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738184276;
	bh=z2oxoG9hjltUmRX9hw1gBiIleQlCKIR1GujwB+vX9Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rB3ETID+KRBK1oxD9NNoQEtc0RBddySZ+cdxott4kZ9Ytm4VLK7wsk+mnbKIimRgr
	 wlIz2p+7WJOKih9caIduvNcHxkkF9JaOmNk/PanDDZRakynDLLyhEniPIk+zwNcXsj
	 nytEJKktvxBbvs4jEE2WU9Lh1cSEQ2qeLsVCRwfXIQARopSGE+qoulm/AwfnvcKAor
	 DeWz81uNkk3a4fqAqe6U/CaExZWCHggS0q8c+T1reF4/6Q2lI20GMNEKiCJO0zXsux
	 ZhwzU4tx1ur4m0HyIywob4g14qnp3TFn67iglGYMJALc0lDAEhQ5O8aPIL768PucLV
	 UeX3c7kW4Ry0A==
Date: Wed, 29 Jan 2025 14:57:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH RFC v2] soc: qcom: pmic_glink: Fix device access from
 worker during suspend
Message-ID: <f2q5u6hhzer4wwyz6c7kzrm6i6az5l6dhlfshuirwmhvps4z5g@sx53vb4wbpr5>
References: <20250129-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v2-1-de2a3eca514e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v2-1-de2a3eca514e@linaro.org>

On Wed, Jan 29, 2025 at 01:46:15PM +0200, Abel Vesa wrote:
> For historical reasons, the GLINK smem interrupt is registered with
> IRRQF_NO_SUSPEND flag set, which is the underlying problem here, since the
> incoming messages can be delivered during late suspend and early
> resume.
> 
> In this specific case, the pmic_glink_altmode_worker() currently gets
> scheduled on the system_wq which can be scheduled to run while devices
> are still suspended. This proves to be a problem when a Type-C retimer,
> switch or mux that is controlled over a bus like I2C, because the I2C
> controller is suspended.
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
> The proper solution here should be to not deliver these kind of messages
> during system suspend at all, or at least make it configurable per glink
> client. But simply dropping the IRQF_NO_SUSPEND flag entirely will break
> other clients. The final shape of the rework of the pmic glink driver in
> order to fulfill both the filtering of the messages that need to be able
> to wake-up the system and the queueing of these messages until the system
> has properly resumed is still being discussed and it is planned as a
> future effort.
> 
> Meanwhile, the stop-gap fix here is to schedule the pmic glink altmode
> worker on the system_freezable_wq instead of the system_wq. This will
> result in the altmode worker not being scheduled to run until the
> devices are resumed first, which will give the controllers like I2C a
> chance to resume before the transfer is requested.
> 
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/lkml/Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com/
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org    # 6.3
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v2:
> - Re-worded the commit to explain the underlying problem and how
>   this fix is just a stop-gap for the pmic glink client for now.
> - Added Johan's Reported-by tag and link
> - Added Caleb's Reviewed-by tag
> - Link to v1: https://lore.kernel.org/r/20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org
> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index bd06ce16180411059e9efb14d9aeccda27744280..bde129aa7d90a39becaa720376c0539bcaa492fb 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -295,7 +295,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
>  	alt_port->mode = mode;
>  	alt_port->hpd_state = hpd_state;
>  	alt_port->hpd_irq = hpd_irq;
> -	schedule_work(&alt_port->work);
> +	queue_work(system_freezable_wq, &alt_port->work);
>  }
>  
>  #define SC8280XP_DPAM_MASK	0x3f
> @@ -338,7 +338,7 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
>  	alt_port->mode = mode;
>  	alt_port->hpd_state = hpd_state;
>  	alt_port->hpd_irq = hpd_irq;
> -	schedule_work(&alt_port->work);
> +	queue_work(system_freezable_wq, &alt_port->work);
>  }
>  
>  static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv)
> 
> ---
> base-commit: da7e6047a6264af16d2cb82bed9b6caa33eaf56a
> change-id: 20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-af54c5e43ed6
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

