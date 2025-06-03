Return-Path: <linux-arm-msm+bounces-60114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF15ACC1C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7281D1890AC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D184B2690C8;
	Tue,  3 Jun 2025 08:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="blezYOTK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24F328031A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938076; cv=none; b=RAhXt7C6onNZFX3dcs1TJCsKdSBDF9wRF6dOC0donSANzG9JTCfKGy3du/iMtvEOXBBh9VJJMRLXwPWXFZXYTaqektAMvqxorM/tv8m+fkuFnxYmJ1GT9YCfAKoK+k+7zOYwwj9ufTy9wsjtI5L3SZSDeSAbEosBV3qJYbf3EHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938076; c=relaxed/simple;
	bh=79ensgQMDs8gAqWuBoTz2KkIZPHPCh1UJKBvHwByF9k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFmGjcdBcHAR+KqvaM37IF6Iq/caFMZ3sm6ItWB0knSJW6Y65mmtohUiJKDg362Au3H6q5Nc6XKc0g54iT++Giv/Wtd/3I7aMAQBvgCtQbu1+idht+yOoEuDkwAYGTxM/+ROjwSwxGG7uFGSVEGY89bvee8n45Al45oepketG+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=blezYOTK; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748938072; x=1749197272;
	bh=6hVwFeNMuCJf5pVp1IHICi8nSZ6JldWap9i+NAindh4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=blezYOTK0aQ58rJKWfN3NllLwQLUAqXjgABdeT9OZDOBPkJEPnx4Tq3NaIaAGmhcv
	 fxi/ZPMG7laaQLN75rtX+W71eveE/BIqsxCPodzuGFkcxfGouHUlHeQ96/SCWXFFVY
	 gBtSvTRft+bZF9M+qdcMgu9vj4FfIrbCyLrl/D12tjClh3bvC2LAnipOB2dL8xYrE5
	 LJMLVO4HLl/7xAxrCuGdeKJcX1FnN3B4jiPNLh/Z5c72r0aKlojRjIW0jbmvc3ZVNo
	 1x9lGfLRkcyPWTO9/6+5xzZwScR4G3pGbu6WRClneeNgAPq7BxdcLrtncV57OV9Qwp
	 +aBIJu+ZdbJOg==
