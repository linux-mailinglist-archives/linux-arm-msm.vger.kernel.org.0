Return-Path: <linux-arm-msm+bounces-23464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED7911538
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 23:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57E1B1F235B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 21:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3244C13D8A7;
	Thu, 20 Jun 2024 21:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxOje7aO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741FB13777F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 21:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920702; cv=none; b=q1Zpdfo8RpA84MhGoyQSBb0tD4ZnFTNMz1i0XsAeUwn9RxHTU4oL1dGtSBO00BBZqwIbxZvXVeJ//N5B0hbFcE6Z4eIbFno7Fn2wNrUbda7fLPphPz7idjaAeDNbrZo2MNISmTjHgbOs+Q0WHEmKyRbUf/ZfuTNMjCgw2sfnKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920702; c=relaxed/simple;
	bh=WNglnG4EG0a7w+NKdY5AjsKivBJFc0j8XEYGEoDzLEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVYfjVxxQ1Di1Vc2t+Df8Fi8CVaq0hC5AwXPJM2+QDtoYj/hecbvUCvyCxwMiVU3gaiPrU8Cy9ev60VKs34LatiXC8wltff03BdL1hM5RSsWargR8/y7VAYrAjtjlIxDx3uhKKVlh1IUSIByBMk5sHlmGXsjRiQuU+km6AEOMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxOje7aO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c82101407so2208776e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718920697; x=1719525497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=suCYK5x+Ifl4Je+hw0NA8NqpAzbzYiXDl0FFP7E4Y3U=;
        b=rxOje7aOA3fgC8BPeK1FbvcF91dADJGXC0UX58lWuHVf8FTvdDiRBvqcPMq44zjmSh
         H5kr2EHGIUwjnHCLzWVVbI7Mbtv17p8nfmuhnlhsdUBHucUq4edkKwilF5f9IFYaQpER
         P2VJphKZunx2hXguHnIjK8YPejiFs8erCP1nF7Fq939Lg33iwHHiIAPVRhiU9P+7+nqu
         h5SkYZbVoWMahtZNiJtMJQD94RbUdbdeZv9SO+ZB0y9sJTlFvmz5iiLivgS4Mf5yTotU
         blwmx8WMLYz0YZ8CQvB5+AYTaOox+WlktIbIBKkVXqV1DiB0CSehzWHLMxiGHAukOivi
         4zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920697; x=1719525497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suCYK5x+Ifl4Je+hw0NA8NqpAzbzYiXDl0FFP7E4Y3U=;
        b=azm5bt4yqctWB9nyJQ4NXquneea98hwGcRz9+vegcR88TVlGX1qzc1J23IzbdRF6n2
         jVPSwZguqdrEwgHeBfjIj/0sVSLW+2uwvzClF/iMN2GWxqLkndLhgTObmLUhbJrFP3Ue
         //S8KrXHcDFZttqbF45plQww5CBOX7Z6vELTuoZ9jZiEFsrwGmOWW+XtozFX4xnd+MPJ
         N7puciKtCyZgAXOKl/xhfO7TI7BH8LoDGOdfSqDuPZJWj17Dq8nvMZ9CI+VtIG8GNIaZ
         b5o0BkD2Xudah9CP3CD0OMmCKRWD5l2EdrKmZCVtN0a+I2V/bJaoNNUnR3Bia90tTiLb
         LyNw==
X-Forwarded-Encrypted: i=1; AJvYcCVDCEVDzHfmXgaLWIp1dxkvZaLmUxz/4QdVzvCfFJ9yovZpK8kmcBB/w63hf+dsGMT2CNB1UcPBSZuzZ9j2MDGrb7x05kqRzQMsl25U/Q==
X-Gm-Message-State: AOJu0YzLeRUiy4mihHrmRLYHqRyEx5JV8SDc4iPMJIxPyWxKeYTaY8gf
	cTpQ/huI7oj0KQVSrLtCu5Lekayx0qT1UKDoZHdK2EJqOjUZWmSUBNqJ3Cdd82U=
X-Google-Smtp-Source: AGHT+IG2UKUdwMoL1E6WFS1yCsso1Lh5TB7om64xk3wpfPrZVhCKJBRkYxVyN+C2fz2d8gWiuEApEg==
X-Received: by 2002:a05:6512:4ca:b0:52c:d5e4:9a99 with SMTP id 2adb3069b0e04-52cd5e49ccfmr88672e87.17.1718920697507;
        Thu, 20 Jun 2024 14:58:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd644c1f3sm5921e87.283.2024.06.20.14.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:58:17 -0700 (PDT)
Date: Fri, 21 Jun 2024 00:58:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>
Subject: Re: [PATCH v3 3/4] remoteproc: qcom_q6v5_pas: Add support to attach
 a DSP
Message-ID: <v6z2t53rfeaurrxttwqbab4emajzuvgr63qfro6t7vlexiusm3@bcoyybirzofg>
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

Don't c&p code from adsp_start(). Extract common function instead.

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

Move the error message to adsp_signal_q6v5(). Make the call conditional.

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

Misaligned

> +		rproc->state = RPROC_DETACHED;
> +
>  	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
>  	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
>  	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
> --
> 2.42.0
> 

-- 
With best wishes
Dmitry

