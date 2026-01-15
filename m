Return-Path: <linux-arm-msm+bounces-89214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E7D24C62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 14:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A22D13000DC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 13:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DC6395D8F;
	Thu, 15 Jan 2026 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="fUex6e6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AD33FE00
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484535; cv=none; b=APDtCkxH55PrYC++v0vb9XYkHZ+cFgGOojfY0amScgyt6inPk93aHwmslQuv/Uwp8mYKAgTQtfZGZ6iWajKoThp9lgY4tuC2f9wy2u9mrFha2EzFO6QF9Zh7EcpCXU9kl3Tz1TvVoa44ryQ8oR4wGCqPxmiU291NOvJkLIuPhUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484535; c=relaxed/simple;
	bh=8gIjZ7CpcEN3NUIo6K9AzSKtoz6K+4ZtF6WMP7i1yw0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uShggqeNZ6zuWd+iogF1LuwB7odRuselbMPaH9+dVSeoNJ8bYl13Hhh9EiNg4I9nquTfqVKvbapvb4n8AjZmmU74nFw71uZiI/0OBCUie8EIN8u1r+A75WJc2MnpmSsLgs4+mIlLmpbdPs+A+V4r1KB7C/jEYdv9OMZTJQqTvfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=fUex6e6t; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a35a00506so13813016d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 05:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1768484533; x=1769089333; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8gIjZ7CpcEN3NUIo6K9AzSKtoz6K+4ZtF6WMP7i1yw0=;
        b=fUex6e6thmtI9qVnpvCt3L0CcpwN3UVRbH2zzSkjFkmBW6f/BcXvjhoQQRyO29Zrvx
         cd7SExrzLdXFcg1Cf/m5mxksMjsbXIixCCHCUTxUzaC9q653FFlJyXy4adQuU05z5Zm+
         8xjA5jiDjBQojo+MRCTGjuroKZoIItHKqF1e488IxYK4fzYnchBe/Z5zhop52FuO0DWc
         7epzwmfFNj0vYY05or4ZrgaernFjyjKOdT6zM5lbfNn8/nLXp6BcuyTFPkTxcMXpsc5k
         0ZdxDszKeAywxxCwrU62MUE1iBBohSXV5DyHoOGY0uSYqaPuW4TtusA7U64DG9+4jurW
         +sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768484533; x=1769089333;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gIjZ7CpcEN3NUIo6K9AzSKtoz6K+4ZtF6WMP7i1yw0=;
        b=wcSwQw+PzVOs1ivFRJYm32m+GytcX3uZpEIWKHz1YmamB9O7ZAKnWf06/V2TAcqgwg
         JLn8GPHQAIsK80i5ugsmbis5AfzzEisJHshyamDg4IW00kcEsRdrbu2/ep3Goh70VR0p
         0PKPXk/T6ZDMLZHz08aFC9bIbyZXNuUvdPRZEKS9m0/H4FFIsaYBqVyMUHmT/ORrCMxb
         YSzgKKJk8WvvMX9fLfKNsTStWCu3aLILtLbTBTAdJE5FNyzn3HJfhf3QZbAOgb45RWsJ
         Iadk3xFUKK/g3q0VSqllzjAqefwr8A3JU5YnegHXeq4IYvatptt2gJWX71pPT2K4vAMy
         5W6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTfDlVisQCuvMnuDK+EWZ0acl7Z+bzHAV1g9SdUYeUZ11hfOVawDrNiOehHeBNBqcWfPaHDhqkKi/5+TyH@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLlnKIUP7nuGBlbLq+Q69HxRWHkMlv1qFWOhrg6QuebrCf9dz
	8ho20bD6cBhdKQwv7x3PNfo5FOqLrSQpJHRE65yWXucCukh8nRMzyUVuWZ6pHzDUjnQ=
