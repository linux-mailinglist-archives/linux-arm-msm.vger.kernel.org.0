Return-Path: <linux-arm-msm+bounces-35042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ECA9A47E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 22:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C471F21CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA9E205AB6;
	Fri, 18 Oct 2024 20:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IoW8156Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83E1DA0EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283139; cv=none; b=NFZ+tI+0tSnubsCKZ6xoAKBJutqeR1eSV7ZtjmOrM0MbicEmQ792iR7gGPJSoGzL+6nuQ9jP5+O3wqo88N+LLGg+5kkuzQE4Tern2Hra3FtUpmKGNYkm9LkoS3V3yG56YhkgG3REc+8PaLbcvX4SDSb29GKW6OZccDyWd9Flsl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283139; c=relaxed/simple;
	bh=e9nuRSeQ1q6xv+eJrem9Vo+jNIm6tW5/uoKUlHGWxGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iw7KQt4fu1n8ZToizITNeSQQha7YcpzJlIqr3xFX7Yx5hfPqaXORTY7ufR7IqQkXKSULUfJ7EAt3fvMFOLpvvsiqYHYJyTtMJHdqVodiKIYoe/RwMosNzqGfLcPrmGPNQOGDj6u1WDzHbHIl234xZvCfwExBQ1U4Fwb+zC2zzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IoW8156Z; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e8586b53so2983796e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729283135; x=1729887935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AK9GjlpOWcciFUtS8LZdCQZ8A93JMW9M4qtDPBrqppA=;
        b=IoW8156ZTL0lt4JqTBCzhbkbVyrnaRgLy4kYwP+z8ECxyKoDM64eW/qiyCvj4uMUVC
         8RZT5HqoEKHiFVmddMDFSH0Wv1UCsm+iH6YOh9VcOf58y+z4CP9S71jUZyu7u8iTdLCi
         fqMOO35+3ol/9B3KcZtS4ODxQY7aRMw3NlUxxyP7SNuuLPpllQlD2rrYAk44k1bBtg6Z
         MJucVjAJcLUg7S7dLtgQ2yVHIPPWb1lBaXzu77oU2rf7+1KpSvj7IdWMgoG7rMoiQAPV
         Ubr2dr5L0Psl9G8yerhw1Fo03OlyMmukqFGYw9sTdV4F8mU6ZafcaTzt68eMe0sq1uEg
         DFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283135; x=1729887935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK9GjlpOWcciFUtS8LZdCQZ8A93JMW9M4qtDPBrqppA=;
        b=qsTNf4bonmphQsFci+93w+SoM9TuF6mPY3GmhDNMXzlIXmmcIeXDJ3r3yoilfbWmtg
         KkKs5NAd+wSQ4t6xDdWo+RpfLo1m4hPwXXKlGBvFGG4X8kJ62aqZLjNBbdQ09fPP2QUm
         v4AhJ/rrKeN1a9fMXfVXaR/IQXfoXhRJYEX5/NV1+mA+Cx1U56edOyx6oK/t+tt3tXmp
         oNqlyKETaKOM6t8qdpTnMG6xeddAsSOjm5dfrVq3Kjdk4Awsvi7lbMI2tGFQPdovxl6q
         n/WlLLgwqP0yX3RbAhthWz5nsufTJrQW0zgC2nZ7cuz218UD4zA1HkXMNHI4NS7WQNjR
         AC2w==
X-Forwarded-Encrypted: i=1; AJvYcCV7nsvWv7l4J09GOhyJAN45v9Pkxw9PgWmPI5U/tzC6g42kcWAjaaQFMQFACrr4hPQ3688UyOHtjieLQhIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3byiS//E9Tpu3kivU3IbbLYDLUA8tKDooZOX1KfX09H1xVpd
	s4zDVl+utEOQeSra4+VO8toXmajZHbVFr/0J6yZ72wpP7ZyiWq9VAp11VAvD78Q=
X-Google-Smtp-Source: AGHT+IFMTlzv5g4qUtfX1TintmsLBocdxD75zUVXsk0YyPr6fsy8Fi5Lmut+T+XNEtKsz3N5oaywyA==
X-Received: by 2002:a05:6512:ac2:b0:539:fc9a:12e1 with SMTP id 2adb3069b0e04-53a0c7532c5mr2465574e87.27.1729283134900;
        Fri, 18 Oct 2024 13:25:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a1520480asm319613e87.211.2024.10.18.13.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:25:34 -0700 (PDT)
Date: Fri, 18 Oct 2024 23:25:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/11] clk: qcom: dispcc-qcs615: Add QCS615 display clock
 controller driver
Message-ID: <zsgdwc6klccdbytdysgl342zllgmb7ttatjh4tnug3unyl7vl3@tlptei23yozn>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-6-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-6-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:42AM +0530, Taniya Das wrote:
> Add support for the display clock controller for display clients to
> be able to request for the clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |   9 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/dispcc-qcs615.c | 786 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 796 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index bdb1c672dd90d96814b214afd234341e37e3c470..d0c815e8e4789958151742a8269d7d6f2245b26c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -460,6 +460,15 @@ config QCM_DISPCC_2290
>  	  Say Y if you want to support display devices and functionality such as
>  	  splash screen.
>  
> +config QCS_DISPCC_615
> +	tristate "QCS615 Display Clock Controller"
> +	select QCM_GCC_615
> +	help
> +	  Support for the display clock controller on Qualcomm Technologies, Inc
> +	  QCS615 devices.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config QCS_CAMCC_615
>  	tristate "QCS615 Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index f69c1bc13d3eca1859d9e849399e55175df869c3..f2be0c678127c8f78c5ee708993ebef273d02f19 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>  obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
>  obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
> +obj-$(CONFIG_QCS_DISPCC_615) += dispcc-qcs615.o
>  obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
>  obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>  obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
> diff --git a/drivers/clk/qcom/dispcc-qcs615.c b/drivers/clk/qcom/dispcc-qcs615.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..cc40a9a8a682ba58d9fa9db21e89a05cc75be8a5
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-qcs615.c
> @@ -0,0 +1,786 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_GPLL0,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,

Is there a DSI 1 PLL on this platform?

> +	DT_DP_PHY_PLL_LINK_CLK,
> +	DT_DP_PHY_PLL_VCO_DIV_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_DISP_CC_PLL0_OUT_MAIN,
> +	P_DP_PHY_PLL_LINK_CLK,
> +	P_DP_PHY_PLL_VCO_DIV_CLK,
> +	P_DSI0_PHY_PLL_OUT_BYTECLK,
> +	P_DSI0_PHY_PLL_OUT_DSICLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> +	P_GPLL0_OUT_MAIN,
> +};
> +

-- 
With best wishes
Dmitry

