Return-Path: <linux-arm-msm+bounces-90806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOb1AwfbeGmwtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:34:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301096CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53CCD3271AA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30E735EDB6;
	Tue, 27 Jan 2026 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Ch0BRNRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1680335DD13
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526616; cv=none; b=hLV9CIqisD9h88LrP69+A4v388i69jG4A9eoOWwXnEt1R15R0pEZbY6dqEMZ6r0ut8XiRoHUOnedguL0ZeZrLdyfmgOvkA8e14Eb3Iu14pZF5zvhQZedkX4kTPHEhua8XdGI5NDCGSzNocJsx5qqbnt/1YgVwbHC8v89VGmCAXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526616; c=relaxed/simple;
	bh=V2NzastbFhpzOzHM5nA+miN7xKYKTp/1Xy8T6Y+6Cv0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p/HNGjOTk6i4pubWWEmUcgu0HCAEzSmUUc9SMEAxl5sjV8BjF3+n5D3ojs0P32Naf5y4KN0owp11p8REHyEFkAaQ6CAztm4IFOYY/kRIULi6xbM3ECDDzpk5Y1JDiQYktvGkecFckPOeDtiIeabq7/nTLx/cYdr22/BkziuFn3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Ch0BRNRo; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-502a4e3e611so51666741cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1769526612; x=1770131412; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OhCrE4/omd3Aqh9ad+ieSaeycC5AgJDDUBgsMqT4cBk=;
        b=Ch0BRNRoFYdSILdhOygMhPXCmhuWlh/wdX5WsRTQmCgY/N6Knl0bV8zueL5ZmpoGZI
         qcyh5he21802KZJy4784amAGraXIKTALFhpKJCjASUbdHmxXXxc3W+vjapbm6TUcIStY
         //4Teim1zo5tXQqFsBB+26C1Hzi4mHwLfHaQv3vQclfXmfVTBrd/oFWODvl4xe9z0vxZ
         j8Y+pmWZIFwiPsah2AU4omDXSk2Dhsm2cFFVxkJ+R+8FbqH1IWAAuIyjGBJo338Lp1Fj
         lGJhJkOCdnYOlcSNvG4Qodil4X8X7gKJZY1R/bvRPmpe2jLk2Oxbl2pcpGrNxEr1Hue9
         X7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526612; x=1770131412;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhCrE4/omd3Aqh9ad+ieSaeycC5AgJDDUBgsMqT4cBk=;
        b=E2fozzIKX12aMPL+rTTZXl2GjVTUWGgbkMHmPnPTWsh5CRgLaC2o111xYjKrWvRkyU
         VOo7Mj3x8mYSQ5LHqaGU5cKmh64HsVGAhpQ+v3VEFWmIkdiqEKaWrPwd74I/FoP1G0+g
         o6LyhqE2buzMcyXUCuiZ2PLGZ8emFEQQqlPFQh1WdO1XY2lf+PMHWlAcu+HSGI2a3Cdq
         pQR5OM+vX66Tcr0zaplyGOE3EMkro/m+pjwGHuMDMnSnImIJZD86N0NP2kv/u9TAxxCb
         N4N+lQPunK3/lFC4LTxsUejMUvcJK8vczQiMxdysnpOLKj3jm/HAAdgPocAeyseNJXHa
         WqKg==
X-Forwarded-Encrypted: i=1; AJvYcCXvmmHzeMn6SqPTG8zJoy3Tu40ppPImS3q+ZZy62yG+3tXF1MOjlpKQfM/0ADDuX+fiZJWVJpU/uTkJjuB/@vger.kernel.org
X-Gm-Message-State: AOJu0YzSa/+XHcuezSsesbVMmLDQqGxkBuIu+S7Oakwn96PTl4x4PlaS
	fxy2+/ZQXlp87v/NS/GeialM/hzMhgqF9sE4sWDAH466oxRWQ8Im0D4ZZGyrpfE8Rgk=
X-Gm-Gg: AZuq6aJHxCtZZZkmlcJgIQSk9Aa969vRPHaQ2bRijyYIgOWCvBSS7FX+QAGIQoRgDng
	v2hzum0fHAT7fw7XMsPJJgnzMkWseZOIN5KIF7o1v729frjOh5SmPO5kC2EAHInM1Wdc+XNLxJc
	aWI29dW/rPY4+rgkneSwFczW4n2QT+uQ895SUag25FHiuXJwtKRcUlZ1gCTFYheBHDSO+CxKk16
	oelroX8WESTf0u9yJUinVJFHw8BwPwIY4sjcXz5CZH2EfKoewoFi6ZQeR/k2mpHZ8vrJs6hGzi0
	l/IvDwDKkv6Up2U3DR9RCBMzXMqJmVVk2ClH6dD28tHqNsjP2lFKekynuIWSe5PGveMMKzcwEGz
	vwA6r5uLsNjTQoc7N8Fx6fmGpPsp9tYxf2vA52ZnOosfnq61UuNUDnfKTw5NXwt0IredD2+JO3G
	obxToJeLZ5OT6vsxRp
X-Received: by 2002:a05:622a:592:b0:501:45d7:10cd with SMTP id d75a77b69052e-503301175d8mr21471091cf.20.1769526612072;
        Tue, 27 Jan 2026 07:10:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89491841640sm113651406d6.17.2026.01.27.07.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:10:11 -0800 (PST)
