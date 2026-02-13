Return-Path: <linux-arm-msm+bounces-92825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P1zMJd7j2mWRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 20:29:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775D139369
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 20:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74724301BCF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 19:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8764B2D7D27;
	Fri, 13 Feb 2026 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Ks778jel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF428EA56
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010948; cv=none; b=UZ55t89c06r3mq3K6ox2QqD4qhwE2u6ZdoghYjERvEKwOKM40fC1DJGTDQjdPVjp/rguhQYk9+uUvuW+92G1Tsgm7c4WzIIS6upPpGmE05jAEJBGFYXTKbMFsSyxIJflw6YlDpq7B7OmPkSNVAVpCTXeVawUcRQImEMcNsGorvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010948; c=relaxed/simple;
	bh=SzUnHwptgH9zokkg62OlR2St4ErB9KhCdJB91j/Qkww=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Anh4VDlMQPUwXc7ZwDQjuL3df/N+gE9wm/66qvQVkKyiQqbsk7cPUmvmlTfAZISN8p4qV3OKGyrFE3mpcJ1ADGbnNPygcOmrrpSEBiYr6Dn7gLs8tVNfhvaZwcjvwS/tXBtDMga+HQBVto3fKG9RW27LLm0YGL/fpMaJinUc31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Ks778jel; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50697d6a69cso7577201cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1771010946; x=1771615746; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0klMDiVfrX/lX14Mfsu8AR3W7zS6aiOC+pKWCvgrVY4=;
        b=Ks778jelDVpvpfnQShDj8QOlV2603ewAb8nUKBkngktIbvQWyv/QW/t8M7AY4KHvTE
         hH3HEScP09LJoGemkITQRaiYV74g8ipR2+vgJM8FUZj5xE7iUG3qKZHB44apVeg6ZMw3
         pCvLuoTNx0/Hu6eXjY/1ml6qg93iTULyTUX1edHepwPmcGPrNpHl6dUN8qdkStaW8o0l
         bYfvzvrVrE3ZuesY4pyNxwDZsk/8rVzS46RSFZ5QosRfDtPDaoz/0LkXHa3xBY0yVoPW
         ZrWg9Uk8GL+mlY0gaB4Ef+DlzdugPeaJ0Uoj5NnoE57NjYC5Mrg3Cn3GV2JX5Ebldd2k
         QtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771010946; x=1771615746;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0klMDiVfrX/lX14Mfsu8AR3W7zS6aiOC+pKWCvgrVY4=;
        b=jxt3kVNf+MxkBXYcpPk8Jsbrn7nxVIXyij0aM1JOffjRfO4lLFywIq6LZQ7CtT3fK4
         Hb8Y2cNl9Qz91FlQRDDiEjDTubikLm/zov97R+CPx8yyUoCT8mOAn/N5izvhzp7R33JZ
         6EK7FroQuRu00Bdz7iE+7/IjhZboB6vCNUJ9EAU1iDQhz+Jx4jYMp5CIfCOe9szOSPUf
         KBO3W2OuiIzfTAo/IfPtOVAVITSue7wnUCUOXuJEIjVbgR4nRRwgldgWpHYCvadz6KVH
         xn0n79eZsdWRRguMsu8qk2tSLQlpxxClkFc4gdpK+4HB48AcP+6Xe7iwXB8BXCZu/s64
         esFg==
X-Forwarded-Encrypted: i=1; AJvYcCWWPh2B9UweJtVNki/fmrGjq/rskEM+tNnnSfur6eiVchweg0MfyXtozpmFLvy8JsgOzDDACJDNSNODiKmZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmc+1JYChcWigGlJwkh3PHnkWOqsAYvUoup8bNDxpL9DDHkaTj
	wbWhVAI20OPczjrCiZoxLUIxipBDWj0D7kTTFRY7sCnaT9i8ZKZzalMmRXamm8iJQhU=
