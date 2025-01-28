Return-Path: <linux-arm-msm+bounces-46419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F013EA213D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD0E3A05E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 22:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E40A197A87;
	Tue, 28 Jan 2025 22:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="2FmEwSwk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A197DA62;
	Tue, 28 Jan 2025 22:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101765; cv=none; b=qOnFYA8Krtcg8QrJJVWEucUjN/qd6e4h9VDMrPe2CcIhVDKUSN0BwwaDl0/Ib8hsJuua9KGLc+53q30sPlWy+MZkH8/2CVknj8BXAeleC/aglAYZpe0y/Dtng5hkOh4t2xN17InxqgLAjLtYa0T85JyP69sPGTLOW6ouFwQUi3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101765; c=relaxed/simple;
	bh=YccFbEl8Fq7zn27tZqe5aQ5AwzGbXsANSfkE8s3T/FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3KmYXM7V/M2TmGpEwB21Fpl3e4cevtfXLkeziCftI/8HJoO4DJS3oKn7cbnqNWFtH9U2UR9I5+UPgrl5dYw9cCmDcnr6mnvSfDqOhDZXJPB4w+gASvuvEDt1Ke8RviKG6wFSE+BkosU4/J9mKx6Ibw62SOyS4CBr0vGzqR1Tvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=2FmEwSwk; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738101762; bh=YccFbEl8Fq7zn27tZqe5aQ5AwzGbXsANSfkE8s3T/FQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2FmEwSwkh81MQvM817kJpMo2rTXcA26m1DoDAIvH22RLW6JvPlyxf9qPAsfLab+25
	 Cg0Sf9E7C+s5PA5/HVJgm9Qi5cHg4FDvKlXq97LSMvoUn/VfRvcVnWBnpaiOZMuseY
	 EhPaFo0p4v8ZvHN029TqB+m13CKONYyNjM60fywU=
From: Luca Weiss <luca@lucaweiss.eu>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matti =?UTF-8?B?TGVodGltw6RraQ==?= <matti.lehtimaki@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Handle platforms with one power
 domain
Date: Tue, 28 Jan 2025 23:02:36 +0100
Message-ID: <2353651.ElGaqSPkdT@lucaweiss.eu>
In-Reply-To: <Z5iHkeXebKd7HEAO@linaro.org>
References:
 <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <2764902.mvXUDI8C0e@lucaweiss.eu> <Z5iHkeXebKd7HEAO@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On dinsdag 28 januari 2025 08:30:25 Midden-Europese standaardtijd Stephan G=
