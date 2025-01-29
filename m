Return-Path: <linux-arm-msm+bounces-46477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B4A218FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 09:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31098162A51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 08:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33617194096;
	Wed, 29 Jan 2025 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQ7kFf/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D557219992D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738139257; cv=none; b=iFhwm4UGXQsHudm0qHh2YojlI2L/+nXNQXSMG8WsPQUGtfb6uGWvLiX5VFyyktevqAnc5wCZpz5dbAZaZX8B9h3i4uf7TEcXTGPnk6BPrI0kMWLX1a3YNUatmtoq4nUP1u01zB4zBxOb2p9FBPonn3sf4YGB2b5JEOs6R8AbpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738139257; c=relaxed/simple;
	bh=jbFN3FLwQk/97n2wjzQR/BR2z8Y5CDZXPSM5L2M3+dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnScqxjQttu11Cv/IlN7sZb5j48JDA9wwMXQEyAWdgd28Hd7lVPUrSBiEH0DqKwjuxsZNHYZ4r8B3kWmUpYD1mk5oxcFgFollY2kiu1i7zoN2vF/qo2BocJrM3X5Ii2bQFsyoLDJ240jL52Z+MuiH6+EwjT7V6TaZILGgNFWk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQ7kFf/n; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361815b96cso44242515e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 00:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738139253; x=1738744053; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhQFBIJ8kvnHH7JrMdeXTDl9F+4hBg2i8+ptBD6seKs=;
        b=XQ7kFf/nXaWgVmKgjnKLSULuwsT1clx9iWu/KxwLGAJWp4ho5ejXUD2BKJ3E8Ft36p
         7jJJ7bXkvUfoGl1mJMDutCqNmoAi8/0Fv6UugGRspCAYGxBpXb8Rtgke+/FUOKELn8ae
         Vjx6AghvjxqdTmO/JbqrKK8uBrO5lgKycSWXu5Ayq0gQ3Jr4Hjarge8R6nqMF92rTA0q
         STPIWI36Nxzdnj/WdSQo3NDwzSM5eOWcPI6yc2qNze2g2kArcNYAfmSldIIA61fnh3Tx
         lstreUDmYnjAGMMMMKx/3t5fuqy2CiuX1MtUakgoUvXXXV+s/+g7tEK6R/v2Inpnj3KK
         HFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738139253; x=1738744053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhQFBIJ8kvnHH7JrMdeXTDl9F+4hBg2i8+ptBD6seKs=;
        b=MTbxuhO4Ks+vYjua9lCJED3eTJLDOKY4VYT1ukNH8MM1QQrLqHS/emocHPMJcMdp46
         Ogf/fyiOFhpiYupW9EdT2PTDZdFhVnVQcStpxZTAAhP4+NLHa59YV+bsQGHGV8AbWHDO
         28j4putfUKDJAAqgNh1MJKnDjEpkjRBCv2jpE4NB2I/h2bkTxrB0JwRBCapPw0mBvmNX
         1TUXna1Ftz5OSeQPJUI0pW08QF6hBkYj09aBO0VesHMhEXfMRUXkupXuk603z9ythzqF
         kGWBT2FeV/fZeti/1XWzOmj2h/NNHshrHAu0LixMD9klSUxTSpEWP2wpyjGPYwEtifG1
         +YRA==
X-Forwarded-Encrypted: i=1; AJvYcCURRRU6yOzb4w+2dBv7RkvyLVKaY5kWWo6W7tuSzX6EWZ5TvdOgBn4RDbxCdV2x5KUeiFMv54GBNKbqmbM1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqlnhg+nBk9oyJpMW0578IlGio2wtkXoa4C2E4rXLtKZGbj49S
	Gq7bFRFuooqfY6Bh3ng8RvXN2+qcX30hw97SJRfOwbfDS3OVrBnJfNKWvYt5ElE=
