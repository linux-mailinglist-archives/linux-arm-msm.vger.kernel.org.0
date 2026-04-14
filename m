Return-Path: <linux-arm-msm+bounces-103224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC8/HCbQ3ml0IgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 01:39:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AB33FF188
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 01:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E02B3005AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 23:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FBF3CB2D2;
	Tue, 14 Apr 2026 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="jKd1dHOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E567389443
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 23:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776209952; cv=none; b=YVaFwrZR8R0Nbrzo7hPVLB5n8fALHQCR1SUaFbmKcqBCh/BT1u9sGHUpO3aDRkPz1kS9v9FyRPte5FPjcrWSkW54TbP6wByBhfl38TQpbW0JtjsQB6BYydsDIVyVzRd7a+TGVug0s6qKPR62E4qsDeD0aVwfyY8iHcP9qhvZhwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776209952; c=relaxed/simple;
	bh=ZQsOBkB1S3n0//aolM4avdvsGyqltWWjuQg9TpDOfeM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uPWQH4wLZobhVuv5LHfHjpMqNOOFTAV2GatyBhVxlxKN092RbCPLyOcErevXSoWpRFYEbfsC6LphO2oo2zwyodocj2CoCwArqT0+ZahktWuQz3Pol0ldqlnflKGEBwoHwvo2t38C/JLP9yXP2DDm/25CTFYc29GlnApj6m/w860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=jKd1dHOu; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899d6b7b073so62869696d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1776209948; x=1776814748; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xdcDizxUzZtD3adFCvdchJhJRQ2hD09xTn0vHjtmQjM=;
        b=jKd1dHOu8CUFco7qVVWGRl5mBx40cygBhTdsm1y5zcT2TZgT5p72fpNiJUhY0XcBAK
         qfuM6d2pesrt56hgSRWt4wnnWPrKoAjncqvgPr1KF+kB7z5ITjeUqovogWQ2an3I2AsH
         +BgLVtA/1YwsYmkfSvFKpf2ksqtco007lEGXCWQi/n4hlxwy3BuS75rKHtuOE0k1S+91
         mTppkSzayK48PfHHbiB5QcssB4sGuHDfq1QhkLaZaokPLhKnmNYeknO6o7u5d7T6isR7
         7e4fHNdOHW/iNft/GtB+o8hgfvAShhTBn6+B4DHkNOMzvGogXsgsNR6/RLbyHzHEDvsY
         X2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776209948; x=1776814748;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdcDizxUzZtD3adFCvdchJhJRQ2hD09xTn0vHjtmQjM=;
        b=jv4B6fDibs3KyE+/gYK7DBeHsGu8Pgal7YF5kmfp5dS7IvHXY6vc0TdnbceclIKcy9
         fwg5zWoF7IeUgFyd+z4YNm38+6CTIqcHKoWsgnKVV6zohWPQFMK3iniSZffbzv3Ns69F
         8ZaGTrmXSrLzNu/mt80Le0pY71G+XHF/78aR24NZfOV6ToohtImoixwrQoyum2xjEg94
         GpX4rfB0y2TmlhN9eUPuYcxyZ/WBUvGw4SPM98gb11NxU4kKuafqEX5PUjPwYQnOsV/E
         YTgUSDlLQB2pxbDv7KknjuR66YriSeMoIZgQiYZiAo2todJy3KloeDy+U8QBgVmgJOH6
         bjHA==
X-Forwarded-Encrypted: i=1; AFNElJ86xm/sL3TzPlJiuDUKg6sR3K/Prm1o3rya5e+mli/hYHGqyXWvGuJ820Hqn2METG6P+YX+FSTqpVcTtM5A@vger.kernel.org
X-Gm-Message-State: AOJu0YyCf2wv2chqJMUriTt0JChKWOjeEnrQinR7AMPNq8Wb8E9ZyQaw
	FAqoJUgwLzMTyznwCvJ82ipIKd4BcHPDVW83v0xZrDfjCNLi+47zFG0QShC8xaXATzU=