X-Gm-Gg: AY/fxX5nrIBsmwiH/PS98uDU+cNy0g5VoZ8dTLy2KV6VUZ2Ony9MhRhphJi6U57q0UV
	lNu9FoMA0W8fwgv78o2B0TfKa8NfxFnLtTVU7heUK35l8/Pzi5jGwHJ6mB935LdgRm5tIwI4fOm
	BgYRbPVG+UCEm28r3/yHMAcv8rgA57Afh0XZ8k8g5hTyYxhukzhRZQl8fuNgzZmXSAb0LReFwes
	R+mZ4vfKOlK31PGShKQeSmMJIC3o8cEE1W132wQtkNd1nTFAWofl2p0/WdjQA9OAx+2hewL1cnY
	1h5NtRO7rtXpOYj9qC4P4gT6GAVpFXoSTu21J+FmOqXUj5a63RPNfMN6Kpm3aYKndpgYh4KXYo7
	TwpHjl6HtIh38oX8NPXINU6cN+4QMVvPWJTscuSPLs9c6TkPFy7W7We2JERmjTU0OVKIMGcHkmP
	fUiX8982le/bD+otbG
X-Received: by 2002:a05:6214:27e1:b0:892:670e:e60c with SMTP id 6a1803df08f44-8927442d37dmr97931536d6.68.1768484532608;
        Thu, 15 Jan 2026 05:42:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e202esm195812506d6.14.2026.01.15.05.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 05:42:11 -0800 (PST)
Message-ID: <6b5746cd16edf589fca79e2e6f8cf7f706309815.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Thu, 15 Jan 2026 08:42:09 -0500
In-Reply-To: <d7b2d31b-e643-43cb-8f16-9568944222d6@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
	 <abb850223d81708588c594cfeee9e0fdbc1193e8.camel@ndufresne.ca>
	 <d7b2d31b-e643-43cb-8f16-9568944222d6@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-K2jQ5CqlwefA2eR02Jn/"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-K2jQ5CqlwefA2eR02Jn/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 14 janvier 2026 =C3=A0 14:14 -0800, Deepa Guthyappa Madivalara =
a =C3=A9crit=C2=A0


[...]

>=20
> Thanks for the quick comments.
> Qp map for can be too much data to be sent from user space to firmware=
=20
> via control per frame.
> Ex: Avc has mbsize as 16 and the max mbpf iris driver supports is 8192x43=
52.
> This would mean 136kb of data (8bit Qp) needs to be transferred for each=
=20
> frame in worst case.
> While are still evaluating Qp map option, due to firmware performance=20
> issues we are
> gravitating more towards rectangle ROI.
> I am not sure if we will need to support the Qp map in the future.

Have you read how this is implemented in Vulkan and D3D12 ? Please have a r=
ead:

- Vulkan Video, see quantizationMapTexelSize [0]
- D3D, see QPMapRegionPixelsSize [1]

[0] https://docs.vulkan.org/features/latest/features/proposals/VK_KHR_video=
_encode_quantization_map.html
[1] https://microsoft.github.io/DirectX-Specs/d3d/D3D12_Video_Encoding_Text=
ure_QPMap_DirtyMap_MotionVectors.html

Note that D3D also support dirty regions (what you call ROI in this proposa=
l),
with no limits, since these are translated into map by drivers (its a softw=
are
feature on top) and motion search hints, that one seems rare.

I'm not against having ROI in our API, its common in older chips designs, b=
ut
its clearly going away in the long run since most fixed hardware impose ver=
y low
region count, which is not usable for modern application. ROI it trivial to
implement on top of QP maps.

A typical use case for that is to use lightweight AI or traditional CV to l=
ocate
most relevant portion of a video. The result is more like a heat map, not a=
 set
of rectangles. Then we roughly map that in a low granularity QPMap before
encoding. This allow maintaining very low bandwidth, while preserving the
information needed for the heavier processing in the cloud. I'm including o=
ne of
the many example of that, this is a talk from Spiideo [2].

[2] https://gstconf.ubicast.tv/videos/region-based-compression-in-gstreamer=
/


regards,
Nicolas

--=-K2jQ5CqlwefA2eR02Jn/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWjusgAKCRDZQZRRKWBy
9Ju5AQCQIMovRMofOu4DeumIzOJgv+Yv0QGnzQcFyvOtvKXi5QEAtAtjUj1LXu3A
gawrKZXxACjQSeAyUMVObXR/JjwRSgs=
=/K4y
-----END PGP SIGNATURE-----

--=-K2jQ5CqlwefA2eR02Jn/--

