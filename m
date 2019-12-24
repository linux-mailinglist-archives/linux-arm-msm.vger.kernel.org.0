Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6748E129CC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 03:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfLXCbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 21:31:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:51906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbfLXCbB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 21:31:01 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4ADB7206D3;
        Tue, 24 Dec 2019 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577154660;
        bh=WdsuDjh3JDuY5I/aYg/d+79nD0TD6TcAJ/zqECP0Yq4=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=Ytch8iXk3+jrHR7TEr7t1yor6xeJWKB9jnEsWOr8Xz6MjzX6VoMpG3uu2jPbtXR6d
         HIIeG1VTTFqMGMOhibGjc2FzBlNl+Tkusc0eLMuFfaC8HO6puZML9Yuw5QFEkOcLBO
         i0WD0Pyvd5L510Sq3Ay5NY93PVSRctNMZm/u4mFE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573812304-24074-9-git-send-email-tdas@codeaurora.org>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org> <1573812304-24074-9-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 8/8] clk: qcom: Add video clock controller driver for SC7180
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:30:59 -0800
Message-Id: <20191224023100.4ADB7206D3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-11-15 02:05:04)
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc=
-sc7180.c
> new file mode 100644
> index 0000000..0c60986
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
[...]
> +
> +static int video_cc_sc7180_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       struct alpha_pll_config video_pll0_config =3D {};
> +
> +       regmap =3D qcom_cc_map(pdev, &video_cc_sc7180_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       video_pll0_config.l =3D 0x1f;
> +       video_pll0_config.alpha =3D 0x4000;
> +       video_pll0_config.user_ctl_val =3D 0x00000001;
> +       video_pll0_config.user_ctl_hi_val =3D 0x00004805;
> +
> +       clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
> +
> +       /* video_cc_xo_clk */

Please say what's happening to video_cc_xo_clk.

> +       regmap_update_bits(regmap, 0x984, 0x1, 0x1);
> +
> +       return qcom_cc_really_probe(pdev, &video_cc_sc7180_desc, regmap);
> +}
> +
> +static struct platform_driver video_cc_sc7180_driver =3D {
> +       .probe =3D video_cc_sc7180_probe,
> +       .driver =3D {
> +               .name =3D "sc7180-videocc",
> +               .of_match_table =3D video_cc_sc7180_match_table,
> +       },
> +};
