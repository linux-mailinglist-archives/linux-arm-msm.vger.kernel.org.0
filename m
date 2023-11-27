Return-Path: <linux-arm-msm+bounces-2168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06E7FAE87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 00:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD94D1C20AC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 23:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4025349F6D;
	Mon, 27 Nov 2023 23:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7rXnkcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CBADF68;
	Mon, 27 Nov 2023 23:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75224C433C8;
	Mon, 27 Nov 2023 23:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701128486;
	bh=weP+2DgJBx1dYZy08M9yhRAGupDOCwbQuosE0EUyWV8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=a7rXnkcZC0eEvflSMXIq1b0VcYoXkkWXq7OxnUI3DSeFDFGx+J/xGScO0HjQZfmMe
	 LqYpPyoLGy2r+5CHC6aiamz5sN4VcghqVZvgYwctTYV2gTK3RlcyemaLO7XVfCZdsX
	 e3faqKi6gg4r+yKlUMjZuo08wMW7AOwvfxjpa7z1LkXR1SHAXT9mMf6mgHJwCm6coh
	 QTIrRv6awIasaqIatl+jqQiP9RYv+ySszOgyI6ZbeIO1Mnhlv2H7PLeR/tv9Duq0Eh
	 h3P7/evhc5HEy5y1At1XjPkCfXOXXdN7Prv/qJh6g7aig9avY2WHIRtOKGnTZvfr4g
	 HHOsRFJNAYLmw==
Message-ID: <729bbf75faad7c3a4ed74fffc3d84007.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231122-x1e80100-clk-tcsrcc-v1-2-43078c6d6452@linaro.org>
References: <20231122-x1e80100-clk-tcsrcc-v1-0-43078c6d6452@linaro.org> <20231122-x1e80100-clk-tcsrcc-v1-2-43078c6d6452@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add TCSR clock driver for x1e80100
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 27 Nov 2023 15:41:24 -0800
User-Agent: alot/0.10

Quoting Abel Vesa (2023-11-22 05:42:13)
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

Is the config symbol intentionally namespaced for X1E prefix to group
one SoC? Why not X1E80100_TCSRCC then?

> +       tristate "X1E80100 TCSR Clock Controller"
> +       depends on ARM64 || COMPILE_TEST
> +       select QCOM_GDSC
> +       help
> +         Support for the TCSR clock controller on X1E80100 devices.
> +         Say Y if you want to use peripheral devices such as SD/UFS.
>  endif
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
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +enum {
> +       DT_BI_TCXO_PAD,
> +};
> +
> +static struct clk_branch tcsr_edp_clkref_en =3D {
> +       .halt_reg =3D 0x15130,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .clkr =3D {
> +               .enable_reg =3D 0x15130,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(const struct clk_init_data) {
> +                       .name =3D "tcsr_edp_clkref_en",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch tcsr_pcie_2l_4_clkref_en =3D {
> +       .halt_reg =3D 0x15100,
> +       .halt_check =3D BRANCH_HALT_DELAY,

Why are these all branch halt delay but still have a halt_reg?

> +       .clkr =3D {
> +               .enable_reg =3D 0x15100,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){

const?

> +                       .name =3D "tcsr_pcie_2l_4_clkref_en",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .index =3D DT_BI_TCXO_PAD,
> +                       },

