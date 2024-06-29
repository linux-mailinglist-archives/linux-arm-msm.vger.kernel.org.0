Return-Path: <linux-arm-msm+bounces-24706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E67991CB8B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 10:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91AE1F2268B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 08:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155B6364CD;
	Sat, 29 Jun 2024 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="DSb4N0dU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E071CFA0;
	Sat, 29 Jun 2024 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719648241; cv=none; b=G37HCqIzVU0MBW3Yk7uN1Us9W1B4aDGlPY5QgSxE+E/kt67DNTkuG5ky2/G7RyG7gdHr/bmpaanJCcD+tmE/JoZEai7G3JnwUmp7eC2VzfLRnupolKhVSa54QB1me9iSUXAi6i3klO/sf/Q4eRrfOv4J8ROe+RDRfOACc842Bsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719648241; c=relaxed/simple;
	bh=VOubikG6ZpnVVZCM7MJ8dHjxeyaHenragv3J+gQEHdc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=C6ZZRYp+/0UCU0L9uOBpO3SR8MACvSC22RkvVNg17mceb+P35C2J3L/DPhcTawOe/r/vl2KXeETxl5VkkuyRv0/ld5dAGUYnRb7THrk75wsJbLXXktjQ74E9MuOOATinB/mqZC0g206dHPGkoQluXW5BcgljWq/WQwMJ2vZFKhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=DSb4N0dU reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QfAQv6rdwkp+lvfK9xPCyNRFEgAyBJrfS4SIVVxYfyc=; b=D
	Sb4N0dUKgHssEp/5svGHDZdJWnqIFs2pjHVwg9ZUJtLykQkYgYv34v2H/rW2aJ+/
	9UrdhQAyHTM74Mw6LvN42A5sK4qmk2vbezq43aOGEVEUK4/3jCPRD6LUeFGofpwp
	xUn+a2/iDkDt3pOgj6e2ROM3g46ZnNF8ifuX63HttI=
Received: from slark_xiao$163.com ( [112.97.61.182] ) by
 ajax-webmail-wmsvr-40-115 (Coremail) ; Sat, 29 Jun 2024 16:03:28 +0800
 (CST)
Date: Sat, 29 Jun 2024 16:03:28 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Jeffrey Hugo" <quic_jhugo@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 2/3] bus: mhi: host: Add name for mhi_controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <cde35f69-4d6e-d46d-88ca-9c5d6d5e757f@quicinc.com>
References: <20240628073626.1447288-1-slark_xiao@163.com>
 <cde35f69-4d6e-d46d-88ca-9c5d6d5e757f@quicinc.com>
