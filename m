Return-Path: <linux-arm-msm+bounces-86943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F33CE94F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C55300FE23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1472C2349;
	Tue, 30 Dec 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ctehTI5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5826528C84A;
	Tue, 30 Dec 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089395; cv=none; b=mXMGjJ8oS7+wfepHtXqAPVg0ANV4AI7HxyocHQe0xPFeYgs1AtMV02A2fYhmsjX8Ks/743KAvVDNupxF6KwlKRj8WbuI5Jdrwu3KdbWoiLXsJjrEdafA8FnzmuBygQvV+6Mq4TgwKaAmT2GFcn5BheUem0CLXm9cMCgw3Ru/y+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089395; c=relaxed/simple;
	bh=wTiXDpfU6q9X5QdMk9Tcxn26k+zyE0H7rCZr5xwZ3ks=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZIvUGCP7fVQJqIy9r3EcbiML9XwmgA7ZoAo3WP1I8i2bW7rRTS6XVhrf5D3yCCmFvZzFVU+U6Lnuvc/b+TwSx868dZrk1LHVOodWFfqdDddgFsji+eQtcwZHCSYOKCIOuM8F6fHGzcN9y9NFru1gWh2vFvusrI/q17cjwo6T9O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ctehTI5y; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=wTiXDpfU6q9X5QdMk9Tcxn26k+zyE0H7rCZr5xwZ3ks=; b=c
	tehTI5yuWGpg8uWZasa2JnFFRnvcbitNFiLLNXjT5x6goUKhCricZHtF8jb5meIz
	GwGJqQ/rSBCkHH5g8svs6dJtqp9Ihk34EJHS9b5w+aqwfRDRQWkqEmL9vyWJfTY7
	P3Kx1WTFkw9Md7UqAIx6JwJhcXRVEObJ1gqJQbXCNw=
Received: from slark_xiao$163.com ( [112.97.82.249] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Tue, 30 Dec 2025 18:08:04 +0800
 (CST)
Date: Tue, 30 Dec 2025 18:08:04 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for
 Foxconn T99W760
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAFEp6-2NBa8tgzTH__F4MOg=03-LO7RjhobhaKHmapXXa9Xeyw@mail.gmail.com>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com>
 <4c4751c0.9803.19b3079a159.Coremail.slark_xiao@163.com>
 <CAFEp6-2NBa8tgzTH__F4MOg=03-LO7RjhobhaKHmapXXa9Xeyw@mail.gmail.com>
X-NTES-SC: AL_Qu2dBfyTtkoj4imZYukfmk8Sg+84W8K3v/0v1YVQOpF8jBLowBkwXUJINHjZyMiRJAKgrRWbTjtF++VreJlyZIwLdz1obbFqRjSDjk80aCdNiw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <703d68c0.93c7.19b6ebaa741.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iSgvCgD3XwiFpFNpCS1MAA--.4671W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC5wR53WlTpIQiBgAA35
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTEyLTMwIDE3OjUwOjM5LCAiTG9pYyBQb3VsYWluIiA8bG9pYy5wb3VsYWluQG9z
cy5xdWFsY29tbS5jb20+IHdyb3RlOgo+SGkgU2xhcmssCj4KPk9uIFRodSwgRGVjIDE4LCAyMDI1
IGF0IDk6MDHigK9BTSBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2My5jb20+IHdyb3RlOgo+Pgo+
Pgo+PiBBdCAyMDI1LTExLTIxIDIwOjQ2OjU0LCAiTG9pYyBQb3VsYWluIiA8bG9pYy5wb3VsYWlu
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+PiA+T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgMTE6
NTfigK9BTSBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2My5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+
PiBUOTlXNzYwIGlzIGRlc2lnbmVkIGJhc2VkIG9uIFF1YWxjb21tIFNEWDM1IGNoaXAuIEl0IHVz
ZSBzaW1pbGFyCj4+ID4+IGFyY2hpdGVjaHR1cmUgd2l0aCBTRFg3Mi9TRFg3NSBjaGlwLiBTbyB3
ZSBuZWVkIHRvIGFzc2lnbiBpbml0aWFsCj4+ID4+IGxpbmsgaWQgZm9yIHRoaXMgZGV2aWNlIHRv
IG1ha2Ugc3VyZSBuZXR3b3JrIGF2YWlsYWJsZS4KPj4gPj4KPj4gPj4gU2lnbmVkLW9mZi1ieTog
U2xhcmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29tPgo+PiA+Cj4+ID5SZXZpZXdlZC1ieTogTG9p
YyBQb3VsYWluIDxsb2ljLnBvdWxhaW5Ab3NzLnF1YWxjb21tLmNvbT4KPj4gPgo+PiBIaSBMb2lj
LAo+PiBNYXkgSSBrbm93IHdoZW4gdGhpcyBwYXRjaCB3b3VsZCBiZSBhcHBsaWVkIGludG8gbmV0
IG9yIGxpbnV4LW5leHQ/Cj4+IEkgc2F3IHRoZSBjaGFuZ2VzIGluIE1ISSBzaWRlIGhhcyBiZWVu
IGFwcGxpZWQuCj4+IFQ5OVc3NjAgZGV2aWNlIHdvdWxkIGhhdmUgYSBuZXR3b3JrIHByb2JsZW0g
aWYgbWlzc2luZyB0aGlzIGNoYW5nZXMgaW4gd3dhbgo+PiBzaWRlLiBQbGVhc2UgaGVscCBkbyBh
IGNoZWNraW5nLgo+Cj5Zb3UgY2FuIHNlZSBzdGF0dXMgaGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L25ldGRldmJwZi9saXN0Lwo+Cj5JZiB0aGUgY2hhbmdlcyBoYXZl
IG5vdCBiZWVuIHBpY2tlZCB0b2dldGhlciwgcGxlYXNlIHJlc2VuZCB0aGlzIG9uZSwKPmluY2x1
ZGluZyB0YWdzLgo+Cj5SZWdhcmRzLAo+TG9pYwpIaSBMb2ljLApJIGNoZWNrZWQgYWJvdmUgbGlu
ayBhbmQgZGlkbid0IGZpbmQgbXkgY2hhbmdlcy4KVGhpcyBpcyBzdHJhbmdlIHNpbmNlIHRoZSBj
aGFuZ2VzIGluIE1ISSBzaWRlIG9mIHRoaXMgc2VyaWFsIGhhcyBiZWVuIGFwcGxpZWQsIGJ1dCB0
aGlzIApoYXMgYmVlbiBpZ25vcmVkLgpCVFcsIHRoaXMgY2hhbmdlcyBtYXkgbm90IGJlIGFwcGxp
Y2FibGUgYmVjYXVzZSBhbm90aGVyIGNoYW5nZSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L25ldGRldmJwZi9wYXRjaC8yMDI1MTEyMDExNDExNS4zNDQyODQtMS1zbGFya194
aWFvQDE2My5jb20vCmhhcyBiZWVuIGFwcGxpZWQuIAoKU28gZG8geW91IHdhbnQgbWUgdG8gcmVz
ZW5kIHRoZSBuZXcgY2hhbmdlcyBiYXNlZCBvbiB0aGUgbGF0ZXN0IG5ldCBiYXNlbGluZSA/CkFu
eSBzZXJpYWxzIHNoYWxsIGJlIGFzc2lnbmVkPyBWNCBzaGFsbCBiZSB1c2VkPwo=

