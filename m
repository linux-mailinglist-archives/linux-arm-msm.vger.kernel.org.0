Return-Path: <linux-arm-msm+bounces-89031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60231D2012A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 17:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99418300216D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 16:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992E73A1A5F;
	Wed, 14 Jan 2026 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jlP+BieU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02806184
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406900; cv=none; b=hX3FUIH4gby9QZH3xt8jA37EI+fxRNd0W/RrD0tpE6ZQARNCK2x7oPUlFos6EiBX8sgssf0VOEIRoidyez4b48vEWpd+GyhrxCEwnfBR3o/GP35eHKPhS+SZbRfS0Q1HSRl/OzKK453le86IBYDQOV1ta/69eyAclwunUvgEtu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406900; c=relaxed/simple;
	bh=VN+sc/PCbmrTU2eqySY5vF+P4Mai8eNMaxaFpZ0Q+s4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DsBXaPKzfMW38TyA4HhivdM50BoGSRqx3YlKv3/sX+t8LJkZnExdveDHlKZDJAzH9ilRjCd2kxUbQe8ZZMh774+ozB7SPpYyZnr29N6mUsgofVyDRKr6Aoe23MPnBWukI4ztwffurehcSVUoX6nkyHTnH7bRMMz99DEudJzZ+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=jlP+BieU; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88fdac49a85so92482286d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 08:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1768406898; x=1769011698; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VN+sc/PCbmrTU2eqySY5vF+P4Mai8eNMaxaFpZ0Q+s4=;
        b=jlP+BieU0secmiKx8eAI4aczWVbVXHCMaWZeSVv/hNW2zRP4GRMi5iMFm4zfWWLqMU
         DEJn9Q8/5/OBHNtAdeJ7Bncfx+531QR0D2ql2I5rhkaYcCYMXGMY1TokbacwyTYcXt5z
         MTCYPxk3QtBZeLCX0Fmg4UobAmlpzpsnPXvW6TW9abnBhMzBy4ZCkkwXh7QnaU62Uayf
         5Ih/CXI6xFFgpHwdtW8mllRJHkQTRGPHdiRwIxwP1aQKyq+bS2Q5Z+1b2tWaYMSUCW4C
         AFCxJon5GGTlcv12wy8JEggnUuS+wWiy//JpR18Yaq3H9ffeMMaFecysuDoK0JSTXyOI
         IZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406898; x=1769011698;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN+sc/PCbmrTU2eqySY5vF+P4Mai8eNMaxaFpZ0Q+s4=;
        b=VpZ0j5nmcFNB2hEVSkqT0sdNlVJIOVgLyYfQYc4AnXUDjr+lVpiZ/kaXiiwBWp5xx7
         BzGVbxQbTzGvReYnFGJHi606tH45JurUjD4mfGek71vYHcyx1joSX3xrhOJJWFq0FSrN
         B9ELTus6RG6HcBV0+4VjSk79L5KEW0bR9Ohttu16a7nfNIihRrjAL26R01m/URqrt0Cp
         OWbSpfWsWGc1EQL+EHxZ5lUc0PDXEVlPcyKgEnaUOtq53rrfxHoHPe3hl+MbQZi2x+s7
         VGIybUBU/kY0w9IFLuK9FZP2K073o9RLaJxb5sdNxof/b2f1/RM6EsttT5TXKs3Qnvjs
         d0eA==
X-Forwarded-Encrypted: i=1; AJvYcCWFdFrLRK8XE5l/auGqSZM8OrYnMsK3wqjw0m2Pyy9L0RmffwsihDTyZXs1ldMcAcfMpwT4/5Vf/WYubKJy@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxHu9bWpYrmpGhCZXmNWPFwft+w4h0Y5nnNCSndA3FFp6ryxB
	aGquBEkfAcxxoAEikSCNJkyfvD8BzMnLzYcdFVqPxKwLeI0bdeQFcnoRoXwwK2/RyFE=
