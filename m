Return-Path: <linux-arm-msm+bounces-82607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F55C71ECC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 04:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 675782BAF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 03:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04A72F90CD;
	Thu, 20 Nov 2025 03:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="B7i3WdnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505B2FB97A;
	Thu, 20 Nov 2025 03:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763607921; cv=none; b=umHodJXC3iOBc1tLwBTJmWDJs9aKOS76p8Te+YS48HhZyI9I0JO1fgkfTHUsnmDfRKSPFJZ717os1tf6tWykUmkAaE4WpuHbnQy88otEF/ZKz8eap0AwtfyYMwHOyiVGESx/bHnl1E2J2Dyl4VfOe4xji7NfGWCEtFH12ec46eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763607921; c=relaxed/simple;
	bh=i8gB58pI0HkKpFIOUeMIcxpq5b9sADN5IRiqJ5VjmXs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=bgz2pAnUKTnok1D1oxCHzG3ZPcp4bgU1FDc0FXKytvwcn1QHw+LpyEOWs8luLBq+uObmoI6wvnQhOdmq7AWT/2dPRARBaf5lyttAshtmVamXUNNLVtB0rPjvinIHrqyrR4waEonfbKrpFiNcPBGemcMpfbrVHIPcpyEkn7evpxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=B7i3WdnU reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=UHsXXyZXaO0/+AgF96P1gnn8MC99jkmqU9+fGZoiqXU=; b=B
	7i3WdnU3J9DkDN2nnGunx7BDEx5xX8UFnHFlcuaoAtRO2r6JnEuZ10gyeHkfS9FB
	DKo/Po5m/cbpNXKs1z6B+VcMte062rPUWSrkCXCaNC72AkTFLBKhccutisG1ata6
	NmsL8t5QS1DwTQ2yojmMoPf3admBl3SSm+h3q/QOfo=
Received: from slark_xiao$163.com ( [2409:895a:3841:c8e7:efe9:818f:26:6687]
 ) by ajax-webmail-wmsvr-40-121 (Coremail) ; Thu, 20 Nov 2025 11:04:09 +0800
 (CST)
Date: Thu, 20 Nov 2025 11:04:09 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, mani@kernel.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for
 Foxconn T99W760
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <rchyzpkfozxd55x4mvpsz2toz7j26yeww7yjiios3uky734lnq@rtuiloh6aokm>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
 <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
 <rchyzpkfozxd55x4mvpsz2toz7j26yeww7yjiios3uky734lnq@rtuiloh6aokm>
