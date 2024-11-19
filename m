Return-Path: <linux-arm-msm+bounces-38263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 703EE9D1DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 03:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 038FF1F21F72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 02:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FD31369BC;
	Tue, 19 Nov 2024 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vp7GVmL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4F136331
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 01:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731981596; cv=none; b=HdgBR3Fglnt5raYDW4dxcYI0Ann7SlTMxKHthPtXaBD3V4wuQtcQV9axsy/9QTGxKPyuOgEonlUlb5yRM2qF6LWoI4z5Z8pBkjJAzZsukMX8MbBVT9G+gxOC0pEEF+KzxNoRfjixh+xsVe5vzajo4xEcxvpEQhN+YugyWcOyuRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731981596; c=relaxed/simple;
	bh=k7oEV0P5rFawVdEvlcJxF6gDevuu3haFSzWwECAaudI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViGo7euJgp0Pe5mY4ZT7C3r4B26nOBm0aUUhwiosmLLsIOFcJTkoMvO1z8JcQnj581tE4yzQrMJtFWHDHxOnKqFRkOnxmqxhtOgDIbGNfFutqs63xwtfA4UdKY34mmhJaovI+iTdfjb611GuJ+zl0VNDg9u/v71WSv2RHScIUDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vp7GVmL4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5743074bso41683851fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731981592; x=1732586392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/OvNY52fWU5PD8o8xALIhnewUxZNHmsucUqv0krVUM=;
        b=vp7GVmL4D/8FW1lqD4Cf7xpH39VDczkX3l9Edz6x1YWTAEyvqBsmbDim9ExdraoIMl
         JWm7f145KqHUZgw0Q6Zj7xjbbEYAVsBd5OmPii1tHVzIkQdRqeFo8AR68+CD3JsL0hj5
         vHdBnyEGymVgfOOC1Tj8cKoRjehA7voQUe03YUf5pELCvqzQXng46NETjMv9FlZB2Z+J
         0U3Bk4h4U/TQlR1TjfOLti0/O1/eIeKr1mcllXmx4FgSdOkxYyiiITrjDVNh3LUyIMmc
         oBYkfJAdS1GY1jbQRRJGeZTpUVXJEiI4LRWncFQ5PbEgHUkzxBP9eLURYCCoIXInaHeP
         rpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731981592; x=1732586392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/OvNY52fWU5PD8o8xALIhnewUxZNHmsucUqv0krVUM=;
        b=aHe3d+dX/NHJScp8Mqh5q/9JkLooIx06nhy9MJz5sh+keW3XcTwtFkM9LVXfMPAGH4
         0yxxxxRZ2deMSKV5JZMpa5ONpztYGe4hD0ubXsyxJGyq2tUDbKeV3NiGkx9f9dPqo/hc
         lfLhVOLU/ZU01jJwhQW9jFN8T2wJR618xmqXkq7Et/ylf0x4nDchlwi9DLP4qPM36KK9
         Bk0UzMf32ylg+vsvPdgM6DfyIZkhchm3SWcvust4AKig/EjAqjY3dhrR8QtdOOmvjaYP
         ybUkNqnhokBUTTDSQNHeVCzNn8GwuOJypnYQ8Lvsqp6R7ezmnP7Sr8hmj8D1fDNVkvf7
         aBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhc9rkLw/xlIbALt7RaOV9zldcIzJzQRDHrCb0+HpHZYqxG/+OIP4eC9QwzSxr3wkeCyF7ACk53qVXgEye@vger.kernel.org
X-Gm-Message-State: AOJu0YzP3E0bV2wm3B+8jDZdlOUaFzKWJZ9XLhg77ZfqglSv1M2N0ac/
	Hz0PJ6hrIyuihZOLV3zT3WXlXRAyFXvKhznS6Qyw8FxUd7Bln46myWL/+DtUwlNjaDxe12Z4ZVh
	Y
X-Google-Smtp-Source: AGHT+IG2Rzq1QR5cEOlxhpbMBfxiVqxJwk/7ltOtHjroesTfT7lHwegu8IQ4MdLh+1a7pGLb3N5xuA==
X-Received: by 2002:a05:651c:b25:b0:2f7:6371:6c5a with SMTP id 38308e7fff4ca-2ff83bc57femr4537501fa.16.1731981592104;
        Mon, 18 Nov 2024 17:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69959957sm10782591fa.43.2024.11.18.17.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 17:59:50 -0800 (PST)
Date: Tue, 19 Nov 2024 03:59:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: Add support for GCC clock controller
 on SM8750
Message-ID: <xjfdqtiauxzmes3hwtgknjglu5rkp4mnyktsaxqtb7xmzsa2zx@phlkamgm47x4>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-6-quic_molvera@quicinc.com>
 <n4h4jvxrsyahgmxedfsifhgmarw4rzn2cbg5pcvzo4ll3edziq@vgpvjco5hyb4>
 <f2bf7790-7387-4eb6-8e1e-e555a20a717b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2bf7790-7387-4eb6-8e1e-e555a20a717b@quicinc.com>