X-Gm-Gg: AY/fxX6q/aLAHTtcc/0v7ZCGHbS4wSyp/zspRT6VQa6D0fLu63g6Tpab65ZHsC45yXa
	lPAQMfowVnWgqKjUCMbazhYJhpAQEYvK/h+BPU2z+xSuwmAAIcjFOsAHuzo1j8Aod11Sqioao+o
	Min38z2CAM+EH6tO0cqUD20wkIqYAmyTJtX8EajlQpY1VZNLNE+68IVQ3U7j/qntMbqgmQQsN4H
	nljYABK91KZDHu7n1ccwCEQnKrsQJBbzSozCf9MwJTpNK+wAyZ2eX1U+bjU1KhcUiptioO5MS9D
	GtGGkQc/TtMy7PBMFNsIVEgSme2IU6wv06yKTEwtIfIfyJ5w036xm3GrK3rVaJBPe8RO3xFcgsa
	XJHvnqrh1+L+VqNU6jv7dN/EzBDJGvo/mqJPZRWv90B+WNRofvMytqtPfqSz1yWNJ+J4JRc51Mu
	JAui58w2BiuceBUXIX
X-Received: by 2002:ad4:5c43:0:b0:888:89fd:a720 with SMTP id 6a1803df08f44-89275ae028amr37603396d6.11.1768406897648;
        Wed, 14 Jan 2026 08:08:17 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772681desm180568616d6.51.2026.01.14.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:08:16 -0800 (PST)
Message-ID: <abb850223d81708588c594cfeee9e0fdbc1193e8.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Wed, 14 Jan 2026 11:08:15 -0500
In-Reply-To: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-RZ3MD85+AD47PzpQ7mde"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-RZ3MD85+AD47PzpQ7mde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 13 janvier 2026 =C3=A0 12:33 -0800, Deepa Guthyappa Madivalara a =
=C3=A9crit=C2=A0:
> Hi all,
>=20
> This patch set implements region of interest(ROI) support
> for video encoder to be configured as a rectangular
> region, and corresponding delta QP parameter. A new compound
> control V4L2_CID_MPEG_VIDEO_ENC_ROI which maps to struct
> v4l2_ctrl_enc_roi_params is implemented to achieve this.=C2=A0=20

My very first question will be why ROI rather then QP Map ? Its seems that
modern API such as D3D12 and Vulkan Video aims for QP Map instead of a limi=
ted
set of rectangles, while older hardware / firmware have ROI, but since you =
are
saying that this is not yet implemented in your firmware, I thought it was =
worth
asking.

The ROI are relatively easy to convert into QP Maps, but the opposite is go=
ing
to be a lot less accurate. That being said, the number of ROI can be extrem=
ely
limited, at least this is the case for Samsung MFC firmware and Hantro enco=
ders
(no upstream driver yet).

let us know your thought, should we adopt just one, and have driver transla=
te
once HW moved to the new approach ? Should we enventually support both ?

Nicolas

>=20
> I'm sharing this series as an RFC because adding support
> in the firmware and framework for testing, gstreamer testing
> is still in progress. I would appreciate early feedback on
> the design, implementation, and fixes before moving to a
> formal submission.
>=20
> v4l2-ctl -d /dev/video1 --list-ctrls
> ..
> hevc_b_frame_maximum_qp_value 0x00990b8c (int): min=3D1 max=3D51 step=3D1
> default=3D51 value=3D51 flags=3Dhas-min-max
> video_encoder_roi_params 0x00990b92 (unknown): type=3D284
> value=3Dunsupported payload type flags=3Dhas-payload
>=20
> Thanks,
> Deepa
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> Deepa Guthyappa Madivalara (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: uapi: Introduce new control for vid=
eo encoder ROI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: v4l2-core: Add support for video en=
coder ROI control
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add ROI support framework for=
 video encoder
>=20
> =C2=A0.../userspace-api/media/v4l/ext-ctrls-codec.rst=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +++
> =C2=A0drivers/media/platform/qcom/iris/iris_ctrls.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 54
> +++++++++++++++++++++-
> =C2=A0drivers/media/platform/qcom/iris/iris_ctrls.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../platform/qcom/iris/iris_platform_common.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0.../media/platform/qcom/iris/iris_platform_gen2.c=C2=A0 |=C2=A0 8 +=
+++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++++-
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
> =C2=A0include/media/v4l2-ctrls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 17 +++++++
> =C2=A010 files changed, 110 insertions(+), 2 deletions(-)
> ---
> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> change-id: 20260112-iris_enc_roi-8898f9a2455f
>=20
> Best regards,

--=-RZ3MD85+AD47PzpQ7mde
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWe/bwAKCRDZQZRRKWBy
9IIOAP0ctElbfVB1Z85B09FYWfrcfWYAKUKe2ShV+mhVxbj9UQEAnSFbEkJj8yR9
8dLb3xM7LiIxv4Jr2SdjB6Yg4dQ6dQg=
=lJlC
-----END PGP SIGNATURE-----

--=-RZ3MD85+AD47PzpQ7mde--

