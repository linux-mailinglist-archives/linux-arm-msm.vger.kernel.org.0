Return-Path: <linux-arm-msm+bounces-48890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B046CA3F69E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 14:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437EA188D3F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 13:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067C620B1EE;
	Fri, 21 Feb 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwEiZFH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B520A5DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740146378; cv=none; b=XkcV/KT++iod1vbAIpfJ1UANlxqPMurOSyC+TOfxkTiAAwIbyuGXe7fwCei++OD3soox1GEEhbd46WEzVoF75XY0AsFG0m4nZ43T7nMbGpSJrCLVzAiwbTC9hJkiJJct3giXV46AtjbxGhjqW/UBx+dAuOQNChAnHz7mm0D9pnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740146378; c=relaxed/simple;
	bh=CbxAJQT3KnJjiwPB/Rc1ytu55iSPfTpU8eUVc7UEzqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAt3kRh+o/LCeIGBiJ1ZuvelFwcd3avlpb+JmPIF/kAnkBsT+VS7PF3lTHnI4bzWyLG8i0TLlEoNWllOMd2Y/zwY81N66kI6prRZ5ZtipmlNJgv+zSKf2CdY3qhhKU1GBipOwr/kJjmhpsDdgyMYPBmG7yrvNCzEf3j/FWctFVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwEiZFH0; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-545316f80beso1963857e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 05:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740146374; x=1740751174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/zYl4L9cR43dlWu0AvSnmoEUXilsvHz4aPwBMTecENo=;
        b=JwEiZFH0sCyQlkXWPegQw5ZOVXQUJxVe3IlZiS32RMNudvk2ud3S7iLbn05/AEATSY
         vh2t2cN3ZBVCGWpiTslQtGbuZRyUI5tPniq9Mk50LRhqPiq+03HWoDIBgbrz/+8UgIea
         YE1Mn8qrRLL2DdcseyP2UxnZ1jNAigHnnAP4narVJWiYJTQkB/qgGiuqAFcUomp5dGsv
         MUTeKW8k4YQNfSPdZhakH5N6VfslSJu88hkMxivr3WkcT9QVxsGPwjw8qd4aYfFoOgOC
         rvqt2fs9OcjZKP42AZFxp5j5BnDygAdj7t+GO4Ovh7QqYICGgzdxE92V2OPiLsdlhFr6
         Y/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740146374; x=1740751174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zYl4L9cR43dlWu0AvSnmoEUXilsvHz4aPwBMTecENo=;
        b=VthJjjF2sw7zuNgCcRMy2c9d6WiwAk2azC6j6pxhqrQq+PdGTFcWoYy4qLBxJMSRDG
         zUSX7mRoYFc2XwNuT1kjlbkvRqXQ7NTywvJEnGfMFc3FvtnI2a8AhmmxKWcTUS7gGeDA
         Km8B/uPalfRFy7+KlCmTBe0jk7g4X5s90CBPyiigubCv9YEGaNnoo2O0MLs+RivSKeIc
         BGLOrkXl3jhEjzkR3SlOt0v5P3y+2OutB3eW/jA6/yE8LuoaFjZGO7fnEII48nbCClgN
         vX0E6rIJxXGvSAgr/okCpnRG4z8ecWMGW7r1qqenT0yvLYkVA6medivsHVWLh8V/HZXf
         bdog==
X-Gm-Message-State: AOJu0Yw59s5AWQ/lZMnAu2GfHG2N1mdJnDbkoREs+dVW+ZIxn6j6rtu1
	Kx8WXs0549pNU+hqJ64MFiXxg2USPcNImx+MKhDdghWyeZtgOLotsdLl7njy/0Q=
X-Gm-Gg: ASbGnctdogCCX1CWaaCbtstJigYULVeMirWmAvVMlQLFBmOPWv+DX9LZK/yhsCTQ0VU
	c/97MjioOD7SpSu6WcAoGnOIFqGqc4OMkw0LlhqZ4eNEMgfaCcciEPl6Kq7xN88Rstl7yXN7zaO
	/eQhCgYP7AJ+YHXPQBIgYz8fLTZ1jT/NgAG2fxf0LSsHfI4pO2JQ0V/qeKC7R20kSpRCnIyd8ZU
	Q9YyWDlRleXa8QPDj0jucl8hcQvZ91GENgpwka/uJHohigpiCp61MMG4s8/OY4ePA9T6Ymb5xW/
	ahF3Riorob5vaPv3yBFjDwLeEAMNLj/HTIh1SIuefQGJxZKb51OZLUmy50DKO5AABzjIstPREAo
	HfrGdsw==
