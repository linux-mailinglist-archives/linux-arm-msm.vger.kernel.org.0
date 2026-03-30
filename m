Return-Path: <linux-arm-msm+bounces-100728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIRyKp5IymkQ7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1216D358A7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B8A3309D3D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A711E3822BA;
	Mon, 30 Mar 2026 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="WC5PUIR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C0382394;
	Mon, 30 Mar 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864094; cv=none; b=VCZIaKcnBg/b1kvYwRTXfGmtB0GZeQdc18ygC4/O8ARsLJ+RHLOjuCtJ6jo2Zz9+unCoGGkg89WoYH6E829/Fw+B79bFy2TC4XnAmxs4+fyPBls/aGrZ6jvzR9zCcLC+de4qsO/rR2OqAEnicdYkpqyaR1gm6p/6lU/d93pntfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864094; c=relaxed/simple;
	bh=1abaB16vTryQyZ4IQqf1mS0sV++tdgdjSh78e9kgecc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXxqqsCXclAr6xhBamzKPvQeuIYPChkKFwcuywCWIWaK59d0Jhb2APlzU44scVdbteKVRCTzbkVTuJQPlydDdqZu4RFUn2wbOm+5pbIy+Hh5WCploYjAL0ud9zQQ3MjFlMllNuZovyIXiYwQEuwh+b2Yg3Zm4OzU4ufeN9DWdfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=WC5PUIR5; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1774864082; x=1775123282;
	bh=gzxU0N3gWu1fL7HeQpwNeBntcjEIP+Yb6numuEmyXEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WC5PUIR5YLCGmzm6tegpr7wjtK+RINZET3Npm85Ug+edKBThXjnhM87w5tFOayqxA
	 f46/+ZxZIn6F6n1hkYuHzHkzU0Xt1P73dqNTOGcSTS130BFFgYOblGN+CFZR6YPQnm
	 QYDM8NlgYHrq6weAa/pFJEcdUT9kHG7xmkgxV/BJ5mwrmbv4RP1ZgKLZmhbmvtQ2TA
	 ReskNpnMZpZwcSbnDfmU+sEZxYu7c89S7RD89faUPSleMCL90YrYrt4p4GzgJt2WMx
	 pYapMwIsOHTWbMSKK5+meqYqLxdf1XpKVu363o/A8OzQtYuJU64RenC8gz6fSJn4x3
	 Qccj4eIhAVfuA==
Date: Mon, 30 Mar 2026 09:47:59 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable onboard accelerometers
Message-ID: <k7FdikIAx-4wrznsIcDVuW7rISV6wrja4RxplvzsdmuhfLUllHI-Ge5MpdkpqoOq17qvY3_mpNxqOQ5parnIHVtb_DEA_31TqHih_QHhGMA=@vinarskis.com>
In-Reply-To: <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com> <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com> <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com> <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com> <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 7d8197a4466c05a492cbe59f937ef583135d5da6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vinarskis.com:dkim,vinarskis.com:mid]
X-Rspamd-Queue-Id: 1216D358A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Monday, March 23rd, 2026 at 18:05, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:

> On Mon, Mar 23, 2026 at 04:06:53PM +0100, Konrad Dybcio wrote:
> > On 3/2/26 2:25 PM, Aleksandrs Vinarskis wrote:
> > >
> > > On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:
> > >
> > >> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
> > >>> Particular laptop comes with two sets of sensors:
> > >>> 1. Motherboard: accelerometer
> > >>> 2. Display/Camera module: accelerometer, ambient ligth (and more)
> > >>>    sensor
> > >>>
> > >>> Define both i2c busses (bitbanged), sensors and respective rotation
> > >>> matrices.
> > >>
> > >> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
> > >> poking at the same bus as the DSP is, concurrently.
> > >
> > > Indeed, Val already pointed out that there is hexagonrpcd to access
> > > sensors behind Sensor Core from DSP. I found corresponding .json sens=
or
> > > files in Windows for all x3 sensors, but could not make it work yet.
> > >
> > > Without these additional things in userspace it does not cause any
> > > conflicts: I've been using this for a week now, no i2c communication
> > > issues and device orientation information is present.
> > >
> > > The question is then if we want to keep this series which ignores DSP
> > > capabilities with the advantage that it will work for everyone with
> > > the new kernel vs doing it 'correct' way over DSP which requires
> > > additional json (and binary blobs?) and userpsace configuration,
> > > meaning that most users will never have these sensors?
> >
> > I don't know what's the endgame for sensors. Maybe +Dmitry knows whethe=
r
> > there's any action on that point.
> >
> > Going through the DSP allows you to keep aggregating the data at close
> > to no power cost (""low power island""), notably without waking up the
> > CPUs if there's no other work. That, plus I'm somewhat skeptical about
> > going behind its back, since it may be that a firmware update or some
> > other trigger makes it start trying to communicate with them.
>=20
> The sensors story would require DSP libraries matching the firmware,
> sensors descriptions and several still-closed-source libraries to work.
> There is an open-source libssc project, but I don't know if anybody has
> tested it on this platform (and it will still require DSP libs to
> function).
>=20
> >
> > But I'm not 100% against this either
>=20
> I guess it is a necessary evil until we get libssc to work on it.

Thanks everyone for the input.

It sounds that long-term DSP is clearly a go-for solution, but at
the current state bit-banging is acceptable way to provide this
functionality. I will update my patch to reflect outcome of this
discussion in v2.

Regards,
Alex

>=20
> --
> With best wishes
> Dmitry
> 

