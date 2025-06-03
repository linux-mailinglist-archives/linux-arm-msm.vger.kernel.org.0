Return-Path: <linux-arm-msm+bounces-60115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37886ACC1C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 487741886311
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC74280321;
	Tue,  3 Jun 2025 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="iGAVarSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3CA269AE0;
	Tue,  3 Jun 2025 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938129; cv=none; b=Xr0ApyUrKUicZ8GLa7g7Oi4fAP6O/OLL73tYiB3+yivr+doCaN6f21PZ4kLaKzVOwa+GEdgHUFHw6jw7TA7LSQYfDfkvvcG/UgYlCuAJ9C4T3jVwzS+hNgX9ngrPzuIjGvDqfv+2fX+jIm32DP0xx7rwbBcdeVlzJ61FbJT1s+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938129; c=relaxed/simple;
	bh=msPUpWz4f3d4kJlhPPW5sCohuOIJAE/P/Hep8CDnBnI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sm94d1JNQPwUkgEL+92tf+3dOMY/UEZC9/XHqv/SjNU8pB0gQfkFe7wlERCZkns//ePhN6Uv7H/e8MIWu1Em4WgfKctCJeY5tqzxac4cb3ZmuTTI0UFT0x3LojPYYrJFtLJT8o9JKBGFPGns68MSyDZxSMwtHjsBrbbqfimD2aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=iGAVarSZ; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748938125; x=1749197325;
	bh=o0aX78E0NKjwZVM5MrZI+8W5KeemKWhOJUXDdTfKd8U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iGAVarSZJkjZ2WHN3kPcig3DZ2V+2KMjUxR+EdEUra4etyQ3gIF9//aXKKL2qvegW
	 WSTQtmCTT6whGjnIvRyzjqByoOCwOZWhqsqtVY84IjlvOwjlW8BagN/85cRF1T0Z7K
	 UGp9k7u0ylloXhBUN/+N/ZmYxdI5ayG2nT38nKIJWYx8fN6BPpSpvy94UBXsibW3Iv
	 z5LiqimhjsCZWtv5IPhq2JeDgA6QnpjzbMSd5f9SVxuUByNGNzk334RHEZD1/F0kHu
	 XS2HNazz1WbQnma/9gVC3mna+75qbV9KQFQm5dY/wfQydL29h4PDkdiDNswoVrSv8w
	 GdTpICMf5j3mQ==
Date: Tue, 03 Jun 2025 08:08:38 +0000
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 16/18] arm64: dts: qcom: sm8450: Additionally manage MXC power domain in camcc
Message-ID: <e8853f32-11b9-4909-9769-c06b439f2bf7@nxsw.ie>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-16-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com> <20250530-videocc-pll-multi-pd-voting-v5-16-02303b3a582d@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 0bf79866b8b6856c89688d1a6e2a98a9f4466c39
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 14:21, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8450 platform. Hence add MXC power domain to
> camcc node on SM8450.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index 36a67c679fbaed944d7590528b696635c306da5d..624190c07c59f3e6714f296f1=
b264d2a88135116 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3292,8 +3292,10 @@ camcc: clock-controller@ade0000 {
>   =09=09=09=09 <&rpmhcc RPMH_CXO_CLK>,
>   =09=09=09=09 <&rpmhcc RPMH_CXO_CLK_A>,
>   =09=09=09=09 <&sleep_clk>;
> -=09=09=09power-domains =3D <&rpmhpd RPMHPD_MMCX>;
> -=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>;
> +=09=09=09power-domains =3D <&rpmhpd RPMHPD_MMCX>,
> +=09=09=09=09=09<&rpmhpd RPMHPD_MXC>;
> +=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>,
> +=09=09=09=09=09<&rpmhpd_opp_low_svs>;
>   =09=09=09#clock-cells =3D <1>;
>   =09=09=09#reset-cells =3D <1>;
>   =09=09=09#power-domain-cells =3D <1>;
>=20
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


