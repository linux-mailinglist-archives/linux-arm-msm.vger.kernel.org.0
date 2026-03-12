Return-Path: <linux-arm-msm+bounces-97159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOuWIiBysmmuMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:58:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E70C26E877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C21C300380D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6441F3B7766;
	Thu, 12 Mar 2026 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IphPqAi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CE3B7771;
	Thu, 12 Mar 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302299; cv=none; b=W3AO9Ib3bqQeJ/M+kPm6E25guEPCM0VTBNnbSa711LdrKLxEy5XEfSy/X++Ygq5MYBuTUZ1AraKBD/20aWhdPQ83tvhVJnbIDB2HwXkx8SCu1f9uW8tIPqq763ix4r0ddj89W1DTrkMs27/LfDjVCiiIVk1fqoUp6HYSr/JamhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302299; c=relaxed/simple;
	bh=491ncjziD5diK7qZMyd3XE7NLPLH14xdPjd/dh21Jek=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WdFfQMEwwPJya77gB0x7UD8lrdUHgDtPRRRh15MZwn1fv2J4Pi5ehdEUXKKCGgzEZhgQfYFhVJC92McPxWZn4fL6o5aS3u2GvmXXg/kk4OnX4iQTYvU8hS3hBBgMF+L7KbGuJVu0Hhcz/r6sbmht68D6xxbdkvBjSWMTD6jZh9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=IphPqAi1; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773302289; x=1773561489;
	bh=OA/G2wWdlXzbBQo1bZvmaqv8EVQbrJ106sAu8h8qkkQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IphPqAi1ld/Exhs7oyK4gtIkMoVIFZ9PZeGqxDvcEUx63g2mgPoyn4Lt+0px7sTxq
	 Uum/OT1pXx1sbKYwKLuJOPoR++Q/sZ5OIANPjYWA0bWF7eQaSdhR8FS0d9tgHF9MMb
	 NZy3nUflOu8FLDpWw487gCtZvIUgswc3FreZAWzTYopk6NvBc4bRxbwqQrViCIfsAu
	 C9Mz4FzvbFbMNkmDuws4PXJk5O01IRDWrRNFnxksvcY8LgdXWR+OscvqJmskyU0Iv9
	 YdPRyonLsKh7tIADxag29efRq8GOQD0Eq/HsA8r1LOBdLwWd4tQWksyp9bEIVeSTop
	 ItsAzvFQugx1A==
Date: Thu, 12 Mar 2026 07:58:04 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <TVEaCiufQE0XjfNRlD6DUS6UjDw6nPyHh6ENYRSpFQT0ZD_o5sBH_Albc17WmU0B06PyfSq7elJ0c9C68kjDSgzBHcwYaOPl79XnKBPIU8M=@protonmail.com>
In-Reply-To: <e6m5xhnexza6fnmz6cczwsrp3ec6n643yjukj64gvync627sl3@2pldnf7ldcpi>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com> <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k> <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com> <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com> <e6m5xhnexza6fnmz6cczwsrp3ec6n643yjukj64gvync627sl3@2pldnf7ldcpi>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: fa75426f96d157ea5eec068a36d4617ab6ed608e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97159-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Queue-Id: 8E70C26E877
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tuesday, March 10th, 2026 at 23:30, Dmitry Baryshkov <dmitry.baryshkov@o=
ss.qualcomm.com> wrote:

> On Tue, Mar 10, 2026 at 04:42:43PM +0000, cristian_ci wrote:
> > On Tuesday, March 10th, 2026 at 12:28, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:
> >
> > > On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> > > > On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4=
 Relay wrote:
> > > >> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > >>
> > > >> Add the description for the display panel found on this phone.
> > > >> And with this done we can also enable the GPU and set the zap shad=
er
> > > >> firmware path.
> > > >>
> > > >> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > >> ---
> > > >>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 +++++++++=
+++++++++++++
> > > >>  1 file changed, 80 insertions(+)
> > > >>
> > > >> +
> > > >> +&mdss_dsi0 {
> > > >> +=09vdda-supply =3D <&pm8953_s3>;
> > > >> +=09vddio-supply =3D <&pm8953_l6>;
> > > >> +
> > > >> +=09pinctrl-0 =3D <&mdss_default>;
> > > >> +=09pinctrl-1 =3D <&mdss_sleep>;
> > > >> +=09pinctrl-names =3D "default", "sleep";
> > > >
> > > > It might be better to move pinctrl nodes to the panel device, becau=
se
> > > > they control the panel reset pin (rather than some kind if DSI-rela=
ted
> > > > pin).
> > >
> > > +1, perhaps let's rename that pin to panel_reset while at it
> >
> > So, something like (plus related renaming in tlmm node):
> >
> > =09panel: panel@0 {
> > =09=09compatible =3D "novatek,nt35532";
> > =09=09reg =3D <0>;
> >
> > =09=09backlight =3D <&pmi8950_wled>;
> > =09=09reset-gpios =3D <&tlmm 61 GPIO_ACTIVE_LOW>;
> > =09=09vsp-supply =3D <&lab>;
> > =09=09vsn-supply =3D <&ibb>;
> >
> > =09=09pinctrl-0 =3D <&panel_default>;
> > =09=09pinctrl-1 =3D <&panel_reset>;
> > =09=09pinctrl-names =3D "default", "reset";
>=20
> No, "reset" would not be recognized. Use "sleep" as before.

so, something like:

 =09=09pinctrl-1 =3D <&panel_sleep>;
 =09=09pinctrl-names =3D "default", "sleep";

?

Also, should I remove 'sleep' state if panel handles only one state ('defau=
lt')
instead of two states (like mdss)?

> >
> > =09=09port {
> > =09=09=09panel_in: endpoint {
> > =09=09=09=09remote-endpoint =3D <&mdss_dsi0_out>;
> > =09=09=09};
> > =09=09};
> > =09};
> >
> > this?
> >
> > > Konrad
> > >
> >
> > Regards
>=20
> --
> With best wishes
> Dmitry
> 

