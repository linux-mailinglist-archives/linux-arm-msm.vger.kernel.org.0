Return-Path: <linux-arm-msm+bounces-60112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D89ACC1B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06560189006D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BED280A39;
	Tue,  3 Jun 2025 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="ZxmDXyNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB3268FFA;
	Tue,  3 Jun 2025 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938002; cv=none; b=kuraa84dFu6grtiRZ8ym9KKnbhHUZ+7cXOGo+4VQ+0+g/OZoUtSClFCxvOL/HEuu7UHDSVC4uIxCJq+SbLF+gaSQ6tzi9eZg/uYCzPbzgNHP99GAYrL6IJX6MRTQRIOQDEmfcpR2S5k2VJ5lHXH6/EWsJs5SpgFKRuukAGNFtiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938002; c=relaxed/simple;
	bh=vA9ISxVIXD//U3gVzYuh4hxAcG0DsSNUk25JtyERkBM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MtDdXDNh1wm77TSzMLHBYB6PGJwGf3ScayeBr3DTPHATJgBB9EduMO88C2E5CtYlkJfjrHLnqVn0emqBZEFTWs15hPRJ9dhklAzLfGamtshDOdlzyk4WWWyknH/xLEkX066TPFoBS2cQOYBAbeGyPPWo6YeytxhaIVcPFjYLJEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=ZxmDXyNG; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748937992; x=1749197192;
	bh=VsFQU6X5FZEcLXjPI/zIjLxhAI/E1uSVazbED4L19D4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZxmDXyNGl7gNOF2Dr4sM48z20pdJr+gDxb2LknQMvYr1tCJHit63lFeG8kxl1JEz4
	 dSRd2N8wbTnGUtsA6lsaDooiN6molaHSak7nTVqiF186lWy3rfYbG0VGADGHIEEXIX
	 eAe74ZBhB8d8GCgsNaCEWcYIE7utQ4Jo+vsdRkSvM1hqNVDXFsVMq0mcUG/6cMCOUC
	 gFr8jlYEJP2mNBwzcXBauADbBGFHIOYbtvWLVwE2P1Xxz4L+5RlZXtQ2vSprfN9fvP
	 N5wbpkiVL1pgEO16SSjJeSOeBLc/D2TZhGTfgvNTaUVirZ/gAfkKStr+IzNnMD8217
	 uBFDVwQTjV8rg==