X-Google-Smtp-Source: AGHT+IH1adyJodZuxejqxdNY7+1MgnBwNtjWHQ8rUzYhMFZCIdPs+a2+d5mwFLrhDrfQsO0ptGItPA==
X-Received: by 2002:a05:6512:ad2:b0:545:191:81db with SMTP id 2adb3069b0e04-54838f5e248mr1022548e87.50.1740146374490;
        Fri, 21 Feb 2025 05:59:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54531b8ac1dsm1994118e87.75.2025.02.21.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 05:59:33 -0800 (PST)
Date: Fri, 21 Feb 2025 15:59:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, amitk@kernel.org, thara.gopinath@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v4 4/5] thermal: qcom: tsens: Add support for IPQ5018
 tsens
Message-ID: <zesif5ehsoho3725k4xjqhb3tizj6fj6ufocdlzd3facj5hrrt@r4t5hthvyp2p>
References: <20250221065219.17036-1-george.moussalem@outlook.com>
 <DS7PR19MB8883A75912761EB89C9A1B409DC72@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883A75912761EB89C9A1B409DC72@DS7PR19MB8883.namprd19.prod.outlook.com>

On Fri, Feb 21, 2025 at 10:52:18AM +0400, George Moussalem wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens IP V1.0, 4 sensors and 1 interrupt.
> The soc does not have a RPM, hence tsens has to be reset and
> enabled in the driver init. Adding the driver support for same.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  [v4] Added Dmitry's Reviewed-by tag
>       Fixed modpost warning: added __init to init_common
> 
>  drivers/thermal/qcom/tsens-v1.c | 60 +++++++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens.c    |  3 ++
>  drivers/thermal/qcom/tsens.h    |  2 +-
>  3 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 1a7874676f68..1f955acbc2cf 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -79,6 +79,18 @@ static struct tsens_features tsens_v1_feat = {
>  	.trip_max_temp	= 120000,
>  };
>  
> +static struct tsens_features tsens_v1_ipq5018_feat = {
> +	.ver_major	= VER_1_X,
> +	.crit_int	= 0,
> +	.combo_int	= 0,
> +	.adc		= 1,
> +	.srot_split	= 1,
> +	.max_sensors	= 11,
> +	.trip_min_temp	= -40000,
> +	.trip_max_temp	= 120000,
> +	.ignore_enable	= 1,
> +};
> +
>  static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
>  	/* ----- SROT ------ */
>  	/* VERSION */
> @@ -150,6 +162,41 @@ static int __init init_8956(struct tsens_priv *priv) {
>  	return init_common(priv);
>  }
>  
> +static int __init init_ipq5018(struct tsens_priv *priv)
> +{
> +	int ret;
> +	u32 mask;
> +
> +	ret = init_common(priv);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Init common failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_field_write(priv->rf[TSENS_SW_RST], 1);
> +	if (ret) {
> +		dev_err(priv->dev, "Reset failed\n");
> +		return ret;
> +	}
> +
> +	mask = GENMASK(priv->num_sensors, 0);
> +	ret = regmap_field_update_bits(priv->rf[SENSOR_EN], mask, mask);
> +	if (ret) {
> +		dev_err(priv->dev, "Sensor Enable failed\n");
> +		return ret;
> +	}
> +
> +	ret = regmap_field_write(priv->rf[TSENS_EN], 1);
> +	if (ret) {
> +		dev_err(priv->dev, "Enable failed\n");
> +		return ret;
> +	}
> +
> +	ret = regmap_field_write(priv->rf[TSENS_SW_RST], 0);
> +
> +	return ret;
> +}
> +
>  static const struct tsens_ops ops_generic_v1 = {
>  	.init		= init_common,
>  	.calibrate	= calibrate_v1,
> @@ -194,3 +241,16 @@ struct tsens_plat_data data_8976 = {
>  	.feat		= &tsens_v1_feat,
>  	.fields		= tsens_v1_regfields,
>  };
> +
> +const struct tsens_ops ops_ipq5018 = {
> +	.init		= init_ipq5018,
> +	.calibrate	= tsens_calibrate_common,
> +	.get_temp	= get_temp_tsens_valid,
> +};
> +
> +struct tsens_plat_data data_ipq5018 = {
> +	.num_sensors	= 5,

Commit message suggests that this should be '4'.

> +	.ops		= &ops_ipq5018,
> +	.feat		= &tsens_v1_ipq5018_feat,
> +	.fields		= tsens_v1_regfields,
> +};

-- 
With best wishes
Dmitry

