Return-Path: <linux-arm-msm+bounces-46210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29357A1D2F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99874161140
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 09:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19CF1FC7C5;
	Mon, 27 Jan 2025 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWsDLUNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95B71FCCF9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968790; cv=none; b=BYSZFm+QDbaafnkBxc3mXU1q0PypwoADSHGHjuYKEk/ZncewrX2q+NIgbqRZ7blTwY4BUdB606aAtejIrLC1rVduWimFRTs7crosWZyIwMGRgwfiapGH4kv5F9lFEPy/s1ygYNV13vp6eXDaXN5zvG7+CXi6LhDsXV+yNh15QO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968790; c=relaxed/simple;
	bh=gO3d/4mrWXGze06FTi6Z9lXpH3hV9B3qsDLKjVLRQjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3Q4+wyYR7JT+eG4AGxhmd9SR3CkLdOctxddq5ry6rhC4129LPuTTFsiVbqMxo9Qhoy7gJlxTSjUdn30z3zj7aJfyRe7SB5zKQjB5GArdQTjeaiTImqZdUpeWA7W+i0x93dcw53KNXPh314fAejdY/20dgTOibqtn3YxMYF7mq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MWsDLUNS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab68a4ab074so277028966b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737968787; x=1738573587; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ru5JcDXJ0V6EvEX8QHAyIUNaLhSujmRQCuu+cesIXi4=;
        b=MWsDLUNSCM7FFWg3dm7Qh6h//hk0sxd67bjvyUJoTmIzDbKOSt4vs692c4lO7XI2B9
         bMZazHztRfBRHD7gBAP5qwhxn91kLh35Qaiff6aUetBCoyOSQtcH/VmqXZEdnWosOQS5
         93QlyNAus1jgT7H0DXk+2K/C0fc9KnTXm35Raspw971doF7jupyEOKHu5O/qaPgcIFVJ
         CYnzFs9IOeGH9dJ8Pi+F9CDNDpFfnluV3n5QQb7sp8tOlCPILsdS9zC5NmX1voIfKUKT
         Lc4x0fMOVjYXqdazbUuwCeQ2Mi+69uf6lA/bu+ALAKM53mooEXAK7O7FnA1iTDefKsPl
         1NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968787; x=1738573587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ru5JcDXJ0V6EvEX8QHAyIUNaLhSujmRQCuu+cesIXi4=;
        b=AM3npuKBVNOKcEOOSbu56r6pxrHYaKEwgkZZufgvqWYFDb3ykBqCJDZsGNL8AuApbc
         bUzosj9Vcun/BaeD6YLE3GIxpwT7uiz/dbLO3xqXl+LHKqLu0A+jbTvFA+7IKRENQjTu
         lnO5zIXSJyOHVARW8jC/XxRUqwwyP4cCby9w+Yy8N7VUeNrpZBHFZrBn3XAYRxAvWIAX
         Dy9TLGOqxAubE+JFCy5vVm9oS/pFKdRw7eYyi6mRmVgIcZhrldjXVJwgBsPHu5Cjc5w7
         wO+isQX64CiHZXFM1LfRagjywwpSX9185WVUFpSpGGSORXB/Pg0QcOIu5MkFhehlAfAs
         X9zg==
X-Forwarded-Encrypted: i=1; AJvYcCWmGB/dV9cdKPcHEopmcdwnGFcmxOyPJ1ruqvSgVk5uF3dnBkRoDYjDlgFY3j3ySrMmAfktaQtUU+7uL3ML@vger.kernel.org
X-Gm-Message-State: AOJu0YxZC89kvmq9JMh11P9yUK1SKUJK3bO2czifeE9Am2bc+yUGaFDS
	9+MdjlNHiSQpYo2JpeISK3+LxTbXxq4KHCpKgfqVA258hsrpcwkVISgb9tpA11E=
X-Gm-Gg: ASbGncvKKq8jHSSSgw9w2TSp9d5EfDM0gEQHbZz4iLqB/ClX/IFf5USpNp/+A1yvjA4
	ulMXcBadUU0pqQ/bZ7Y5QNVDVrbmR3wr8IL2o7FalzTuzGbymUabzk3yftVdRtWsAQMYplv9mX6
	532RjH84f/gGkbYYz7tH2JriHPSfzZfT3e9erE/gj1gwom+gn+TnkZdGf/ICPeYIWfuOS68s+6f
	j+q0mgve6Qjfd/fo42RHL6HP7gEIi62cmFvBHFnCNCADyIHRzbnpk9BFwrE2wbFZ6jOtNzkmz/4
	rW3Dkjcf2bTx0aPO
