Return-Path: <linux-arm-msm+bounces-60111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A283ACC1AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86DB27A7CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3AE280037;
	Tue,  3 Jun 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="DNKrBj7e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405FE27F728;
	Tue,  3 Jun 2025 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748937962; cv=none; b=XWW7mEgAB2kplS+IHltGe2c3Kmb/HrNuEG8rxuS7eivmBZgffBYwS6AtBTlX/AFJ33iAaeKutl7RdllDcaK8/53w0B+zgZdftjItlQP3P6iTcheZ0YfrX7KtHTvEkXW1TNAc5LSNh/WZ8zZKZfrla6C4eHL7PomFCGAdfDoQH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748937962; c=relaxed/simple;
	bh=h8xM7Wq6+qjVZ3DBnkcHEoOOJLF2fsBp0pGSWQQOcuY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyaDE1eWclqOszJONcrhA/skHzTfCSO6kEkZr1z9VrMqsbLzFongNr3VnFAYyDN2gJhg86zY47xNAprZ/T1FLjKkeJ7h0xg1mnTmrODDh601I5Vn5m67Ac+J7H+cYRSoVE8xCF7q6SHOoGIsDIBNRiBgfI41vl57dmmX43aswZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=DNKrBj7e; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748937958; x=1749197158;
	bh=Sq9HcazlldadxsbigxS4uwVdL4EGMPGLCLgMT9h3n9g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DNKrBj7e0TSKcKobr1Oy6YdbWWRsU7cBdkLcguH8JRnJUWn0W9cW1dbEHvOfYz7Iq
	 8KsVdPFWNp22RPmK82jc26TngVq+tXB/kqI2PS1GAM838mlYHnEXf5MTQWpdfQPDbW
	 LZpnc2FSmQxWX8VdkRN6PoEcpf7KiDK/dsVGFM8/1Cfq1HMwT2ZWNG6i59gZd42WrS
	 Agfz7xKBtLj/awJth3rWGEbGuLFFEBef/V1dOdtjkZThYZ3XpV7uK/tVENPWxFNoBU
	 KmkzyiIu8gD3VBTlGIKXskAy1KlGUDWZAmUcVKRwYh+2uloejWZPwHhupCGVdudFQo
	 sEcrLHrzX06Wg==
