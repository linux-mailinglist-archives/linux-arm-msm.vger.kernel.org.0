Return-Path: <linux-arm-msm+bounces-96734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKIOEulEsGmshgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:20:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55A2549E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ACB7300BB81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7D53C13ED;
	Tue, 10 Mar 2026 16:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="USAjZal/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32012D8DCA;
	Tue, 10 Mar 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773159649; cv=none; b=pM2tiNfP0CyLYaULnv3UkO8TSf0bV697CC/zzhyu0sy8vwOQIvYCy8AUKi/qm3Mg3y2VdLEKY2/DkxPuBsgp/Ji0LElNOVGeGbyxZqFN/OhpfGR6QVzAJ+1DoP565yqtqE1PSV6zj0J5GixHycpjLIEaT4VKJYV20R02pYrUv/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773159649; c=relaxed/simple;
	bh=/kwTVlD5wO3RCWS4OFNL5bpmNc30DwJBQHbTccteqzk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ViZJ0FWheeIkN6wk7Q3CXh/AawNbHyC9VM+u42TnxXEMXRGDtgfc1RVj4ymstWfRGGb5Tv46VF18EBqAyTl9pfn5UEu2aa43Gj1sr8EKNnAxOzrp12IT4sLFiRpbjxcJpfkB+oTziLKYgO3aieQi6mCWCbvyXCzkEqTSFjpM9GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=USAjZal/; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773159644; x=1773418844;
	bh=e4HSNccmKB3Yosyw7jREa+wZR4UoY+r/POtySV43otA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=USAjZal/c8ilL9UQOS7CG0sYrHwTi9FBeut5a/NsYoZG0lwdGGYaS4NDxc8simfKI
	 G1DQayq9yQLE51Y9D5hVV6Hs+Y8QZTfDg0tGpJJYkTOf4OJ/u/Y3gPK63PeFd+2FQH
	 tJdGLkyguEfaABALivsD4vE4nYRDGFa8ug1jBmCEP0jLPo/2a/APRcqNH7LibVFE8K
	 j6pH77iN9foF86SfmQISUxLOxwyRxjV1P/Idx5+FxEnd3dCHF0FF8Ap+AvpjftXAi+
	 YDze5RPLK9BOBWvBInLZkd1WfuH7vSbLxu7Rs0jAHkTTqasU+4orNaTLLIxyvynoOA
	 IURn+Uim/Ohcw==
Date: Tue, 10 Mar 2026 16:20:38 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
Message-ID: <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com>
In-Reply-To: <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com> <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 774cb5722f82a2c4e94f4ddb240ac2f7a274f305
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DF55A2549E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96734-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:dkim,protonmail.com:email,protonmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action





Cristian

Sent with Proton Mail secure email.

On Tuesday, March 10th, 2026 at 14:08, Konrad Dybcio <konrad.dybcio@oss.qua=
lcomm.com> wrote:

> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> > Add it to the device tree.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++=
++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch=
/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > index 7b2849405462..709ea6fc9fbb 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > @@ -94,6 +94,31 @@ &hsusb_phy {
> >  =09status =3D "okay";
> >  };
> >
> > +&i2c_3 {
> > +=09status =3D "okay";
> > +
> > +=09touchscreen@5d {
> > +=09=09compatible =3D "goodix,gt5688";
> > +=09=09reg =3D <0x5d>;
> > +
> > +=09=09interrupts-extended =3D <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>=20
> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
> even consume the former. Trying to read through some of that, I think
> it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
> (which nota bene doesn't match between the comment in that driver and thi=
s
> submission - perhaps that's just a SKU difference) during the reset
> sequence
>=20
> i.e., does the touch work any different if you drop the above?

Apparently, not. That works as expected.

> does /proc/interrupts differ?

When interrupts-extended is defined:

...
 50:        318          0          0          0          0          0     =
     0          0  msmgpio  65 Edge      gt5688
...
 54:       3141          0          0          0          0          0     =
     0          0 GIC-0  65 Level     gpu-irq
...

Instead, when interrupts-extended is removed/commented out, I see just:

...
 53:       2404          0          0          0          0          0     =
     0          0 GIC-0  65 Level     gpu-irq
...

> Konrad
>=20

Regards

