Return-Path: <linux-arm-msm+bounces-40009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E69E12BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 06:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01AEEB23620
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AC8188920;
	Tue,  3 Dec 2024 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUyfcr71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8218872A;
	Tue,  3 Dec 2024 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202521; cv=none; b=E3FiGMltYceD7CaV9LJNsrRLbJFm1KsVKo8F3yoHo3n13KQSop/YwRtjfwu+OxbGbg7pBJogzwenvwFT7yAsvYkYS79/VFOm7TVWQKKPB3rDIp4FUlLRP7kCmLHj/AI2e2mua9rna3KO+icKa251CzgB4D2MofqqUwOACEO5TpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202521; c=relaxed/simple;
	bh=6l+5e4V81hD7gu3+La1bJDtAI2K8iIUv3uStPxHU7Dg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=T6EEE6IvvJL+iJV2crSwmZrARqeaMdIR4Fs6UNfB6OAOQk3VPXbvPQD1IhwSFkXBFGGaOo6le7nTomK+qs/nvy+q2pBvGnmKO4DMKYJgjVD7cogrcv5yURQJV6xxWAYTYO8zY+6oSvNnOzNvnfYjzQY6Zp3goGHP8r5tah+rfYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUyfcr71; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501DBC4CECF;
	Tue,  3 Dec 2024 05:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733202520;
	bh=6l+5e4V81hD7gu3+La1bJDtAI2K8iIUv3uStPxHU7Dg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NUyfcr71T5KKpZVNplUl2clS38wHP5MFGowSbmu4kqesFVXpMWd0RmCkYkiY9usev
	 17UPIgzJ6vkYZQmRNl3n5Ai0aTGpPaw8UYwMRe25Ry28iRQZm303xnriawvpnUQaKr
	 i5zsbdnMwtCF89xLex9PqYY5AVNmNzTsJtF/7uIMIl04fwNiNXjgcNUwKO9SSElgyM
	 Rbai7Aka0xyX9y91OzE1CqlKqMAcrK3uQY6DPXKmc72nIdh0EVSjzXJYD9iUHZezau
	 Lmtmp939E3pPXBeCSUbCm0H10E8cxOWDsuoshkS3HTqKSBrTpoiW+rpUYqJMrYulfG
	 schD2NlbXnMyA==
Message-ID: <140e036792e7d7468130a47b0724132d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241127093623.80735-1-krzysztof.kozlowski@linaro.org>
References: <20241127093623.80735-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 02 Dec 2024 21:08:38 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2024-11-27 01:36:23)
> If regmap_read() fails, random stack value was used in calculating new
> frequency in recalc_rate() callbacks.  Such failure is really not
> expected as these are all MMIO reads, however code should be here
> correct and bail out.  This also avoids possible warning on
> uninitialized value.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 41 ++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 5e9217ea3760..0cd937ab47d0 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -682,9 +682,12 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigne=
d long parent_rate)
>         struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
>         u32 alpha_width =3D pll_alpha_width(pll);
> =20
> -       regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
> +       if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
> +               return 0;
> +
> +       if (regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl))
> +               return 0;
> =20
> -       regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
>         if (ctl & PLL_ALPHA_EN) {
>                 regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low);

What about 'low'?

>                 if (alpha_width > 32) {

