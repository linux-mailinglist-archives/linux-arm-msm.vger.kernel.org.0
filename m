Return-Path: <linux-arm-msm+bounces-24859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA491EF0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 08:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4224128252B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 06:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2645473E;
	Tue,  2 Jul 2024 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="iJq7I7CV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C88523D;
	Tue,  2 Jul 2024 06:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902151; cv=none; b=On+rWO2fRehoY7i46TqEHwWuUurC/FG6XJxbWcMNWIiCx9IwUwViDp2sWZi6y4xZ/HWN0KfBc3m7U6E9Zoq2SudZ4Lrw3LVlpFXnK9KavALwsDH1hpdPE5WiewgASOJdS1cvCyq+Lc1DVdqaToeKz+cfpYTEo1C1hTyI7BRlISo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902151; c=relaxed/simple;
	bh=6UyaXtdSJN87qPrtLpnAwlUBMTry5YyqrGRdWgO9chM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=OH5ujnp1pWUO1Srp/5UOumafV7mG1MIv6jT3spQcoMW013lCeVgqgfegFL2ATmhOr483iIr5pUYRmIlVE3cnqTdYuItVuoMNlcaVYRr4aIVv3ZNb4azly1c1uw57pKkEpIwZOExfcAMeYWtlmQIYgAyYxVV1oBYIRnAFBskSsP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=iJq7I7CV reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=yomgaRjDGgQXUoWu4sIaqbVyDnSTqfWHwpjm4EaLzhM=; b=i
	Jq7I7CVMjO32MpzNhzwsDxXkq/nIKlNvtSNBieZDMDha5pE3MZ1xGQxTuN47sKkF
	dW04m9SsPUoIF8O4clVTDXJRcF4q9QiABUd7GWfbx8orXnH+JyCHB+V66bb/oPhD
	G4rPtfs+02oS9l6tne7XgkUJ7f6o+T5CZ6H5VE4kJo=
Received: from slark_xiao$163.com ( [112.97.57.76] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Tue, 2 Jul 2024 14:34:51 +0800 (CST)
Date: Tue, 2 Jul 2024 14:34:51 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	quic_jhugo@quicinc.com, netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v4 1/3] bus: mhi: host: Add Foxconn SDX72 related
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240701162523.GC133366@thinkpad>
References: <20240701021216.17734-1-slark_xiao@163.com>
 <20240701162523.GC133366@thinkpad>
