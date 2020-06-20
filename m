Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0782201F32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 02:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730951AbgFTA17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 20:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730883AbgFTA15 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 20:27:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4722522A83;
        Sat, 20 Jun 2020 00:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592612876;
        bh=am14Jubm3mSnrjfxjKu4x+VOzFG247FZpQD2yNfTOQY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uePu/B9J6RMHo1K1NXn7wZ7SNzKRM+ZsOEFRCE0HuNSeq0eE6cRrGJn2/zvHRgHJP
         lszXRfLwwwJ24fFIml3CxDZsyA4W9pCkHMouD8zZvmN/1RhmlU+t/PcEoliO8V8viN
         KfFJhckR7qb3aVqJDiaJtA3B4F4kXt4K7sp11aTQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591266927-24976-3-git-send-email-loic.poulain@linaro.org>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org> <1591266927-24976-3-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add CPU clock driver for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org
Date:   Fri, 19 Jun 2020 17:27:55 -0700
Message-ID: <159261287558.62212.16649006403982628548@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-06-04 03:35:25)
> Each of the CPU clusters (Power and Perf) on msm8996 are
> clocked via 2 PLLs, a primary and alternate. There are also
> 2 Mux'es, a primary and secondary all connected together
> as shown below
>=20
>                              +-------+
>               XO             |       |
>           +------------------>0      |
>                              |       |
>                    PLL/2     | SMUX  +----+
>                      +------->1      |    |
>                      |       |       |    |
>                      |       +-------+    |    +-------+
>                      |                    +---->0      |
>                      |                         |       |
> +---------------+    |             +----------->1      | CPU clk
> |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> |               +------+-----------+    +------>2 PMUX |
> +---------------+      |                |      |       |
>                        |   +------+     |   +-->3      |
>                        +--^+  ACD +-----+   |  +-------+
> +---------------+          +------+         |
> |Alt PLL        |                           |
> |               +---------------------------+
> +---------------+         PLL_EARLY
>=20
> The primary PLL is what drives the CPU clk, except for times
> when we are reprogramming the PLL itself (for rate changes) when
> we temporarily switch to an alternate PLL. A subsequent patch adds
> support to switch between primary and alternate PLL during rate
> changes.
>=20
> The primary PLL operates on a single VCO range, between 600MHz
> and 3GHz. However the CPUs do support OPPs with frequencies
> between 300MHz and 600MHz. In order to support running the CPUs
> at those frequencies we end up having to lock the PLL at twice
> the rate and drive the CPU clk via the PLL/2 output and SMUX.
>=20
> So for frequencies above 600MHz we follow the following path
>  Primary PLL --> PLL_EARLY --> PMUX(1) --> CPU clk
> and for frequencies between 300MHz and 600MHz we follow
>  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk
>=20
> ACD stands for Adaptive Clock Distribution and is used to
> detect voltage droops.
>=20
> Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
> Co-developed-by: Ilia Lin <ilialin@codeaurora.org>

Co-developed-by should be combined with Signed-off-by tags.

From Documentation/process/submitting-patches.rst

"Co-developed-by: states that the patch was co-created by multiple develope=
rs;
it is a used to give attribution to co-authors (in addition to the author
attributed by the From: tag) when several people work on a single patch.  S=
ince
Co-developed-by: denotes authorship, every Co-developed-by: must be immedia=
tely
followed by a Signed-off-by: of the associated co-author." =20

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig         |   8 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/clk-alpha-pll.h |   6 +
>  drivers/clk/qcom/clk-cpu-8996.c  | 538 +++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 553 insertions(+)
>  create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index abb121f..87b515d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -37,6 +37,14 @@ config QCOM_CLK_APCS_MSM8916
>           Say Y if you want to support CPU frequency scaling on devices
>           such as msm8916.
> =20
> +config QCOM_CLK_APCC_MSM8996
> +       tristate "MSM8996 CPU Clock Controller"
> +       select QCOM_KRYO_L2_ACCESSORS

This needs to depend on ARM || ARM64 because it uses the kryo accessors whi=
ch
are architecture specific instructions.

> +       help
> +         Support for the CPU clock controller on msm8996 devices.
> +         Say Y if you want to support CPU clock scaling using CPUfreq
> +         drivers for dyanmic power management.
> +
>  config QCOM_CLK_RPM
>         tristate "RPM based Clock Controller"
>         depends on MFD_QCOM_RPM
