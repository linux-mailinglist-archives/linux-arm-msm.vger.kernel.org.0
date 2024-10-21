Return-Path: <linux-arm-msm+bounces-35268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42D9A7218
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CD3AB23CA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 18:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96431F8EFC;
	Mon, 21 Oct 2024 18:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfZfBuUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674411E907F;
	Mon, 21 Oct 2024 18:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534487; cv=none; b=o3qbOtAoCd7iQAFvbShWkb038txau+tVH0fLHJXB7HFs3CbSoJUbDv//AFrT8ALrXAxRbVoDxwXkPuqZYtcfFtDN11vpKQGPy/ASv15ZwNHwkWQpZesHj+JSzyHq6rJHpEOq8HHLT7/PGKPzdkG9L/ZOTvql3oXjCMcdpOAnxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534487; c=relaxed/simple;
	bh=j1mgVHPRoaNe9ycS61VrY4Fi/1Xcd+t3wGQSQxTpFFs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Yn1Am5BAB6hrfc4LHKxScENdtl4qynoMfYRWaAasKMNCDtNHdoxw0PAJNNCRvq0nUcG/Y1wXxD2bl37l8Yvrn+W/YeRX0KE08hJM8UEefujACKzQKfa2ZR0iRH+HweFNq9kSsywWELP9IEKr1vKCcBFf4x+exs2MNUkhsgI60y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfZfBuUJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BF2C4CEC3;
	Mon, 21 Oct 2024 18:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729534487;
	bh=j1mgVHPRoaNe9ycS61VrY4Fi/1Xcd+t3wGQSQxTpFFs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OfZfBuUJuR6VIidzmxsqgGm0vKWZZs1SYihvGiJIrN+VhnYgAIbqI7Nj6oZc2IRRU
	 5p6X11bGYsYt6aTgY8ScXKCTdaijRrcOVAwq13SS9oWIwunb7I2OAch9fdWD1s08vn
	 7OKF4mEs1xs1OCvSfEPQg32IgJrLKHjiaiJknflqVxsTJYEm85WUeM4TG7BaxHSzGK
	 e6AT0/i2rHntTPAsQgaZwDeFYecP0Aw8+D08Tm+mT2ACwpJYDkq66q3IaIjghB6ceR
	 pThVPB6Bq0qtOqwxCMWG68+p7VNE0iZAVEoLijvezs1ncJuQDADMXNNDMrPVI0e22g
	 eHtE87AR8ft2g==
Message-ID: <5f39a93197f02fa7ec0de897a7ce646d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com>
References: <20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: fix alpha mode configuration
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Gabor Juhos <j4g8y7@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 21 Oct 2024 11:14:44 -0700
User-Agent: alot/0.10

Quoting Gabor Juhos (2024-10-21 10:32:48)
> Commit c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
> added support for configuring alpha mode, but it seems that the feature
> was never working in practice.
>=20
[...]
>=20
> Applying the 'alpha_en_mask' fixes the initial rate of the PLLs showed
> in the table above. Since the 'alpha_mode_mask' is not used by any driver
> currently, that part of the change causes no functional changes.
>=20
> Cc: stable@vger.kernel.org
> Fixes: c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index f9105443d7dbb104e3cb091e59f43df25999f8b3..03cc7aa092480bfdd9eaa986d=
44f0545944b3b89 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -421,6 +421,8 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pl=
l, struct regmap *regmap,
>         mask |=3D config->pre_div_mask;
>         mask |=3D config->post_div_mask;
>         mask |=3D config->vco_mask;
> +       mask |=3D config->alpha_en_mask;
> +       mask |=3D config->alpha_mode_mask;
> =20

This is https://lore.kernel.org/all/20241019-qcs615-mm-clockcontroller-v1-1=
-4cfb96d779ae@quicinc.com/

