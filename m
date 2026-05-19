Return-Path: <linux-arm-msm+bounces-108419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D/UABAmDGrvXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:57:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 948CC57AA97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 962843032527
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B56A3EFFD9;
	Tue, 19 May 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uwfEP4fw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD43EFFC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180962; cv=none; b=mFT9lx2SVFIJjmsFxTgbT73JWRgwCw2vPCb6U5qdILC/TjmadkZwG0Zvv04aao4ZHsaE94my31NeFxSb2FDqBxlRblwY3ysfqKThizKPAoP403N6HqZtlPFoph8D/PiE7lbnuzlG/WVlnydKR1TO+kxX8IJPjcuf9UcIUnV0d0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180962; c=relaxed/simple;
	bh=uKGhi9iUrTdOisqjiyNydIx7fx0FrybVAAXaYF6uRo8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FHky7Ibgi1E4nbg+G5CqGAj1YVYa1AVuvSkdVojNa31DUptajilU0o5qLHu/kSnHI8cKm8j1+T2SXG0KK0AyP5oU9dutPR2DEInBPk3aQKhAMcOfzOkozlvMQK30z7/4fUUTYkJXhqxTRcdQ9gAp7gxyCPYcKQkGU2mXPmdQvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uwfEP4fw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so7265137a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779180958; x=1779785758; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nt0bHv2cN1VanRtf2jDdXMUgy7r2FF0U42NvjdLGAFQ=;
        b=uwfEP4fwB17TnD1YcbmOSGS2i3Y5zsKGMx7E6zKz57K45Sj4VqA1iy07f6fZg4LMJX
         eZeVrTL0XFiQjSpN2QGPQqb91BHVZcyaUxBKZV+U0wf4tmVMlOtgr9FI0W5wgskDJipO
         1rmyGviMWX2ah+MF4S2eMZ8DlJGW5C5ps5b5kyVCY2H0IHBr4Fu8qBSh6GjJA/pyNy+q
         FzeRMqk4q2dQEPlobLkrXXEZKDiBv6W9LVkmpwe2oCjr+JCACHunEpAahJwGKLJ+AF3C
         0Fu36rnG5x9UtggeVUcq14rQUr1wLZqKCtVLzuWj2Rf4NSw6Mcaxz0fpot2ihsPCw/bp
         6jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180958; x=1779785758;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nt0bHv2cN1VanRtf2jDdXMUgy7r2FF0U42NvjdLGAFQ=;
        b=mg0J2gCVeDoztMnjYSD+JDInoJxuMUFQS9XLRTlyn/ljaWMeZ8NDkYLzzNQ5uiSah+
         LJ6dl8Y1rY9rkr0kePvbypqFqJ/mC6968f6S4WWkdAAo6+6cKvFv3VA/oD8EtwL14wi3
         OGZDPL0FJbtjw10AGPpWnnLMXg+pycY+50i3onQ5wkQkAX7CmAe4a+hQdh4iaYd6ozS0
         ctlyQx9I8wAsftg/5DFhsRUgx4Hh1/uk4iNS29kzrNoURhwXIgb/9gfrvHuTJRJknfUr
         oiJOVoE4wrKC8FYrLES9DpPRlEgjLfRUdDEpFN3I0lBTwgTkPSE4gx7zs8Jf1nIWMtG2
         io8g==
X-Gm-Message-State: AOJu0YyJjXIY1xwD085fF+AbWKd6DN77wUmH5pZfdVunSSWE+nJl2S1G
	6tgVIbFfpZwHwlqt77T2vI0+sZBmEyiT3JdSGdDI5EPXLgPpsZfGZGLEg7otOKJAARg=
X-Gm-Gg: Acq92OGNnfdYch3yk0i8n74VERlbvZVBMQigzMnT3SpQLCKb4YFIHYd+7oQIb+adxOG
	cMONpYY0948BKfBUkvnag4k3L15tNvmXI4HK2Kduh0BSt5W4dpSj5LibiOGgeB1giNpKDdbwGv1
	sOwt2bpWDpci89KwTEOwOT8qa8br/Drs1COClExs2sH+BhDLkFysGa05g1V4bbl4wsjkh3dEwRH
	a0B5i1+R1KVP5JJ4dVQHgn3BcAHyJ14F7heU0DMOxMtUDOTA8+EUjCVRDQERrG9lmkvS/IlKx3C
	4sPXtioa6nkL+L/e+E0KbTsblKV809ANjqwQBYRrzOq4v4yrH8DWINdtyv8SEP3MRWss7kUViZ1
	7h+IhiCtB0O+AYAk3vr6+AcUt1cy66cZ/YWb1ZCZrTcAItKDHU64LRuMhUxIZ2fCWDOo80qK7Na
	sfZ/T2qRPTnD9YL8xQ29tXxt2rfRye3HPy1/Ne59l+MEridTh6V5StEAji9mKwPfBMAiV5
X-Received: by 2002:a05:6402:504c:b0:67b:7d11:758e with SMTP id 4fb4d7f45d1cf-683bc5b72c1mr7689364a12.11.1779180958503;
        Tue, 19 May 2026 01:55:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58c79sm6291724a12.12.2026.05.19.01.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 10:55:57 +0200
Message-Id: <DIMJ0GE2UNHS.VVZVQKVBXBLX@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink
 label
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	TAGGED_FROM(0.00)[bounces-108419-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[1.7.250.32:email,0.45.198.192:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,fairphone.com:mid,fairphone.com:dkim,1.201.195.128:email,0.103.194.128:email]
X-Rspamd-Queue-Id: 948CC57AA97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 9, 2026 at 8:13 PM CEST, Mukesh Ojha wrote:
> The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> users in the upstream tree across all affected SoCs. The only user
> of this label is qcs6490-audioreach.dtsi which references the label
> defined in its own SoC dtsi and is left untouched.
>
> Remove the label from kaanapali, kodiak, lemans, monaco,

nit: Not from kodiak, as you wrote above.

Regards
Luca

> sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Not sure, if these should be individual patches..
>
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/monaco.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi   | 2 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7cc326aa1a1a..39aad33f42c5 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2634,7 +2634,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_MPROC_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index fe6e76351823..c5976e19fc4a 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -7483,7 +7483,7 @@ remoteproc_adsp: remoteproc@30000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 7b1d57460f1e..e44a42173d2d 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2795,7 +2795,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts=
/qcom/sar2130p.dtsi
> index d65ad0df6865..3c9529bb2f76 100644
> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> @@ -1612,7 +1612,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> index f45deb188c6c..6d36d377e05e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -3755,7 +3755,7 @@ remoteproc_adsp: remoteproc@17300000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts =3D <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
>  				label =3D "lpass";
>  				qcom,remote-pid =3D <2>;
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 761f229e8f47..416991bf9cba 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2956,7 +2956,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index 03bf30b53f28..ffc4ab021ad7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2798,7 +2798,7 @@ remoteproc_adsp: remoteproc@3000000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 912525e9bca6..e5dc3dc19f04 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2797,7 +2797,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 1604bc8cff37..a4b71fd3ca14 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4486,7 +4486,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index 18fb52c14acd..63fcc6c749a5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2217,7 +2217,7 @@ remoteproc_adsp: remoteproc@6800000 {
> =20
>  			status =3D "disabled";
> =20
> -			remoteproc_adsp_glink: glink-edge {
> +			glink-edge {
>  				interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;


