Return-Path: <linux-arm-msm+bounces-89216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25986D24DF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21C66301395B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 14:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19EB3A1A36;
	Thu, 15 Jan 2026 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Rmh/KQzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C33A0E85
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485734; cv=none; b=QQmNEJa+iPUEUPPvP/IjOB3fSHbR6LCEQIzbyW8q92LZL1s2+yGUJh7y8gY7gw8YNmbZDajqHWAsMy3H6FIGoOoMj/9MotyC1VqsmcPKaiJZoZaC0lbqKlXNcB1w4ggfs2MoNXAaxkotXLbpQcSd6Ghqkis7p42VBJUNKhVouKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485734; c=relaxed/simple;
	bh=mkebdjfvUNSZgRJJe+5p7S/ViqNXWJxR/XbMtIkcIGo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KJteAIeiWL15slou6ryxITtxnPTWrYDfoc6zOUPDVvJYiMN26+2iGYuf+XpHe2hS0VBEpRerGI7MZR7fnIEiwh8zrUvGTpQc805nkdsU+tXTam2sN7NJetgCCAuV2a2DI+PvrpXj2+1ar0+FwAx4D+/qXEIOde5wzAtkdGcIkXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Rmh/KQzc; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a32bf0248so6875476d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1768485732; x=1769090532; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mkebdjfvUNSZgRJJe+5p7S/ViqNXWJxR/XbMtIkcIGo=;
        b=Rmh/KQzc/jAcQm6x2s9qgYfO0mTKVryr9duyHWRNPRQCGzkadBm6znthc1URe1y4/1
         eMkc2+zbe+K3RYhcLdlPpe/SoxN2KD2wryIQ7LLss5/8NosfdJXKtHJIvzl+kfEJx+xN
         DCdM1f0FrpnHxu0K2N4EIisMSB3f4NQuPPpfaffPznAopa7qx7T9Agk+6NZFnLqr/gHr
         nKy9/taKzlnFrn66UWCn2JT5vQGb3NVMAA3qNRhEXfgS8dh9h6ahLJsuCCCno+GNBOPH
         T3aqhVjbdTd0d1vaXoQaoPGSv67mT9gKrnpsdVIOAL/k5f60zm1EKvTk8hqux6KgLkn0
         pp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485732; x=1769090532;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkebdjfvUNSZgRJJe+5p7S/ViqNXWJxR/XbMtIkcIGo=;
        b=ch2Ql/+DDNZPJB2y/i5qpZF1ZOt5SYdile+Rdw1knKU3n/vokqZTOx5IjhhhWvy67E
         /hMYnPum/e8xXFtFyOht/9IBBl/yatvDjLJIynXviYB8l4k3sTTJG1JaiYxjhHf6RST1
         sztsxw11CMp6aMQWbAiUqVhSk8L8dDfPv/AfPue+1SKm57UlkubBQm320TY0g3GVzfeC
         W4gVrui72pVEz+AExi9TuU/oq4lGNjUbe7xSFFLfl7WNB8y5mFHWVqpKb1UKSrEL2QoU
         JZh3ciEspfnukiDzdGpgK/322flaANTQSaznW9yAn3On3RWUmiCOA7d8Y3vGsoBN/XRg
         amEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV54z+9KljXctowutzpHrllErgz7UHp25tZCQRAaMD0rGV8tuBP0C5YhjUNb7A3zyUItNrrIDcbLnoKR4QU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Ohw447PllgpbSV3Lvci59j9FqsWFWgM4jkrhdq0ZSpS0qfK4
	XPd49mZ9EbGaRiEIV5mVBZu1NjXK7F59z3X//OhnCO/5FqHWRPVCblOvNQEFr8LpmI4=
X-Gm-Gg: AY/fxX4yqCikVuTxultZDd79UGxLEBmrHuyVPdf3axx5dAhhlZmN1UKG6aHz8rERaso
	YRjxaijd9YyuYmkYQ7IPoSO9ycZiH1eTMksuZQTjTtsLFpnWWHLE770ie5QRyVwxGBFzZ+zGueI
	FRCyB+zpBPF3QfJ/t8khztJpcwhuLHsrKLHfY/8W54yIewy3ZMoFzox0a2g+TcncHtXnoIZRTOe
	YwBqGUNTcOP1A9IQ8l4bZvTDmFU65Ap5HdwS4p4tk9w1qX4wkJINrL4D9FMcenMfOfVa7utzDf+
	di+pBQJIGN0HQ1WJTwBvVhZIfxDNr0Ies2HWIrwPyQnwfEEtMWWx3X+TPXbhUvuU6yyFJm7vPkl
	QBNFkasHNp7S7D3UjjSzwz8Ay6q+d4UbHA2w9c6Wq1O+Da2Yll/vWawcf4rtv/L9qB2vM9LEiHo
	yL1WCJx902cj2BEXs9
