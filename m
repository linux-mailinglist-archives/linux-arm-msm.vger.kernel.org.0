Return-Path: <linux-arm-msm+bounces-46499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250DA21C26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 12:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74AE51887A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8481BEF87;
	Wed, 29 Jan 2025 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWj29di4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088251B424A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738150060; cv=none; b=otz5mCzNf7uZ/CX2Ku0RV1IGwnYeIkOewOdnS4XXo9pN3d36WOPsWudcCz7pAulMXRywlKqlxN5g46TrwI+2p4HjnAZcmNZ2Z2+vfngd0LWVaYlN0INo0EHL0gaoRrm87GL/zrAeYtT7wAiHBy9EBAQkHhF/cSiPv/t7akIVm0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738150060; c=relaxed/simple;
	bh=QbzMdo5twuN8qHdUuuA8eKAEXsCU81mC2eMowoF6pkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVvD9tX33+odcb/hDy/VUAbP7W9CIRTX+/Dk3kVj/877LvDd97jCyYUILw6LAMzGrme904fK5P+1zXS2VGS3C85pSMZE9RYHxGh0ojF32lfgodrW2OL+QetgfjlHpz3Vf1n+0T9qlKUI70FonXJiL5dqEgQtTDtczbnlVLr0Fps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWj29di4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54298ec925bso7779715e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 03:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738150055; x=1738754855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdMhtxP5R+RhzbtYpl+nDYBC1VN7c30OWolTsuKS8Es=;
        b=vWj29di4IP3TNXPK3gzSGQuOHcrcyYXppym3TmeABM4iG0x+wofmD7dneNKRhlwC22
         b4Zt3GIghhTTyRBgkkyWEjSBoc3SfZ46puJujWzyT2YhdH8bGM9IW5A1eCDh6UN+0Vb+
         QvuveqUYT2tb8o+f+t5bmK+YQFtI/uo3uKW/GAx45jA5nkIKwr25nuBLTHYc9zLX12s/
         fQY4Q8Uy0DPakT6CUqY+ZXyYrb/1qJtkEzM6KgdbIh5NR9pv1f+ZFQXVNh9S9vSidxAv
         7VimNHfALmxYe8V9DB0p+dDlsqwJa7fCI8FHGHKVIQJ/tyh/r21t6Rftoz4x0SRVsd1Q
         pg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150055; x=1738754855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdMhtxP5R+RhzbtYpl+nDYBC1VN7c30OWolTsuKS8Es=;
        b=hD7rr1FKaFk0+ut3RQzuek08ONLEl9uE/NMRKoEKH5KNWddg1t4toL+wGCOz/79awl
         XTZgFYxeZUnD1VXwyggBfLWZAPyjw5M/oH/iYSp1lTG6o3ykfDQPvr1henwXaORMXMYS
         EX0kJVSrRoo+G1VfXaMftlhOKuYrLA6JqJJiEka4X3RWyHFAGHk/z02sk6rz4AkCMd9z
         MwNDxhgy7Av47gC4Hwo85XxQgx3GnS2qwEid/o1qA/ihdXNW7yuupXTCR6KPWov7HCQS
         uNyucFdLcMMdxvMFOZVjoSAOcrIEa9ayHB36RG447nmGSgTBgAPKqSSe/qzQa1t8WvuY
         +aog==
X-Forwarded-Encrypted: i=1; AJvYcCWw7y7eBKPwBJzq2GHKYkx264s6XcK75QpqWnJYutGeXbYwKTp2A/XkQuotE4gEY28K+kVqcUuh9bCvOVBw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+5Dvs8OZmFL5z8OYWSb5VmXjp+YaS3DcoddGPiunrBfC479XC
	RaP08cXkdh/4Vn/uyUv4iYCpdn2J7xOIl4qu7Bvt12qY7FbJfqfitjcQlKLzN9g=
X-Gm-Gg: ASbGncv6TEqXzJSfWnUnn/l8VZ8uYBWaJd8TUqG3pv9JEn1TibtxdMflU2APq4E/Otx
	eRT+LHnc+eactU+1lzNG95um/C2UujuBDJO16DJJ5Yor5a1VI9ZSIwKGH9zl1STJM9xiWjsAzP5
	0bkjz30aDCsHeBnrzo4rWcJleSFIX7jhVvA0zCCeTDCH7CNV0MevDmzdKmkYwazemKkpoFNKAlX
	yELlGBCfyJWwZ91yvMlHhTUVx3PBmKTozEng3+qEwUZ092Fyn3xfDnxF6Ajx8JCQjvPN8+LD+w6
	Rfy38nJvkY5VoqIpYw3CJPzneJk1HQ07wEarJ44qujmZhtusKtzw8O8DV6Id3/f4HOubjgs=