X-NTES-SC: AL_Qu2aC/qft0or7iWeYOkfmk8Sg+84W8K3v/0v1YVQOpF8jDzp4AcPVGFHF0bdysidFwqFmhyTbCJOyu1wb5JYea0BAtDJVsQjLe1KmLXa219Cjw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <298e9aeb.2587.190630546b9.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3P47Qv39mWmsUAA--.8330W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJQIMZGVOB8H34gAEsz
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDYtMjggMjI6Mzg6NTcsICJKZWZmcmV5IEh1Z28iIDxxdWljX2podWdvQHF1aWNp
bmMuY29tPiB3cm90ZToKPk9uIDYvMjgvMjAyNCAxOjM2IEFNLCBTbGFyayBYaWFvIHdyb3RlOgo+
PiAgIEZvciBTRFg3MiBNQklNIG1vZGUsIGl0IHN0YXJ0cyBkYXRhIG11eCBpZCBmcm9tIDExMiBp
bnN0ZWFkIG9mIDAuCj4+ICAgVGhpcyB3b3VsZCBsZWFkIHRvIGRldmljZSBjYW4ndCBwaW5nIG91
dHNpZGUgc3VjY2Vzc2Z1bGx5Lgo+PiAgIEFsc28gTUJJTSBzaWRlIHdvdWxkIHJlcG9ydCAiYmFk
IHBhY2tldCBzZXNzaW9uICgxMTIpIi4KPgoKPldlaXJkIGluZGVudGF0aW9uCgpNeSBtaXN0YWtl
LiBXaWxsIGJlIGNvcnJlY3RlZCBpbiBuZXh0LgoKPgo+PiAgIEluIG9kZXIgdG8gZml4IHRoaXMg
aXNzdWUsIHdlIGRlY2lkZSB0byB1c2UgdGhlIG1vZGVtIG5hbWUKPgo+Im9yZGVyIgo+Cj4+IHRv
IGRvIGEgbWF0Y2ggaW4gY2xpZW50IGRyaXZlciBzaWRlLiBUaGVuIGNsaWVudCBkcml2ZXIgY291
bGQKPj4gc2V0IGEgY29ycmVzcG9uZGluZyBtdXhfaWQgdmFsdWUgZm9yIHRoaXMgbW9kZW0gcHJv
ZHVjdC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNv
bT4KPj4gLS0tCj4+ICAgZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyB8IDEgKwo+
PiAgIGluY2x1ZGUvbGludXgvbWhpLmggICAgICAgICAgICAgICAgfCAyICsrCj4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1
cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVy
aWMuYwo+PiBpbmRleCAxZmIxYzJmMmZlMTIuLjE0YTExODgwYmNlYSAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+PiArKysgYi9kcml2ZXJzL2J1cy9t
aGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+IEBAIC0xMDg2LDYgKzEwODYsNyBAQCBzdGF0aWMgaW50
IG1oaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2
aWNlX2lkICppZCkKPj4gICAJbWhpX2NudHJsLT5ydW50aW1lX2dldCA9IG1oaV9wY2lfcnVudGlt
ZV9nZXQ7Cj4+ICAgCW1oaV9jbnRybC0+cnVudGltZV9wdXQgPSBtaGlfcGNpX3J1bnRpbWVfcHV0
Owo+PiAgIAltaGlfY250cmwtPm1ydSA9IGluZm8tPm1ydV9kZWZhdWx0Owo+PiArCW1oaV9jbnRy
bC0+bmFtZSA9IGluZm8tPm5hbWU7Cj4+ICAgCj4+ICAgCWlmIChpbmZvLT5lZGxfdHJpZ2dlcikK
Pj4gICAJCW1oaV9jbnRybC0+ZWRsX3RyaWdnZXIgPSBtaGlfcGNpX2dlbmVyaWNfZWRsX3RyaWdn
ZXI7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21oaS5oIGIvaW5jbHVkZS9saW51eC9t
aGkuaAo+PiBpbmRleCBiNTczZjE1NzYyZjguLjg2YWE0ZjUyODQyYyAxMDA2NDQKPj4gLS0tIGEv
aW5jbHVkZS9saW51eC9taGkuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21oaS5oCj4+IEBAIC0z
NjEsNiArMzYxLDcgQEAgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyB7Cj4+ICAgICogQHdh
a2Vfc2V0OiBEZXZpY2Ugd2FrZXVwIHNldCBmbGFnCj4+ICAgICogQGlycV9mbGFnczogaXJxIGZs
YWdzIHBhc3NlZCB0byByZXF1ZXN0X2lycSAob3B0aW9uYWwpCj4+ICAgICogQG1ydTogdGhlIGRl
ZmF1bHQgTVJVIGZvciB0aGUgTUhJIGRldmljZQo+PiArICogQG5hbWU6IG5hbWUgb2YgdGhlIG1v
ZGVtCj4KCj5XaHkgcmVzdHJpY3QgdGhpcyB0byBtb2RlbXM/ICBUaGVyZSBhcmUgcGxlbnR5IG9m
IG90aGVyIE1ISSBkZXZpY2VzCgpBY3R1YWxseSBhbGwgTUhJIGRldmljZXMgY291bGQgYmUgY2Fs
bGVkIG1vZGVtcy4gSSBkb24ndCB0aGluayB0aGlzIGlzCmEgd3JvbmcgbmFtZS4KCj4KPj4gICAg
Kgo+PiAgICAqIEZpZWxkcyBtYXJrZWQgYXMgKHJlcXVpcmVkKSBuZWVkIHRvIGJlIHBvcHVsYXRl
ZCBieSB0aGUgY29udHJvbGxlciBkcml2ZXIKPj4gICAgKiBiZWZvcmUgY2FsbGluZyBtaGlfcmVn
aXN0ZXJfY29udHJvbGxlcigpLiBGb3IgdGhlIGZpZWxkcyBtYXJrZWQgYXMgKG9wdGlvbmFsKQo+
PiBAQCAtNDQ1LDYgKzQ0Niw3IEBAIHN0cnVjdCBtaGlfY29udHJvbGxlciB7Cj4+ICAgCWJvb2wg
d2FrZV9zZXQ7Cj4+ICAgCXVuc2lnbmVkIGxvbmcgaXJxX2ZsYWdzOwo+PiAgIAl1MzIgbXJ1Owo+
PiArCWNvbnN0IGNoYXIgKm5hbWU7Cj4KCj5QbGVhc2UgcnVuIHBhaG9sZQoKRW1tLCBqdXN0IGNo
ZWNrZWQswqAgdGhlcmUgYXJlIDMgaG9sZXM6CsKgwqDCoCB1MzLCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE0zO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKsKgwqAgMzEywqDCoMKgwqAgNCAqLwrCoMKgIMKgLyogWFhYIDQgYnl0ZXMg
aG9sZSwgdHJ5IHRvIHBhY2sgKi8KLi4uCsKgwqDCoCBib29swqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2FrZV9zZXQ7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8qwqDCoCA1MjbCoMKgwqDCoCAxICovCsKgwqAgwqAvKiBYWFggMSBieXRlIGhvbGUsIHRyeSB0
byBwYWNrICovCi4uLgrCoMKgwqAgdTMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtcnU7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKg
wqAgNTM2wqDCoMKgwqAgNCAqLwrCoMKgIMKgLyogWFhYIDQgYnl0ZXMgaG9sZSwgdHJ5IHRvIHBh
Y2sgKi8KCkkgd2lsbCBwdXQgJ2NvbnN0IGNoYXIgKm5hbWUnIGFib3ZlICd1MzIgbXJ1JyB0byBh
dm9pZCB0aGUgbGFzdCBob2xlLgpJcyB0aGlzIG9rYXk/Cgo+Cj4+ICAgfTsKPj4gICAKPj4gICAv
KioK

