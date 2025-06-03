Return-Path: <linux-arm-msm+bounces-60110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D84ACC1A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F5E3A4073
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDD2280006;
	Tue,  3 Jun 2025 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="dJZL/ubb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680A27F728
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748937789; cv=none; b=XUv/N5X2K1+1LS76G6EiA7+OPF0Z2IMBrQH7+Eby8sQOnpdMkUHNnANB6MGttc6YWiMxjgbymDeRdCzkQXGJ8Isx/lDCGG4WJpfOgpd6hEJ/Qu70ZKGeLM7YQmjapdAQElbIRx9DJzQE+OpBfLm7tJN1OXVU+VtaS+4+8nbjBXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748937789; c=relaxed/simple;
	bh=V1RuypRc8wpmKJy9fD2ps+Jjaz1BIeVwW+uLlISu6G8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/gez+LY0TtUKMStfI4FQFSXATt30la/LdWwWZX48IebBOdMQfu8eO0X13mx1Mb+/cIXiWbjQYr304Ab6MD/e7KA6dCWR0WDWX+8GiMcbWP82ROQnJxJA3NH9suYB1bF/yMaROEH01BD/3P2hVM3fnaGLbVig+VLiM9uK0didl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=dJZL/ubb; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748937776; x=1749196976;
	bh=wvT9a/zTe4Ix1oUXKhYeqP9LCyzR2z2SG/ZmYqZaYAI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dJZL/ubbSvZqRw+eG0O87cu/CrzJZqet9UEp3gHkwp68TMyKt4ZneT7IJQoJl236r
	 EGAoMCjFhpp5iEK5kN6W4IIKIQVhszYOcbU5hfxII4b5WyW0lpHsZ3O3uWH1MqAQIe
	 o/sHIjbNAnuSPeeDMaWrwu6VJfQL+DeS+2GNhD+LwUg8buK8ChYC2CAomVf57nxJHX
	 KN1TFowIN1erm54hzwyG94Q8kk1RfPvd3IBOvByNIzhbgWf0DXtid5PjzIeJdAAa9g
	 a0tWMKVQpDkkN/HpXe5xMKB3xV7hYx4RiM+ROA2aEj3pTtNR8vncKbt3jxngnzNzNw
	 tE73fRxe3RL8g==
