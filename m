Return-Path: <linux-arm-msm+bounces-21004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173B8D3F07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 21:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1791B22BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 19:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFFA1C2330;
	Wed, 29 May 2024 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLIfSfyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AA1C2329;
	Wed, 29 May 2024 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717012096; cv=none; b=LsTTSLmxEuGnDZ4SwiHn0BkYZ6wfLIGAxc5Dn2TQg14IXUDlx+8UDijISPSnfJ9wN+t+oILWxTNl9QqbWU8s7rwtIduaNov2XpPekcdp7uZpozFT+nYRYJW1XIo3p+J5qiqLzz/DV9NC1Vcp909WU5TMiquk3R6YvIi9bNp8u8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717012096; c=relaxed/simple;
	bh=qWhEwAr6AYrSEXs8Gky9nRQSfZTamh+Ys9gijsMJcIk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ar3waaQHaUx+uIGPk9XtGNK4SbrrDhPG4nml+b/Qiosrk8nTTSOmaBLrKYjB8Qb/NywBG0+8+6z31nMVw6Crqax1CERl+GArDWLAvOwE7ITCJmL2ADe9Cz6VpkKzlWbhuxVWZWRumJ0T8UmqX93bmAGoP8Gg5uReh+iZrWrWlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLIfSfyz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD0BC32781;
	Wed, 29 May 2024 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717012096;
	bh=qWhEwAr6AYrSEXs8Gky9nRQSfZTamh+Ys9gijsMJcIk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TLIfSfyzl/LE6/dXyGaWYNyxHPf99UPq9vGHjqcf4Xz+vTTQgX7DnBaKkN4hF7pb0
	 VXrW8fvC6x5GHZGpAkeyktSF2Zyxpdi5GTrwFIFFucAj8Ay1uOnMKVRoJgzi0S7bNL
	 1gQYp+E4Ee5ggdsvZcRzle1QikxlECZ+OZW/eXhZOQk1L91uSZhvYFeLpHz9Q21jYE
	 wPa5ms2oLOz2eEF9e5diQhElr3D8ll0tEU22hCZvH+RcmU4cP6WW8eb95zLZ47XVWj
	 /0BSsvItSDZ4Bbtm3Uc/d4YL0QIi8Hx/k0yZx7aIqNJmqxxIph0E5Qb6i3qZEeoshL
	 AeJET7CYsl9Xw==
Message-ID: <63d35ddacc113598f1822486b882552a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ssnyujhgz64mbxawb43okjkdidd3tbxwjob36ikgbogy64xuqv@ckvir5vfqo63>
References: <20240528114254.3147988-1-quic_ajipan@quicinc.com> <20240528114254.3147988-8-quic_ajipan@quicinc.com> <ssnyujhgz64mbxawb43okjkdidd3tbxwjob36ikgbogy64xuqv@ckvir5vfqo63>
Subject: Re: [PATCH V3 7/8] clk: qcom: Add GPUCC driver support for SM4450
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Ajit Pandey <quic_ajipan@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 12:48:14 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-05-28 06:23:27)
> On Tue, May 28, 2024 at 05:12:53PM +0530, Ajit Pandey wrote:
> > Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
> >=20
> > Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> > ---
> >  drivers/clk/qcom/Kconfig        |   9 +
> >  drivers/clk/qcom/Makefile       |   1 +
> >  drivers/clk/qcom/gpucc-sm4450.c | 805 ++++++++++++++++++++++++++++++++
> >  3 files changed, 815 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
>=20
> [trimmed]
>=20
> > +
> > +     /* Keep some clocks always enabled */
> > +     qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
> > +     qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
> > +     qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
>=20
> I pinged Stephen regarding these clocks. LGTM otherwise.
>=20

Looks OK to me. I assume that these clks don't get turned off when the
GPU power domain is turned off. If that's the case then presumably we
would need to turn these on and off during power transitions.

