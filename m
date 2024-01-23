Return-Path: <linux-arm-msm+bounces-7936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F14838D6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 12:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0046287B52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59F95D911;
	Tue, 23 Jan 2024 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhVobTbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8E5D745
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706009423; cv=none; b=envcSDOGSLsZO/qDzHU1aRuMETFYEXewl3fFj+3VeXsZ9+eCRuMMMW5LMo7Eieqk4jRn7KzT3mArrFM6Pp7OKndOBaybmXmcredX0HEJrRyNc2IXTJ34z62hYIE49kEjFP+gIain0n/7wAVxUDMVIbcrKRxT8yb8W93ImCh5E5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706009423; c=relaxed/simple;
	bh=8qXdDuefajqjfJnGLGX3kBl3k5rQ69pq1uKi0EcKllY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiW7eiWfIXhnEM2OasFSwbvxktmvZVM65abZX8wKsApBjPrj0k6D6Mrj1MMDHfV66edpd0qJfcNdDH53GYh/GiqKmT/XqDAlLIMmk9VuhKniv42wJ/3346Ot6b7b5GgLnvRKeDY1ArPxj0QSpIQItF8luL3AC6MtnZ9OUw2wTuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhVobTbs; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a309222cc62so148924766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706009418; x=1706614218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ztuc09k9XEhJQ02AL2HYqAF/bdpK94ISal8vRw8Rdk=;
        b=lhVobTbsFdMqdp7UrapKPsBiM8vizR0GcNzoXDhNHRe2dBegrUI1ZLqKNd3S2MclCm
         /de5kBeHEhVPUtW4f5e61ibUr37+QN7MrLZZHTN6WCw2RV0fsZepiOSDikfdh3jPTQIl
         zEdH/tPmfhO20MUoDvTgxoFPm0CTEzNshxpSkbA19CDXmxhmd6rQE3KA/AjVKCpIJ0jQ
         vshTU92+GOeXEKvCyJtWe+K27lDzQ+NpB6u84KcIRBbbJWx286s3X/5iu6HHKqemNPut
         m/iRMYP9HG2aR9CF/y4uYofoVBgp4zuiStAgQT9dbM8n1klGqTCMkHEOebgBJYSFitUe
         TAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009418; x=1706614218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ztuc09k9XEhJQ02AL2HYqAF/bdpK94ISal8vRw8Rdk=;
        b=JSyVpWyrFxJrmchqRlgkd0NOu/igfRSHkioddM12rrIa5s657DYRyboLhx0bVLG6Dm
         Oa5M26QAECDSCAAvJyAY2skKe+V451loVU+ui0qtU1liZYavx2q+bHSJexPrz3nbLyAQ
         4HaDSI1sVx6ocCFsy7F6T2DENoQ+2PPaLDjQF5jI062vxbXizv2jyuIKv89PGP7KLLNW
         eNYbSqdd2pqmYnOMVo/eisESwVWVTRHCXncTEflDc3RkR1xC9OvBVLfXUguhQ+g8WEal
         gXP1s7saeK291TuRSi87Ha56wwdp+eMHdx5YLJM/REagTQhoFKaS3Xux8A4nYhyogO+j
         cyCg==
X-Gm-Message-State: AOJu0YyZnbWOMpo0VHTRTd0Zm0KMTi8hj2N3WY/+hnT1aQDuXLYHxicC
	WsFxCrJmdS0xDh5PHH4NPnJIePCtgu4Ql6TRhBwvNDzaKbP9t8GziXW6W23ZVds=
X-Google-Smtp-Source: AGHT+IFwIlT1lMB4ByCt9mLwJOwLsuGSAt+FQywblYcr61g2wF5iH1FRbTnf2W39FnDIo7d9BMxBMg==
X-Received: by 2002:a17:907:c70d:b0:a2f:df21:9f24 with SMTP id ty13-20020a170907c70d00b00a2fdf219f24mr2609314ejc.97.1706009418414;
        Tue, 23 Jan 2024 03:30:18 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a2ea02e4162sm7969848ejc.214.2024.01.23.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 03:30:17 -0800 (PST)
Date: Tue, 23 Jan 2024 13:30:16 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2 07/10] clk: qcom: Add dispcc clock driver for x1e80100
Message-ID: <Za+jSGEpa6sobVIU@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-7-2b0739bebd27@linaro.org>
 <27cc9438-d31f-41af-b012-adb77dd4da5a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27cc9438-d31f-41af-b012-adb77dd4da5a@linaro.org>

On 23-12-15 12:45:11, Bryan O'Donoghue wrote:
> On 14/12/2023 16:49, Abel Vesa wrote:
> > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > Add the dispcc clock driver for x1e80100.
> > 
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> > +static struct platform_driver disp_cc_x1e80100_driver = {
> > +	.probe = disp_cc_x1e80100_probe,
> > +	.driver = {
> > +		.name = "disp_cc-x1e80100",
> > +		.of_match_table = disp_cc_x1e80100_match_table,
> > +	},
> > +};
> > +
> > +static int __init disp_cc_x1e80100_init(void)
> > +{
> > +	return platform_driver_register(&disp_cc_x1e80100_driver);
> > +}
> > +subsys_initcall(disp_cc_x1e80100_init);
> > +
> > +static void __exit disp_cc_x1e80100_exit(void)
> > +{
> > +	platform_driver_unregister(&disp_cc_x1e80100_driver);
> > +}
> > +module_exit(disp_cc_x1e80100_exit);
> > +
> > +MODULE_DESCRIPTION("QTI DISPCC X1E80100 Driver");
> > +MODULE_LICENSE("GPL");
> > 
> 
> And we don't even do the odd underscore insertion consistently. For whatever
> reason "DISPCC" instead of "DISP_CC"
> 
> Just to reiterate the underscores should be dropped from these clock
> controller names and defines entirely, they just eat up bytes in databases.
> 
> .name = "dispcc-x1e80100"
> 
> ("QTI DISPCC X1E80100 Driver"); better but IMO we could just a complete word
> here
> 
> "Display Clock Controller" there's no need to abbreviate.

Maybe, but I think it's better to stay aligned with other platforms.
So please check SM8550, SM8650, and so on.

> 
> ---
> bod