X-Gm-Gg: ASbGncvYDNRwX37jBufJI+uZlew98JAWzgXHuVJzrHLBbnobwXe1o5W5NH2qEL0RDRl
	PurZdmNwDFHOIny3wCEXCT+nNzLpD3eC2uV6Mca5c3KGXBj8sM2x4cGPUX0V6ZouZZk0JY/KOsv
	j3bB1+1CgnXy+jDv1og3lP8mBQ00JpHCtByQ96XgsKol+2NhZBpcV14tRXaFsAPT9M0aj/DiPI8
	u9KTW1gPVNuiGP/L/Oo0107T4Gpjh9WCcR76Le38lS6O5M9OlaeZ1geF9+OWRVrqSxcvcrZ0H1p
	36w6CehIFQDWgbEk0sycDQ==
X-Google-Smtp-Source: AGHT+IGZsU7GllkCu3Gh1OhbhjD1M01Dpo3iCvB2uGOrmjONcJ2TsbWHIx6gOm4dxW70pjtOGqx+kw==
X-Received: by 2002:a05:600c:468d:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-438dc429eb0mr16415325e9.29.1738139252906;
        Wed, 29 Jan 2025 00:27:32 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d5d4sm16071284f8f.21.2025.01.29.00.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:27:32 -0800 (PST)
