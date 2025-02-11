Return-Path: <linux-arm-msm+bounces-47537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5664A307B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C1D33A3214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1B21F0E42;
	Tue, 11 Feb 2025 09:53:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2931F153F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739267623; cv=none; b=qTN9mxTFdWdU/Hp/bgrrlXP7FuRCircllfJzLPI0COc4MgWzclvAk6UppU8rWXWIdQdd4ycWyz/54dAApbNJYtuOs+VlEjDvkmV/YpzK+ywInG4RqJQ6oHkqTc1mbKs5wGbuPgR8xbxB3Js+OpXdCs3cJ3d3WgzKRuAJbzJUguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739267623; c=relaxed/simple;
	bh=HWRII0l1tSACzIG6eJSFFhy5e/RM0/rZAs3T6sIb2Hw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lu7LePDX7qTbgdsAG7WQ6FV9Zi5OQX6td1E+gIutjMUVwbBf2HD6hwq9JAZWS4oYvL4eKznEvtfMmbqHhxx9fWgwCoBSXileP7TI4ITBGKPu53vKNgoE7VRJYqCR13CcgqIFBNshdBxWpY/jDZci5/FwhOfiPaQXUo/wzobBN54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1thmxL-0007an-OH; Tue, 11 Feb 2025 10:53:27 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1thmxK-000OXM-2X;
	Tue, 11 Feb 2025 10:53:26 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1thmxK-0002lT-2F;
	Tue, 11 Feb 2025 10:53:26 +0100
Message-ID: <6c38b6e028858662aa5d45f4a14b993860b73cc0.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] phy: qcom: pcie: Determine has_nocsr_reset
 dynamically
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wenbin Yao <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org,  dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
 quic_qianyu@quicinc.com,  neil.armstrong@linaro.org,
 manivannan.sadhasivam@linaro.org,  quic_devipriy@quicinc.com,
 konrad.dybcio@oss.qualcomm.com,  linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Tue, 11 Feb 2025 10:53:26 +0100
In-Reply-To: <20250211094231.1813558-2-quic_wenbyao@quicinc.com>
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
	 <20250211094231.1813558-2-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

On Di, 2025-02-11 at 17:42 +0800, Wenbin Yao wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Decide the in-driver logic based on whether the nocsr reset is present
> and defer checking the appropriateness of that to dt-bindings to save
> on boilerplate.
>=20
> Reset controller APIs are fine consuming a nullptr, so no additional
> checks are necessary there.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-pcie.c
> index 873f2f9844c6..ac42e4b01065 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2793,8 +2793,6 @@ struct qmp_phy_cfg {
> =20
>  	bool skip_start_delay;
> =20
> -	bool has_nocsr_reset;
> -
>  	/* QMP PHY pipe clock interface rate */
>  	unsigned long pipe_clock_rate;
> =20
> @@ -3685,7 +3683,6 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_p=
ciephy_cfg =3D {
> =20
>  	.pwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		=3D PHYSTATUS_4_20,
> -	.has_nocsr_reset	=3D true,
> =20
>  	/* 20MHz PHY AUX Clock */
>  	.aux_clock_rate		=3D 20000000,
> @@ -3718,7 +3715,6 @@ static const struct qmp_phy_cfg sm8650_qmp_gen4x2_p=
ciephy_cfg =3D {
> =20
>  	.pwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		=3D PHYSTATUS_4_20,
> -	.has_nocsr_reset	=3D true,
> =20
>  	/* 20MHz PHY AUX Clock */
>  	.aux_clock_rate		=3D 20000000,
> @@ -3836,7 +3832,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2=
_pciephy_cfg =3D {
> =20
>  	.pwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		=3D PHYSTATUS_4_20,
> -	.has_nocsr_reset	=3D true,
>  };
> =20
>  static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg =3D {
> @@ -3870,7 +3865,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4=
_pciephy_cfg =3D {
> =20
>  	.pwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		=3D PHYSTATUS_4_20,
> -	.has_nocsr_reset	=3D true,
>  };
> =20
>  static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg =3D {
> @@ -3902,7 +3896,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8=
_pciephy_cfg =3D {
> =20
>  	.pwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		=3D PHYSTATUS_4_20,
> -	.has_nocsr_reset	=3D true,
>  };
> =20
>  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_=
phy_cfg_tbls *tbls)
> @@ -4203,11 +4196,14 @@ static int qmp_pcie_reset_init(struct qmp_pcie *q=
mp)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get resets\n");
> =20
> -	if (cfg->has_nocsr_reset) {
> -		qmp->nocsr_reset =3D devm_reset_control_get_exclusive(dev, "phy_nocsr"=
);
> -		if (IS_ERR(qmp->nocsr_reset))
> +	qmp->nocsr_reset =3D devm_reset_control_get_exclusive(dev, "phy_nocsr")=
;
> +	if (IS_ERR(qmp->nocsr_reset)) {
> +		if (PTR_ERR(qmp->nocsr_reset) =3D=3D -ENOENT ||
> +		    PTR_ERR(qmp->nocsr_reset) =3D=3D -EINVAL)

Why is -EINVAL ignored here?

Without this you could just use
devm_reset_control_get_optional_exclusive(), which already turns -
ENOENT into NULL. That seems to me the correct thing to do, as from
driver point-of-view, this reset control is optional.

> +			qmp->nocsr_reset =3D NULL;
> +		else
>  			return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
> -						"failed to get no-csr reset\n");
> +					     "failed to get no-csr reset\n");
>  	}
> =20
>  	return 0;

regards
Philipp

