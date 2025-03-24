Return-Path: <linux-arm-msm+bounces-52415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C3A6E745
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 00:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6056B173422
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 23:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899A51F1506;
	Mon, 24 Mar 2025 23:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ma6dzGi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577EE1EA7D8;
	Mon, 24 Mar 2025 23:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742859734; cv=none; b=ICztIKeUa72qB4qrt8nBzq71txESBJtXw3k5NxoCeDrqJO68VQBM1K9sGdIoe8o8Ea5paJx441BEnRAoXJVOSBbEPFMm6OdKytjUvsP9f8RuT49BsfxjdQvsFsQttkDOLdEGuPvcZmA4sAJ7izy/yWHFvQMhikYwOJYXv6eowhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742859734; c=relaxed/simple;
	bh=WxBKiPw/1+Q6+SWg/jrm3YstJrgcchdbsKnl0favTJY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=h9kftEliI4ny9KJ1xVL2S6EPgaf46RZbInBjz+lV3ckr9w2XtMMKosi6FzjblnHcsUxNctnkvF59XRiUW4wn0wGUVBdrhsSngh/iWukZkydZKZeII2zOTBjSFlVsbrAQcC6SC24sKgqbjFiU8pMEWV4dW5hLzIjJncL2ir87wno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ma6dzGi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB70CC4CEDD;
	Mon, 24 Mar 2025 23:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742859733;
	bh=WxBKiPw/1+Q6+SWg/jrm3YstJrgcchdbsKnl0favTJY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ma6dzGi7j79oG9lt2NQQrKuGb97bxY6guutPRzgwyaFzb5p4FH/IQnAzyK0wsZKqD
	 urYY0b+49YU8xinqkaoLVEvgXNuGi6esmPmSEMHuBj6pdAgRwZ0wbzkK0SagNlE/I5
	 Ycw+WOikUeTM2FBV0wYOItO1okqgOKDg+36gExaIHTS2iQqr6cRsEVt302M/TXYOGv
	 fDcxRzsG/gfT5cj+ZmbZt9gq4GZ2tPP+EY+lxTz2Yq5cS61p2964JoY+VUlKoazbdX
	 +ssM0z/8LPNW05vVRWQYmqNIh5lbV/Y65UbAC8ghttE7dE4i1Gncgp42tsIElM5pBH
	 NLFAv2fu4ZAqQ==
Message-ID: <f1e7566e4004e3f7228961df0b5152c4@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-2-3ea8e5262da4@quicinc.com>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com> <20250321-qcom_ipq5424_cmnpll-v1-2-3ea8e5262da4@quicinc.com>
Subject: Re: [PATCH 2/4] clk: qcom: cmnpll: Add IPQ5424 SoC support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, Luo Jie <quic_luoj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Mon, 24 Mar 2025 16:42:11 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Luo Jie (2025-03-21 05:49:53)
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index 432d4c4b7aa6..ce5e83124c6d 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights r=
eserved.
>   */
> =20
>  /*
> @@ -16,6 +16,10 @@
>   * are supplied to GCC (24 MHZ as XO and 32 KHZ as sleep clock), and to =
PCS
>   * with 31.25 MHZ.
>   *
> + * On the IPQ5424 SoC, there is an output clock from CMN PLL to PPE at 3=
75 MHZ,
> + * and an output clock to NSS at 300 MHZ. The other output clocks from C=
MN PLL
> + * on IPQ5424 are the same as IPQ9574.
> + *
>   *               +---------+
>   *               |   GCC   |
>   *               +--+---+--+
> @@ -115,6 +119,20 @@ static const struct cmn_pll_fixed_output_clk ipq9574=
_output_clks[] =3D {
>         CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
>         CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
>         CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
> +       { /* Sentinel */ },

Nitpick: Drop the comma here so nothing can come after the sentinel.

> +};
> +
> +static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] =3D {
> +       CLK_PLL_OUTPUT(XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
> +       CLK_PLL_OUTPUT(SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
> +       CLK_PLL_OUTPUT(PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
> +       CLK_PLL_OUTPUT(NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
> +       CLK_PLL_OUTPUT(PPE_375MHZ_CLK, "ppe-375mhz", 375000000UL),
> +       CLK_PLL_OUTPUT(ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
> +       CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
> +       CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
> +       CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
> +       { /* Sentinel */ },

Nitpick: Drop the comma here so nothing can come after the sentinel.

>  };
> =20
>  /*