Date: Tue, 03 Jun 2025 08:02:51 +0000
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/18] clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
Message-ID: <dc8d4ca9-93bf-4aed-a744-d8b799e01606@nxsw.ie>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com> <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: cb9fd4fa3ad6bfa0b16cc759d8a825477ae58d2d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 14:20, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configurin=
g
> the PLLs or enabling the clocks.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sm8550.c | 66 +++++++++++++++++++-------------=
-------
>   1 file changed, 33 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc=
-sm8550.c
> index fcfe0cade6d0a95e749aabbc2af1174e5a70f0db..3e5891b43ee404edc6c99bbf8=
f2583cb44df9e37 100644
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
> @@ -7,7 +7,6 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>=20
>   #include <dt-bindings/clock/qcom,sm8650-videocc.h>
> @@ -51,6 +50,7 @@ static struct alpha_pll_config video_cc_pll0_config =3D=
 {
>=20
>   static struct clk_alpha_pll video_cc_pll0 =3D {
>   =09.offset =3D 0x0,
> +=09.config =3D &video_cc_pll0_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -82,6 +82,7 @@ static struct alpha_pll_config video_cc_pll1_config =3D=
 {
>=20
>   static struct clk_alpha_pll video_cc_pll1 =3D {
>   =09.offset =3D 0x1000,
> +=09.config =3D &video_cc_pll1_config,
>   =09.vco_table =3D lucid_ole_vco,
>   =09.num_vco =3D ARRAY_SIZE(lucid_ole_vco),
>   =09.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -511,6 +512,23 @@ static const struct qcom_reset_map video_cc_sm8550_r=
esets[] =3D {
>   =09[VIDEO_CC_XO_CLK_ARES] =3D { .reg =3D 0x8124, .bit =3D 2, .udelay =
=3D 100 },
>   };
>=20
> +static struct clk_alpha_pll *video_cc_sm8550_plls[] =3D {
> +=09&video_cc_pll0,
> +=09&video_cc_pll1,
> +};
> +
> +static u32 video_cc_sm8550_critical_cbcrs[] =3D {
> +=090x80f4, /* VIDEO_CC_AHB_CLK */
> +=090x8124, /* VIDEO_CC_XO_CLK */
> +=090x8140, /* VIDEO_CC_SLEEP_CLK */
> +};
> +
> +static u32 video_cc_sm8650_critical_cbcrs[] =3D {
> +=090x80f4, /* VIDEO_CC_AHB_CLK */
> +=090x8124, /* VIDEO_CC_XO_CLK */
> +=090x8150, /* VIDEO_CC_SLEEP_CLK */
> +};
> +
>   static const struct regmap_config video_cc_sm8550_regmap_config =3D {
>   =09.reg_bits =3D 32,
>   =09.reg_stride =3D 4,
> @@ -519,6 +537,13 @@ static const struct regmap_config video_cc_sm8550_re=
gmap_config =3D {
>   =09.fast_io =3D true,
>   };
>=20
> +static struct qcom_cc_driver_data video_cc_sm8550_driver_data =3D {
> +=09.alpha_plls =3D video_cc_sm8550_plls,
> +=09.num_alpha_plls =3D ARRAY_SIZE(video_cc_sm8550_plls),
> +=09.clk_cbcrs =3D video_cc_sm8550_critical_cbcrs,
> +=09.num_clk_cbcrs =3D ARRAY_SIZE(video_cc_sm8550_critical_cbcrs),
> +};
> +
>   static const struct qcom_cc_desc video_cc_sm8550_desc =3D {
>   =09.config =3D &video_cc_sm8550_regmap_config,
>   =09.clks =3D video_cc_sm8550_clocks,
> @@ -527,6 +552,8 @@ static const struct qcom_cc_desc video_cc_sm8550_desc=
 =3D {
>   =09.num_resets =3D ARRAY_SIZE(video_cc_sm8550_resets),
>   =09.gdscs =3D video_cc_sm8550_gdscs,
>   =09.num_gdscs =3D ARRAY_SIZE(video_cc_sm8550_gdscs),
> +=09.use_rpm =3D true,
> +=09.driver_data =3D &video_cc_sm8550_driver_data,
>   };
>=20
>   static const struct of_device_id video_cc_sm8550_match_table[] =3D {
> @@ -538,26 +565,7 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table)=
;
>=20
>   static int video_cc_sm8550_probe(struct platform_device *pdev)
>   {
> -=09struct regmap *regmap;
> -=09int ret;
> -=09u32 sleep_clk_offset =3D 0x8140;
> -
> -=09ret =3D devm_pm_runtime_enable(&pdev->dev);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09ret =3D pm_runtime_resume_and_get(&pdev->dev);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09regmap =3D qcom_cc_map(pdev, &video_cc_sm8550_desc);
> -=09if (IS_ERR(regmap)) {
> -=09=09pm_runtime_put(&pdev->dev);
> -=09=09return PTR_ERR(regmap);
> -=09}
> -
>   =09if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc"=
)) {
> -=09=09sleep_clk_offset =3D 0x8150;
>   =09=09video_cc_pll0_config.l =3D 0x1e;
>   =09=09video_cc_pll0_config.alpha =3D 0xa000;
>   =09=09video_cc_pll1_config.l =3D 0x2b;
> @@ -569,21 +577,13 @@ static int video_cc_sm8550_probe(struct platform_de=
vice *pdev)
>   =09=09video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] =3D &video_cc_mvs=
1_shift_clk.clkr;
>   =09=09video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] =3D &video_cc_mv=
s1c_shift_clk.clkr;
>   =09=09video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] =3D &video_cc_xo_clk_=
src.clkr;
> -=09}
> -
> -=09clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_co=
nfig);
> -=09clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_co=
nfig);
>=20
> -=09/* Keep some clocks always-on */
> -=09qcom_branch_set_clk_en(regmap, 0x80f4); /* VIDEO_CC_AHB_CLK */
> -=09qcom_branch_set_clk_en(regmap, sleep_clk_offset); /* VIDEO_CC_SLEEP_C=
LK */
> -=09qcom_branch_set_clk_en(regmap, 0x8124); /* VIDEO_CC_XO_CLK */
> -
> -=09ret =3D qcom_cc_really_probe(&pdev->dev, &video_cc_sm8550_desc, regma=
p);
> -
> -=09pm_runtime_put(&pdev->dev);
> +=09=09video_cc_sm8550_driver_data.clk_cbcrs =3D video_cc_sm8650_critical=
_cbcrs;
> +=09=09video_cc_sm8550_driver_data.num_clk_cbcrs =3D
> +=09=09=09=09=09=09=09ARRAY_SIZE(video_cc_sm8650_critical_cbcrs);
> +=09}
>=20
> -=09return ret;
> +=09return qcom_cc_probe(pdev, &video_cc_sm8550_desc);
>   }
>=20
>   static struct platform_driver video_cc_sm8550_driver =3D {
>=20
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