X-NTES-SC: AL_Qu2dAfqbuEAv7yWdZukfmk8Sg+84W8K3v/0v1YVQOpF8jArpwSECY0B8BUfdzf6lCgOMiBSzdglMzf5CZrRIeK4rxsJiQCqmYgCpypVp4fz30g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5d61df3a.2f2f.19a9f382a58.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eSgvCgBHEWAphR5pf3cmAA--.5604W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibh4MZGkec8WEzgADsQ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNS0xMS0xOSAyMTo0NzozMywgIkRtaXRyeSBCYXJ5c2hrb3YiIDxkbWl0cnkuYmFyeXNo
a292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgMDI6
MDg6MzNQTSArMDEwMCwgTG9pYyBQb3VsYWluIHdyb3RlOgo+PiBPbiBXZWQsIE5vdiAxOSwgMjAy
NSBhdCAxMjoyN+KAr1BNIERtaXRyeSBCYXJ5c2hrb3YKPj4gPGRtaXRyeS5iYXJ5c2hrb3ZAb3Nz
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBPbiBXZWQsIE5vdiAxOSwgMjAyNSBhdCAw
Njo1NjoxNVBNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+PiA+ID4gVDk5Vzc2MCBpcyBkZXNp
Z25lZCBiYXNlZCBvbiBRdWFsY29tbSBTRFgzNSBjaGlwLiBJdCB1c2Ugc2ltaWxhcgo+PiA+ID4g
YXJjaGl0ZWNodHVyZSB3aXRoIFNEWDcyL1NEWDc1IGNoaXAuIFNvIHdlIG5lZWQgdG8gYXNzaWdu
IGluaXRpYWwKPj4gPiA+IGxpbmsgaWQgZm9yIHRoaXMgZGV2aWNlIHRvIG1ha2Ugc3VyZSBuZXR3
b3JrIGF2YWlsYWJsZS4KPj4gPiA+Cj4+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTbGFyayBYaWFvIDxz
bGFya194aWFvQDE2My5jb20+Cj4+ID4gPiAtLS0KPj4gPiA+ICBkcml2ZXJzL25ldC93d2FuL21o
aV93d2FuX21iaW0uYyB8IDMgKystCj4+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+PiA+ID4KPj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC93d2FuL21oaV93d2FuX21iaW0uYyBiL2RyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5j
Cj4+ID4gPiBpbmRleCBjODE0ZmJkNzU2YTEuLmExNDJhZjU5YTkxZiAxMDA2NDQKPj4gPiA+IC0t
LSBhL2RyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5jCj4+ID4gPiArKysgYi9kcml2ZXJz
L25ldC93d2FuL21oaV93d2FuX21iaW0uYwo+PiA+ID4gQEAgLTk4LDcgKzk4LDggQEAgc3RhdGlj
IHN0cnVjdCBtaGlfbWJpbV9saW5rICptaGlfbWJpbV9nZXRfbGlua19yY3Uoc3RydWN0IG1oaV9t
YmltX2NvbnRleHQgKm1iaW0KPj4gPiA+ICBzdGF0aWMgaW50IG1oaV9tYmltX2dldF9saW5rX211
eF9pZChzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKmNudHJsKQo+PiA+ID4gIHsKPj4gPiA+ICAgICAg
IGlmIChzdHJjbXAoY250cmwtPm5hbWUsICJmb3hjb25uLWR3NTkzNGUiKSA9PSAwIHx8Cj4+ID4g
PiAtICAgICAgICAgc3RyY21wKGNudHJsLT5uYW1lLCAiZm94Y29ubi10OTl3NTE1IikgPT0gMCkK
Pj4gPiA+ICsgICAgICAgICBzdHJjbXAoY250cmwtPm5hbWUsICJmb3hjb25uLXQ5OXc1MTUiKSA9
PSAwIHx8Cj4+ID4gPiArICAgICAgICAgc3RyY21wKGNudHJsLT5uYW1lLCAiZm94Y29ubi10OTl3
NzYwIikgPT0gMCkKPj4gPgo+PiA+IENhbiB3ZSByZXBsYWNlIHRoaXMgbGlzdCBvZiBzdHJpbmMg
Y29tcGFyaXNvbnMgd2l0aCBzb21lIGtpbmQgb2YgZGV2aWNlCj4+ID4gZGF0YSwgYmVpbmcgc2V0
IGluIHRoZSBtaGktcGNpLWdlbmVyaWMgZHJpdmVyPwo+PiAKPj4gSWYgd2UgbW92ZSB0aGlzIE1C
SU0tc3BlY2lmaWMgaW5mb3JtYXRpb24gaW50byBtaGktcGNpLWdlbmVyaWMsIHdlCj4+IHNob3Vs
ZCBjb25zaWRlciB1c2luZyBhIHNvZnR3YXJlIG5vZGUgKGUuZy4gdmlhCj4+IGRldmljZV9hZGRf
c29mdHdhcmVfbm9kZSkgc28gdGhhdCB0aGVzZSBwcm9wZXJ0aWVzIGNhbiBiZSBhY2Nlc3NlZAo+
PiB0aHJvdWdoIHRoZSBnZW5lcmljIGRldmljZS1wcm9wZXJ0eSBBUEkuCj4KSGkgTG9pYywKVGhl
IG9yaWdpbmFsIHNvbHV0aW9uIGlzIHdlIGRlZmluZWQgdGhpcyBtdXhfaWQgaW4gbWhpLXBjaS1n
ZW5lcmljIHNpZGUgYW5kIAp0cmFuc2ZlciBpdCB0byBNQklNIHNpZGUuIEJ1dCBpdCBpcyByZWpl
Y3RlZCBpbiBsYXN0IHllYXIuCldoeSB3ZSBtb3ZlIGl0IGJhY2sgYWdhaW4/Cgo+V29ya3MgZm9y
IG1lIHRvby4KPgo+LS0gCj5XaXRoIGJlc3Qgd2lzaGVzCj5EbWl0cnkK

