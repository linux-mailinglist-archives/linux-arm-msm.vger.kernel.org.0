Return-Path: <linux-arm-msm+bounces-24159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69A917214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 22:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE3B01F22D93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA9A17F4F4;
	Tue, 25 Jun 2024 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuygBh4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC69917CA14;
	Tue, 25 Jun 2024 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345500; cv=none; b=nsiOr7kjLqzQ9HmjRDcfZXLDa9hr8NFQ28h6hA7vmFwhSnsg+mSgdvsTDywYO/sTEtX7roPqF8Ix/A/cpj0dz1ROym2sX7Ee5vC5tOR9x9uEQHR88eJLwzPzjczsjR50/By5FHUw5oOWyEDr+dSUmKrPI+EX1QSjgatOSm2TcQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345500; c=relaxed/simple;
	bh=MJNmCd7FhXym2f6PUkVcSe+TB7G6x66x130HhKzdzBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teK+AkkjhdTiCD0SvPPyH8cNDsO0sowpOUoqBDV+k9G6eBrslLyO3QujPdCETVL2ae8n8RqaIikWfSFCYlHb5VhUQITyf5YBytxdEbhUCbJQKffSoIoATX4IkpIKyz7qqcUwItlXwW1L3cODO93nDSMQ21v9rEMs0Ss556a/EAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuygBh4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1A7C32781;
	Tue, 25 Jun 2024 19:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719345500;
	bh=MJNmCd7FhXym2f6PUkVcSe+TB7G6x66x130HhKzdzBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BuygBh4ZCADwmVWbcR1Tm3b+mek/WwltrRh5HjyR70z394+Q02IgnnoAxb3e4SYkm
	 DirMrEAxuvGVTbKUEAzVHp1MkrHC9hKtazfRu85bqyP84aEqAz4luuReL+pMmX3Ok8
	 QJgAq6gfDOOTZrXKn/3N+C6R4ybTgej/t+2ox0U76YYgSK3QXWxku2ADkQN6Q6sT6i
	 rrYxNgLgJXwOJDx19MoKkMFFQKRRQKpPr3AdOp4dLEk1LiOPsBCSkjAXx0QyK16VsF
	 vPGTyEFuLOU/hPY1/429W5cADDWqsswjMTBAQpuMOu8RmTKozMzGaqsa8Wzfr9ovy4
	 Hh/a6ivDgnioQ==
Date: Tue, 25 Jun 2024 13:03:33 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Melody Olvera <quic_molvera@quicinc.com>
Subject: Re: [PATCH v3 3/4] remoteproc: qcom_q6v5_pas: Add support to attach
 a DSP
Message-ID: <g6jl6ookh2pdb5ef6nbjc5q673xo4fmg5iauwm7ewld7pizkkw@3xnegfivief6>
References: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
 <20240620120143.12375-4-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620120143.12375-4-quic_kbajaj@quicinc.com>

On Thu, Jun 20, 2024 at 05:31:42PM GMT, Komal Bajaj wrote:
> From: Melody Olvera <quic_molvera@quicinc.com>
> 
> Some chipsets will have DSPs which will have begun running prior
> to linux booting, so add support to late attach these DSPs by
> adding support for:
> - run-time checking of an offline or running DSP via rmb register
> - a late attach framework to attach to the running DSP
> - a handshake mechanism to ensure full and proper booting via rmb

I don't fully understand what state we're going to find the remote side
in during this attach.

I think that between commit message and comments in the code it should
be clear what the expected flow is, why there is a 5 second timeout, why
does Linux tell the DSP to "continue boot", etc.

Regards,
Bjorn

> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b9759f6b2283..32d45c18e15e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -258,6 +259,94 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
> 
> +static int adsp_signal_q6v5(struct qcom_adsp *adsp)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	if (adsp->q6v5.rmb_base) {
> +		ret = readl_poll_timeout(adsp->q6v5.rmb_base + RMB_BOOT_WAIT_REG,
> +					 val, val, 20000,
> +					 RMB_POLL_MAX_TIMES * 20000);
> +		if (ret < 0)
> +			return ret;
> +
> +		writel_relaxed(1, adsp->q6v5.rmb_base + RMB_BOOT_CONT_REG);
> +	}
> +
> +	return 0;
> +}
> +
> +static int adsp_attach(struct rproc *rproc)
> +{
> +	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> +	int ret;
> +
> +	ret = qcom_q6v5_prepare(&adsp->q6v5);
> +	if (ret)
> +		return ret;
> +
> +	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> +	if (ret < 0)
> +		goto disable_irqs;
> +
> +	ret = clk_prepare_enable(adsp->xo);
> +	if (ret)
> +		goto disable_proxy_pds;
> +
> +	ret = clk_prepare_enable(adsp->aggre2_clk);
> +	if (ret)
> +		goto disable_xo_clk;
> +
> +	if (adsp->cx_supply) {
> +		ret = regulator_enable(adsp->cx_supply);
> +		if (ret)
> +			goto disable_aggre2_clk;
> +	}
> +
> +	if (adsp->px_supply) {
> +		ret = regulator_enable(adsp->px_supply);
> +		if (ret)
> +			goto disable_cx_supply;
> +	}
> +
> +	/* if needed, signal Q6 to continute booting */
> +	ret = adsp_signal_q6v5(adsp);
> +	if (ret < 0) {
> +		dev_err(adsp->dev, "Didn't get rmb signal from  %s\n", rproc->name);
> +		goto disable_px_supply;
> +	};
> +
> +	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
> +	if (ret == -ETIMEDOUT) {
> +		dev_err(adsp->dev, "start timed out\n");
> +		qcom_scm_pas_shutdown(adsp->pas_id);
> +		goto disable_px_supply;
> +	}
> +
> +	return 0;
> +
> +disable_px_supply:
> +	if (adsp->px_supply)
> +		regulator_disable(adsp->px_supply);
> +disable_cx_supply:
> +	if (adsp->cx_supply)
> +		regulator_disable(adsp->cx_supply);
> +disable_aggre2_clk:
> +	clk_disable_unprepare(adsp->aggre2_clk);
> +disable_xo_clk:
> +	clk_disable_unprepare(adsp->xo);
> +disable_proxy_pds:
> +	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> +disable_irqs:
> +	qcom_q6v5_unprepare(&adsp->q6v5);
> +
> +	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
> +	adsp->firmware = NULL;
> +
> +	return ret;
> +}
> +
>  static int adsp_start(struct rproc *rproc)
>  {
>  	struct qcom_adsp *adsp = rproc->priv;
> @@ -320,6 +409,13 @@ static int adsp_start(struct rproc *rproc)
>  		goto release_pas_metadata;
>  	}
> 
> +	/* if needed, signal Q6 to continute booting */
> +	ret = adsp_signal_q6v5(adsp);
> +	if (ret < 0) {
> +		dev_err(adsp->dev, "Didn't get rmb signal from  %s\n", rproc->name);
> +		goto release_pas_metadata;
> +	}
> +
>  	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
>  	if (ret == -ETIMEDOUT) {
>  		dev_err(adsp->dev, "start timed out\n");
> @@ -432,6 +528,7 @@ static unsigned long adsp_panic(struct rproc *rproc)
>  static const struct rproc_ops adsp_ops = {
>  	.unprepare = adsp_unprepare,
>  	.start = adsp_start,
> +	.attach = adsp_attach,
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> @@ -442,6 +539,7 @@ static const struct rproc_ops adsp_ops = {
>  static const struct rproc_ops adsp_minidump_ops = {
>  	.unprepare = adsp_unprepare,
>  	.start = adsp_start,
> +	.attach = adsp_attach,
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> @@ -779,6 +877,10 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto detach_proxy_pds;
> 
> +	if (adsp->q6v5.rmb_base &&
> +			readl_relaxed(adsp->q6v5.rmb_base + RMB_Q6_BOOT_STATUS_REG))
> +		rproc->state = RPROC_DETACHED;
> +
>  	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
>  	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
>  	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
> --
> 2.42.0
> 

