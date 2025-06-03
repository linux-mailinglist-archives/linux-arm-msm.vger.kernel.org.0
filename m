Return-Path: <linux-arm-msm+bounces-60117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733DACC1CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 376DE3A398D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC846280323;
	Tue,  3 Jun 2025 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="GmvHtxjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1ED1B0F17;
	Tue,  3 Jun 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938170; cv=none; b=LFrvzfWB5PP0dlXW0IV/cI5H4F6QkArjLPdyO67DFE2L3O/h2bqK6be5NEhNgjRl96az/zkc2GxbMUjaSKXgI6jEot3YEsAyN3Vcvfqwxhyoo8/F26DbNJQsWBut9AfahpwydKCLvCuG5+yX2V1TdpwAEW7NaBN0iQsR/fuZfes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938170; c=relaxed/simple;
	bh=Tl2unEXAfUpgUY1U1eiFkhnWmStHVTDPe4mXpF4J/KA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CP4UvsgTi2TcdCom72EfFy1nGpMaH1eua/dhKQFMKCDhe4X945dj/gaDizuIl05goiSUVyH53FTFvX4X4Ky7qen1RMlr+f3D+EWyfRM810VKqC6PTgMjYMZR8Rx47ZbRWghLBdL8yGQ5vUl4eUtTUorpSgWkSj/drgc4O+ZSmwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=GmvHtxjo; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748938166; x=1749197366;
	bh=wtdotDftFsaYUhRhukvnTcygnm/B8luqsxUkw4v+/YM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GmvHtxjoNgTjFBotHqAKIGxtqCaQqxOy5MFtG3DOSW/Kg1tgGd3CXPa0/s48vOgrw
	 AyStd544tk4Y1Y0lY+phxd5ffk4T55YgQQwbb779t725ixOOSsLthJqQIXLxmym0r8
	 pQJ4CpGhnH5qBKKhlf/qmTd4epttOwWlqkN7IofFvF36q08+GEhY89VgHHoEWWMX2/
	 th73cENL9+xyrUyn1X+9IfIa0tTcZqU3S+ucF0ycRf491IgRx4elYRBmeGSKk10lmg
	 Dq0sLLK6MFOSXwfYXjgq5tXTbykgW+jNNMpQtyB1sfc+B2SgIGlvdY4qE+xc8OM+DN
	 nlZtZymOtukyw==
Date: Tue, 03 Jun 2025 08:09:23 +0000
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 18/18] arm64: dts: qcom: sm8650: Additionally manage MXC power domain in camcc
Message-ID: <304578ef-6b08-454b-9576-1a646b3daa34@nxsw.ie>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-18-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com> <20250530-videocc-pll-multi-pd-voting-v5-18-02303b3a582d@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 80f8ad29fa52543474bb475f6c453ccc297041f8
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
> the camera PLLs on SM8650 platform. Hence add MXC power domain to
> camcc node on SM8650.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index ad60596b71d25bb0198b26660dc41195a1210a23..a2b3d97abc7f799810e20131d=
7231608c8757859 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5072,7 +5072,8 @@ camcc: clock-controller@ade0000 {
>   =09=09=09=09 <&bi_tcxo_div2>,
>   =09=09=09=09 <&bi_tcxo_ao_div2>,
>   =09=09=09=09 <&sleep_clk>;
> -=09=09=09power-domains =3D <&rpmhpd RPMHPD_MMCX>;
> +=09=09=09power-domains =3D <&rpmhpd RPMHPD_MMCX>,
> +=09=09=09=09=09<&rpmhpd RPMHPD_MXC>;
>   =09=09=09#clock-cells =3D <1>;
>   =09=09=09#reset-cells =3D <1>;
>   =09=09=09#power-domain-cells =3D <1>;
>=20
> --
> 2.34.1
>=20
>=20
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