X-Google-Smtp-Source: AGHT+IEoku4hVU1Bs9oRO3XcssM7g6jlT/m4SSLdEG1yw4hlXESz6xS72CFcZgRwwuOZUWCMBW5YQg==
X-Received: by 2002:a05:6402:518a:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5db7d2f5ec0mr98139827a12.13.1737968787049;
        Mon, 27 Jan 2025 01:06:27 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18638ed2sm5138630a12.36.2025.01.27.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:06:25 -0800 (PST)
Date: Mon, 27 Jan 2025 10:06:24 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8226
Message-ID: <Z5dMkPvhjCkb9e9w@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-4-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-4-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:23PM +0100, Luca Weiss wrote:
> Add support for the external power block headswitch register needed by
> MSM8226 and some other qcom platforms.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
>   - Remove cx-supply from MSM8226 "fallback_proxy_supply" because it's
>     always used as power domain
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 117 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index e2523b01febf393abfe50740a68b85a04011293c..ef85c9843a12acb0e4e9ee6167c34d4981d4dc8a 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -134,6 +134,11 @@
>  #define BOOT_FSM_TIMEOUT                10000
>  #define BHS_CHECK_MAX_LOOPS             200
>  
> +/* External power block headswitch */
> +#define EXTERNAL_BHS_ON			BIT(0)
> +#define EXTERNAL_BHS_STATUS		BIT(4)
> +#define EXTERNAL_BHS_TIMEOUT_US		50
> +
>  struct reg_info {
>  	struct regulator *reg;
>  	int uV;
> @@ -161,6 +166,7 @@ struct rproc_hexagon_res {
> [...]
> @@ -1871,6 +1897,36 @@ static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
>  		dev_pm_domain_detach(pds[i], false);
>  }
>  
> +static int q6v5_external_bhs_enable(struct q6v5 *qproc)
> +{
> +	u32 val;
> +	int ret = 0;
> +
> +	/*
> +	 * Enable external power block headswitch and wait for it to
> +	 * stabilize
> +	 */
> +	regmap_update_bits(qproc->conn_map, qproc->ext_bhs,
> +			   EXTERNAL_BHS_ON, 1);

Nitpick: regmap_update_bits() doesn't take a bool (0/1) as last value,
it's the actual value. The 1 as last argument is essentially a magic
number here that happens to be equal to EXTERNAL_BHS_ON = BIT(0).

This should be

	regmap_update_bits(..., EXTERNAL_BHS_ON, EXTERNAL_BHS_ON);

or even better just

	regmap_set_bits(..., EXTERNAL_BHS_ON);

> +
> +	ret = regmap_read_poll_timeout(qproc->conn_map, qproc->ext_bhs,
> +				       val, val & EXTERNAL_BHS_STATUS,
> +				       1, EXTERNAL_BHS_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_err(qproc->dev, "External BHS timed out\n");
> +		ret = -ETIMEDOUT;
> +	}
> +
> +	return ret;
> +}
> +
> +static void q6v5_external_bhs_disable(struct q6v5 *qproc)
> +{
> +	regmap_update_bits(qproc->conn_map, qproc->ext_bhs,
> +			   EXTERNAL_BHS_ON, 0);

	regmap_clear_bits(..., EXTERNAL_BHS_ON);

> +}
> +
>  static int q6v5_init_reset(struct q6v5 *qproc)
>  {
>  	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
> @@ -2021,6 +2077,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, qproc);
>  
>  	qproc->has_qaccept_regs = desc->has_qaccept_regs;
> +	qproc->has_ext_bhs_reg = desc->has_ext_bhs_reg;
>  	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
>  	qproc->has_vq6 = desc->has_vq6;
>  	qproc->has_spare_reg = desc->has_spare_reg;
> @@ -2079,6 +2136,14 @@ static int q6v5_probe(struct platform_device *pdev)
>  		qproc->proxy_pd_count = ret;
>  	}
>  
> +	if (qproc->has_ext_bhs_reg) {
> +		ret = q6v5_external_bhs_enable(qproc);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "Failed to enable external BHS.\n");

Since the only possible error condition inside
q6v5_external_bhs_enable() is the timeout condition that is already
logged, you might as well drop this error message.

Thanks,
Stephan

