Return-Path: <linux-arm-msm+bounces-105614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mClqFQO692l1lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:11:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F834B76C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B1473005583
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94B93A6EF8;
	Sun,  3 May 2026 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="VC/n+2KU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A63A63F7;
	Sun,  3 May 2026 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777842686; cv=none; b=n+7D4kKRHr3EsCjxK+9M44A+JGWIjnIMgiV4UvNoFkLpxfK6m0HNsxAIdhAsX+jigb4CrpkQZ9Li40nQvtrggVYC0GNmoy8qOmq8VobTu2S+7qHMs11hd6ujv5Sk5s5zZJ1yFkJrW2gGlnbg7kO7eMofkE5FR9uyPGHujmfHDKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777842686; c=relaxed/simple;
	bh=4IY6zgCE3t6xCxKy1+7cS+LAlfFK2OEbPo6snkCIKPE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qv5S4alhVmm9IWnzHLuFWDGoDaj7Zhd+62pTJS3Xo5vqku+HUnE1bv+NKGj7gSNnnQstxOFQu9u2ksbNVhQMqASZulxE9dhtv+tlASGOlT7y5amD6rV8uHEzE4MJg3HBjJ6JnX7JTZhjhghZj76cDj5MUxgdYDlSAIkOtPJF2Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=VC/n+2KU; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1777842674; x=1778101874;
	bh=Mze8pJ2Bv3rPQ71TmtY8/Gn2r4+/ykkYhDlYmX5zZSg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VC/n+2KU2ttk3svh9BYuOP1zgLWk73DcXL1aoKA5zoHj+MwFD8RluqgH4rXKgtTir
	 KivuJLThb8r/nLxuE6IoiUhENRTmsS3WePxAbw+TShxRhr8X9zSFKMKbqEisJRI0hm
	 kqdb68aKkSJmXcVBWVNRMvKg/JdCH3yE8/IpaKuVDsHYEMduSS09Otx9zg23J6osOl
	 l51AqfNOYGFPy1qs82ppH39IqXpkyWmOjQlXoojevMDcKYsiVzHMxUpXKq5DVw1Usu
	 h6PoJmn+YIi+nMgJ5SYjPfOXPq1Wmbt3HdXenPKtr0FTQYGII91xpgXSrKbbF8yiLc
	 J5e2XGbGyVD6w==
Date: Sun, 03 May 2026 21:11:08 +0000
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for pmk8550
Message-ID: <41zGfbkQbjrQfSqKbnaZNz8B-Vm_xJV8SsscGw_vLVygnw87MkVHK-bjR2TA1oKrLO9zk6DRTaGCrQj8duw3bCBpDK-FX6400Mhh1-sOd1o=@vinarskis.com>
In-Reply-To: <c7cd7cf8-6f2b-4db8-a51a-04e7aad07863@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com> <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com> <c7cd7cf8-6f2b-4db8-a51a-04e7aad07863@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 9a62b55032b81d364ff60b0d1031a224e850489f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E6F834B76C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105614-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.35.40:email,0.0.23.212:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.44:email]


On Friday, April 17th, 2026 at 07:27, Jishnu Prakash <jishnu.prakash@oss.qu=
alcomm.com> wrote:

> On 4/4/2026 6:25 PM, Aleksandrs Vinarskis wrote:
> > Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> > Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 26 +++++++++++++++++++++++=
+++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boo=
t/dts/qcom/hamoa-pmics.dtsi
> > index 6a31a0adf8be472badea502a916cdbc9477e9f2b..cc69d299bc356d90aa1483f=
347f5eee43b853e45 100644
> > --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> > @@ -218,6 +218,32 @@ pon_resin: resin {
> >  =09=09=09};
> >  =09=09};
> >
> > +=09=09pmk8550_vadc: adc@9000 {
> > +=09=09=09compatible =3D "qcom,spmi-adc5-gen3";
> > +=09=09=09reg =3D <0x9000>, <0x9100>;
> > +=09=09=09#address-cells =3D <1>;
> > +=09=09=09#size-cells =3D <0>;
> > +=09=09=09interrupts =3D <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> > +=09=09=09=09     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> > +=09=09=09#io-channel-cells =3D <1>;
> > +=09=09=09#thermal-sensor-cells =3D <1>;
> > +
> > +=09=09=09channel@3 {
> > +=09=09=09=09reg =3D <0x3>;
> > +=09=09=09=09label =3D "pmk8550_die_temp";
> > +=09=09=09=09qcom,pre-scaling =3D <1 1>;
> > +=09=09=09};
> > +
> > +=09=09=09channel@44 {
> > +=09=09=09=09reg =3D <0x44>;
> > +=09=09=09=09label =3D "pmk8550_xo_therm";
> > +=09=09=09=09qcom,pre-scaling =3D <1 1>;
> > +=09=09=09=09qcom,ratiometric;
> > +=09=09=09=09qcom,hw-settle-time =3D <200>;
> > +=09=09=09=09qcom,adc-tm;
>
> There's a small problem here - if you add the "qcom,adc-tm" property
> under any channels, the auxiliary TM driver will be loaded to handle
> this functionality and it will attempt to register such channels as
> thermal devices. Since there is no thermal-zone node added for this
> channel, you will get an error from here.
>
> If you intend this channel to be used for ADC_TM functionality, a
> thermal zone node for this channel has to be added. If this functionality
> is not needed, it's better to remove the "qcom,adc-tm" property.

Thanks for catching this, I did not realize it. It would be nice to add
thermal zone node in the future, currently I am missing required
information to do that. For now I will drop "qcom,adc-tm" property as
you suggested.

Alex

>
> Thanks,
> Jishnu
>
> > +=09=09=09};
> > +=09=09};
> > +
> >  =09=09pmk8550_rtc: rtc@6100 {
> >  =09=09=09compatible =3D "qcom,pmk8350-rtc";
> >  =09=09=09reg =3D <0x6100>, <0x6200>;
> >
>
>