erhold wrote:
> On Mon, Jan 27, 2025 at 11:21:04PM +0100, Luca Weiss wrote:
> > On maandag 27 januari 2025 09:58:45 Midden-Europese standaardtijd Steph=
an Gerhold wrote:
> > > On Sun, Jan 26, 2025 at 09:57:22PM +0100, Luca Weiss wrote:
> > > > For example MSM8974 has mx voltage rail exposed as regulator and on=
ly cx
> > > > voltage rail is exposed as power domain. This power domain (cx) is
> > > > attached internally in power domain and cannot be attached in this =
driver.
> > > >=20
> > > > Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing re=
gulators with power domains")
> > > > Co-developed-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > > > Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > > ---
> > > > Changes in v2:
> > > >   - Move MSM8974 mx-supply from "fallback_proxy_supply" to
> > > >     "proxy_supply" to match updated DT schema
> > > >   - Add fixes tag
> > > > ---
> > > >  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
> > > >  1 file changed, 17 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remotepro=
c/qcom_q6v5_mss.c
> > > > index e78bd986dc3f256effce4470222c0a5faeea86ec..e2523b01febf393abfe=
50740a68b85a04011293c 100644
> > > > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > > > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > > > @@ -1828,6 +1828,13 @@ static int q6v5_pds_attach(struct device *de=
v, struct device **devs,
> > > >  	if (!pd_names)
> > > >  		return 0;
> > > > =20
> > > > +	/* Handle single power domain */
> > > > +	if (dev->pm_domain) {
> > > > +		devs[0] =3D dev;
> > > > +		pm_runtime_enable(dev);
> > > > +		return 1;
> > > > +	}
> > > > +
> > > >  	while (pd_names[num_pds])
> > > >  		num_pds++;
> > >=20
> > > Hmm, I think you should put the above if condition below this loop and
> > > verify that num_pds =3D=3D 1. Otherwise this would hide the error con=
dition
> > > if the platform needs multple PDs, but someone only specifies one of
> > > them in the DT. i.e.
> > >=20
> > > 	if (num_pds =3D=3D 1 && dev->pm_domain) {
> > > 		// ...
> > > 	}
> > >=20
> > > > =20
> > > > @@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *de=
v, struct device **devs,
> > > >  static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pd=
s,
> > > >  			    size_t pd_count)
> > > >  {
> > > > +	struct device *dev =3D qproc->dev;
> > > >  	int i;
> > > > =20
> > > > +	/* Handle single power domain */
> > > > +	if (dev->pm_domain && pd_count) {
> > >=20
> > > Maybe if (pd_count =3D=3D 1 && dev->pm_domain) for consistency with t=
he
> > > above then.
> >=20
> > Good suggestions, thanks!
> >=20
> > >=20
> > > > +		pm_runtime_disable(dev);
> > >=20
> > > I'm guessing it does, but just to make sure: Have you verified that t=
he
> > > power domain is indeed voted for off after this call to
> > > pm_runtime_disable()? Start the remoteproc and when it's booted inspe=
ct
> > > /sys/kernel/debug/pm_genpd/pm_genpd_summary to see if the PD/remotepr=
oc
> > > dev is suspended.
> >=20
> > Looks sane I think (modem: remoteproc@fc880000)
> >=20
>=20
> The modem does look sane yeah...
>=20
> > htc-memul:~$ sudo cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> > domain                          status          children        perform=
ance
> >     /device                         runtime status                  man=
aged by
> > -----------------------------------------------------------------------=
=2D------
> > oxili_cx                        off-0                           0
> >     fdb00000.gpu                    suspended                   0      =
     SW
> > camss_vfe                       off-0                           0
> > camss_jpeg                      off-0                           0
> > mdss                            on                              0
> >     fd900000.display-subsystem      active                      0      =
     SW
> > venus0                          off-0                           0
> > cx_vfc                          off-0                           0
> > cx_ao                           off-0                           0
> > cx                              on                              0
> >     fc880000.remoteproc             suspended                   0      =
     SW
> >     fe200000.remoteproc             unsupported                 0      =
     SW
> >     fb204000.remoteproc             suspended                   0      =
     SW
>=20
> ... but "unsupported" for ADSP and the end result for cx ("on") does
> look suspicious. Looking at qcom_q6v5_pas.c, it uses almost the same
> code for single power domain support as here...
>=20
> What state is the ADSP in here at this point? Did it boot sucessfully?
>=20
> If I'm reading the code correctly, the pm_runtime_enable() in
> adsp_pds_attach() should get rid of the "unsupported" at probe time,
> so I'm a bit confused how this can happen..
>=20
> [5 minutes of staring later...]
>=20
> Um, qcom,msm8226-adsp-pil uses &adsp_resource_init, which doesn't have
> any "proxy_pd_names". It should use &msm8996_adsp_resource so that it
> actually manages the CX power domain. Same for MSM8974, but that was
> never converted to use power domains... =F0=9F=99=88

Oh wow, thanks for catching this!

>=20
> Can you submit a patch that changes at least msm8226 to use
> &msm8996_adsp_resource? Would be also good to make the same changes
> I suggested here (check num_pds =3D=3D 1 / pd_count =3D=3D 1).

Sent a series to fix the above and this:
https://lore.kernel.org/linux-arm-msm/20250128-pas-singlepd-v1-0-85d9ae4b00=
93@lucaweiss.eu/T/

Regards
Luca

>=20
> Thanks,
> Stephan
>=20





