Return-Path: <linux-arm-msm+bounces-47785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0FA32C40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001431882E28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6945624C663;
	Wed, 12 Feb 2025 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOR6ZRFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE4253B6A;
	Wed, 12 Feb 2025 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378825; cv=none; b=M+8tC/xkFndVpLb6Sl1gfTZ/fTIeC+u6ZklaCQla8Gm7bV2AD40SGIUi2yGNGkFEzYxCDhxGezYA2DA1s+xKsZ3/5v9nJw6pJXC+VWYg2xQhnhdGNRBf/wU2ddqA6oKEsyh1SapErKGnkepWP87wX8yTb0bleiF8t1jDF6D+Y5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378825; c=relaxed/simple;
	bh=AxbqplLjvLiGIpCkppb7rOx2QEyb+sThces8qpsbMCE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aixR4Tbrj1LT2wPHfifV+WiXTdkm1/MVRCCyP5XPPupmhkfUis4oewY0jHgD64E0xoSudFZFDFSu45c2OB1+ESUBbp1P5YV/YKxtgZnqZE1vtCN8DpkliFDluaafMSrQ6pVqyd82hOiLmIRJfReB4sPOs3rEg+nTRErUwzMv2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOR6ZRFg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220ca204d04so7247585ad.0;
        Wed, 12 Feb 2025 08:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739378823; x=1739983623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDVzRfCwBh1mYoJ2qxS4TbDOigyo6o/RrhqIM36xUOA=;
        b=QOR6ZRFgo6vlCX5RBNbwEQQMhH71HFFV5dlQGwtwqDl6Pko14Eq3XEksR/n7Fp9IXt
         TjOxq4tBhyyFUrp1vZH7gR7YkDOm//WA2UVJm2Fk9QjqCSII27sX+bCoLtSrBd27xCm8
         q2zkyFQaVTFvFXzxuOaQEnZSlGbgHBFx6VmERg0GrlSPO2+3+CuIZGGxoGCjA4U5dZeP
         eTkAEV7emvEn/OxxoiRiemod6BtCm/ovmwLhVR4k93CtSw5PhMuhxA9hPgYewW9ZJFhJ
         2BtBSu812FgEBZMncskEIbxhCp0vOi/gj5prupoPfXwQzflCoCSQrCeUad0VtTFJ+Pzt
         dN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378823; x=1739983623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDVzRfCwBh1mYoJ2qxS4TbDOigyo6o/RrhqIM36xUOA=;
        b=nP6hAfZMxAG6wAGQI3oawO0TEaOOM1IYiMIDv1WNXWCkBvd+S9cJnEH1kximcqfRp5
         HygZCq91pfZC4K+5E710LVehXeaHRHyu1kw13qGkyOtCN6Z2vDbEyPOc/D33Bn9wjFz7
         BYNH8tXXfamOwvaQEL0oWcraRUYBDy4sBHyCLqqXI8PK914zdHnkNi5Ymdzuh1HNn1fy
         CHHD3Sr5YeP6UwUlNNqg4OpFwB0mR9hoX9deRyw5lXgLx9B/prDEmGWKjBNGD0t24BSR
         TUU+kKyjrdJRbd99VZBPVGtBdw3QDLZvwE8LQlrrc/iSkCtqhpXnFUsraSnvzb6FJ+iv
         VZcA==
X-Forwarded-Encrypted: i=1; AJvYcCVDkZ1r8bvoM/uOZmcWyUeD48xmLyNyrigaKGjvcaWe13ZO/G2QDM1KwJNod3ijkSLu+YWZKJYAtIPo@vger.kernel.org, AJvYcCVXdzGL9UeMFwhRKxjbWM9kiQ9LhiM2GiAaHCu7xbdVBf/jwOK8Y107c0qrmu7/zjlT7O4NjV9QAjo4G8pt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Y6yQgV701WAPbGm1wMIU2HyhdhkxnTZvx2FDido9pffvSjF2
	yxn/q3bga/D+O1ev6lPym3O+UGj1GyKIc9/wmxlCPZGHVYO4DzWJ
X-Gm-Gg: ASbGncvFRHZPaBHX5pf5b5RvFewoA/RNumTHGZ0vVlF7FX+bvyO2E8sXFsno3LfR3se
	NBpFN4xHXLAsAQZquZ8X76PaoAqtqu65Uh526GXkKEU8d1FZUjoOTqXSk4/Fscm+Cm4PXTz4KX8
	UO9m0g4sq2/b2/gqU1LR2fs1UiQ+YQT1S5a5p0WQjv4ShKZA45HDP0gYmVvAz45UEYuYtjrkxog
	bjq9GcrXhkXbU5tqjRdEePH8d7rmEHd3dHUjdLn2UAzg5+XpbFIovxYU3R6Mb+xxY8hkeeLHRWF
	1S9EzHRzg5KpUZqqCEGf0FniZ5u0oYm8AvJ1mQlkGw==
X-Google-Smtp-Source: AGHT+IE2CcZuyc9ctvMGoGdHrpg/H7Hpn/fcbaXpofrnJbeOrrvyTTBnIkCgcIZwnR0ssBQq5iBTIQ==
X-Received: by 2002:a05:6a21:81:b0:1ee:6032:b1e8 with SMTP id adf61e73a8af0-1ee6032be02mr4157409637.18.1739378822875;
        Wed, 12 Feb 2025 08:47:02 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307d1e80e5sm7467266b3a.15.2025.02.12.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:47:02 -0800 (PST)