Date: Wed, 29 Jan 2025 09:27:27 +0100
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
Subject: Re: [PATCH v4 05/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8226
Message-ID: <Z5nmb2gvWauVtkRc@linaro.org>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
 <20250129-msm8226-modem-v4-5-2b02ed7b7f1c@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129-msm8226-modem-v4-5-2b02ed7b7f1c@lucaweiss.eu>

On Wed, Jan 29, 2025 at 12:35:37AM +0100, Luca Weiss wrote:
> Add support for the external power block headswitch register needed by
> MSM8226 and some other qcom platforms.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 117 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2c80d7fe39f8e308eb12e79415a551b5009b3fe4..6f590f9128409b4aa427ab6bde1a9c4a966b3d15 100644
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
>  	bool has_mba_logs;
>  	bool has_spare_reg;
>  	bool has_qaccept_regs;
> +	bool has_ext_bhs_reg;
>  	bool has_ext_cntl_regs;
>  	bool has_vq6;
>  };
> @@ -180,6 +186,7 @@ struct q6v5 {
>  	u32 halt_nc;
>  	u32 halt_vq6;
>  	u32 conn_box;
> +	u32 ext_bhs;
>  
>  	u32 qaccept_mdm;
>  	u32 qaccept_cx;
> @@ -237,6 +244,7 @@ struct q6v5 {
>  	bool has_mba_logs;
>  	bool has_spare_reg;
>  	bool has_qaccept_regs;
> +	bool has_ext_bhs_reg;
>  	bool has_ext_cntl_regs;
>  	bool has_vq6;
>  	u64 mpss_perm;
> @@ -246,6 +254,7 @@ struct q6v5 {
>  };
>  
>  enum {
> +	MSS_MSM8226,
>  	MSS_MSM8909,
>  	MSS_MSM8916,
>  	MSS_MSM8953,
> @@ -415,6 +424,34 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
>  	}
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
> +	regmap_set_bits(qproc->conn_map, qproc->ext_bhs, EXTERNAL_BHS_ON);
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
> +	regmap_clear_bits(qproc->conn_map, qproc->ext_bhs, EXTERNAL_BHS_ON);
> +}
> +
>  static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, u64 *current_perm,
>  				   bool local, bool remote, phys_addr_t addr,
>  				   size_t size)
> @@ -1112,11 +1149,17 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  		goto disable_proxy_clk;
>  	}
>  
> +	if (qproc->has_ext_bhs_reg) {
> +		ret = q6v5_external_bhs_enable(qproc);
> +		if (ret < 0)
> +			goto disable_vdd;
> +	}
> +
>  	ret = q6v5_clk_enable(qproc->dev, qproc->reset_clks,
>  			      qproc->reset_clk_count);
>  	if (ret) {
>  		dev_err(qproc->dev, "failed to enable reset clocks\n");
> -		goto disable_vdd;
> +		goto disable_ext_bhs;
>  	}
>  
>  	ret = q6v5_reset_deassert(qproc);
> @@ -1214,6 +1257,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  disable_reset_clks:
>  	q6v5_clk_disable(qproc->dev, qproc->reset_clks,
>  			 qproc->reset_clk_count);
> +disable_ext_bhs:
> +	if (qproc->has_ext_bhs_reg)
> +		q6v5_external_bhs_disable(qproc);
>  disable_vdd:
>  	q6v5_regulator_disable(qproc, qproc->active_regs,
>  			       qproc->active_reg_count);
> @@ -1281,6 +1327,8 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>  			 qproc->reset_clk_count);
>  	q6v5_clk_disable(qproc->dev, qproc->active_clks,
>  			 qproc->active_clk_count);
> +	if (qproc->has_ext_bhs_reg)
> +		q6v5_external_bhs_disable(qproc);
>  	q6v5_regulator_disable(qproc, qproc->active_regs,
>  			       qproc->active_reg_count);
>  
> @@ -1750,6 +1798,23 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
>  		qproc->qaccept_axi = args.args[2];
>  	}
>  
> +	if (qproc->has_ext_bhs_reg) {
> +		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +						       "qcom,ext-bhs-reg",
> +						       1, 0, &args);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to parse ext-bhs-reg index 0\n");
> +			return -EINVAL;
> +		}
> +
> +		qproc->conn_map = syscon_node_to_regmap(args.np);
> +		of_node_put(args.np);
> +		if (IS_ERR(qproc->conn_map))
> +			return PTR_ERR(qproc->conn_map);
> +
> +		qproc->ext_bhs = args.args[0];
> +	}
> +
>  	if (qproc->has_ext_cntl_regs) {
>  		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>  						       "qcom,ext-regs",
> @@ -2021,6 +2086,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, qproc);
>  
>  	qproc->has_qaccept_regs = desc->has_qaccept_regs;
> +	qproc->has_ext_bhs_reg = desc->has_ext_bhs_reg;
>  	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
>  	qproc->has_vq6 = desc->has_vq6;
>  	qproc->has_spare_reg = desc->has_spare_reg;
> @@ -2174,6 +2240,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
>  	.has_mba_logs = true,
>  	.has_spare_reg = true,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_SC7180,
> @@ -2202,6 +2269,7 @@ static const struct rproc_hexagon_res sc7280_mss = {
>  	.has_mba_logs = true,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = true,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = true,
>  	.has_vq6 = true,
>  	.version = MSS_SC7280,
> @@ -2233,6 +2301,7 @@ static const struct rproc_hexagon_res sdm660_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_SDM660,
> @@ -2268,6 +2337,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_SDM845,
> @@ -2299,6 +2369,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_MSM8998,
> @@ -2337,6 +2408,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_MSM8996,
> @@ -2371,6 +2443,7 @@ static const struct rproc_hexagon_res msm8909_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_MSM8909,
> @@ -2416,6 +2489,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_MSM8916,
> @@ -2451,6 +2525,7 @@ static const struct rproc_hexagon_res msm8953_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_MSM8953,
> @@ -2503,13 +2578,53 @@ static const struct rproc_hexagon_res msm8974_mss = {
>  	.has_mba_logs = false,
>  	.has_spare_reg = false,
>  	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
>  	.has_ext_cntl_regs = false,
>  	.has_vq6 = false,
>  	.version = MSS_MSM8974,
>  };
>  
> +static const struct rproc_hexagon_res msm8226_mss = {
> +	.hexagon_mba_image = "mba.b00",
> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "pll",
> +			.uA = 100000,
> +		},
> +		{
> +			.supply = "mx",
> +			.uV = 1050000,
> +		},
> +		{}
> +	},
> +	.proxy_clk_names = (char*[]){
> +		"xo",
> +		NULL
> +	},
> +	.active_clk_names = (char*[]){
> +		"iface",
> +		"bus",
> +		"mem",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		NULL
> +	},
> +	.need_mem_protection = false,
> +	.has_alt_reset = false,
> +	.has_mba_logs = false,
> +	.has_spare_reg = false,
> +	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = true,
> +	.has_ext_cntl_regs = false,
> +	.has_vq6 = false,
> +	.version = MSS_MSM8226,
> +};
> +
>  static const struct of_device_id q6v5_of_match[] = {
>  	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
> +	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
>  	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
>  	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
>  	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
> 
> -- 
> 2.48.1
> 

