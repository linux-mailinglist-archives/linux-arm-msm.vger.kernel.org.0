Return-Path: <linux-arm-msm+bounces-66803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0B3B130F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 19:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB2D33A44D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 17:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B471E5B7E;
	Sun, 27 Jul 2025 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="qlMwJQHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB4610D;
	Sun, 27 Jul 2025 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753637645; cv=none; b=ev+IF2PNYSEwNzJ6Zhq4PXuCA6qGvO32XOLqUG9eyYLyQ8evHBOhpkMxrch8O3nOKB5xWrGwFDyy3WflEDQoe4J2q8B3/e2xE8aTGjBX5BnNs2hvdVrsgulWhtu1oFNpeHeZ5J9wHqtxmK6ksB0lv2GKMMSAUzS91TW88zls+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753637645; c=relaxed/simple;
	bh=xuNLFOQWKxB9sop7LNDg3r7Q0QFBQfgq5ZLLennKUBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7fL5ZVDgBNcDDJQkH3ghrbrSpExfAmMCZjlIoKtuWSxvmxLerV82kCB4NUA3kRchS88nayJUD6GNJq+1LnkIlNRTR7s27CrRFRn0hDq1LrrfPMyPQnAGy48FCb3r8Udg8grImn1g97uA0cSQyQg0mjz4MaW03lsf8OZjDFyM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=qlMwJQHP; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753637640; bh=xuNLFOQWKxB9sop7LNDg3r7Q0QFBQfgq5ZLLennKUBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qlMwJQHP65fJMG0cufCveK+7XMo0okvhjLYVvAHYxLSEOKf0OqTDajmjVKD3ax/wM
	 XAYQYqYaT19Wu72bWCsPtNXIFqJhQTBTy6MhnGd2X49yDK//k2iAAuCtrQZx7KI4Nr
	 6zUWdrfPMDM6TZvNWERqlWQg5jGnvKS+cy9HUwV8=
Received: from [172.24.215.49] (unknown [185.102.219.57])
	by mail.ionic.de (Postfix) with ESMTPSA id 1D4CC1480AF7;
	Sun, 27 Jul 2025 19:34:00 +0200 (CEST)
Message-ID: <19b393bf-6ba3-406b-8b5b-48a60e5aa855@ionic.de>
Date: Sun, 27 Jul 2025 19:33:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
To: Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
 <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
 <20250727144014.GX1367887@horms.kernel.org>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <20250727144014.GX1367887@horms.kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MN1VB316uqi3ZXTLfwfRi9ro"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MN1VB316uqi3ZXTLfwfRi9ro
Content-Type: multipart/mixed; boundary="------------h0nmMiWzcsjrt1x9mKWbiDK4";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <19b393bf-6ba3-406b-8b5b-48a60e5aa855@ionic.de>
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
 <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
 <20250727144014.GX1367887@horms.kernel.org>
In-Reply-To: <20250727144014.GX1367887@horms.kernel.org>