Date: Wed, 12 Feb 2025 08:46:59 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 quic_wcheng@quicinc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
Message-ID: <20250212084659.572c0408@jamesmacinnes-VirtualBox>
In-Reply-To: <f4a15f6d-1c2c-484b-9a81-6e5e138b3fdb@oss.qualcomm.com>
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
	<20250212010744.2554574-3-james.a.macinnes@gmail.com>
	<f4a15f6d-1c2c-484b-9a81-6e5e138b3fdb@oss.qualcomm.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 13:55:59 +0100
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 12.02.2025 2:07 AM, James A. MacInnes wrote:
> > This patch extends the Qualcomm USB VBUS regulator driver to support
> > PMI8998 PMIC alongside the existing support for PM8150B.
> > 
> > Key changes:
> > - Added current limit tables specific to PMI8998.
> > - Dynamically configure the VBUS regulator based on the PMIC type.
> > - Updated debug messages to reflect successful initialization for
> >   supported PMICs.
> > - Changed registration log message
> > 
> > These changes ensure proper VBUS current limit configuration and
> > compatibility across multiple Qualcomm PMICs.
> > 
> > Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> > ---
> >  drivers/regulator/qcom_usb_vbus-regulator.c | 38
> > ++++++++++++++++++--- 1 file changed, 33 insertions(+), 5
> > deletions(-)
> > 
> > diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c
> > b/drivers/regulator/qcom_usb_vbus-regulator.c index
> > cd94ed67621f..804dd1a9e057 100644 ---
> > a/drivers/regulator/qcom_usb_vbus-regulator.c +++
> > b/drivers/regulator/qcom_usb_vbus-regulator.c @@ -20,10 +20,30 @@
> >  #define OTG_CFG				0x53
> >  #define OTG_EN_SRC_CFG			BIT(1)
> >  
> > -static const unsigned int curr_table[] = {
> > +struct msm_vbus_desc {
> > +	const unsigned int *curr_table;
> > +	unsigned int n_current_limits;
> > +};
> > +
> > +static const unsigned int curr_table_pm8150b[] = {
> >  	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
> >  };
> >  
> > +static const unsigned int curr_table_pmi8998[] = {
> > +	250000, 500000, 750000, 1000000,
> > +	1250000, 1500000, 1750000, 2000000,
> > +};  
> 
> To the best of my understanding these numbers are correct
> 

Hopefully it is all correct. I pulled the numbers from the datasheet,
but they are known to lie.

> > +
> > +static const struct msm_vbus_desc msm_vbus_desc_pm8150b = {
> > +	.curr_table = curr_table_pm8150b,
> > +	.n_current_limits = ARRAY_SIZE(curr_table_pm8150b),
> > +};
> > +
> > +static const struct msm_vbus_desc msm_vbus_desc_pmi8998 = {
> > +	.curr_table = curr_table_pmi8998,
> > +	.n_current_limits = ARRAY_SIZE(curr_table_pmi8998),
> > +};
> > +
> >  static const struct regulator_ops qcom_usb_vbus_reg_ops = {
> >  	.enable = regulator_enable_regmap,
> >  	.disable = regulator_disable_regmap,
> > @@ -37,8 +57,6 @@ static struct regulator_desc qcom_usb_vbus_rdesc
> > = { .ops = &qcom_usb_vbus_reg_ops,
> >  	.owner = THIS_MODULE,
> >  	.type = REGULATOR_VOLTAGE,
> > -	.curr_table = curr_table,
> > -	.n_current_limits = ARRAY_SIZE(curr_table),
> >  };
> >  
> >  static int qcom_usb_vbus_regulator_probe(struct platform_device
> > *pdev) @@ -48,6 +66,7 @@ static int
> > qcom_usb_vbus_regulator_probe(struct platform_device *pdev) struct
> > regmap *regmap; struct regulator_config config = { };
> >  	struct regulator_init_data *init_data;
> > +	const struct msm_vbus_desc *quirks;  
> 
> 'quirks' is one way to put it ;) I'd call it 'desc' or 'data' but it's
> totally a potayto/potahto discussion
> 

Is there a reasonable name for that? I suspect that later chips may add
more to the structure. I am happy to change it as there is at least one
more revision for this series.

> >  	int ret;
> >  	u32 base;
> >  
> > @@ -68,6 +87,12 @@ static int qcom_usb_vbus_regulator_probe(struct
> > platform_device *pdev) if (!init_data)
> >  		return -ENOMEM;
> >  
> > +	quirks = of_device_get_match_data(dev);
> > +	if (!quirks)
> > +		return -ENODEV;
> > +
> > +	qcom_usb_vbus_rdesc.curr_table = quirks->curr_table;
> > +	qcom_usb_vbus_rdesc.n_current_limits =
> > quirks->n_current_limits; qcom_usb_vbus_rdesc.enable_reg = base +
> > CMD_OTG; qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
> >  	qcom_usb_vbus_rdesc.csel_reg = base +
> > OTG_CURRENT_LIMIT_CFG; @@ -80,18 +105,21 @@ static int
> > qcom_usb_vbus_regulator_probe(struct platform_device *pdev) rdev =
> > devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config); if
> > (IS_ERR(rdev)) { ret = PTR_ERR(rdev);
> > -		dev_err(dev, "not able to register vbus reg %d\n",
> > ret);
> > +		dev_err(dev, "Failed to register vbus reg %d\n",
> > ret); return ret;
> >  	}
> >  
> >  	/* Disable HW logic for VBUS enable */
> >  	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG,
> > 0); 
> > +	dev_dbg(dev, "Registered QCOM VBUS regulator\n");  
> 
> Not sure how useful this is given the previous call creates a sysfs
> entry on success, but sure
> 
> Konrad

I like having a "I'm here" message so I can see when something is
loaded and to know where in the boot log it happened. Happy to remove it
if that is the standard.

James