X-Google-Smtp-Source: AGHT+IFtlc94QWGgPJciAfKJd6iML1fdimMywpw4Q1xwQVsFRb8X3q+yuNtr1tZBr1nfLKPhKsx6OQ==
X-Received: by 2002:a05:6512:148:b0:540:2ff1:3c7c with SMTP id 2adb3069b0e04-543e4bdff2amr733639e87.7.1738150054904;
        Wed, 29 Jan 2025 03:27:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c837949esm1965905e87.160.2025.01.29.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:27:33 -0800 (PST)
Date: Wed, 29 Jan 2025 13:27:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: quic_vgarodia@quicinc.com, quic_abhinavk@quicinc.com, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, 
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org, 
	neil.armstrong@linaro.org, nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com, 
	stefan.schmidt@linaro.org, lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	krzysztof.kozlowski@linaro.org, johan@kernel.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <dl5gxjxvajoq3tszujqrew7ynvepufcr2qj7ztj7ksgv2fxtdt@zaeqtxuwbayb>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <sb3beoyhnlcdfjbm37ogpdoph7m4fecpbuu3myglnpzblpnqhw@wdyskeps3uuh>
 <45c3676a-aafe-59e8-910d-af82031c24a6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c3676a-aafe-59e8-910d-af82031c24a6@quicinc.com>

On Wed, Jan 29, 2025 at 03:23:22PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/28/2025 9:44 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 01:34:28PM +0530, Dikshita Agarwal wrote:
> >> Introduce a helper module with a kernel param to select between
> >> venus and iris drivers for platforms supported by both drivers.
> >>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/Makefile          |  1 +
> >>  drivers/media/platform/qcom/iris/iris_core.h  |  1 +
> >>  drivers/media/platform/qcom/iris/iris_probe.c |  3 +
> >>  drivers/media/platform/qcom/venus/core.c      |  5 ++
> >>  .../platform/qcom/video_drv_helper/Makefile   |  4 ++
> >>  .../qcom/video_drv_helper/video_drv_helper.c  | 70 +++++++++++++++++++
> >>  .../qcom/video_drv_helper/video_drv_helper.h  | 11 +++
> >>  7 files changed, 95 insertions(+)
> >>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
> >>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
> >>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
> >>
> >> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> >> index ea2221a202c0..15accde3bd67 100644
> >> --- a/drivers/media/platform/qcom/Makefile
> >> +++ b/drivers/media/platform/qcom/Makefile
> >> @@ -2,3 +2,4 @@
> >>  obj-y += camss/
> >>  obj-y += iris/
> >>  obj-y += venus/
> >> +obj-y += video_drv_helper/
> >> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> >> index 37fb4919fecc..7108e751ff88 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_core.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> >> @@ -107,5 +107,6 @@ struct iris_core {
> >>  
> >>  int iris_core_init(struct iris_core *core);
> >>  void iris_core_deinit(struct iris_core *core);
> >> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> > 
> > s/extern //g
> > 
> >>  
> >>  #endif
> >> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> >> index 954cc7c0cc97..276461ade811 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
> >>  	u64 dma_mask;
> >>  	int ret;
> >>  
> >> +	if (!video_drv_should_bind(&pdev->dev, true))
> >> +		return -ENODEV;
> >> +
> >>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> >>  	if (!core)
> >>  		return -ENOMEM;
> >> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >> index 77d48578ecd2..b38be7812efe 100644
> >> --- a/drivers/media/platform/qcom/venus/core.c
> >> +++ b/drivers/media/platform/qcom/venus/core.c
> >> @@ -369,12 +369,17 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
> >>  static void venus_remove_dynamic_nodes(struct venus_core *core) {}
> >>  #endif
> >>  
> >> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> > 
> > Use #include instead.
> > 
> >> +
> >>  static int venus_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >>  	struct venus_core *core;
> >>  	int ret;
> >>  
> >> +	if (!video_drv_should_bind(&pdev->dev, false))
> >> +		return -ENODEV;
> >> +
> >>  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
> >>  	if (!core)
> >>  		return -ENOMEM;
> >> diff --git a/drivers/media/platform/qcom/video_drv_helper/Makefile b/drivers/media/platform/qcom/video_drv_helper/Makefile
> >> new file mode 100644
> >> index 000000000000..82567e0392fb
> >> --- /dev/null
> >> +++ b/drivers/media/platform/qcom/video_drv_helper/Makefile
> >> @@ -0,0 +1,4 @@
> >> +# Makefile for Video driver helper
> >> +
> >> +obj-m := video_drv_helper.o
> > 
> > Always built as a module? And what if iris or venus are built into the
> > kernel?
> iris and venus are always built as module,

This is not correct.

> and if we are adding the
> dependency of this module on IRIS && VENUS then this can't be Y I think.

It surely can. Moreover, if one doesn't enable both Iris and Venus, this
module is completely unnecessary.

> > Add a normal Kconfig symbol, tristate, no Kconfig string. Use depends on
> > IRIS && VENUS (and maybe default y) to let it be built only if both
> > drivers are enabled.

-- 
With best wishes
Dmitry