Date: Tue, 03 Jun 2025 08:07:47 +0000
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 11/18] clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
Message-ID: <fd52c848-3d43-429f-b346-12befa5bcd82@nxsw.ie>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-11-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com> <20250530-videocc-pll-multi-pd-voting-v5-11-02303b3a582d@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 59cab46fef0e224000c7436a30489e4049c2e3c5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 14:20, Jagadeesh Kona wrote:
> Camera PLLs on SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/camcc-sm8650.c | 83 +++++++++++++++++++++-------------=
-------
>   1 file changed, 42 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8=
650.c
> index 0ccd6de8ba78a3493f8f853a4330d2676b5743d4..8b388904f56fc3b3f77a43a09=
f735ace24b9fcf7 100644
> --- a/drivers/clk/qcom/camcc-sm8650.c
> +++ b/drivers/clk/qcom/camcc-sm8650.c
> @@ -7,7 +7,6 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>=20
>   #include <dt-bindings/clock/qcom,sm8650-camcc.h>
> @@ -72,6 +71,7 @@ static const struct alpha_pll_config cam_cc_pll0_config=
 =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll0 =3D {
>   =09.offset =3D 0x0,
> +=09.config =3D &cam_cc_pll0_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -149,6 +149,7 @@ static const struct alpha_pll_config cam_cc_pll1_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll1 =3D {
>   =09.offset =3D 0x1000,
> +=09.config =3D &cam_cc_pll1_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -199,6 +200,7 @@ static const struct alpha_pll_config cam_cc_pll2_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll2 =3D {
>   =09.offset =3D 0x2000,
> +=09.config =3D &cam_cc_pll2_config,
>   =09.vco_table =3D rivian_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(rivian_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
> @@ -230,6 +232,7 @@ static const struct alpha_pll_config cam_cc_pll3_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll3 =3D {
>   =09.offset =3D 0x3000,
> +=09.config =3D &cam_cc_pll3_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -284,6 +287,7 @@ static const struct alpha_pll_config cam_cc_pll4_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll4 =3D {
>   =09.offset =3D 0x4000,
> +=09.config =3D &cam_cc_pll4_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -338,6 +342,7 @@ static const struct alpha_pll_config cam_cc_pll5_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll5 =3D {
>   =09.offset =3D 0x5000,
> +=09.config =3D &cam_cc_pll5_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -392,6 +397,7 @@ static const struct alpha_pll_config cam_cc_pll6_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll6 =3D {
>   =09.offset =3D 0x6000,
> +=09.config =3D &cam_cc_pll6_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -446,6 +452,7 @@ static const struct alpha_pll_config cam_cc_pll7_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll7 =3D {
>   =09.offset =3D 0x7000,
> +=09.config =3D &cam_cc_pll7_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -500,6 +507,7 @@ static const struct alpha_pll_config cam_cc_pll8_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll8 =3D {
>   =09.offset =3D 0x8000,
> +=09.config =3D &cam_cc_pll8_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -554,6 +562,7 @@ static const struct alpha_pll_config cam_cc_pll9_conf=
ig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll9 =3D {
>   =09.offset =3D 0x9000,
> +=09.config =3D &cam_cc_pll9_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -631,6 +640,7 @@ static const struct alpha_pll_config cam_cc_pll10_con=
fig =3D {
>=20
>   static struct clk_alpha_pll cam_cc_pll10 =3D {
>   =09.offset =3D 0xa000,
> +=09.config =3D &cam_cc_pll10_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -3509,6 +3519,27 @@ static const struct qcom_reset_map cam_cc_sm8650_r=
esets[] =3D {
>   =09[CAM_CC_SFE_2_BCR] =3D { 0x130f4 },
>   };
>=20
> +static struct clk_alpha_pll *cam_cc_sm8650_plls[] =3D {
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
> +};
> +
> +static u32 cam_cc_sm8650_critical_cbcrs[] =3D {
> +=090x132ec, /* CAM_CC_GDSC_CLK */
> +=090x13308, /* CAM_CC_SLEEP_CLK */
> +=090x13314, /* CAM_CC_DRV_XO_CLK */
> +=090x13318, /* CAM_CC_DRV_AHB_CLK */
> +};
> +
>   static const struct regmap_config cam_cc_sm8650_regmap_config =3D {
>   =09.reg_bits =3D 32,
>   =09.reg_stride =3D 4,
> @@ -3517,6 +3548,13 @@ static const struct regmap_config cam_cc_sm8650_re=
gmap_config =3D {
>   =09.fast_io =3D true,
>   };
>=20
> +static struct qcom_cc_driver_data cam_cc_sm8650_driver_data =3D {
> +=09.alpha_plls =3D cam_cc_sm8650_plls,
> +=09.num_alpha_plls =3D ARRAY_SIZE(cam_cc_sm8650_plls),
> +=09.clk_cbcrs =3D cam_cc_sm8650_critical_cbcrs,
> +=09.num_clk_cbcrs =3D ARRAY_SIZE(cam_cc_sm8650_critical_cbcrs),
> +};
> +
>   static const struct qcom_cc_desc cam_cc_sm8650_desc =3D {
>   =09.config =3D &cam_cc_sm8650_regmap_config,
>   =09.clks =3D cam_cc_sm8650_clocks,
> @@ -3525,6 +3563,8 @@ static const struct qcom_cc_desc cam_cc_sm8650_desc=
 =3D {
>   =09.num_resets =3D ARRAY_SIZE(cam_cc_sm8650_resets),
>   =09.gdscs =3D cam_cc_sm8650_gdscs,
>   =09.num_gdscs =3D ARRAY_SIZE(cam_cc_sm8650_gdscs),
> +=09.use_rpm =3D true,
> +=09.driver_data =3D &cam_cc_sm8650_driver_data,
>   };
>=20
>   static const struct of_device_id cam_cc_sm8650_match_table[] =3D {
> @@ -3535,46 +3575,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sm8650_match_table)=
;
>=20
>   static int cam_cc_sm8650_probe(struct platform_device *pdev)
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
> -=09regmap =3D qcom_cc_map(pdev, &cam_cc_sm8650_desc);
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
> -
> -=09/* Keep clocks always enabled */
> -=09qcom_branch_set_clk_en(regmap, 0x13318); /* CAM_CC_DRV_AHB_CLK */
> -=09qcom_branch_set_clk_en(regmap, 0x13314); /* CAM_CC_DRV_XO_CLK */
> -=09qcom_branch_set_clk_en(regmap, 0x132ec); /* CAM_CC_GDSC_CLK */
> -=09qcom_branch_set_clk_en(regmap, 0x13308); /* CAM_CC_SLEEP_CLK */
> -
> -=09ret =3D qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap)=
;
> -
> -=09pm_runtime_put(&pdev->dev);
> -
> -=09return ret;
> +=09return qcom_cc_probe(pdev, &cam_cc_sm8650_desc);
>   }
>=20
>   static struct platform_driver cam_cc_sm8650_driver =3D {
>=20
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