Message-ID: <df2d7dcc31c9a47752a1d58efdd7a416311e55ec.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Vikash Garodia
	 <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar	
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan	 <saravanak@kernel.org>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon	 <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Stefan Schmidt	 <stefan.schmidt@linaro.org>, Hans
 Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Charan Teja Kalla
 <charan.kalla@oss.qualcomm.com>,  Vijayanand Jitta
 <vijayanand.jitta@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:10:08 -0500
In-Reply-To: <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
	 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
	 <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
	 <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
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
	protocol="application/pgp-signature"; boundary="=-fIhbK5YC4Jyx7+92/gYN"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90806-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5301096CE2
X-Rspamd-Action: no action


--=-fIhbK5YC4Jyx7+92/gYN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 janvier 2026 =C3=A0 13:52 +0200, Dmitry Baryshkov a =C3=A9crit=
=C2=A0:
> On Tue, Jan 27, 2026 at 04:56:34PM +0530, Vikash Garodia wrote:
>=20

[..]

>=20
> > =C2=A0- 4 testcase failed due to unsupported resolution
>=20
> Can it be fixed?

Its nicer if you name the failing tests vectors. I can guess this is
PICSIZE_{A,B,C,D}_Bossen_1 by experience, but not everyone will guess. HEVC
level impose a limit on bandwidth, not on resolution. These files are eithe=
r
very large and small height or the opposite. One of these is just 4K in por=
trait
mode (that is more concerning). Though, there is a V4L2 limitation for this
aspect, since we advertise the resolutions by range. Most hardware is desig=
ned
to support 4096x4096, in that casse that's what you should expose as limits=
.

Though, some hardware do have dynamic sizing capabilities (like RKVDEC HEVC=
), in
this case there is not much you can do, you have to find the right trade of=
. But
since you expose LEVELs, I think its fine to overshoot a little. Both
constraints should ensure it works with valid streams.

>=20
> > =C2=A0- 2 testcase failed due to CRC mismatch

These are clear example of "no one can guess".

>=20
> Which means an error in the testsuite or somewhere on our side?

The testsuite fully pass if you run using Franhofer reference decoder. This=
 is
logical since the MD5 has been generated with it.

>=20
> > =C2=A0- 2 test fails due to session error (under debug)
> > =C2=A0=C2=A0 - PICSIZE_C_Bossen_1

Hmm, see, I have no idea which fourth one could fail due to resolution, and=
 that
forth one is likely a bug on your side.

> > =C2=A0=C2=A0 - WPP_E_ericsson_MAIN_2
> >=20
> > VP9:
> > 235/305 testcases passed while testing VP9-TEST-VECTORS with
> > =C2=A0GStreamer-VP9-V4L2-Gst1.0.
> > =C2=A0The failing test case:
> > =C2=A0- 64 testcases failed due to unsupported resolution
>=20
> Can it be fixed?

Check if you aren't mixing up constraints between display, coded and alloca=
ted
resolutions. On most hardware, all 3 can differ. The OUTPUT queue should ei=
ther
not care at all, or use it to allow optimistic pre-allocation. But check th=
at
the low resolution constraints is not coming from the OUTPUT queue software=
.

VP9 coded resolution, it always at least 64x64.

>=20
> > =C2=A0- 2 testcases failed due to unsupported format
>=20
> Hmm?

Clarify please, I suppose these are YUV444 (aka professional profiles).

>=20
> > =C2=A0- 1 testcase failed with CRC mismatch (fails with ref decoder as =
well)
>=20
> Could you please raise an issue against fluster?

Check your setup, it fully pass with reference here. The MD5 has been gener=
ated
using the reference.

  ./fluster.py run -d libvpx-VP9 -ts  VP9-TEST-VECTORS

It also fully pass with the GStreamer wrapper, though it had been fixed in
recent GStreamer versions (I'm testing with 1.26.10).

>=20
> > =C2=A0- 2 testcase failed due to unsupported resolution after sequence =
change
>=20
> Can it be fixed?

This one can't be fixed without adding an extension to the V4L2 Stateful De=
coder
spec, like we did for the stateless decoder spec. In order to handle inter-=
frame
resolution changes (a resolution change on a non-keyframe), you have to not=
ify
userspace with the new resolution, give it a way to read back this solution=
,
have CREATE_BUFS() support to allow allocating for that new resolution with=
out
going through streamoff (to avoid looking reference data), and finally, a w=
ay to
remove buffers that are now too small (or too big if userspace wants to red=
uce
the amount of RAM used) through the new DELETE_BUFS ioctl. You also have to
track in your driver the reference buffer resolution/stride.

This is non-trivial with the existing stateful state-machine. You have to m=
ake
sure userspace won't be confused between normal DRC and inter-frame DRC (dy=
namic
resolution changes).


[...]

regards,
Nicolas

--=-fIhbK5YC4Jyx7+92/gYN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXjVUQAKCRDZQZRRKWBy
9K0kAQD0MAxPQbBuvjXyEOQ54AGTdA6LiPXI/V2NXsiuOOyzsQEA0zSjwWpUUgI8
OAbqxNRQbDIJW1n1zkHysWn/LRy5NQI=
=TSG9
-----END PGP SIGNATURE-----

--=-fIhbK5YC4Jyx7+92/gYN--

