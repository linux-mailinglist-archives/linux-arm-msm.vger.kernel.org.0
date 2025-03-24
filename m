Return-Path: <linux-arm-msm+bounces-52414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BBDA6E73A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 00:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E15E189704E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 23:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969421F12FD;
	Mon, 24 Mar 2025 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1wOaHGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DA1A071C;
	Mon, 24 Mar 2025 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742859524; cv=none; b=sjEHMoRB5ae/GzJ+ECziIZGfU5bfmv9m2W7pT9UxEZlVK1gvcb7rvvAmzWzaL4bBYWqgMwu+qzTz0PpLxa5H7Vm4NrX7YlrY9BOE/Sb4O2SBORM7/nfSs+sSEnHUAB7oPhnhH3z1LHycWe2PAbKzfK7k3J9g1ieLjrP4dB4GMJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742859524; c=relaxed/simple;
	bh=RIqISDaEFJwK0Np25r7FIso1RHCi1Fki6eFllRzWwXA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ZxPngl7Lj1oX8YTrATpqMZdtwh+Nmghze88oxVMOGiW2uEDDhwmEvj7yn7UhejJSZnwxckAj0uxXkilaceekDck8EKUPL3PwGnmg1j1iR2Eh/JgUZVam1oQXcGqUjn6lh3yeHeoSfuH7pqDqlgyx6TcTQHQUh4iI+9d1Y+pXAH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1wOaHGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EB2C4CEDD;
	Mon, 24 Mar 2025 23:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742859523;
	bh=RIqISDaEFJwK0Np25r7FIso1RHCi1Fki6eFllRzWwXA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G1wOaHGe7BW9WF9cFTHkgtXkav8uM/FmCAivrnNBZza59gFnwYrAvQN7xYVcuc0VB
	 s+iIKR3MrC8qp/6j6S8faiJQwl8aoLL1rlNrs1crieBSl3jVwuszQ8Fm6owWEezCSY
	 0c/fU9FzqlGiFB+0ekXgE0snAICWyq61vaM85c/0uEw9DQrCwDm7MrCSxvAoDmyRao
	 Wbsf2BDIXkTz2dJTQIl65JXuA4gou4SmdTE2dg6ctIIoJ02m2TXsZoKpiU0lTkWzQV
	 L/ySd4Mtwy33196q7Lr958IvqELmxKFGyG9ilRZCah6mJyQdYWWLmcr6whwH4JoHcA
	 vVgmYqrF+5krA==
Message-ID: <7292158ac0cd6b944d9d1f01314d24b1@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250321-qcs8300-mm-patches-v5-1-9d751d7e49ef@quicinc.com>
References: <20250321-qcs8300-mm-patches-v5-1-9d751d7e49ef@quicinc.com>
Subject: Re: [PATCH v5] clk: qcom: Add support for Camera Clock Controller on QCS8300
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Imran Shaik <quic_imrashai@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Imran Shaik <quic_imrashai@quicinc.com>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 24 Mar 2025 16:38:41 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Imran Shaik (2025-03-20 20:56:43)
> diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa=
8775p.c
> index 11bd2e234811..bd75f59d3ffe 100644
> --- a/drivers/clk/qcom/camcc-sa8775p.c
> +++ b/drivers/clk/qcom/camcc-sa8775p.c
> @@ -1811,6 +1830,7 @@ static const struct qcom_cc_desc cam_cc_sa8775p_des=
c =3D {
>  };
> =20
>  static const struct of_device_id cam_cc_sa8775p_match_table[] =3D {
> +       { .compatible =3D "qcom,qcs8300-camcc" },
>         { .compatible =3D "qcom,sa8775p-camcc" },
>         { }
>  };
> @@ -1841,10 +1861,83 @@ static int cam_cc_sa8775p_probe(struct platform_d=
evice *pdev)
>         clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_co=
nfig);
>         clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_co=
nfig);
> =20
> -       /* Keep some clocks always enabled */
> -       qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK =
*/
> -       qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
> -       qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
> +       if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-camc=
c")) {

Can we just use device_is_compatible() here? Then we're not specific to
DT. Or better yet, use the device match data to signal this instead of
checking compatible again, and possibly getting it wrong due to a typo
somewhere.