--------------h0nmMiWzcsjrt1x9mKWbiDK4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiA3LzI3LzI1IDE2OjQwLCBTaW1vbiBIb3JtYW4gd3JvdGU6DQo+IEkgdHJpZWQgYWdh
aW4gd2l0aCB0aGUgbGF0ZXN0IGhlYWQsDQo+IGNvbW1pdCAyZmIyYjkwOTNjNWQgKCJzbGVl
cF9pbmZvOiBUaGUgc3luY2hyb25pemVfc3JjdSgpIHNsZWVwcyIpLg0KPiBBbmQgaW4gdGhh
dCBjYXNlIEkgbm8gbG9uZ2VyIHNlZSB0aGUgMXN0IHdhcm5pbmcsIGFib3V0IGxvY2tpbmcu
DQo+IEkgdGhpbmsgdGhpcyBpcyB3aGF0IHlvdSBzYXcgdG9vLg0KDQpFeGFjdGx5ISBUb2dl
dGhlciB3aXRoIGltcG9zc2libGUgY29uZGl0aW9uIHdhcm5pbmdzLCBidXQgdGhvc2UgYXJl
IGFjdHVhbGx5IA0KZmluZS9pbnRlbmRlZC4NCg0KPiBUaGlzIHNlZW1zIHRvIGEgcmVncmVz
c2lvbiBpbiBTbWF0Y2ggd3J0IHRoaXMgcGFydGljdWxhciBjYXNlIGZvciB0aGlzDQo+IGNv
ZGUuIEkgYmlzZWN0ZWQgU21hdGNoIGFuZCBpdCBsb29rcyBsaWtlIGl0IHdhcyBpbnRyb2R1
Y2VkIGluIGNvbW1pdA0KPiBkMDM2N2NkOGE5OTMgKCJyYW5nZXM6IHVzZSBhYnNvbHV0ZSBp
bnN0ZWFkIGltcGxpZWQgZm9yIHBvc3NpYmx5X3RydWUvZmFsc2UiKQ0KT2gsIHRoYW5rIHlv
dSB2ZXJ5IG11Y2guIEkgc3VzcGVjdGVkIHRoYXQgSSdtIGp1c3QgbWlzc2luZyBhIHNwZWNp
YWwgc2NyaXB0IG9yIA0Kb3B0aW9uIG9yIGV2ZW4gYWRkaXRpb24gdG8gU21hc2ggKGdpdmVu
IHRoYXQgRGFuIHNlZW1zIHRvIGhhdmUgcmV2YW1wZWQgaXRzIA0KbG9ja2luZyBjaGVjayBj
b2RlIGluIDIwMjApLCBlc3BlY2lhbGx5IHNpbmNlIGl0IHNlZW1zIHRvIGJlIHNvIHdpZGVs
eSB1c2VkIGluIA0Ka2VybmVsIGRldmVsb3BtZW50LCBidXQgbm90IGEgYnVnIGluIHRoZSBz
b2Z0d2FyZSBpdHNlbGYuDQoNCg0KDQpNaWhhaQ0K

--------------h0nmMiWzcsjrt1x9mKWbiDK4--

--------------MN1VB316uqi3ZXTLfwfRi9ro
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmiGYwcFAwAAAAAACgkQH9Yu2W4lOofA
xxAA0q/PFb1UUD6aj2S4/mQfcCGxu+bwvG/NwsAZL70XC0JBF4OjIAdmLQytzRJLBv5Rm34T3eB4
9Uo4DEs31izz+jMpmqYKwPJy20it8+JAkjqJDTIt2FINNZG2p9rKkcMTgndKT6O5HhATFjFmtnou
OK59kBDCWPT+6fBB4v5SyHu17U8H5+sSWa8IzKX0rm8ts4RUGLpVBA530Ag6t0fLr+LS2dhudxRq
cTFjXKZM6+VqOgn2CF4JXrUM9gDLSRrYxKymln90nRLdIxx6a5xU/yqDXooaaq7RJzgRKXokXFto
aLSDkSQv+sLHQNQzt/RbgWTo76kDAv7g96PqrXI6yamgGNi0gljx3k+YKniBwOD7MZZa8JU6Hatc
045eFgoUKCHVrdHqw2ISSGwfLCJQwxPRfCDbDY0myr5TdGWcHTnwjQdfJJmKX2thRnn2cby5PJ9F
WM3Fz8VtyasYTy3o9+r3LfCTYaAF0REUK/3M7XVbSbhpY9kR36ov1YLffwiMy3zRlY/7EjPWce2m
oQq2TdbP3sTpJC6yW38nGsONCWjTlU3an/gr36Uw38IRqp8JpG/BPMdm6l3jTmo/C1ZXxFgs9l6H
Ik8wBzYuPD83QiPJiWjTFvHmMPGPVjU8+KMhvlkiaaNiz5bj0gvh9A8T/oTG5K1XxWeD6JiY8hoq
pIA=
=dwe+
-----END PGP SIGNATURE-----

--------------MN1VB316uqi3ZXTLfwfRi9ro--

