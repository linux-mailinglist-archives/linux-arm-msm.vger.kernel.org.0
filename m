Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B68D3FD302
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 07:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242035AbhIAFjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 01:39:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233857AbhIAFjY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 01:39:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A93E4610A1;
        Wed,  1 Sep 2021 05:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630474707;
        bh=PaTwTNAaTQ2860lT+KGCAerHs/tFlaB2x10QZWZFWy0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mf2ZjsEDXX+MO78slthNsK9QF1zsLTQ8bn89WOtiZ2lfaNyysIS7URkz/5DfsEnfJ
         wieG+H1rmbrK9SBP95gOGYdyfDhAEW8cj1F9Q4MomMeWTaF8IhXnONFF+Z0wUP7cz0
         iqkFPiI2Of48r9CPZG+7k3hOksyIe4DMKDc7mfKIhLQLOtxtvfECJdYwk1c8Do9WMJ
         SK5uPIdxet/jyKfdHs/1BOClNaldzE42S7tmVOgCxZNuuZ9UIHpQpe2fXSoeVlFjim
         kZH4n2U0vbm4MBMFYujPHD6dVjSbp9Ufnl4eiMr1DpmaOtk/v2ibHlyPd8RXZJp0tM
         yS4G8igPi/+TA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1630406202-3919-2-git-send-email-tdas@codeaurora.org>
References: <1630406202-3919-1-git-send-email-tdas@codeaurora.org> <1630406202-3919-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: Add lpass clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 31 Aug 2021 22:38:26 -0700
Message-ID: <163047470651.42057.13433048930627060805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-08-31 03:36:42)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 0a55967..cd7a5a1 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -394,6 +394,14 @@ config SC_LPASS_CORECC_7180
>           Say Y if you want to use LPASS clocks and power domains of the =
LPASS
>           core clock controller.
> =20
> +config SC_LPASSCC_7280
> +       tristate "SC7280 Low Power Audio Subsystem (LPAAS) Clock Controll=
er"
> +       select SC_GCC_7280
> +       help
> +         Support for the LPASS clock controller on SC7280 devices.
> +         Say Y if you want to use the LPASS branch clocks of the LPASS c=
lock
> +         controller to reset the LPASS subsystem.
> +

Can you send another patch to move SC_LPASS_CORECC_7180 under
SC_GPUCC_7180? This file should be sorted on Kconfig symbol
alphabetically.

>  config SC_GPUCC_7180
>         tristate "SC7180 Graphics Clock Controller"
>         select SC_GCC_7180
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 9825ef8..1b33f49 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_SC_GCC_8180X) +=3D gcc-sc8180x.o
>  obj-$(CONFIG_SC_GPUCC_7180) +=3D gpucc-sc7180.o
>  obj-$(CONFIG_SC_GPUCC_7280) +=3D gpucc-sc7280.o
>  obj-$(CONFIG_SC_LPASS_CORECC_7180) +=3D lpasscorecc-sc7180.o
> +obj-$(CONFIG_SC_LPASSCC_7280) +=3D lpasscc-sc7280.o

This one got it right, almost. LPASSCC comes before LPASS_CORECC though.

>  obj-$(CONFIG_SC_MSS_7180) +=3D mss-sc7180.o
>  obj-$(CONFIG_SC_VIDEOCC_7180) +=3D videocc-sc7180.o
>  obj-$(CONFIG_SC_VIDEOCC_7280) +=3D videocc-sc7280.o
