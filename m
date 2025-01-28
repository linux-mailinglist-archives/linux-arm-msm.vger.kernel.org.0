Return-Path: <linux-arm-msm+bounces-46405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6EA20E2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 17:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42B1E7A16F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 16:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863F11D89E3;
	Tue, 28 Jan 2025 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qk+2sQFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34813FD72
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080863; cv=none; b=YpmmIWGOqNmhATR58HAi8I9JpaR/Ra5xU7jxRZHxDsEE5k91rVuKCljmUEAWizG9OQE3qkwIgWjT6zjejl6eUReT1XAjwLLN0mlA9pscVZVKX4ekogt9/BwuZqAQTXkwGL8YSUeStuzHvK9XOtulayGHIg18PKU6rCQy8AY5tbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080863; c=relaxed/simple;
	bh=V+8O1rfG0PtgG2mZewWafITZ/QejPbq84+Q7W5vHrNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsM5Q7B7Dv9V+WbQODcBynzMQwj9rqOiNirTV6k/iF8N0ELbyTm2WdoL+sZ8kB6izGyVg9dHrzqQEIq4kj70yH7m56WGU713jtcamaMpbUl6D4L3QbOdBPZiayRIcuEMo1uyFeQCA6FloZNCva4N3PGcndPs5N4CnUS4kTSvJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qk+2sQFA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso6349777e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738080859; x=1738685659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfrf3X5SzKzh+CnGML4V0I738SsENrYkQEpW3iGzs00=;
        b=qk+2sQFAARncmVqCCuCA6GHAJvQeuc/CFBGgzetQlylc1ZAVboXmrLVQYPUdmIZVth
         DwvSiD12JGaY0VlVeV5greoI8EXZXLqA8xQmp7lK3oojmVulgVEdClz5ye6ZizTv6lcz
         z8nGPnnwzhH41RY1zw0ctDwJGSKqkTS42Cw7hfob6RsYLX20eBEvpwfh5rrSebnNzSer
         rnB5Gr8xwIIcrbu+AFGxZiCVG+qgiHm8zE/hZtmnhUElXpnXQuBQMnYMMo/atMaHvCL2
         wnM3CWsMKVa/V+ut07qAekXbrIWAsGmssjn65zMLbTTnJG2vffv9cL7mFWNNlLp1PW4m
         IZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080859; x=1738685659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfrf3X5SzKzh+CnGML4V0I738SsENrYkQEpW3iGzs00=;
        b=jAycl6V8oq9VEgNOUhuu+OtkwdWowsAq27U9erwWEAVRneqiQ+Cdx/DByLcfMW5Csb
         SxEC5BTqRstNy8UCWceRz+szB5ozBd64jpidahAwsxCOHDLahrJBIxUCog27JlV512KS
         oTvL8VheXfBePTt1w1TjguG3m6vHXmanxNVUaVE80n2CZytZ7J03hFxNl0IcLLy3OHc7
         pwwGCfJ+R7n2sPMOuh6aq3RIUQ67KO6mH/lHIACCx9nG/i44a4oEU17TAVzH8DZ/E6pF
         N1QafiXLtLuyGlNe93ACEfWGCaU9PExu2hLtIPlNhoAfA/rssGX4SiEcUGwNro4GVulr
         m4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVE8RTPGoiUYyTp4ulu3hhUKsDU36SDT3pZo9oPgQPjw8OpKvwx4v0REI/oiEJnjv1uyf+NTfu4Rj3pHJ4O@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhtntvFtDwZvJXmPit00iVT9FeaSPuNpI2odxTLApYEGTZTQo
	2RDLQLb7nd2s7wsU54fyfMq7Gny30GZzYy6sGFWdP4qdA3zJSyi0TmI2JwkFQAE=
X-Gm-Gg: ASbGncvB/AZSyiSup3yhQqo6dmM8Qe9/ynVhjx57nKPCBfXconH2M1CT8AIF8ISJNPN
	UjXledUYPle5r6XV6P2qBk6QpIdubMCIKe5H3ueUQ+oW3pIjG8IRb7yjPUNXCFHYf/Z1lb6P2OL
	mIekxoZ0xTOlg0zeRCRDd2Qk1GvbE4rqti+UhN8nm3NPvgN7NEg9PItPeeIZzXQbcwwVmjzbvVn
	AdQFBATIKKLHX6M2CRf0FF9WQl5qNlmMXGMWqd2Bg8ZLOsYrwW139ZfcxVjz5aRpe9BU7wHxBF6
	VpR4G7bsGXFnTk8DzX2jrh47MAfHRGEapDdy2cNyxqNcxVez+H39Hdksr7Bjb3U9Eg5+ciM=
X-Google-Smtp-Source: AGHT+IFoSCjOEyHyCxGBwZf3Dsd48yDOE82PeCVJp+p6g0aGNX2Zj7Vr+hQDmC1f8bpWHXoAVGDHnw==
X-Received: by 2002:ac2:4e16:0:b0:542:8e2c:b279 with SMTP id 2adb3069b0e04-543df6b977amr1412423e87.2.1738080858616;
        Tue, 28 Jan 2025 08:14:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8368516sm1667520e87.142.2025.01.28.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:14:17 -0800 (PST)