X-Gm-Gg: AeBDieuAU76OcZ5Ychw2GEDQbrwynRhDI01NHNO5lo8uz0C9JiMcR6/61KszpnS2L8m
	JG/q/oitLt6KS5GkcKI6iiKc+fGPTW48C8zOzTWE3vXn4DccWFh2aJiqQ12Wvyd+tP0UDh6X8HT
	jv6HgPb5bqP5GSh6t41s1unN300AuCduBLsulEkbOdaC2/5n1XROYZ+oDUbkPOGUrGjQJ8tgdIa
	GIQDQVScdcyexYcei79rvN1quIayM0UiNEmpCgHwXI3HOY+V03poFTZ+LZh72sFRZd78YFQvMzY
	MQ3IxA18HPhWAU8yTfFankRGO7grLM534A7AtHfggZko0QzsP5WBJIg9a28XnEBrNGKVC/607GS
	M+YcZ3RQm62nHT7SvXRJWGkfdn8vu8wZrMcVoCPxzbugDbMV1xlVJmYQiSFrFJ2mysea0CFdhBj
	xMppX+AqkmJdBAaoljm18HDDKoeFPjqrIe8uB1pJE=
X-Received: by 2002:a05:6214:2503:b0:8ac:b204:3238 with SMTP id 6a1803df08f44-8acb20435f5mr139156866d6.30.1776209948439;
        Tue, 14 Apr 2026 16:39:08 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8aca5222c8esm93751436d6.28.2026.04.14.16.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 16:39:07 -0700 (PDT)
Message-ID: <5d9c38edcfa4faffdf9d02a318f87355a5c9a021.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 4/7] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vishnu Reddy	
 <busanna.reddy@oss.qualcomm.com>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 14 Apr 2026 19:39:05 -0400
In-Reply-To: <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
References: 
	<20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
	 <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
	 <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
	 <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
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
	protocol="application/pgp-signature"; boundary="=-CdX+pDs4e4UxKbXGxFhm"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-103224-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ndufresne.ca:mid,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: D8AB33FF188
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-CdX+pDs4e4UxKbXGxFhm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 10 avril 2026 =C3=A0 13:59 +0200, Neil Armstrong a =C3=A9crit=
=C2=A0:
> On 4/10/26 12:10, Vishnu Reddy wrote:
> >=20
> > On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> > > Update the gen2 response and vdec s_fmt code to take in account
> > > the P010 and QC010 when calculating the width, height and stride.
> > >=20
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > > =C2=A0 .../platform/qcom/iris/iris_hfi_gen2_response.c=C2=A0=C2=A0=C2=
=A0=C2=A0 | 19
> > > ++++++++++++++++---
> > > =C2=A0 drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 21
> > > ++++++++++++++++++---
> > > =C2=A0 2 files changed, 34 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.=
c
> > > b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > index 8e19f61bbbf9..d268149191ea 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > @@ -542,9 +542,22 @@ static void
> > > iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_ip->width =3D width;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_ip->height =3D height;
> > > -=C2=A0=C2=A0=C2=A0 pixmp_op->width =3D ALIGN(width, 128);
> > > -=C2=A0=C2=A0=C2=A0 pixmp_op->height =3D ALIGN(height, 32);
> > > -=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].bytesperline =3D ALIGN(wid=
th, 128);
> > > +=C2=A0=C2=A0=C2=A0 pixmp_op->width =3D pixmp_op->pixelformat =3D=3D =
V4L2_PIX_FMT_QC10C ?
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(width, 192) : ALIGN=
(width, 128);
> > > +=C2=A0=C2=A0=C2=A0 pixmp_op->height =3D pixmp_op->pixelformat =3D=3D=
 V4L2_PIX_FMT_QC10C ?
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(height, 16) : ALIGN=
(height, 32);
> > > +=C2=A0=C2=A0=C2=A0 switch (pixmp_op->pixelformat) {
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_P010:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].by=
tesperline =3D ALIGN(width * 2, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC10C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].by=
tesperline =3D ALIGN(ALIGN(width, 192) * 4
> > > / 3, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_NV12:
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC08C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].by=
tesperline =3D ALIGN(width, 128);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].sizeimage =3D i=
ris_get_buffer_size(inst,
> > > BUF_OUTPUT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 matrix_coeff =3D subsc_params.color_in=
fo & 0xFF;
> > > diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
> > > b/drivers/media/platform/qcom/iris/iris_vdec.c
> > > index 719217399a30..ca0518c27834 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> > > @@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, str=
uct
> > > v4l2_format *f)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt =3D inst->=
fmt_dst;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->type =3D =
V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_m=
p.pixelformat =3D f->fmt.pix_mp.pixelformat;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.width =3D=
 ALIGN(f->fmt.pix_mp.width, 128);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.height =
