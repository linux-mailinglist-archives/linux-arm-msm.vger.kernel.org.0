Return-Path: <linux-arm-msm+bounces-4257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C26C80D4CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FBFBB20FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D135A4F1FB;
	Mon, 11 Dec 2023 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGkwdOOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF49D4EB4D;
	Mon, 11 Dec 2023 17:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD38C433CA;
	Mon, 11 Dec 2023 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702317517;
	bh=CoHFrQIbWUopxi/6NgF+s3ej3i0E535vo1y3uKwUONI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KGkwdOOXQeZxUl2el0v0YWwYVoi7gi7Aamf2+dyFcQKl3O89T0YT5Hllft2JrxnyM
	 vf678b32fIUcgYZ101sZuLq6sieHZvk6hThA3qadTWSOrWY8/Uj18t8nvR1KZIA2II
	 GJeharLzqWTlo3hLUk/iYP4aGCmryIf6ai5pPbvBY2SUbA6aERZ4F6/EjEFYk8H1Kf
	 bYq5e7IGA8j4FIFcEdRC65BYh9PXePZ/tX3J3zJ06/oDcHFuaStGjWvwNm/MvZWaHW
	 g+0wvR/cXepPQt9FrkLTaXY+D9ak+tdvwxOit+Mxw2AprsJosvlacxVmbJ5PKAQxZL
	 83FBLpuGGUQ8g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso5420919e87.0;
        Mon, 11 Dec 2023 09:58:37 -0800 (PST)
X-Gm-Message-State: AOJu0Yy4UQfewqBYw9v4yWl9Upwf5SrbwxXE0LcGlbvPI+o/ZSMyEPCa
	wVG8uiqtlfMQnANEpVBJK3gg4djASrWmsaSRZw==
X-Google-Smtp-Source: AGHT+IFhGfMMJKtekSGjF4bprgaJXphTzPGrMTvLkiHMAAyx3r/eZQMCNlyfs1fqyBwdkL9hb0l0Gns5aka9u+xU/uo=
X-Received: by 2002:a05:6512:2804:b0:50d:14b2:287a with SMTP id
 cf4-20020a056512280400b0050d14b2287amr2351763lfb.25.1702317515423; Mon, 11
 Dec 2023 09:58:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-x1e80100-clk-tcsrcc-v1-0-43078c6d6452@linaro.org> <20231122-x1e80100-clk-tcsrcc-v1-2-43078c6d6452@linaro.org>
In-Reply-To: <20231122-x1e80100-clk-tcsrcc-v1-2-43078c6d6452@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Dec 2023 11:58:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLO60Gmn6y=D+ZxKgoxRP9=jcZL9S8LuUgp=4HvAmvWzQ@mail.gmail.com>
Message-ID: <CAL_JsqLO60Gmn6y=D+ZxKgoxRP9=jcZL9S8LuUgp=4HvAmvWzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: Add TCSR clock driver for x1e80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 7:42=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> The TCSR clock controller found on X1E80100 provides refclks
> for PCIE, USB and UFS. Add clock driver for it.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig           |   8 +
>  drivers/clk/qcom/Makefile          |   1 +
>  drivers/clk/qcom/tcsrcc-x1e80100.c | 295 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 304 insertions(+)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index ad1acd9b7426..6ed9c89d9070 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1116,4 +1116,12 @@ config SM_VIDEOCC_8450
>           SM8450 devices.
>           Say Y if you want to support video devices and functionality su=
ch as
>           video encode/decode.
> +
> +config X1E_TCSRCC_80100
> +       tristate "X1E80100 TCSR Clock Controller"
> +       depends on ARM64 || COMPILE_TEST
> +       select QCOM_GDSC
> +       help
> +         Support for the TCSR clock controller on X1E80100 devices.
> +         Say Y if you want to use peripheral devices such as SD/UFS.
>  endif
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 17edd73f9839..4931a1470137 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -140,3 +140,4 @@ obj-$(CONFIG_SPMI_PMIC_CLKDIV) +=3D clk-spmi-pmic-div=
.o
>  obj-$(CONFIG_KPSS_XCC) +=3D kpss-xcc.o
>  obj-$(CONFIG_QCOM_HFPLL) +=3D hfpll.o
>  obj-$(CONFIG_KRAITCC) +=3D krait-cc.o
> +obj-$(CONFIG_X1E_TCSRCC_80100) +=3D tcsrcc-x1e80100.o
> diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc=
-x1e80100.c
> new file mode 100644
> index 000000000000..2ec142c3d1f9
> --- /dev/null
> +++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reser=
ved.
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

You probably don't need this header and the implicit includes it makes
are dropped now in linux-next. Please check what you actually need and
make them explicit.

Rob