Date: Tue, 28 Jan 2025 18:14:14 +0200
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
Message-ID: <sb3beoyhnlcdfjbm37ogpdoph7m4fecpbuu3myglnpzblpnqhw@wdyskeps3uuh>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128080429.3911091-2-quic_dikshita@quicinc.com>

On Tue, Jan 28, 2025 at 01:34:28PM +0530, Dikshita Agarwal wrote:
> Introduce a helper module with a kernel param to select between
> venus and iris drivers for platforms supported by both drivers.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/Makefile          |  1 +
>  drivers/media/platform/qcom/iris/iris_core.h  |  1 +
>  drivers/media/platform/qcom/iris/iris_probe.c |  3 +
>  drivers/media/platform/qcom/venus/core.c      |  5 ++
>  .../platform/qcom/video_drv_helper/Makefile   |  4 ++
>  .../qcom/video_drv_helper/video_drv_helper.c  | 70 +++++++++++++++++++
>  .../qcom/video_drv_helper/video_drv_helper.h  | 11 +++
>  7 files changed, 95 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
> 
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index ea2221a202c0..15accde3bd67 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -2,3 +2,4 @@
>  obj-y += camss/
>  obj-y += iris/
>  obj-y += venus/
> +obj-y += video_drv_helper/
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 37fb4919fecc..7108e751ff88 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -107,5 +107,6 @@ struct iris_core {
>  
>  int iris_core_init(struct iris_core *core);
>  void iris_core_deinit(struct iris_core *core);
> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);

s/extern //g

>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 954cc7c0cc97..276461ade811 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
>  	u64 dma_mask;
>  	int ret;
>  
> +	if (!video_drv_should_bind(&pdev->dev, true))
> +		return -ENODEV;
> +
>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 77d48578ecd2..b38be7812efe 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -369,12 +369,17 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
>  static void venus_remove_dynamic_nodes(struct venus_core *core) {}
>  #endif
>  
> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);

Use #include instead.

> +
>  static int venus_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct venus_core *core;
>  	int ret;
>  
> +	if (!video_drv_should_bind(&pdev->dev, false))
> +		return -ENODEV;
> +
>  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/video_drv_helper/Makefile b/drivers/media/platform/qcom/video_drv_helper/Makefile
> new file mode 100644
> index 000000000000..82567e0392fb
> --- /dev/null
> +++ b/drivers/media/platform/qcom/video_drv_helper/Makefile
> @@ -0,0 +1,4 @@
> +# Makefile for Video driver helper
> +
> +obj-m := video_drv_helper.o

Always built as a module? And what if iris or venus are built into the
kernel?

Add a normal Kconfig symbol, tristate, no Kconfig string. Use depends on
IRIS && VENUS (and maybe default y) to let it be built only if both
drivers are enabled.

> +
> diff --git a/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
> new file mode 100644
> index 000000000000..9009c2906e54
> --- /dev/null
> +++ b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include "video_drv_helper.h"
> +
> +/* The venus driver supports only hfi gen1 to communicate with the firmware while
> + * the iris driver supports both hfi gen1 and hfi gen2.
> + * The support of hfi gen1 is added to the iris driver with the intention that
> + * it can support old gen1 interface based firmware, while enabling gen2 based future SOCs.
> + * With this, the plan is to migrate older SOCs from venus to iris.
> + * As of now, since the iris driver supports only entry level features and doesn't have
> + * feature parity with the venus driver, a runtime-selection is provided to user via
> + * module parameter 'prefer_venus' to select the driver.
> + * This selection is available only for the SoCs which are supported by both venus
> + * and iris eg: SM8250.
> + * When the feature parity is achieved, the plan is to switch the default to point to
> + * the iris driver, then gradually start removing platforms from venus.
> + * Hardware supported by only venus - 8916, 8996, SDM660, SDM845, SC7180, SC7280
> + * Hardware supported by only iris - SM8550
> + * Hardware supported by both venus and iris - SM8250
> + */
> +
> +#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> +{
> +	/* If just a single driver is enabled, use it no matter what */
> +	return true;
> +}
> +
> +#else

Move the stub funtion to header.

> +static bool prefer_venus = true;
> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
> +module_param(prefer_venus, bool, 0444);
> +
> +/* list all platforms supported by both venus and iris drivers */
> +static const char *const venus_to_iris_migration[] = {
> +	"qcom,sm8250-venus",
> +	NULL,
> +};
> +
> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)

The prefix is too broad, but maybe its fine.

> +{
> +	if (of_device_compatible_match(dev->of_node, venus_to_iris_migration))
> +		return prefer_venus ? !is_iris_driver : is_iris_driver;
> +
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(video_drv_should_bind);
> +#endif
> +
> +static int __init video_drv_helper_init(void)
> +{
> +	return 0;
> +}
> +
> +static void __exit video_drv_helper_exit(void)
> +{
> +}
> +
> +module_init(video_drv_helper_init);
> +module_exit(video_drv_helper_exit);

No need for this, please drop.

> +
> +MODULE_DESCRIPTION("A video driver helper module");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
> new file mode 100644
> index 000000000000..6d835227fec2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __VIDEO_DRV_HELPER_H__
> +#define __VIDEO_DRV_HELPER_H__
> +
> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> +
> +#endif
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