=3D ALIGN(f->fmt.pix_mp.height, 32);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_align =3D f->fmt.pi=
x_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC10C ?
> > > 192 : 128;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.width =3D=
 ALIGN(f->fmt.pix_mp.width, codec_align);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_align =3D f->fmt.pi=
x_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC10C ?
> > > 16 : 32;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.height =
=3D ALIGN(f->fmt.pix_mp.height,
> > > codec_align);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_m=
p.num_planes =3D 1;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.plane_fmt=
[0].bytesperline =3D ALIGN(f-
> > > >fmt.pix_mp.width, 128);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (f->fmt.pix_mp.pix=
elformat) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_P010:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
mt->fmt.pix_mp.plane_fmt[0].bytesperline =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(f->fmt.pix_mp.width * 2, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
reak;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC10C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
mt->fmt.pix_mp.plane_fmt[0].bytesperline =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
reak;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_NV12:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC08C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
mt->fmt.pix_mp.plane_fmt[0].bytesperline =3D f-
> > > >fmt.pix_mp.width;
> > In the removed code, bytesperline for NV12 and QC08C was aligned to 128
> > bytes.
> > In the new code, Is that alignment missed or not required?
>=20
> The alignment is done right before:
> 	codec_align =3D f->fmt.pix_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC10C ? 19=
2 :
> 128;
> 	fmt->fmt.pix_mp.width =3D ALIGN(f->fmt.pix_mp.width, codec_align);
>=20
> calling ALIGN(f->fmt.pix_mp.width, 128) again is a no-op.

What typically other drivers do is implement a static table that associate =
a
v4l2_frmsize_stepwise to each format, and possibly per HW generation. And t=
hen
uses v4l2_apply_frmsize_constraints() to apply them generically in their
try/s_fmt functions. This make lot cleaner and clearer code then the sate o=
f
this driver.

Nicolas

>=20
> Thanks,
> Neil
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
reak;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_m=
p.plane_fmt[0].sizeimage =3D
> > > iris_get_buffer_size(inst, BUF_OUTPUT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->buffers[=
BUF_OUTPUT].min_count =3D iris_vpu_buf_count(inst,
> > > BUF_OUTPUT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->buffers[=
BUF_OUTPUT].size =3D fmt-
> > > >fmt.pix_mp.plane_fmt[0].sizeimage;
> > >=20
>=20

--=-CdX+pDs4e4UxKbXGxFhm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCad7QGgAKCRDZQZRRKWBy
9OTVAQDjDrJmAqZEOXX8SZYq68g2MLgk/zHNCSipt8K3Kenp/wEAh/Y/BbqAEvAn
GwHnpqw/pVb+Q+MkJnLervpmdFlT6AY=
=itdH
-----END PGP SIGNATURE-----

--=-CdX+pDs4e4UxKbXGxFhm--