Date: Tue, 03 Jun 2025 08:06:28 +0000
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/18] clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
Message-ID: <db1827ed-4710-48ba-8037-3888957b06e9@nxsw.ie>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-10-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com> <20250530-videocc-pll-multi-pd-voting-v5-10-02303b3a582d@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 5ddd453cbe7b71d0d2e71faf659ab8425327d4bd
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 14:20, Jagadeesh Kona wrote:
> Camera PLLs on SM8550 require both MMCX and MXC rails to be kept ON to
> configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enabling critical clocks to qcom_cc_really_probe() whic=
h
> ensures all required power domains are in enabled state before configurin=
g
> the PLLs or enabling the clocks.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/camcc-sm8550.c | 85 +++++++++++++++++++++-------------=
-------
>   1 file changed, 44 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8=
550.c
> index 871155783c798fd9245d735642272eae2a2d3465..63aed9e4c362d523093409f74=
ef4e57f292ddf90 100644
> --- a/drivers/clk/qcom/camcc-sm8550.c
> +++ b/drivers/clk/qcom/camcc-sm8550.c
> @@ -7,7 +7,6 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>=20
>   #include <dt-bindings/clock/qcom,sm8550-camcc.h>
> @@ -74,6 +73,7 @@ static const struct alpha_pll_config cam_cc_pll0_config=
 =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll0 =3D {
>   =09.offset =3D 0x0,
> +=09.config =3D &cam_cc_pll0_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -151,6 +151,7 @@ static const struct alpha_pll_config cam_cc_pll1_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll1 =3D {
>   =09.offset =3D 0x1000,
> +=09.config =3D &cam_cc_pll1_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -201,6 +202,7 @@ static const struct alpha_pll_config cam_cc_pll2_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll2 =3D {
>   =09.offset =3D 0x2000,
> +=09.config =3D &cam_cc_pll2_config,
>   =09.vco_table =3D rivian_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(rivian_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
> @@ -232,6 +234,7 @@ static const struct alpha_pll_config cam_cc_pll3_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll3 =3D {
>   =09.offset =3D 0x3000,
> +=09.config =3D &cam_cc_pll3_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -286,6 +289,7 @@ static const struct alpha_pll_config cam_cc_pll4_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll4 =3D {
>   =09.offset =3D 0x4000,
> +=09.config =3D &cam_cc_pll4_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -340,6 +344,7 @@ static const struct alpha_pll_config cam_cc_pll5_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll5 =3D {
>   =09.offset =3D 0x5000,
> +=09.config =3D &cam_cc_pll5_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -394,6 +399,7 @@ static const struct alpha_pll_config cam_cc_pll6_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll6 =3D {
>   =09.offset =3D 0x6000,
> +=09.config =3D &cam_cc_pll6_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -448,6 +454,7 @@ static const struct alpha_pll_config cam_cc_pll7_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll7 =3D {
>   =09.offset =3D 0x7000,
> +=09.config =3D &cam_cc_pll7_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -502,6 +509,7 @@ static const struct alpha_pll_config cam_cc_pll8_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll8 =3D {
>   =09.offset =3D 0x8000,
> +=09.config =3D &cam_cc_pll8_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -556,6 +564,7 @@ static const struct alpha_pll_config cam_cc_pll9_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll9 =3D {
>   =09.offset =3D 0x9000,
> +=09.config =3D &cam_cc_pll9_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -610,6 +619,7 @@ static const struct alpha_pll_config cam_cc_pll10_con=
fig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll10 =3D {
>   =09.offset =3D 0xa000,
> +=09.config =3D &cam_cc_pll10_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -664,6 +674,7 @@ static const struct alpha_pll_config cam_cc_pll11_con=
fig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll11 =3D {
>   =09.offset =3D 0xb000,
> +=09.config =3D &cam_cc_pll11_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -718,6 +729,7 @@ static const struct alpha_pll_config cam_cc_pll12_con=
fig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll12 =3D {
>   =09.offset =3D 0xc000,
> +=09.config =3D &cam_cc_pll12_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -3479,6 +3491,27 @@ static const struct qcom_reset_map cam_cc_sm8550_r=
esets[] =3D {
>   =09[CAM_CC_SFE_1_BCR] =3D { 0x133dc },
>   };
>=20
> +static struct clk_alpha_pll *cam_cc_sm8550_plls[] =3D {
> +=09&cam_cc_pll0,
> +=09&cam_cc_pll1,
> +=09&cam_cc_pll2,
> +=09&cam_cc_pll3,
> +=09&cam_cc_pll4,
> +=09&cam_cc_pll5,
> +=09&cam_cc_pll6,
> +=09&cam_cc_pll7,
> +=09&cam_cc_pll8,
> +=09&cam_cc_pll9,
> +=09&cam_cc_pll10,
> +=09&cam_cc_pll11,
> +=09&cam_cc_pll12,
> +};
> +
> +static u32 cam_cc_sm8550_critical_cbcrs[] =3D {
> +=090x1419c, /* CAM_CC_GDSC_CLK */
> +=090x142cc, /* CAM_CC_SLEEP_CLK */
> +};
> +
>   static const struct regmap_config cam_cc_sm8550_regmap_config =3D {
>   =09.reg_bits =3D 32,
>   =09.reg_stride =3D 4,
> @@ -3487,6 +3520,13 @@ static const struct regmap_config cam_cc_sm8550_re=
gmap_config =3D {
>   =09.fast_io =3D true,
>   };
>=20
> +static struct qcom_cc_driver_data cam_cc_sm8550_driver_data =3D {
> +=09.alpha_plls =3D cam_cc_sm8550_plls,
> +=09.num_alpha_plls =3D ARRAY_SIZE(cam_cc_sm8550_plls),
> +=09.clk_cbcrs =3D cam_cc_sm8550_critical_cbcrs,
> +=09.num_clk_cbcrs =3D ARRAY_SIZE(cam_cc_sm8550_critical_cbcrs),
> +};
> +
>   static const struct qcom_cc_desc cam_cc_sm8550_desc =3D {
>   =09.config =3D &cam_cc_sm8550_regmap_config,
>   =09.clks =3D cam_cc_sm8550_clocks,
> @@ -3495,6 +3535,8 @@ static const struct qcom_cc_desc cam_cc_sm8550_desc=
 =3D {
>   =09.num_resets =3D ARRAY_SIZE(cam_cc_sm8550_resets),
>   =09.gdscs =3D cam_cc_sm8550_gdscs,
>   =09.num_gdscs =3D ARRAY_SIZE(cam_cc_sm8550_gdscs),
> +=09.use_rpm =3D true,
> +=09.driver_data =3D &cam_cc_sm8550_driver_data,
>   };
>=20
>   static const struct of_device_id cam_cc_sm8550_match_table[] =3D {
> @@ -3505,46 +3547,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sm8550_match_table)=
;
>=20
>   static int cam_cc_sm8550_probe(struct platform_device *pdev)
>   {
> -=09struct regmap *regmap;
> -=09int ret;
> -
> -=09ret =3D devm_pm_runtime_enable(&pdev->dev);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09ret =3D pm_runtime_resume_and_get(&pdev->dev);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09regmap =3D qcom_cc_map(pdev, &cam_cc_sm8550_desc);
> -=09if (IS_ERR(regmap)) {
> -=09=09pm_runtime_put(&pdev->dev);
> -=09=09return PTR_ERR(regmap);
> -=09}
> -
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config=
);
> -=09clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_confi=
g);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll9, regmap, &cam_cc_pll9_config=
);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll10, regmap, &cam_cc_pll10_conf=
ig);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll11, regmap, &cam_cc_pll11_conf=
ig);
> -=09clk_lucid_ole_pll_configure(&cam_cc_pll12, regmap, &cam_cc_pll12_conf=
ig);
> -
> -=09/* Keep some clocks always-on */
> -=09qcom_branch_set_clk_en(regmap, 0x1419c); /* CAM_CC_GDSC_CLK */
> -=09qcom_branch_set_clk_en(regmap, 0x142cc); /* CAM_CC_SLEEP_CLK */
> -
> -=09ret =3D qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8550_desc, regmap)=
;
> -
> -=09pm_runtime_put(&pdev->dev);
> -
> -=09return ret;
> +=09return qcom_cc_probe(pdev, &cam_cc_sm8550_desc);
>   }
>=20
>   static struct platform_driver cam_cc_sm8550_driver =3D {
>=20
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