X-Received: by 2002:a05:6214:10c2:b0:785:aa57:b5bb with SMTP id 6a1803df08f44-892743cfe92mr64172606d6.43.1768485731419;
        Thu, 15 Jan 2026 06:02:11 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9f5aasm395158685a.21.2026.01.15.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:02:10 -0800 (PST)
Message-ID: <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dikshita Agarwal
	 <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar	
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 09:02:07 -0500
In-Reply-To: <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
References: 
	<20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
	 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
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
	protocol="application/pgp-signature"; boundary="=-SuVcRe6JDVhxJkp0/xej"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-SuVcRe6JDVhxJkp0/xej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 15 janvier 2026 =C3=A0 10:08 +0200, Dmitry Baryshkov a =C3=A9crit=
=C2=A0:
> On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > Add support for the QC08C color format in both the encoder and decoder=
=20
> > paths of the iris driver. The changes include:
> >=20
> > - Adding QC08C format handling in the driver for both encoding and=20
> > decoding.
> > - Updating format enumeration to properly return supported formats.
> > - Ensuring the correct HFI format is set for firmware communication.
> > -Making all related changes required for seamless integration of QC08C=
=20
> > support.
> >=20
> > The changes have been validated using v4l2-ctl, compliance, and GStream=
er
> > (GST) tests.
> > Both GST and v4l2-ctl tests were performed using the NV12 format, as=
=20
> > these clients do not support the QCOM-specific QC08C format, and all=
=20
> > tests passed successfully.
> >=20
> > During v4l2-ctl testing, a regression was observed when using the NV12=
=20
> > color format after adding QC08C support. A fix for this regression has=
=20
> > also been posted [1].
> >=20
> > [1]:
> > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.a=
garwal@oss.qualcomm.com/T/#u
> > =C2=A0
> >=20
> > Changes in v2:
> > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > (Bryan, Dmitry)
> > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > - Link to v1:
> > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11ed=
afd8@oss.qualcomm.com
> >=20
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > ---
> > Dikshita Agarwal (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for HFI_PROP_OP=
B_ENABLE to control split mode
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for QC08C forma=
t for decoder
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for QC08C forma=
t for encoder
> >=20
>=20
> Looking at the series again... What is the definition of V4L formats?
> Are they expected to be self-compatible? Transferable between machines?
> In DRM world we made a mistake, making use of a single non-parametrized
> UBWC modifier, and then later we had to introduce OOB values to
> represent different params of UBWC compressed images.
>=20
> So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> should we have different format values (at least for different swizzle
> and macrotile modes)?

Our expectation is that the decoder will produce the same format regardless=
 the
resolution. And that format should be shareable, so that same format coming=
 from
two drivers means the same thing without out of band data, except that
resolution and strides are needed oob anyway and can obviously be used as a=
n
acceptable workaround the issue you describe. It should also have a single
translation to DRM fourcc + modifier, and hopefully the other way around is
possible too, otherwise its a bit broken and unusable.

So bottom line, since V4L2 does not have modifiers, you have to treat one V=
4L2
format as a pair of DRM fourcc + modifier. Decoders typically only support =
a
subset, or hardware engineers can generally pick a handful of performant
configurations that works for all cases (its all 2D with similarly sized
macroblocks). Since these formats are only usable when consumed by GPU or
display controllers, its important that all party uses the same convention =
for
the limited information available.

Nicolas

--=-SuVcRe6JDVhxJkp0/xej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWjzYAAKCRDZQZRRKWBy
9NHdAQC5zVxUrA0j3qXnoLE4o2clAaoEaw5nwUgVFbmIokPgOgEA00HZmP6ttFY1
awXTgDpAWi4QX7nSzx2DLiass5x7rAE=
=MTpT
-----END PGP SIGNATURE-----

--=-SuVcRe6JDVhxJkp0/xej--

