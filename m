Return-Path: <linux-arm-msm+bounces-98212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP+YL0hquWmZDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:50:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F392AC5B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF723303CB07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B023E8680;
	Tue, 17 Mar 2026 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LXjn5oH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C43E8C52
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759014; cv=none; b=h1B8Qfq75OvuTB6/gmbyuk3JufcfSYIvtzIHgGTnZ7s6qxWGhoDRto1zEmoZzu2gk1euXQy8KQvq0HT9QRu076eXqdzGVjhy1RG95OrE5de93O5hRP1rs6+6WrtQoHeRjo65vNLf+VPS3UWBbyOyvlLbPdZmwmXaWwFYnlt2eQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759014; c=relaxed/simple;
	bh=fv4N5ZnqgMnUNaISGXM3ZCoWJDtQS/dualFJmaFPuuU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Jo0vFyVND4TZvFeKM3P9et+JpBWGvaG2S3xy9Nk6SMnItlG60QwAMDQHHz1pvgeGYlAMeePoHmc/iiZAcYOcCwyzYPVi4TVKMDf1EfY/D45MJNzAi9GGtCxhO00Dp5wiM4yQgiGwJE+v4f1ghnpAJQ3RA/lE89psOztNZXjrujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LXjn5oH/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so782345666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773759010; x=1774363810; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvLCj8O+Yxg0F9nK1kMfsPFMXTAA+Wcc2r9kgyX0HS0=;
        b=LXjn5oH/q83u9zvRBc19fJGNHgLfDuB1gfVfsnHkpximCYbF1NbbDCzk0ZVXQIury+
         bXXBp/otTNZPqUeiV1dRUZRTXgzDVZslpN8D35lNOdBSW5SR5zOhqSgrllobjDlzIbxQ
         Tgjm8Wf9Csc/DGlu731InOVjVbCZTH6tB3ntrzj3qGI6XWYYI63AoRH/BtnCeAscGE4u
         fbJdAAHgaqoFFmZnfiLSUWO0sgTHOZpXHq7SJSqC5GCEhOgnBTvSNMKhPkLtylvSZewE
         gabmMp++47HegPHBsAvBEXOLX95eh3SGA50dmeBZUi42QhK1Q1DgDvUy12PdVKIz9ke8
         0bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759010; x=1774363810;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvLCj8O+Yxg0F9nK1kMfsPFMXTAA+Wcc2r9kgyX0HS0=;
        b=rV86g8O522b3ZC4jkbEJq2vmczl+F0HwqrhE108Bx8NE/ycwCXQaf02V3EF6qHnSQt
         8gqr+2+Y+k5siFIzICCmRUogJQT5/XdSAu2qdkhrlz5CHcT052vTNptczpRieb7j0e+9
         H+qxhBWNEPPhIvNNh1PY5To/TjDAFAoSMiKb68ZeagxGzCKAevaFD8+kzqVs260wZAuB
         TmMtMOO7EVj1en6MW6qyhVHJLSxgfL/Qy+nRtHih6kQ1fNuOSrZavQ6oKNjsxQwLKm6I
         kVrRU57sknVnsPi2zV2i1lYZ9b49MpnYse3HbgOfYs0+gCHbFJC2SOPCpcSoJwU6YbGu
         2CZw==
X-Gm-Message-State: AOJu0YyyfN/c7B6YEM6ti9Z1OL5zhc2DDFHgQnVQDPEl1lgMN+O9y6Bs
	cKBCgly2tFJ9h4DBDFF4qFTY8o0daMxIfBQma27OLUVRpX88QOM2PsdRhzKyYAT4Yts=
X-Gm-Gg: ATEYQzxr+l1pf2r6TDodSgIbGKb9iC+w1KaXlFBXNpxTS/42uEycJm2J5f3J2TyBt4H
	kss65jWzsOioBDVymL2EyTyR6jsHQ8IkhyYEI5jjPNXMNbLxuIcPWDCDBTSl0cNds0+2bm9Xdk2
	bpjAhDW3ZDn7GRMLI64Df3wDzaM5VHJNTIHMfeT1P4VhFVoXoauiTdUbDwJ5JRHGekIM7jU9cy8
	eeHFfl71D1nQcO1FBQQ7oT761Yd3tYwkMoD45Ee5/0TnVTqY2bhDi6PgHKwhhvlTqzCYcpJyWUK
	wPXjLtkCf4Z1yWyjRZWejgsj6EItyeFT1Bo3W4AOxRMpCXioPhitoSjaljQj4zJJCW6ABd+voFR
	+4aCyoWltgs/ISqP4Nw9P3Ip8wI0NWvE1VjKblw9Hn+69YcQXu7ateGaPlECGkXV0cEudu614by
	zKUCFZim1s6mR46XlkC7l5OfVKzypdguBZp9dklG7EQa/cI/FYCox/7F1d6zuVHBbTmCAL
X-Received: by 2002:a17:906:7953:b0:b97:73ae:e1f with SMTP id a640c23a62f3a-b9773ae1114mr1036316166b.34.1773759009888;
        Tue, 17 Mar 2026 07:50:09 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667ac611b88sm59632a12.0.2026.03.17.07.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 15:50:07 +0100
Message-Id: <DH553B1YAFG5.1UT90QXHUSGM1@fairphone.com>
To: "Konrad Dybcio" <konradybcio@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Tengfei Fan" <tengfei.fan@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Jingyi Wang"
 <jingyi.wang@oss.qualcomm.com>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Vinod Koul" <vkoul@kernel.org>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Sai Prakash Ranjan" <quic_saipraka@quicinc.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Abel Vesa" <abelvesa@kernel.org>, "Raviteja
 Laggyshetty" <quic_rlaggysh@quicinc.com>, "Melody Olvera"
 <quic_molvera@quicinc.com>, "Taniya Das" <quic_tdas@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Jishnu Prakash"
 <quic_jprakash@quicinc.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: milos: Fix GIC_ITS range length
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com> <20260317-topic-its_range_fixup-v1-2-49be8076adb1@oss.qualcomm.com>
In-Reply-To: <20260317-topic-its_range_fixup-v1-2-49be8076adb1@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98212-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,1.5.137.32:email]
X-Rspamd-Queue-Id: 63F392AC5B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 17, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Currently, the GITS_SGIR register is cut off. Fix it up.
>
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qc=
om/milos.dtsi
> index e1a51d43943f..084be5316e0d 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1911,7 +1911,7 @@ ppi_cluster1: interrupt-partition-1 {
> =20
>  			gic_its: msi-controller@17140000 {
>  				compatible =3D "arm,gic-v3-its";
> -				reg =3D <0x0 0x17140000 0x0 0x20000>;
> +				reg =3D <0x0 0x17140000 0x0 0x40000>;

The .FLAT doesn't make it super obvious what the size should be, but
yes, GITS0_SGIR would be outside the range with 0x20000, and 0x40000
looks sane given at 0x1718_0000 the next register after GITS0_SGIR is
located.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>


> =20
>  				msi-controller;
>  				#msi-cells =3D <1>;


