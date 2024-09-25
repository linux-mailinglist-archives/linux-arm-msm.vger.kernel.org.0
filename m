Return-Path: <linux-arm-msm+bounces-32490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA09986104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 16:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671D428CAA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 14:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873FE183CB5;
	Wed, 25 Sep 2024 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qyjoblw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0717DFF5;
	Wed, 25 Sep 2024 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727272180; cv=none; b=jMxl8k0p55a/8D8eR7DqwEIGW4lf5TcToo4M6krWCOJ1Wo/QdYvK0/v7F9papMLG0kHfqvk46s0uY2OC21XrIceo0gvGMi9TfdYm3S7GWTyRqlhKzAkC5J+dUS+GqMZ5j1P2Aim8SVP6NspZATMRBK9r58dpbu/Ema7q2c/UFFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727272180; c=relaxed/simple;
	bh=ycCGXL/uRHjA4Pfa6QMo/gCbhY65nmP/6lsczsGQbxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee6xe5csH/FJ5lGfsZ1Dr+WEqTfmJZeHEUBnT4shtTYxCYJMPTPBrCOlu/szhLqRif0qmCAwvFxLoHmW2vPXdcPpxDjsndbu/EurZTOrG1YvYOuALYe8iSj25+JGw8wpiddCXgmNCL79B6puoeuLVfnsIjC+SgNeFhyzS6ot3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qyjoblw9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5010C4CEC3;
	Wed, 25 Sep 2024 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727272180;
	bh=ycCGXL/uRHjA4Pfa6QMo/gCbhY65nmP/6lsczsGQbxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qyjoblw9mJC40BA64nQ1Ef/hb5PmYECWjhyCWm3k3j3LzuQztz7CPvXd0chslbboL
	 ZQXtrZGgSMzfXC2vaLGttHeJLQkz3UgQlQcv8/zBxNQXX8yChCDfkDrlzzSqSOvHcR
	 bu4cd0pcLoIqeXZrLVJi3kJ3gJWuyvBkLxZQ9euRdqIusyZ6hugN8pQvAP1apidhjz
	 Qc8KB4cIszj4r+LO5DVE1ob9W9119M8N/uCWaDT0ckWpzc4MnOdkF/08Bc6Y5Tnoem
	 XTa/heuE8jvi8leKUgqJ6Xq8tJMc0rQZa2B0toHR/mTLccFD6VelbHhH64wkakAu9y
	 fB3Dyac+apMcQ==
Date: Wed, 25 Sep 2024 15:49:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, robdclark@gmail.com, dmitry.baryshkov@linaro.org, 
	quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: allow encoder mode_set even when connectors
 change for crtc
Message-ID: <20240925-glaring-squid-of-opportunity-5ddce2@houat>
References: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>
 <20240909-neat-stoic-hamster-cbbe42@houat>
 <33f29f1c-157a-424e-89c6-c1549a2d6403@quicinc.com>
 <20240910-liberal-platinum-scorpion-d43cff@houat>
 <34dad274-a048-4a1f-8acb-894d264ebe80@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fjwrgalcvxjtvi5d"
Content-Disposition: inline
In-Reply-To: <34dad274-a048-4a1f-8acb-894d264ebe80@quicinc.com>