Date: Tue, 03 Jun 2025 08:05:51 +0000
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/18] clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
Message-ID: <e602e789-2391-4812-bc2b-e3ef594b106e@nxsw.ie>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-9-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com> <20250530-videocc-pll-multi-pd-voting-v5-9-02303b3a582d@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: bf111c8de727848e072502c907d4dc929fc80e0a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 14:20, Jagadeesh Kona wrote:
> Camera PLLs on SM8450/SM8475 require both MMCX and MXC rails to be
> kept ON to configure the PLLs properly. Hence move runtime power
> management, PLL configuration and enable critical clocks to
> qcom_cc_really_probe() which ensures all required power domains are in
> enabled state before configuring the PLLs or enabling the clocks.
>=20
> This change also removes the modelling for cam_cc_gdsc_clk and keeps it
> always ON from probe since using CLK_IS_CRITICAL will prevent the clock
> controller associated power domains from collapsing due to clock framewor=
k
> invoking clk_pm_runtime_get() during prepare.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/camcc-sm8450.c | 89 ++++++++++++++++++++--------------=
-------
>   1 file changed, 44 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8=
450.c
> index 08982737e4901c0703e19f8dd2d302e24748210c..4dd8be8cc9881c890d2e7c3a1=
2f12816a9ab47dc 100644
> --- a/drivers/clk/qcom/camcc-sm8450.c
> +++ b/drivers/clk/qcom/camcc-sm8450.c
> @@ -86,6 +86,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll0=
_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll0 =3D {
>   =09.offset =3D 0x0,
> +=09.config =3D &cam_cc_pll0_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -191,6 +192,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l1_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll1 =3D {
>   =09.offset =3D 0x1000,
> +=09.config =3D &cam_cc_pll1_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -257,6 +259,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l2_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll2 =3D {
>   =09.offset =3D 0x2000,
> +=09.config =3D &cam_cc_pll2_config,
>   =09.vco_table =3D rivian_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(rivian_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
> @@ -296,6 +299,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l3_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll3 =3D {
>   =09.offset =3D 0x3000,
> +=09.config =3D &cam_cc_pll3_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -368,6 +372,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l4_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll4 =3D {
>   =09.offset =3D 0x4000,
> +=09.config =3D &cam_cc_pll4_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -440,6 +445,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l5_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll5 =3D {
>   =09.offset =3D 0x5000,
> +=09.config =3D &cam_cc_pll5_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -512,6 +518,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l6_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll6 =3D {
>   =09.offset =3D 0x6000,
> +=09.config =3D &cam_cc_pll6_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -584,6 +591,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l7_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll7 =3D {
>   =09.offset =3D 0x7000,
> +=09.config =3D &cam_cc_pll7_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -656,6 +664,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pl=
l8_config =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll8 =3D {
>   =09.offset =3D 0x8000,
> +=09.config =3D &cam_cc_pll8_config,
>   =09.vco_table =3D lucid_evo_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_evo_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> @@ -1476,24 +1485,6 @@ static struct clk_rcg2 cam_cc_xo_clk_src =3D {
>   =09},
>   };
>=20
> -static struct clk_branch cam_cc_gdsc_clk =3D {
> -=09.halt_reg =3D 0x1320c,
> -=09.halt_check =3D BRANCH_HALT,
> -=09.clkr =3D {
> -=09=09.enable_reg =3D 0x1320c,
> -=09=09.enable_mask =3D BIT(0),
> -=09=09.hw.init =3D &(const struct clk_init_data) {
> -=09=09=09.name =3D "cam_cc_gdsc_clk",
> -=09=09=09.parent_hws =3D (const struct clk_hw*[]) {
> -=09=09=09=09&cam_cc_xo_clk_src.clkr.hw,
> -=09=09=09},
> -=09=09=09.num_parents =3D 1,
> -=09=09=09.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> -=09=09=09.ops =3D &clk_branch2_ops,
> -=09=09},
> -=09},
> -};
> -
>   static struct clk_branch cam_cc_bps_ahb_clk =3D {
>   =09.halt_reg =3D 0x1004c,
>   =09.halt_check =3D BRANCH_HALT,
> @@ -2819,7 +2810,6 @@ static struct clk_regmap *cam_cc_sm8450_clocks[] =
=3D {
>   =09[CAM_CC_CSIPHY4_CLK] =3D &cam_cc_csiphy4_clk.clkr,
>   =09[CAM_CC_CSIPHY5_CLK] =3D &cam_cc_csiphy5_clk.clkr,
>   =09[CAM_CC_FAST_AHB_CLK_SRC] =3D &cam_cc_fast_ahb_clk_src.clkr,
> -=09[CAM_CC_GDSC_CLK] =3D &cam_cc_gdsc_clk.clkr,
>   =09[CAM_CC_ICP_AHB_CLK] =3D &cam_cc_icp_ahb_clk.clkr,
>   =09[CAM_CC_ICP_CLK] =3D &cam_cc_icp_clk.clkr,
>   =09[CAM_CC_ICP_CLK_SRC] =3D &cam_cc_icp_clk_src.clkr,
> @@ -2913,6 +2903,22 @@ static const struct qcom_reset_map cam_cc_sm8450_r=
esets[] =3D {
>   =09[CAM_CC_SFE_1_BCR] =3D { 0x13094 },
>   };
>=20
> +static struct clk_alpha_pll *cam_cc_sm8450_plls[] =3D {
> +=09&cam_cc_pll0,
> +=09&cam_cc_pll1,
> +=09&cam_cc_pll2,
> +=09&cam_cc_pll3,
> +=09&cam_cc_pll4,
> +=09&cam_cc_pll5,
> +=09&cam_cc_pll6,
> +=09&cam_cc_pll7,
> +=09&cam_cc_pll8,
> +};
> +
> +static u32 cam_cc_sm8450_critical_cbcrs[] =3D {
> +=090x1320c, /* CAM_CC_GDSC_CLK */
> +};
> +
>   static const struct regmap_config cam_cc_sm8450_regmap_config =3D {
>   =09.reg_bits =3D 32,
>   =09.reg_stride =3D 4,
> @@ -3021,6 +3027,13 @@ static struct gdsc *cam_cc_sm8450_gdscs[] =3D {
>   =09[TITAN_TOP_GDSC] =3D &titan_top_gdsc,
>   };
>=20
> +static struct qcom_cc_driver_data cam_cc_sm8450_driver_data =3D {
> +=09.alpha_plls =3D cam_cc_sm8450_plls,
> +=09.num_alpha_plls =3D ARRAY_SIZE(cam_cc_sm8450_plls),
> +=09.clk_cbcrs =3D cam_cc_sm8450_critical_cbcrs,
> +=09.num_clk_cbcrs =3D ARRAY_SIZE(cam_cc_sm8450_critical_cbcrs),
> +};
> +
>   static const struct qcom_cc_desc cam_cc_sm8450_desc =3D {
>   =09.config =3D &cam_cc_sm8450_regmap_config,
>   =09.clks =3D cam_cc_sm8450_clocks,
> @@ -3029,6 +3042,8 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc=
 =3D {
>   =09.num_resets =3D ARRAY_SIZE(cam_cc_sm8450_resets),
>   =09.gdscs =3D cam_cc_sm8450_gdscs,
>   =09.num_gdscs =3D ARRAY_SIZE(cam_cc_sm8450_gdscs),
> +=09.use_rpm =3D true,
> +=09.driver_data =3D &cam_cc_sm8450_driver_data,
>   };
>=20
>   static const struct of_device_id cam_cc_sm8450_match_table[] =3D {
> @@ -3040,12 +3055,6 @@ MODULE_DEVICE_TABLE(of, cam_cc_sm8450_match_table)=
;
>=20
>   static int cam_cc_sm8450_probe(struct platform_device *pdev)
>   {
> -=09struct regmap *regmap;
> -
> -=09regmap =3D qcom_cc_map(pdev, &cam_cc_sm8450_desc);
> -=09if (IS_ERR(regmap))
> -=09=09return PTR_ERR(regmap);
> -
>   =09if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-camcc"))=
 {
>   =09=09/* Update CAMCC PLL0 */
>   =09=09cam_cc_pll0.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_=
OLE];
> @@ -3092,28 +3101,18 @@ static int cam_cc_sm8450_probe(struct platform_de=
vice *pdev)
>   =09=09cam_cc_pll8_out_even.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TY=
PE_LUCID_OLE];
>   =09=09cam_cc_pll8_out_even.clkr.hw.init =3D &sm8475_cam_cc_pll8_out_eve=
n_init;
>=20
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &sm8475_cam_cc_p=
ll0_config);
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &sm8475_cam_cc_p=
ll1_config);
> -=09=09clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &sm8475_cam_cc_=
pll2_config);
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &sm8475_cam_cc_p=
ll3_config);
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &sm8475_cam_cc_p=
ll4_config);
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &sm8475_cam_cc_p=
ll5_config);
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &sm8475_cam_cc_p=
ll6_config);
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &sm8475_cam_cc_p=
ll7_config);
> -=09=09clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &sm8475_cam_cc_p=
ll8_config);
> -=09} else {
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_con=
fig);
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_con=
fig);
> -=09=09clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_co=
nfig);
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_con=
fig);
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_con=
fig);
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_con=
fig);
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_con=
fig);
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_con=
fig);
> -=09=09clk_lucid_evo_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_con=
fig);
> +=09=09cam_cc_pll0.config =3D &sm8475_cam_cc_pll0_config;
> +=09=09cam_cc_pll1.config =3D &sm8475_cam_cc_pll1_config;
> +=09=09cam_cc_pll2.config =3D &sm8475_cam_cc_pll2_config;
> +=09=09cam_cc_pll3.config =3D &sm8475_cam_cc_pll3_config;
> +=09=09cam_cc_pll4.config =3D &sm8475_cam_cc_pll4_config;
> +=09=09cam_cc_pll5.config =3D &sm8475_cam_cc_pll5_config;
> +=09=09cam_cc_pll6.config =3D &sm8475_cam_cc_pll6_config;
> +=09=09cam_cc_pll7.config =3D &sm8475_cam_cc_pll7_config;
> +=09=09cam_cc_pll8.config =3D &sm8475_cam_cc_pll8_config;
>   =09}
>=20
> -=09return qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8450_desc, regmap);
> +=09return qcom_cc_probe(pdev, &cam_cc_sm8450_desc);
>   }
>=20
>   static struct platform_driver cam_cc_sm8450_driver =3D {
>=20
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