X-Gm-Gg: AZuq6aLUa0e7n9t6ZgGYyVDjZH+d11Dcuy6HgUKO9V8P3vaeqGzUFyH84SjiOia8q49
	j0rclcE9ppoJvkXgST6u2BHvDBKXTE2AOCGv6+UaA4Icny1QS3VlDMrQ5yQ8MX4CKwB1CzQhMRZ
	YRtbXg8MEeugoLcaDgKtqCvLkenfGMFFKFrA8eOccdKQqXVdw2xwisvlLBmiCHNL7dPj01myP0M
	mM6YNCPFeaKIl+gaDROY22168NS0Bg8kxH4vGV48dtsdaACTudHzPr2H0UjOxp9BjOI5CZAYbnW
	mYSjhgQ16mIcxxnId1TNk/RPPtdqfLung9XYlQzejrcakuKqqRcJN5eXrhYhCwDq2Kme4RY3yd0
	Qo5tX4a47RT5B7AO6VudUawukr1tWQr3GJrY7o4qPnjNSiJYWONuoQ2+d+cmTiVuWFRmKgNGkQs
	viuuA2kcD5uGe5VRNTFc6RtoHMPaVf
X-Received: by 2002:ac8:5ac9:0:b0:506:8738:6518 with SMTP id d75a77b69052e-506a833addbmr41446561cf.65.1771010945728;
        Fri, 13 Feb 2026 11:29:05 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506a93ba30fsm19355881cf.26.2026.02.13.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:29:04 -0800 (PST)
Message-ID: <8ef7dc7d132143e144dc523ed72c25139fa36a28.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: v4l2-ctrls: add encoder maximum bitrate
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Fri, 13 Feb 2026 14:29:03 -0500
In-Reply-To: <20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809@oss.qualcomm.com>
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
	 <20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-pyeYCoF06hGXM0gUWI2I"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-92825-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2775D139369
X-Rspamd-Action: no action


--=-pyeYCoF06hGXM0gUWI2I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 11:34 +0530, Sachin Kumar Garg a =
=C3=A9crit=C2=A0:
> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control for Encoder.
> Encoder will choose appropriate quantization parameter and do the
> smart bit allocation to set the frame maximum bitrate level as per
> the Bitrate value configured.
>=20
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
> =C2=A0Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++=
++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
1 +
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A03 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index c8890cb5e00a..6b2dfabfc4fd 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -577,6 +577,13 @@ enum v4l2_mpeg_video_bitrate_mode -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Constant bitrate
> =C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Constant quality
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_MBR``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MBR Rate Control is a VBR Rate Control mo=
de optimized for
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 surveillance video contents which has hig=
h temporal correlation
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 due to static camera positions. This Rate=
 Control smartly identifies
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key-frames in the scene, and allocates mo=
re bits to them to improve
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the coding efficiency by taking advantage=
 of high temporal
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 correlation in surveillance videos.

This is a bit vague, and it sounds like how you'd describe a proprietary th=
ing.
Are you sure this is a generic mode that other vendors will support ? If no=
t,
perhaps it should be visible in the API ?

Nicolas

> =C2=A0
> =C2=A0
> =C2=A0
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-
> core/v4l2-ctrls-defs.c
> index 551426c4cd01..b336171539a7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -154,6 +154,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
> =C2=A0		"Variable Bitrate",
> =C2=A0		"Constant Bitrate",
> =C2=A0		"Constant Quality",
> +		"Maximum Bitrate",
> =C2=A0		NULL
> =C2=A0	};
> =C2=A0	static const char * const mpeg_stream_type[] =3D {
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-
> controls.h
> index 68dd0c4e47b2..614fc2c4c81d 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -412,6 +412,7 @@ enum v4l2_mpeg_video_bitrate_mode {
> =C2=A0	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR =3D 0,
> =C2=A0	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR =3D 1,
> =C2=A0	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ=C2=A0 =3D 2,
> +	V4L2_MPEG_VIDEO_BITRATE_MODE_MBR =3D 3,
> =C2=A0};
> =C2=A0#define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_CODEC_BASE+207)
> =C2=A0#define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_CODEC_BASE+208)

--=-pyeYCoF06hGXM0gUWI2I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaY97fwAKCRDZQZRRKWBy
9FT8AP0UYYtJi+da1bbrXhWNS+1MIqvdOiangHm4HG+m/kyNQAEAnbYF0UZaVMKr
BzHOgTlv7/qRYyLbTJutiamm40pWEwA=
=OvJP
-----END PGP SIGNATURE-----

--=-pyeYCoF06hGXM0gUWI2I--