--fjwrgalcvxjtvi5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 11, 2024 at 05:54:44PM GMT, Abhinav Kumar wrote:
> On 9/10/2024 1:40 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Sep 09, 2024 at 12:59:47PM GMT, Abhinav Kumar wrote:
> > > On 9/9/2024 6:37 AM, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Thu, Sep 05, 2024 at 03:11:24PM GMT, Abhinav Kumar wrote:
> > > > > In certain use-cases, a CRTC could switch between two encoders
> > > > > and because the mode being programmed on the CRTC remains
> > > > > the same during this switch, the CRTC's mode_changed remains fals=
e.
> > > > > In such cases, the encoder's mode_set also gets skipped.
> > > > >=20
> > > > > Skipping mode_set on the encoder for such cases could cause an is=
sue
> > > > > because even though the same CRTC mode was being used, the encoder
> > > > > type could have changed like the CRTC could have switched from a
> > > > > real time encoder to a writeback encoder OR vice-versa.
> > > > >=20
> > > > > Allow encoder's mode_set to happen even when connectors changed o=
n a
> > > > > CRTC and not just when the mode changed.
> > > > >=20
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > >=20
> > > > The patch and rationale looks sane to me, but we should really add =
kunit
> > > > tests for that scenarii.
> > > >=20
> > >=20
> > > Thanks for the review.
> > >=20
> > > We have a IGT for recreating this scenario and thats how this issue w=
as
> > > captured
> > >=20
> > > kms_writeback --run-subtest writeback-check-output -c <primary displa=
y mode>
> > >=20
> > > We had added an option ( 'c' - custom mode) a couple of yrs ago to al=
low
> > > writeback to be tested using any mode the user passes in (https://lor=
e.kernel.org/r/all/YuJhGkkxah9U6FGx@platvala-desk.ger.corp.intel.com/T/)
> > >=20
> > > If we pass in the same resolution as the primary RT display, this sce=
nario
> > > always happens as the CRTC switches between RT encoder and WB encoder=
=2E Hope
> > > that addresses some of the concern.
> >=20
> > Unless it can easily be run in some sort of CI loop by anyone
> > contributing to that part of the kernel, it doesn't.
> >=20
> > Don't get me wrong, it's a great feature, but it doesn't help making
> > sure that issue never creeps back in.
> >=20
>=20
> Ack, I understand.
>=20
> > > Regarding KUnit tests, I have a couple of questions:
> > >=20
> > > 1) This is more of a run-time scenario where CRTC switch happens, doe=
s this
> > > qualify for a KUnit or perhaps I am missing something.
> >=20
> > We've been using kunit to perform integration tests in the kernel too,
> > so I would say that it definitely qualifies.
> >=20
> > > 2) Is there any existing KUnit test file under drm/tests for validati=
ng
> > > drm_atomic_helper_commit_modeset_disables() /
> > > drm_atomic_helper_commit_modeset_enables() path because this will fal=
l under
> > > that bucket. I didnt find any matching case where we can extend this.
> >=20
> > We don't have that at the moment, but we shouldn't be too far off. The
> > HDMI framework I contributed some months ago for example has all the
> > mode checking infrastructure in kunit. So you already have some way to
> > create a driver, a new state, modify that state and check it.
> >=20
> > The only thing missing in your case is being able to commit it and check
> > that it has run, which shouldn't be too hard
>
> Alright. Yes I reviewed the hdmi infrastructure tests and you seem to have
> most of the pieces. I just need to find some cycles to work on this :) so
> you can have my name down for it and either me one of our team members or
> perhaps with some help from other msm developers we can get it added.
>=20
> The reason I was hoping to get this reviewed and added as a "fix" was we =
had
> already run into this scenario with kms_writeback test case and the same
> scenario was seen in another msm bug
> https://gitlab.freedesktop.org/drm/msm/-/issues/59 leading to a null ptr
> crash but we ended up fixing that within msm because that was a better fix
> anyway so I was thinking this change would help to resolve these types of
> issues for us once for all.
>=20
> But if this needs to wait for the KUnit to be added, thats fine, we will
> resend this one along with the KUnit once we work on it.

Yeah, if it's not urgent I'd rather have the kunit test at the same time.

Maxime

--fjwrgalcvxjtvi5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvQU8AAKCRAnX84Zoj2+
dqX4AX9LT2pHKxp0NnUAFfbov3SwgZhSXxLTHHhFh5TTk7zZhTNNp7KIrLcciFAE
AFOuCEwBf0fhKVN+VRjoqPUAZACADK38KjT+hNnrom9CQg+vlyIo4rsrox/+wBZn
JfajcT/qMA==
=cQZr
-----END PGP SIGNATURE-----

--fjwrgalcvxjtvi5d--

