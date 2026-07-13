Return-Path: <linux-arm-msm+bounces-118817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1HzpH1MBVWoKiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:16:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D67F74CE71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:16:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=fkLvVqPz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118817-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118817-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 603DE30A110B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA6C36402E;
	Mon, 13 Jul 2026 14:57:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB5353A7D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954664; cv=none; b=GKZOeNRrAoqZfuekR0nN6Ft1Zr8IpFXWgw/hYBl1ETgfBClqJ6Bj4dDjBqhIJuFaVwWY1yh/flqEcBsO2tkkT+bsdXBBo1RvzQfnFsQR0zwDHBILazDF94lE0G+vS4Ygr3VYcCyalec4uNdiX32/+49mWS3l4Rm868oxbylIIng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954664; c=relaxed/simple;
	bh=DIEO8qGvaGNdVs/URq2zTv0E4757w09J3TT0ZkueV+0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lS44Jd+t6668+ziKXZBqKCOjHqijZcdg6jTg2Ol/bRWm5/3dfNhBztxDYMV2XrrRPVgxJiGv9qF3i5fZyi9mi9U68LACXWevee6F8AycLHaAmhpzCkjtMNKqvjJNU3sgBudtTY9VY/QwSAN2DSowM8jD1xREHWP10nuaOv3lajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fkLvVqPz; arc=none smtp.client-ip=209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15f020a223so426845566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783954661; x=1784559461; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=;
        b=fkLvVqPzaA1lVelq3oB8V77v8AaS+sqe7yU/PAbhQ5O8U2+L1AhMdp9+r4yXxl5RTl
         7K9n4vI7PR//w5GAAKUwCw3As6XxiMi3vUoigQUs9HC7EixZRixuPjjISUfBdBpYDWeM
         jCmtUqfVaUnpyHBcA2DkLTuR3C/yPWnwbErWAfZXWzoGttLNSnDPcKMqKc8t+ekgMOhD
         13Hf1y2umXn6e3KHsyMsLapeHWQGY1+OpvVgIt1YycYECpYpNZEcy/ZKWsK98caSKknx
         MRo86KxG4PhR94toXJpqNNAxUilee6eOALsr2pnbXNCC9+3bFdTg/ahQn6HihH7OIwfT
         I4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954661; x=1784559461;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=;
        b=ZCQYxe5gmuhGtdpebJgv6ryQ/tSRNSHTQ7tBbCDABQInL9Yp4OPXzgo6ix0KLkhFpL
         1x7ZyRbz1zkzFiF4EqZPHY883qf5Gh38iHzoo+/Fe7wrysDEO2TeKOFWGx0hwrRQ08tt
         2bAn37j7usH8sFY7AlbywQYwMOjQRrZEAsKBanrtoW2q6vTanNbdD/GQ0hu3yyaTM/ct
         mpt8ng+KqFo9MyVizKLDc3MgONn+mzRj1oV+LG3kFIqlSBsk4vN3SUylj3NlzEaM0tSz
         ZFICR7SJa7ckraNr4pND8C5HziUXBpW0s1e/t6A66XDUh1jJH9CKstBQ9+jvxrguif6d
         ZQMg==
X-Forwarded-Encrypted: i=1; AFNElJ88sUYYupfugUdkirw4MFREtJnZ0pmXjkyeFmpXWIL7IbQVwSxZFRq4r2/DwS3gsQkT7SofNaFbyHzqMLqk@vger.kernel.org
X-Gm-Message-State: AOJu0YwII3NLZ9vb8hm/fWV0ZVpNFou2NTY1tiErZwy0TyHMjHJYJO/+
	Mh4gvtDJMekJhoSoLjRdU1/XjM82x0yUCu6jz70bSGWhI3vkZDTpGn3DkE40a1Iw23jUvAn8vH8
	8YH+e
X-Gm-Gg: AfdE7ckHPdg588o1IBSF2URFDeVahuRcK+bAKRMeUroCZG/QHwh3X0GGDwAHLLQW6UV
	KhFSVagGMBUEYNyHSi04hUEgDeiMbtnST/+IXS7V/dgbxTBSbZflwMwW7EnGCXDPGz9RSa5/v5+
	BBsFy5Xzer0EGHGJwN+A8jhdvPqJ1j/rLS1r9p0C30irZR2FUFEosmM4z2IvJ6AywYPxAnSLpAf
	o87VHzeqKYhWbOZ2PTIhuC9jY1rjdH+y29PhQOyL+w8Ovd4gEPyV0Hja9ZhNl5scrIqAwHJz/7W
	+thkMDsVLpA73x80Dc1dUCJs39wYXs/c4cikurNkPYRvAXni5n8QZxCsLDBBsT4KvIEivf1ssA2
	ucDjg21odl4YHYhlVLp0J9SrfhUpGV8/OD4rhzLU7oqWmniGOQGCbbAb6sxORWNbmQxxGc3ovIE
	Z8G+KqagfyymiQAC6ZYTnHxoZBk8V/egviouQQTwCDMiLRsGzzt3Hk/wzOMA==
X-Received: by 2002:a17:907:1b1d:b0:c15:db89:f0a0 with SMTP id a640c23a62f3a-c161f3935d3mr373847566b.50.1783954661073;
        Mon, 13 Jul 2026 07:57:41 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821666sm1005757166b.4.2026.07.13.07.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 16:57:40 +0200
Message-Id: <DJXJ5D2PSY3J.1Y5XS6SXYFRBH@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118817-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,fairphone.com:from_mime,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D67F74CE71

Hi Taniya,

On Mon Jul 13, 2026 at 4:53 PM CEST, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
>
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qc=
om/milos.dtsi
> index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade640=
18623e49623462c 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
>  				 <&sleep_clk>,
>  				 <&gcc GCC_VIDEO_AHB_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>,
> +				<&rpmhpd RPMHPD_MX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +				<&rpmhpd_opp_low_svs>;
> +
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;
> @@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
>  				 <&sleep_clk>,
>  				 <&gcc GCC_CAMERA_AHB_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>,
> +				<&rpmhpd RPMHPD_MX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +				<&rpmhpd_opp_low_svs>;

At least looking at downstream drivers (camcc-volcano.c and
videocc-volcano.c), both have

  static DEFINE_VDD_REGULATORS(vdd_cx, VDD_HIGH + 1, 1, vdd_corner);
  static DEFINE_VDD_REGULATORS(vdd_mx, VDD_HIGH + 1, 1, vdd_corner);

so from what I can tell based on that, your change seems correct.

I'm sure you have better documentation than that at hand though!

Regards
Luca

