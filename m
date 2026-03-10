Return-Path: <linux-arm-msm+bounces-96735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFOLJm5KsGnFhgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:44:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42637255044
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABCAB300D0D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FC43A7592;
	Tue, 10 Mar 2026 16:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="nPy/6VW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C62C11F3;
	Tue, 10 Mar 2026 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160973; cv=none; b=d27sZyGeB/QMsxrPX/xVb80f3sbP8Q6qDaVq6ubDe7GdLCwv3YIu8w0msXhHMWXPe49Z4ZAAtUTbAPuH5tJ3JMlQSGVVrk3bwd6dpeVcrkOqU1hHOtZHgWWZu0oolwYFSHUxxLYXhioyhVxEgd2zXNCQJdliPjKnkKJnpiF6PO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160973; c=relaxed/simple;
	bh=DCJMHMqqQsaf1XMw/XCKtt1LtViAntE3IHj5UuYzADM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g98czw/hyS4vc5yfwbRYftqeHyQ259qnO1mqudKP4cxv+2TlALnrRiUE1UTGAAx46mmTTyCsjn+GH7CcmsgUEHMNfBr36o9J/4N7ABBfj1w8P4iHvWtnSe9Wp+wEQR3pwfkjFgy5h2kndvP15LJfqqE4AVoPuHa0jryyVSyis6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=nPy/6VW7; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773160968; x=1773420168;
	bh=jp7taCdw1nI5Sr69i3QhuX5EoaMKfMTuSOuoBJnv8mE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nPy/6VW7DoGT4FD2fgZU9f0LFiRS9tEMYateMAXg0GMcQQnpN6hEk6+6NHdTnaDRP
	 vg+OuFysUucg6a+Fy7KjTjV2kHTgWCbWSeNiEYikXRNTYmp5n6Yy0SqIOKQs6FtZSN
	 Al1tHlVBrh/hI4tKJOKO8cJnpPhJ2DMbMWl85RoJRJtEieTH5pU9xh+Pp+IG87gKsj
	 fnXDpduZ95tNSebnm3lTOwzNnAn5ZN9T37ZlBZnTDmY7ScZnJBjYaGj1ycvHzVhBBT
	 8zTv+/3uLt1W8bi4W3RBNTAlGydA4f15G3X8JMacuBTdXEoHeGPWJh6x9Yfzxdwnom
	 mK0QBK4nelWtQ==
Date: Tue, 10 Mar 2026 16:42:43 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com>
In-Reply-To: <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com> <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k> <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 282e252ccd8632b559874c16cfd9f9f7e1eb4b83
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 42637255044
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
	TAGGED_FROM(0.00)[bounces-96735-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Action: no action

On Tuesday, March 10th, 2026 at 12:28, Konrad Dybcio <konrad.dybcio@oss.qua=
lcomm.com> wrote:

> On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> > On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Rel=
ay wrote:
> >> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >>
> >> Add the description for the display panel found on this phone.
> >> And with this done we can also enable the GPU and set the zap shader
> >> firmware path.
> >>
> >> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> >> ---
> >>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 +++++++++++++=
+++++++++
> >>  1 file changed, 80 insertions(+)
> >>
> >> +
> >> +&mdss_dsi0 {
> >> +=09vdda-supply =3D <&pm8953_s3>;
> >> +=09vddio-supply =3D <&pm8953_l6>;
> >> +
> >> +=09pinctrl-0 =3D <&mdss_default>;
> >> +=09pinctrl-1 =3D <&mdss_sleep>;
> >> +=09pinctrl-names =3D "default", "sleep";
> >
> > It might be better to move pinctrl nodes to the panel device, because
> > they control the panel reset pin (rather than some kind if DSI-related
> > pin).
>=20
> +1, perhaps let's rename that pin to panel_reset while at it

So, something like (plus related renaming in tlmm node):

=09panel: panel@0 {
=09=09compatible =3D "novatek,nt35532";
=09=09reg =3D <0>;

=09=09backlight =3D <&pmi8950_wled>;
=09=09reset-gpios =3D <&tlmm 61 GPIO_ACTIVE_LOW>;
=09=09vsp-supply =3D <&lab>;
=09=09vsn-supply =3D <&ibb>;

=09=09pinctrl-0 =3D <&panel_default>;
=09=09pinctrl-1 =3D <&panel_reset>;
=09=09pinctrl-names =3D "default", "reset";

=09=09port {
=09=09=09panel_in: endpoint {
=09=09=09=09remote-endpoint =3D <&mdss_dsi0_out>;
=09=09=09};
=09=09};
=09};
=20
this?

> Konrad
>=20

Regards

