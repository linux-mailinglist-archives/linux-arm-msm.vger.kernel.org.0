Return-Path: <linux-arm-msm+bounces-97282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O9NFKsDs2l8RgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 19:19:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B127716A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 19:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34DEF303C5A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 18:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8189A3FF8B6;
	Thu, 12 Mar 2026 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nPcpJoWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDA53FF8A8;
	Thu, 12 Mar 2026 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773339558; cv=none; b=sI/SnOQgB9vbIEAqxgjkXrIrPUav+Xd92qgc3KoTrRf8Z6ngfR/Xwr7qmWHupX7TtgZ31ds8Ocdu5O4edvEfQuSsa9w3MHSfji2CX5+ZlDEBqlxlosMn8ta8gdVzjSHpz+tzEbg5FjkoT9yJ1ANXxFpJ+IAjGJf4AsJcmswM0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773339558; c=relaxed/simple;
	bh=Vf6TfeJugBF6s4LEUcpl4HPyMKM9i1vkihnXMw0NFjM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XzRzAzBG/Fl/ZTC5KIzhpgpe40GJsSNj6KPw1/utPesDpcF1a83io133UibLNIL+r3RCUS1ocYxL7/Cl7YBsKBVi3Tdm+fAsKM4+pJBAh3xi6+43gIUe2jn+YKAjsdOuDWQT7CIW8x5UY2h8966Y5JkzFMDZ+sbRye6G2KvohCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nPcpJoWH; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773339549; x=1773598749;
	bh=XPi7N6rAJfXojvM7KpS5aTU2qRvg2YrP9Z2KMTkPGos=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nPcpJoWHpUQzGQ0d6PgYXTc9dfde95ZEa67WQdQMvzQUr2Q31JxZaKRqOSXyw6mwP
	 Xe3MnSuUNiiXr5NyPdtZldLyw92XvTEKlxQ4940HKn0IN4Uws6qDtQDTGjodgRWwo4
	 GvD2QJpLX2Gugc3rjI8y7Dlsm0nCZFLNGxoWM6Qb6JtyNA9pHyCVf1WV7dTJ2lqBr3
	 NBnFSs1kachz7dNw54akQA7Hor1EXPm/VoPwxn8Vu/k28mRnsSx1DLnwMCa8zAMoZX
	 2S66xOsRxV0gHYZwRVD1N7VzqMohF62rjtzZc/H0maoOyb/YDBkCSr7zqtIcVP0qFg
	 9JLLCE8BJVLDg==
Date: Thu, 12 Mar 2026 18:18:59 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Junjie Cao <caojunjie650@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Antonino Maniscalco <antomani103@gmail.com>, Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>, Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
Message-ID: <abL8qtbnNzspJMGC@prism>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 09c56c36f25158d50c25def04b7467015a9e174d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97282-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linux.dev,poorly.run,somainline.org,marek.ca,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8C8B127716A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Oct 13, 2025 at 05:34:06PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 13, 2025 at 09:17:04PM +0800, Junjie Cao wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=
=E5=B9=B410=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=
=93=EF=BC=9A
> > > On Mon, Oct 13, 2025 at 07:04:43PM +0800, Junjie Cao wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=
=E5=B9=B410=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 17:39=E5=86=99=E9=81=
=93=EF=BC=9A
> > > > > On 13/10/2025 04:52, =E6=9B=B9=E4=BF=8A=E6=9D=B0 wrote:
> > > > > >  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com
> > > > > > <mailto:dmitry.baryshkov@oss.qualcomm.com>> =E4=BA=8E2025=
=E5=B9=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > >  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> > > > > >  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.or=
g>>
> > > > > >  >>
> > > > > >  >> Some panels support multiple slice to be sent in a single D=
SC
> > > > > > packet. And
> > > > > >  >> this feature is a must for specific panels, such as JDI LPM=
026M648C.
> > > > > > Add a
> > > > > >  >> dsc_slice_per_pkt member into struct mipi_dsi_device and su=
pport the
> > > > > >  >> feature in msm mdss driver.
> > > > > >  >>
> > > > > >  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca
> > > > > > <mailto:jonathan@marek.ca>>
> > > > > >  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca
> > > > > > <mailto:jonathan@marek.ca>>
> > > > > >  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@=
linaro.org>>
> > > > > >  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com
> > > > > > <mailto:caojunjie650@gmail.com>>
> > > > > >  >> ---
> > > > > >  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++--------=
-------
> > > > > >  >>  include/drm/drm_mipi_dsi.h         |  2 ++
> > > > > >  >>  2 files changed, 12 insertions(+), 15 deletions(-)
> > > > > >  >
> > > > > >  >Please extract the generic part, so that it can be merged thr=
ough a
> > > > > >  >generic tree.
> > > > > >  >
> > > > > >
> > > > > > Sorry, I don't get it.  The generic part, generic tree? Do you =
mean
> > > > > > the drm tree? `slice_per_pkt >=3D 2` is seen on the panels of t=
hese
> > > > > > tablets that are equipped with qcom chips. I don't know if thes=
e
> > > > > > panels are used on other platforms, and if it is necessary to d=
o it
> > > > > > in drm.
> > > > >
> > > > > There are two changes here:
> > > > > - MIPI DSI header change
> > > > > - msm DSI driver
> > > > >
> > > > > I've asked to split it to those two commits so that he change for
> > > > > drm_mipi_dsi.h is more obvious for reviewers and so that it can b=
e
> > > > > merged through a drm-misc tree (or through drm-msm tree provided =
it gets
> > > > > a necessary ack).
> > > > >
> > > >
> > > > Thanks for your clear explanation.
> > > >
> > > > I don't mind to add the field separately. But should I submit it
> > > > with the panel driver together? Otherwise, this field is unused
> > > > for a while.
> > > >
> > > > However, as you mentioned, this is not a part of standard, neither
> > > > mipi dsi nor VESA DSC. Recently, only Qualcomm devices require it
> > > > to calculate parameters, then we use them to program registers. Why
> > > > don't we parse the field from devicetree?
> > >
> > > Because the value is uniquelly identified by the panel's compat strin=
g.
> > >
> >=20
> > Yes, it is panel specified.
> > But can we set it for every panel like
> >=20
> > &mdss_dsi0 {
> >     qcom,mdss-dsc-slice-per-pkt =3D <2>;
> >=20
> >     status =3D "okay";
> >=20
> >     panel: panel@0 {
> >         compatible =3D "foo,bar";
> >         reg =3D <0>;
> >     };
> > };
> >=20
> > or moving the property to panel node? We access it from child node.
>=20
> Why do you need it in DT if the panel driver can provide this
> information.

Hello, I need this patch for the Tianma TA066VVHM03 on the ASUS ROG Phone 3=
. Is
the only change required at this point to split the generic part, and is a =
v2
in the works to address this?

>=20
> --=20
> With best wishes
> Dmitry

Thanks,
Alex