On Mon, Nov 18, 2024 at 11:30:58AM -0800, Melody Olvera wrote:
> 
> 
> On 11/15/2024 7:34 AM, Dmitry Baryshkov wrote:
> > On Mon, Nov 11, 2024 at 04:28:05PM -0800, Melody Olvera wrote:
> > > From: Taniya Das <quic_tdas@quicinc.com>
> > > 
> > > Add support for GCC Clock Controller for SM8750 platform.
> > > 
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > > ---
> > >   drivers/clk/qcom/Kconfig      |    9 +
> > >   drivers/clk/qcom/Makefile     |    1 +
> > >   drivers/clk/qcom/gcc-sm8750.c | 3274 +++++++++++++++++++++++++++++++++
> > >   3 files changed, 3284 insertions(+)
> > >   create mode 100644 drivers/clk/qcom/gcc-sm8750.c
> > > 
> > > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > > index ef89d686cbc4..26bfb607235b 100644
> > > --- a/drivers/clk/qcom/Kconfig
> > > +++ b/drivers/clk/qcom/Kconfig
> > > @@ -1130,6 +1130,15 @@ config SM_GCC_8650
> > >   	  Say Y if you want to use peripheral devices such as UART,
> > >   	  SPI, I2C, USB, SD/UFS, PCIe etc.
> > > +config SM_GCC_8750
> > > +	tristate "SM8750 Global Clock Controller"
> > > +	depends on ARM64 || COMPILE_TEST
> > > +	select QCOM_GDSC
> > > +	help
> > > +	  Support for the global clock controller on SM8750 devices.
> > > +	  Say Y if you want to use peripheral devices such as UART,
> > > +	  SPI, I2C, USB, SD/UFS, PCIe etc.
> > > +
> > >   config SM_GPUCC_4450
> > >   	tristate "SM4450 Graphics Clock Controller"
> > >   	depends on ARM64 || COMPILE_TEST
> > > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > > index b09dbdc210eb..1875018d1100 100644
> > > --- a/drivers/clk/qcom/Makefile
> > > +++ b/drivers/clk/qcom/Makefile
> > > @@ -143,6 +143,7 @@ obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
> > >   obj-$(CONFIG_SM_GCC_8450) += gcc-sm8450.o
> > >   obj-$(CONFIG_SM_GCC_8550) += gcc-sm8550.o
> > >   obj-$(CONFIG_SM_GCC_8650) += gcc-sm8650.o
> > > +obj-$(CONFIG_SM_GCC_8750) += gcc-sm8750.o
> > >   obj-$(CONFIG_SM_GPUCC_4450) += gpucc-sm4450.o
> > >   obj-$(CONFIG_SM_GPUCC_6115) += gpucc-sm6115.o
> > >   obj-$(CONFIG_SM_GPUCC_6125) += gpucc-sm6125.o
> > > diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
> > > new file mode 100644
> > > index 000000000000..faaefa42a039
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-sm8750.c
> > > @@ -0,0 +1,3274 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <dt-bindings/clock/qcom,sm8750-gcc.h>
> > > +
> > > +#include "clk-alpha-pll.h"
> > > +#include "clk-branch.h"
> > > +#include "clk-pll.h"
> > > +#include "clk-rcg.h"
> > > +#include "clk-regmap.h"
> > > +#include "clk-regmap-divider.h"
> > > +#include "clk-regmap-mux.h"
> > > +#include "clk-regmap-phy-mux.h"
> > > +#include "common.h"
> > > +#include "gdsc.h"
> > > +#include "reset.h"
> > > +
> > > +enum {
> > > +	DT_BI_TCXO,
> > > +	DT_BI_TCXO_AO,
> > > +	DT_PCIE_0_PIPE_CLK,
> > > +	DT_SLEEP_CLK,
> > > +	DT_UFS_PHY_RX_SYMBOL_0_CLK,
> > > +	DT_UFS_PHY_RX_SYMBOL_1_CLK,
> > > +	DT_UFS_PHY_TX_SYMBOL_0_CLK,
> > > +	DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
> > This doesn't match Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> 
> Hmmm I see what seems to have happened here. You're correct; this doesn't
> match the bindings
> in sm8650-gcc. The v1 patchset had a new bindings file which matched the
> sm8650 bindings, but also
> didn't match the driver; however we only seemed to catch that the two
> bindings matched and not the
> fact that they didn't match the drivers.

I don't see v1. Please bring bindings back.

> 
> In terms of remedy I see two options. I'm fairly certain the driver here is
> correct, so we can either
> add the sm8750 bindings file back and remove the two lines about the PCIE 1
> clocks or adjust the
> sm8650 binding to encompass both sm8650 and sm8750. It's unclear to me how
> precedented the latter
> is; certainly having a single bindings file encompass both chips is
> feasible, but I think I'm currently
> leaning towards bringing back the original bindings file as that seems more
> precedented. Lmk
> your thoughts.

How are you thinking to change SM8650 bindings without breaking the ABI
/ backwards compatibility?

> 
> Thanks,
> Melody
> 
> > > +};
> > > +
> 

-- 
With best wishes
Dmitry

