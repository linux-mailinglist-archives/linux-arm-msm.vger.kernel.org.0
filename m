Return-Path: <linux-arm-msm+bounces-65889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692BAB0C3B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 13:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24F411887887
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 11:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B900F2BEC57;
	Mon, 21 Jul 2025 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="H3HFpjET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7191F3FC8;
	Mon, 21 Jul 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753098847; cv=none; b=tq/1+E4TcQEvw3/n+/QDG6dLjqz1yqTop4bY6NUt7/ULCnw3k8moU39h597DQWGBzuB77Jil7W/p74UfeL6TXe1LQ97PsSExoxwlvgK3G8p6bgMBeMkKOBmK73pK5mNEl+J3J/NZJRfvmxtF2porwpVLT4HT8LEOjQoIp7RRfuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753098847; c=relaxed/simple;
	bh=cpe8TH5BXmM+NNX4qQ4MXmml7aD2/B4yAfB8e4eL6Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9Lf+4naLa+nfimsNPoMUNHsgAUDbAw+jloUQFdnQRYRUkC5zZ1wl/09JJFT5y5HCpvRVbTZKq2bdOFEMlE7hQQnDWyif07hkf2uwZX+lP7s/AyLbJgZLfYv3hQkzezgtj2lxuth++S93E7AkFun9HMrzgF3s0Ku61vB/3dQ4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=H3HFpjET; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753098835; bh=cpe8TH5BXmM+NNX4qQ4MXmml7aD2/B4yAfB8e4eL6Jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H3HFpjETO20JknpVgHSJxpTcReDl0Pu+OpGvyNGEY6CYpyJf7y/8ABR/IrlpwNjHo
	 g4GclcnPAfxNBBY6BkxZeS6RFD2bTUzAYspYT09jPSi2KjKwySyBqDQUS6CHa3xMxk
	 BClYGylgE7lUSnaBmT/FUzPerKGaec9vOlLK2qdQ=
Received: from [172.24.215.49] (unknown [185.102.219.57])
	by mail.ionic.de (Postfix) with ESMTPSA id BDA371480F5B;
	Mon, 21 Jul 2025 13:53:55 +0200 (CEST)
Message-ID: <852835ff-9463-443a-98bb-8a5824fdb1f4@ionic.de>
Date: Mon, 21 Jul 2025 13:53:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] net: qrtr: ns: validate msglen before ctrl_pkt
 use
To: Casey Connolly <casey.connolly@linaro.org>,
 linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Cc: Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <cover.1752947108.git.ionic@ionic.de>
 <866f309e9739d770dce7e8c648b562d37db1d8b5.1752947108.git.ionic@ionic.de>
 <985111fc-3301-4c0a-a13e-ab65e94bdcbb@linaro.org>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <985111fc-3301-4c0a-a13e-ab65e94bdcbb@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YFK00L0URMavkDf9W8uBBTx2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YFK00L0URMavkDf9W8uBBTx2
Content-Type: multipart/mixed; boundary="------------yjfHvdcaWztG84OvH0p23nby";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Casey Connolly <casey.connolly@linaro.org>,
 linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Cc: Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Message-ID: <852835ff-9463-443a-98bb-8a5824fdb1f4@ionic.de>
Subject: Re: [PATCH v2 01/10] net: qrtr: ns: validate msglen before ctrl_pkt
 use
References: <cover.1752947108.git.ionic@ionic.de>
 <866f309e9739d770dce7e8c648b562d37db1d8b5.1752947108.git.ionic@ionic.de>
 <985111fc-3301-4c0a-a13e-ab65e94bdcbb@linaro.org>
In-Reply-To: <985111fc-3301-4c0a-a13e-ab65e94bdcbb@linaro.org>

--------------yjfHvdcaWztG84OvH0p23nby
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiA3LzIxLzI1IDEzOjAyLCBDYXNleSBDb25ub2xseSB3cm90ZToNCj4gT24gMTkvMDcv
MjAyNSAyMDo1OSwgTWloYWkgTW9sZG92YW4gd3JvdGU6DQo+IA0KPiBJIHRoaW5rIHRoaXMg
aXMgbWlzc2luZyBhIEZpeGVzOiB0YWc/DQoNClRoYW5rcy4NCg0KV2lsbCBhZGQgRml4ZXM6
IDBjMjIwNGE0YWQ3MSAoIm5ldDogcXJ0cjogTWlncmF0ZSBuYW1lc2VydmljZSB0byBrZXJu
ZWwgZnJvbSANCnVzZXJzcGFjZSIpIGluIHYzLg0KDQpJIGhhdmVuJ3Qgc2VlbiBhbnkgcmVw
b3J0cyBvZiB0aGlzIGFjdHVhbGx5IHRyaXBwaW5nIGFueXRoaW5nIHVwLg0KDQoNCg0KTWlo
YWkNCg==

--------------yjfHvdcaWztG84OvH0p23nby--

--------------YFK00L0URMavkDf9W8uBBTx2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmh+KlMFAwAAAAAACgkQH9Yu2W4lOodU
kBAA48v9IErBmgM+54RwlE31zR1vukFcZawnkX8usW+a6SwoYxSsAi397udv4bxNLrtAUbPtqOWU
y6Hpnu7Jwgoy35UADfWHwheyJ2h+y3HhwZ2FzkqCaxLhr/mmk31ybUg9IuGxMed+rZI+xkI5K/ZJ
q+TQedpC1TrbHHUyUp36heXykw+gI13mPvpMsywiIv6jxn4hEwcrWacD3JTt76DuTnIsbuFGEj9Y
moBAsvW6qROXEw5p7LUZ1S6dJxBbKaGzP1WtoWI/ErxofFbVwI8Akq0lb08tokLaMH5EOhJ3Vkwu
n2scMoJRCKs++SyQ0bSl1wTgPdmZvB2cOcAgm9a2o9qoEXrJ+r7Atqd0TaN+a62Xp7jCNqSBLAqj
+ROVmqL/IsokuNrHiYqcXBWJcSly5v2WtrsyeO5kkfcDePbeGjOcrh4P1Ml6OjYI5KWXC1W9Dg9C
pSnjcy1qaS8b1xTS08jY74aCi2MJ/6xGIaEgMRfYevNgHzYAYYcoTraR5HCxJn0KeThfxv3h+Fqj
dpPQl7Y/aedUYqiGS4Vyg3RWk2YI1q/yPFN6aNr8gNl59bcppiQPVA3UsCv3DUkPxSY5IC7dS4EB
sUcxnpQp1LSXmucmHax7iqNIpk23uqPQr91/eCMbdSLJrge/qrxYfb0NvTI+EG9ZEA9Ro4Xi0NgE
KBE=
=226L
-----END PGP SIGNATURE-----

--------------YFK00L0URMavkDf9W8uBBTx2--

