Return-Path: <linux-arm-msm+bounces-66788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A632B12FA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 15:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F5216AC98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 13:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EFA1F5847;
	Sun, 27 Jul 2025 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="Ok/jC0Oi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200011185;
	Sun, 27 Jul 2025 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753621791; cv=none; b=LU06qBnqo1IE2Ds2NrmF5O0iNPDa5vwAOA8+0hgHiopSQkaKQnb/EOgrjtFj77pH9zBfRFI9MNZK9mXJDAnd1rRkF8UGixFlMJugyGqqPO9SCFby5FnV0D0j39Og4qjJLENpXNp3Zp0jfApPcrpWp86ezk4kG1LNxGXiDL8SUXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753621791; c=relaxed/simple;
	bh=I5Z2QClN5RPATht/z9FcUBBM0IejBZrF2BYOLP5CdJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5o1841QuPxEVLN4Su+E6fyuSQ06cbsdt9aPbISGpxLhRmrtceExwyw5cL2LlPmFHrA9cR01o4Q5bb+YJk7k1GO9oLxz8zL4vck154DUpY528h+ri/3A8aI1G+AsrKgYLcLief8g+/29izmuoWXydvGFwuQFCkS5mm1CkhwUwBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=Ok/jC0Oi; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753621779; bh=I5Z2QClN5RPATht/z9FcUBBM0IejBZrF2BYOLP5CdJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ok/jC0OiuOwtiAL8rS/kAZ9DZOTltL1bzJQZAzfZnTTXiICCSj7aGkQZJ24kkNHgS
	 F9K98fjIDBkEHgIYsYur5f478Z1E7Seg2OWW5QtfWNq3DOWfkbGVoYcEmn7uYxWxI3
	 16+KMYj0/C+uFRSXBgoxlzY1FRN5ylLRv0DXB09g=
Received: from [172.24.215.49] (unknown [185.102.219.57])
	by mail.ionic.de (Postfix) with ESMTPSA id 7D97A1480AF7;
	Sun, 27 Jul 2025 15:09:39 +0200 (CEST)
Message-ID: <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
Date: Sun, 27 Jul 2025 15:09:38 +0200
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
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <20250724130836.GL1150792@horms.kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qeYid7Fq0OznbNli2EiBuPfg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qeYid7Fq0OznbNli2EiBuPfg
Content-Type: multipart/mixed; boundary="------------B23yLLFmxhUkN2FjZt09BvXo";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Message-ID: <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
In-Reply-To: <20250724130836.GL1150792@horms.kernel.org>

--------------B23yLLFmxhUkN2FjZt09BvXo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiA3LzI0LzI1IDE1OjA4LCBTaW1vbiBIb3JtYW4gd3JvdGU6DQo+IFsuLi5dDQoNClRo
YW5rIHlvdSBmb3IgdGhlIHJldmlld3MsIHRvIGJvdGggeW91IGFuZCBKYWt1Yi4NCg0KDQo+
IFRoaXMgd2lsbCBsZWFrIGhvbGRpbmcgcXJ0cl9ub2Rlc19sb2NrLg0KDQpJdCBjZXJ0YWlu
bHkgZG9lcywgd2lsbCBiZSBmaXhlZCBpbiB2NC4NCg0KDQo+IEZsYWdnZWQgYnkgU21hdGNo
Lg0KDQpJIGhhdmVuJ3QgdXNlZCBzbWF0Y2ggYmVmb3JlLCBhbmQgcHJvYmFibHkgc2hvdWxk
IGRvIHNvIGdvaW5nIGZvcndhcmQuDQoNCkN1cmlvdXNseSwgYSBzaW1wbGUga2NoZWNrZXIg
bmV0L3FydHIvIHJ1biBkaWQgbm90IHdhcm4gYWJvdXQgdGhlIGxvY2tpbmcgaXNzdWUgDQoo
YWxiZWl0IGl0IGJlaW5nIG9idmlvdXMgaW4gdGhlIHBhdGNoKSwgd2hpbGUgaXQgZGlkIHdh
cm4gYWJvdXQgdGhlIHNlY29uZCBpc3N1ZSANCndpdGggcmV0LiBBbSBJIG1pc3Npbmcgc29t
ZXRoaW5nPw0KDQoNCj4gQnV0IHJldCBpcyBub3cgMCwgd2hlcmVhcyBiZWZvcmUgdGhpcyBw
YXRjaCBpdCB3YXMgLUVJTlZBTC4NCj4gVGhpcyBzZWVtcyBib3RoIHRvIGJlIGFuIHVuaW50
ZW50aW9uYWwgc2lkZSBlZmZlY3Qgb2YgdGhpcyBwYXRjaCwNCj4gYW5kIGluY29ycmVjdC4N
Cg0KVHJ1ZS4gV2lsbCBhbHNvIGZpeGVkIGluIHY0Lg0KDQoNCk1paGFpDQo=

--------------B23yLLFmxhUkN2FjZt09BvXo--

--------------qeYid7Fq0OznbNli2EiBuPfg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmiGJRIFAwAAAAAACgkQH9Yu2W4lOofN
lhAAi7qihoRFCY43N2VoNHrUrrZmiMi+2akoYpqMtFskVfu+hp6r12ELJAWJHBYvU8NvJLLpjbci
QnP1MH3XuAy0BXqFEtU5e2/T8fzljMc5duivcMISQFWg3d7Qo82u5CsjX7SSKVS7fFQ8q6Qbm49G
/Qe3HAA1JPnRCameIj3v9RwF59vkFhaneBn4kCukVm7Yy/iIh3c+oV852y2mow7bi0YeHKDmXeDV
GA/x3IH8IGpbRvloIze9R+r/Mgp4eijF96OM8L3ltb5OuBuBGgkOvpQ9afZ8vlBpJZtfPLcBCS0r
Fn9RKAWrPw3Jikn4epkscSdpWB9+7X5WqnMZRu5IwvviAn/mH7yeO1yEUFKFmA7f9Lrl+AMtxjvC
sNRp7f7ydHaGj1iN+GbbfCzGhyNE5DGKFwtanALymxzhTzmMqncXS5quMpf5V7muLvLjbmoTxMJb
Puv4nt6gItFpWirdpp7jXo93gCFn9OVYK/yk5GoMUI/cRrSbmbpJGFQwNZjoFx19LRPeJI5ZxiST
bgsRN7JKxFX1zouGGF+qPEZU485grHxxQqhocrP5KWMrePXlBL4ng8QGMZcJ/v5QJ0Tz2L5R/WPo
rO8ToqrwVh9t+As72/+98GE1NrHikpcdCrJ3OehLoetfRSS05gAyiAuOPI7YwNtSjnWbG3cFk+gP
O4Q=
=PkUt
-----END PGP SIGNATURE-----

--------------qeYid7Fq0OznbNli2EiBuPfg--

