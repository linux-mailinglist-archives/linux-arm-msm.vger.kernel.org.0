Return-Path: <linux-arm-msm+bounces-66289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E442B0F20F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B36397AF81D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A2E2E5412;
	Wed, 23 Jul 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR6+JZHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E60289E3D;
	Wed, 23 Jul 2025 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753273157; cv=none; b=g67mA9JMb+5G5o/L5VlfWhJ/cCufOEN+Gbuocd261CrORw6+g5BGAuqXb0o3fv+14QxJRPlabXiDDQxiDiTIbSgCoKbYkiWG2BoKHQ+FDg73euLZSj1N4NJzA4mvCcH4GQuQLmoFnhFY6CFJ7pQl9uGK8GhmoJg1rpitN6RQsw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753273157; c=relaxed/simple;
	bh=POuTDoQ9PpSydluEqziXn2gVwFFvN6mDSjaJOEBnvUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtBe2mNt67vWBRI5gqVJUMyc7kzuBpupaL2kBF9cj84UvSJBfbTYhwv6QQjalXrPqQxpdI2Oz2puEyQswTYC/kXbs9M2jn6meTzOq+xHBISsjJSclLwWR0l0w754Ql3r9iwHBhoGirBJLkDxTIAukVoHvGAjdO5srSh1Wg8/Zdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR6+JZHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DB4C4CEE7;
	Wed, 23 Jul 2025 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753273155;
	bh=POuTDoQ9PpSydluEqziXn2gVwFFvN6mDSjaJOEBnvUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OR6+JZHdfGfBB+GjdRuPEkv2fUmvV3Ihf86Qs1cb/Z2FB/mmmnxMuw1YFMmB5a2h0
	 2H6dDlD51Jglq3WSNPep/Ejjoyx6PxIdM8B0OFienVPR46GBB0MsV/9eN29M0Jw/vK
	 fPAkga3FScth/T8fyiZLSl276bRhWpFYq/hoU9N4gmtqT6qqPTeMwlGhWV6O0e74Rl
	 lh8312qzlCEJRCXLtKZrl+ywkQ74zVBuHKoXHD0/JG4DIaFZlHnR+c8NXNd066Z96d
	 nCeyO0DkJPuxvZXtlkg1hhGz0+mYQYA0B1DTXSJyohf+bitKllSbVONZBpdY7FLy94
	 BgaEPHKAfq2nA==
Date: Wed, 23 Jul 2025 13:19:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
Message-ID: <00c2ac7c-763f-467f-8199-76de9f5d71b0@sirena.org.uk>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
 <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
 <ac3f1eb2-5830-4bda-bc57-c4d29c22aba0@sirena.org.uk>
 <DBJDZBYHR94V.1QGVALCL60M1X@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s26ZamLLlGnPk0Qb"
Content-Disposition: inline
In-Reply-To: <DBJDZBYHR94V.1QGVALCL60M1X@fairphone.com>
X-Cookie: List was current at time of printing.


--s26ZamLLlGnPk0Qb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 01:09:35PM +0200, Luca Weiss wrote:
> On Wed Jul 23, 2025 at 12:57 PM CEST, Mark Brown wrote:

> > As previously discussed they won't apply until after the merge window.

> Sorry about that, I thought the conflict was for the 6.16 merge window,
> not 6.17?

There is a conflict.  You could check this yourself...

> So I'm not aware of another conflict, that's why I was asking in the
> first place.

You were sending a content free ping:

> > Please don't send content free pings and please allow a reasonable time
> > for review.  People get busy, go on holiday, attend conferences and so=
=20
> > on so unless there is some reason for urgency (like critical bug fixes)
> > please allow at least a couple of weeks for review.  If there have been
> > review comments then people may be waiting for those to be addressed.
> >
> > Sending content free pings adds to the mail volume (if they are seen at
> > all) which is often the problem and since they can't be reviewed
> > directly if something has gone wrong you'll have to resend the patches
> > anyway, so sending again is generally a better approach though there are
> > some other maintainers who like them - if in doubt look at how patches
> > for the subsystem are normally handled.

--s26ZamLLlGnPk0Qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiA0zsACgkQJNaLcl1U
h9AH6wf9ELo4l0meQaRhE0Vx8YMY2nfByC9Ukip/Q3TFsZ5P/t2r7WBg6LpGuB6G
eCQe8Ij3e4NeK/gM1DOpSm4hAq9psN/hQJJ4TuTeIpXnHYj9xHWI7f6BD7Shl8TL
rUdsxAdhmqFtks04vjgVBFI9ZzCKVrVgCgllgkv3qJFv24jPU89FED508O4v923I
sh/95oHEe1SIsylpxWabv/qiV85mGyjzAwua1880+N4cTQb4+qpfPOJ5sF4Y26uv
HePGs4rN7eQcf2EtrQTqIYkN3yjJwZ1FWSdmflPEgVh7jAEgy2/TPKwGV0hCvadt
q9LG+Te7yykwpR31TYO4CecQNXSFJw==
=FMQf
-----END PGP SIGNATURE-----

--s26ZamLLlGnPk0Qb--

