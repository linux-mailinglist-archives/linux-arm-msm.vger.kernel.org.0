Return-Path: <linux-arm-msm+bounces-46291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55850A20078
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A8D218870E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2581D1DC04A;
	Mon, 27 Jan 2025 22:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="hJtWEkf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC41D88DB;
	Mon, 27 Jan 2025 22:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738016475; cv=none; b=lcqqx4ijASJ726V/DcZoTYNEGtOdIwcBSdOamqkaLTSlHmHbpi5RbmyXuxT4nCMi43ZNVXgQ1jqeGJpZzSa+3WBq+xMmFby2uB4FFOrfGtyka6qkyqKMj3j55ffUAnfsHllxtz3F6osvSG1xe/qQFiSrjsroYUGBmR5LB4B9Tkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738016475; c=relaxed/simple;
	bh=w0V5EJfhyJzk1s2kIunL3i/Dw29dcV0O6rKeti3vG2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PmL4R+UK+H1Ie+tiSegXK1sX1wrafXjJSqpzqWW7BclJCnqE4aIPYZqI7ZQIPocKISVWEYdk6s+MYzKnIbaMEER48YvrCPY3k7/YmW+MUb/FtBlGa6ExJSI+ycD6odF6LvdD5io4XpOcST6TdpBXdBUkaS2B/4x10ToimRhXlkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=hJtWEkf0; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738016465; bh=w0V5EJfhyJzk1s2kIunL3i/Dw29dcV0O6rKeti3vG2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hJtWEkf0wy0zBVjSwI9GoVa2i+XB/UHTB+KJmYlyv18OFbmoBv7wZGGoA9M9eTeFC
	 XQMEOrIuk4Juoy3JSClrfAiGkcnBn+VhGW0Sd/KHfwoKvzxqLobQzSEoqwVQoMM/ve
	 tC9PohIIclJuE9wqCTMnqbwkYiJpbJ9W3Ig3aQvk=
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
Date: Mon, 27 Jan 2025 23:21:04 +0100
Message-ID: <2764902.mvXUDI8C0e@lucaweiss.eu>
In-Reply-To: <Z5dKxZ-fri8RaTPo@linaro.org>
References:
 <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-3-e88d76d6daff@lucaweiss.eu>
 <Z5dKxZ-fri8RaTPo@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On maandag 27 januari 2025 09:58:45 Midden-Europese standaardtijd Stephan G=
erhold wrote:
> On Sun, Jan 26, 2025 at 09:57:22PM +0100, Luca Weiss wrote:
> > For example MSM8974 has mx voltage rail exposed as regulator and only cx
> > voltage rail is exposed as power domain. This power domain (cx) is
> > attached internally in power domain and cannot be attached in this driv=
er.
> >=20
> > Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regula=
tors with power domains")
> > Co-developed-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> > Changes in v2:
> >   - Move MSM8974 mx-supply from "fallback_proxy_supply" to
> >     "proxy_supply" to match updated DT schema
> >   - Add fixes tag
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
> >  1 file changed, 17 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qc=
om_q6v5_mss.c
> > index e78bd986dc3f256effce4470222c0a5faeea86ec..e2523b01febf393abfe5074=
0a68b85a04011293c 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -1828,6 +1828,13 @@ static int q6v5_pds_attach(struct device *dev, s=
truct device **devs,
> >  	if (!pd_names)
> >  		return 0;
> > =20
> > +	/* Handle single power domain */
> > +	if (dev->pm_domain) {
> > +		devs[0] =3D dev;
> > +		pm_runtime_enable(dev);
> > +		return 1;
> > +	}
> > +
> >  	while (pd_names[num_pds])
> >  		num_pds++;
>=20
> Hmm, I think you should put the above if condition below this loop and
> verify that num_pds =3D=3D 1. Otherwise this would hide the error conditi=
on
> if the platform needs multple PDs, but someone only specifies one of
> them in the DT. i.e.
>=20
> 	if (num_pds =3D=3D 1 && dev->pm_domain) {
> 		// ...
> 	}
>=20
> > =20
> > @@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, s=
truct device **devs,
> >  static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
> >  			    size_t pd_count)
> >  {
> > +	struct device *dev =3D qproc->dev;
> >  	int i;
> > =20
> > +	/* Handle single power domain */
> > +	if (dev->pm_domain && pd_count) {
>=20
> Maybe if (pd_count =3D=3D 1 && dev->pm_domain) for consistency with the
> above then.

Good suggestions, thanks!

>=20
> > +		pm_runtime_disable(dev);
>=20
> I'm guessing it does, but just to make sure: Have you verified that the
> power domain is indeed voted for off after this call to
> pm_runtime_disable()? Start the remoteproc and when it's booted inspect
> /sys/kernel/debug/pm_genpd/pm_genpd_summary to see if the PD/remoteproc
> dev is suspended.

Looks sane I think (modem: remoteproc@fc880000)

htc-memul:~$ sudo cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children        performance
    /device                         runtime status                  managed=
 by
=2D------------------------------------------------------------------------=
=2D----
oxili_cx                        off-0                           0
    fdb00000.gpu                    suspended                   0          =
 SW
camss_vfe                       off-0                           0
camss_jpeg                      off-0                           0
mdss                            on                              0
    fd900000.display-subsystem      active                      0          =
 SW
venus0                          off-0                           0
cx_vfc                          off-0                           0
cx_ao                           off-0                           0
cx                              on                              0
    fc880000.remoteproc             suspended                   0          =
 SW
    fe200000.remoteproc             unsupported                 0          =
 SW
    fb204000.remoteproc             suspended                   0          =
 SW
usb_hs_hsic                     off-0                           0


Regards
Luca

>=20
> Thanks,
> Stephan
>=20





