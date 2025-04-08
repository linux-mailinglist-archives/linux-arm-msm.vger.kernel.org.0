Return-Path: <linux-arm-msm+bounces-53505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1ACA7FA11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AE49175F31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068CE267B07;
	Tue,  8 Apr 2025 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="YBeFyszi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E4267AE9
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105195; cv=none; b=ZSKAvsC7EbhxlPmz13nQqVxyZ1Kfv6W62TWwu2J9LI5Gx1AsMA2gTSzUa41HOOjyIeJoWzaDZmw5S+7KmxwSH/ezbT6FNXKs8rM08GgUqlTsia2i0WKk1I6roXUsTUNQq3PgcsYaIZip1+ibAYnj/GRkImSUD3H6im+fi3N5IhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105195; c=relaxed/simple;
	bh=oJojnPlxs804iHEW1PKEX9MFL2zS/ctwMsP+/h/a1ZU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=puc+tOOcHQGS+7h7bSTWDrvYfhqlyYOt4RQwOEEMZwDNy841Mk8hNe+g41S10c0hp8JybFzWsBqIgWN6LZtWveWoYQNyO6oE1t3nRqShAYaMvIBEBEH0RNjj2VVyS4xwWyqi6iyxVMTarNCkD+M+O8bV144hQv35kK/qQ1Jglew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=YBeFyszi; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1744105182; x=1744364382;
	bh=81y8mdQRf2pTfRrGp1MmyQqBnE1Gf7WyE1Yqjum9qTI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=YBeFysziEmvvmtt69W6NMTj2lL8ETeYecWXsYUjIWDUknk5poBElmsPSxROkM02FN
	 a5skzwHjc5wKHpH3CZTYYK1kG6d8xnh0rN+0lQdwIly51J1Kow7/k+ZFpUn9oANsHR
	 VDY8tYpKl29FMpS+izOzO0ICBOLrT53W9MazZSEj+Yw4tSxO2bGcpZTFrzNhbqa0Fi
	 NW86YBfa3220i33U0KdD8boH2T3nPvyyKYSnm8l09df8bZNsl9qnXE5kKf+DuVEIEl
	 aYLJHRo9DLlmYd6724ty5ZFiuHSQaBTNLji1VSibI/h4DpP4nkWHqmG3K03wTldJw5
	 cAwrBlfAYrkdA==
Date: Tue, 08 Apr 2025 09:39:39 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org, konradybcio@kernel.org
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm2290: Add CCI node
Message-ID: <1e916069-809e-4a49-aeb7-df89a4e9e3a7@nxsw.ie>
In-Reply-To: <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
References: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com> <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 4c53c4e61d482c4d6ed7613b06303385b692efbd
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/04/2025 11:22, Loic Poulain wrote:
> Add Camera Control Interface (CCI), supporting two I2C masters.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   v2: Reorder commits; Update dts properties order and style
>   v3: No change for this patch
>=20
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/=
qcom/qcm2290.dtsi
> index 7fb5de92bc4c..43fcb4f40a8c 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -557,6 +557,20 @@ qup_uart4_default: qup-uart4-default-state {
>   =09=09=09=09bias-disable;
>   =09=09=09};
>=20
> +=09=09=09cci0_default: cci0-default-state {
> +=09=09=09=09pins =3D "gpio22", "gpio23";
> +=09=09=09=09function =3D "cci_i2c";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
> +=09=09=09cci1_default: cci1-default-state {
> +=09=09=09=09pins =3D "gpio29", "gpio30";
> +=09=09=09=09function =3D "cci_i2c";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09sdc1_state_on: sdc1-on-state {
>   =09=09=09=09clk-pins {
>   =09=09=09=09=09pins =3D "sdc1_clk";
> @@ -1603,6 +1617,42 @@ adreno_smmu: iommu@59a0000 {
>   =09=09=09#iommu-cells =3D <2>;
>   =09=09};
>=20
> +=09=09cci: cci@5c1b000 {
> +=09=09=09compatible =3D "qcom,qcm2290-cci", "qcom,msm8996-cci";
> +=09=09=09reg =3D <0x0 0x5c1b000 0x0 0x1000>;
> +
> +=09=09=09interrupts =3D <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
> +
> +=09=09=09clocks =3D <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_=
CLK>;
> +=09=09=09clock-names =3D "camss_top_ahb", "cci";
> +=09=09=09assigned-clocks =3D <&gcc GCC_CAMSS_CCI_0_CLK>;
> +=09=09=09assigned-clock-rates =3D <37500000>;
> +
> +=09=09=09power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +=09=09=09pinctrl-0 =3D <&cci0_default &cci1_default>;
> +=09=09=09pinctrl-names =3D "default";
> +
> +=09=09=09#address-cells =3D <1>;
> +=09=09=09#size-cells =3D <0>;
> +
> +=09=09=09status =3D "disabled";
> +
> +=09=09=09cci_i2c0: i2c-bus@0 {
> +=09=09=09=09reg =3D <0>;
> +=09=09=09=09clock-frequency =3D <400000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09};
> +
> +=09=09=09cci_i2c1: i2c-bus@1 {
> +=09=09=09=09reg =3D <1>;
> +=09=09=09=09clock-frequency =3D <400000>;
> +=09=09=09=09#address-cells =3D <1>;
> +=09=09=09=09#size-cells =3D <0>;
> +=09=09=09};
> +=09=09};
> +
>   =09=09mdss: display-subsystem@5e00000 {
>   =09=09=09compatible =3D "qcom,qcm2290-mdss";
>   =09=09=09reg =3D <0x0 0x05e00000 0x0 0x1000>;
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