X-NTES-SC: AL_Qu2aC/WbvUgi5yedbekfmk8Sg+84W8K3v/0v1YVQOpF8jDjp5A4rXkRlE1r59fKtICS+jT6xQQdUyOFnbbJmdKkNlM/BN8CAR5oan0L0tfyfWQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <c156594.626c.190722739f2.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3v4mLn4NmwUwaAA--.26409W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQQPZGV4IYYnYgACsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDctMDIgMDA6MjU6MjMsICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pdmFu
bmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj5PbiBNb24sIEp1bCAwMSwgMjAyNCBh
dCAxMDoxMjoxNEFNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+PiBBbGlnbiB3aXRoIFFjb20g
U0RYNzIsIGFkZCByZWFkeSB0aW1lb3V0IGl0ZW0gZm9yIEZveGNvbm4gU0RYNzIuCj4+IEFuZCBh
bHNvLCBhZGQgZmlyZWhvc2Ugc3VwcG9ydCBzaW5jZSBTRFg3Mi4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4gLS0tCj4+IHYyOiAoMSkuIFVw
ZGF0ZSB0aGUgZWRsIGZpbGUgcGF0aCBhbmQgbmFtZSAoMikuIFNldCBTRFg3MiBzdXBwb3J0Cj4+
IHRyaWdnZXIgZWRsIG1vZGUgYnkgZGVmYXVsdAo+PiB2MzogRGl2aWRlIGludG8gMiBwYXJ0cyBm
b3IgRm94Y29ubiBzZHg3MiBwbGF0Zm9ybQo+PiAtLS0KPj4gIGRyaXZlcnMvYnVzL21oaS9ob3N0
L3BjaV9nZW5lcmljLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9n
ZW5lcmljLmMKPj4gaW5kZXggMzVhZTdjZDA3MTFmLi4xZmIxYzJmMmZlMTIgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPj4gKysrIGIvZHJpdmVycy9i
dXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+PiBAQCAtMzk5LDYgKzM5OSw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbWhpX2NoYW5uZWxfY29uZmlnIG1oaV9mb3hjb25uX3NkeDU1X2NoYW5uZWxz
W10gPSB7Cj4+ICAJTUhJX0NIQU5ORUxfQ09ORklHX0RMKDEzLCAiTUJJTSIsIDMyLCAwKSwKPj4g
IAlNSElfQ0hBTk5FTF9DT05GSUdfVUwoMzIsICJEVU4iLCAzMiwgMCksCj4+ICAJTUhJX0NIQU5O
RUxfQ09ORklHX0RMKDMzLCAiRFVOIiwgMzIsIDApLAo+PiArCU1ISV9DSEFOTkVMX0NPTkZJR19V
TF9GUCgzNCwgIkZJUkVIT1NFIiwgMzIsIDApLAo+PiArCU1ISV9DSEFOTkVMX0NPTkZJR19ETF9G
UCgzNSwgIkZJUkVIT1NFIiwgMzIsIDApLAo+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19IV19VTCgx
MDAsICJJUF9IVzBfTUJJTSIsIDEyOCwgMiksCj4+ICAJTUhJX0NIQU5ORUxfQ09ORklHX0hXX0RM
KDEwMSwgIklQX0hXMF9NQklNIiwgMTI4LCAzKSwKPj4gIH07Cj4+IEBAIC00MTksNiArNDIxLDE2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX2NvbnRyb2xsZXJfY29uZmlnIG1vZGVtX2ZveGNv
bm5fc2R4NTVfY29uZmlnID0gewo+PiAgCS5ldmVudF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9l
dmVudHMsCj4+ICB9Owo+PiAgCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVy
X2NvbmZpZyBtb2RlbV9mb3hjb25uX3NkeDcyX2NvbmZpZyA9IHsKPj4gKwkubWF4X2NoYW5uZWxz
ID0gMTI4LAo+PiArCS50aW1lb3V0X21zID0gMjAwMDAsCj4+ICsJLnJlYWR5X3RpbWVvdXRfbXMg
PSA1MDAwMCwKPj4gKwkubnVtX2NoYW5uZWxzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1
NV9jaGFubmVscyksCj4+ICsJLmNoX2NmZyA9IG1oaV9mb3hjb25uX3NkeDU1X2NoYW5uZWxzLAo+
PiArCS5udW1fZXZlbnRzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMpLAo+
PiArCS5ldmVudF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4KPldlaXJkLiBXaHkg
dGhpcyBtb2RlbSBpcyB1c2luZyBhbGwgU0RYNTUgY29uZmlncz8gUmV1c2luZyBpcyBmaW5lLCBi
dXQgaXQgaXMKPnN0cmFuZ2UgdG8gc2VlIG9ubHkgdGhpcyBTRFg3MiBtb2RlbSB1c2luZyBkaWZm
ZXJlbnQgY29uZmlnIHRoYW4gdGhlIG90aGVycwo+YWRkZWQgYmVsb3cuCj4KPi0gTWFuaQo+CgpU
aGVyZSBpcyBhIHNldHRpbmdzICIucmVhZHlfdGltZW91dF9tcyA9IDUwMDAwLCIgZm9yIFNEWDcy
L1NEWDc1IG9ubHkuCkl0IGFsaWducyB3aXRoIFFjb20gU0RYNzIvU0RYNzUgaW4gY2FzZSBvZiB0
aW1lb3V0IGlzc3VlLgoKPj4gK307Cj4+ICsKPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3Bj
aV9kZXZfaW5mbyBtaGlfZm94Y29ubl9zZHg1NV9pbmZvID0gewo+PiAgCS5uYW1lID0gImZveGNv
bm4tc2R4NTUiLAo+PiAgCS5mdyA9ICJxY29tL3NkeDU1bS9zYmwxLm1ibiIsCj4+IEBAIC00ODgs
NiArNTAwLDI4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94
Y29ubl9kdzU5MzJlX2luZm8gPSB7Cj4+ICAJLnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4gIH07
Cj4+ICAKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94Y29u
bl90OTl3NTE1X2luZm8gPSB7Cj4+ICsJLm5hbWUgPSAiZm94Y29ubi10OTl3NTE1IiwKPj4gKwku
ZWRsID0gImZveC9zZHg3Mm0vZWRsLm1ibiIsCj4+ICsJLmVkbF90cmlnZ2VyID0gdHJ1ZSwKPj4g
KwkuY29uZmlnID0gJm1vZGVtX2ZveGNvbm5fc2R4NzJfY29uZmlnLAo+PiArCS5iYXJfbnVtID0g
TUhJX1BDSV9ERUZBVUxUX0JBUl9OVU0sCj4+ICsJLmRtYV9kYXRhX3dpZHRoID0gMzIsCj4+ICsJ
Lm1ydV9kZWZhdWx0ID0gMzI3NjgsCj4+ICsJLnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4gK307
Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94Y29u
bl9kdzU5MzRlX2luZm8gPSB7Cj4+ICsJLm5hbWUgPSAiZm94Y29ubi1kdzU5MzRlIiwKPj4gKwku
ZWRsID0gImZveC9zZHg3Mm0vZWRsLm1ibiIsCj4+ICsJLmVkbF90cmlnZ2VyID0gdHJ1ZSwKPj4g
KwkuY29uZmlnID0gJm1vZGVtX2ZveGNvbm5fc2R4NzJfY29uZmlnLAo+PiArCS5iYXJfbnVtID0g
TUhJX1BDSV9ERUZBVUxUX0JBUl9OVU0sCj4+ICsJLmRtYV9kYXRhX3dpZHRoID0gMzIsCj4+ICsJ
Lm1ydV9kZWZhdWx0ID0gMzI3NjgsCj4+ICsJLnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4gK307
Cj4+ICsKPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX2NoYW5uZWxfY29uZmlnIG1oaV9tdjN4
X2NoYW5uZWxzW10gPSB7Cj4+ICAJTUhJX0NIQU5ORUxfQ09ORklHX1VMKDAsICJMT09QQkFDSyIs
IDY0LCAwKSwKPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfREwoMSwgIkxPT1BCQUNLIiwgNjQsIDAp
LAo+PiBAQCAtNzIwLDYgKzc1NCwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgbWhpX3BjaV9pZF90YWJsZVtdID0gewo+PiAgCS8qIERXNTkzMmUgKHNkeDYyKSwgTm9uLWVT
SU0gKi8KPj4gIAl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9GT1hDT05OLCAweGUwZjkpLAo+
PiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfZm94Y29ubl9kdzU5MzJl
X2luZm8gfSwKPj4gKwkvKiBUOTlXNTE1IChzZHg3MikgKi8KPj4gKwl7IFBDSV9ERVZJQ0UoUENJ
X1ZFTkRPUl9JRF9GT1hDT05OLCAweGUxMTgpLAo+PiArCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVs
X3Vsb25nX3QpICZtaGlfZm94Y29ubl90OTl3NTE1X2luZm8gfSwKPj4gKwkvKiBEVzU5MzRlKHNk
eDcyKSwgV2l0aCBlU0lNICovCj4+ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRk9YQ09O
TiwgMHhlMTFkKSwKPj4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX2Zv
eGNvbm5fZHc1OTM0ZV9pbmZvIH0sCj4+ICsJLyogRFc1OTM0ZShzZHg3MiksIE5vbi1lU0lNICov
Cj4+ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRk9YQ09OTiwgMHhlMTFlKSwKPj4gKwkJ
LmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX2ZveGNvbm5fZHc1OTM0ZV9pbmZv
IH0sCj4+ICAJLyogTVYzMS1XIChDaW50ZXJpb24pICovCj4+ICAJeyBQQ0lfREVWSUNFKFBDSV9W
RU5ET1JfSURfVEhBTEVTLCAweDAwYjMpLAo+PiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vs
b25nX3QpICZtaGlfbXYzMV9pbmZvIH0sCj4+IC0tIAo+PiAyLjI1LjEKPj4gCj4KPi0tIAo+4K6u
4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQo=

