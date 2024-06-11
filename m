Return-Path: <linux-arm-msm+bounces-22268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE96902E0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 03:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D29A1C21F88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 01:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7D4A934;
	Tue, 11 Jun 2024 01:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="gyUcWiZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647ACEDF;
	Tue, 11 Jun 2024 01:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718070362; cv=none; b=OR2spRcgSRPwb4YxWf8qGg+4AoPshN4BLD69l8Hv36QFjB2EfU1jkGwo337zKGLYNeU9ptiw/QLl4DNTE79aT084Oa/D+A3vmwLCpJJN4VxK0DO8hYNjK5k3oMki55cq07KhJvUySBMG9V+xZ+ZSHkGZg0o21IeY5i4PU85Cl+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718070362; c=relaxed/simple;
	bh=5NSs9Jq/IvH6M6vdRrx8v4GnhYUK/xctGT7pD5vm7pY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=or1D8MRu/QI4zt72z41w1bwWz4konq6YyX63A9XQ2FE2jxWtLFcz40SwgETonB5DSjakAoKnnhr8/CnDa7zyPVW21j97jK9iwJzBNix0dkKEfV8Z/olyWYJEi7Ql75roT+D7pAsg0IQ4fUqd7Uq6IxZxCva035C2hrsCZzcmcG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=gyUcWiZT reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=NiZJDbT9jVgqyuAx6P1B7YmnJGfqCIgvfvp//rQmMEY=; b=g
	yUcWiZTa2qhFdSUSW7OtifoR92AbFpeLwGcBKAV47OUyGhLviPPCj72EPff9HuAK
	lXjLINh4tKZaJBJIfhvGay5gR29D+mpw0RfJT5eakYm4sg+9627kdMg+YwVU7raE
	NdtffVBKU5jujxKXbbqdJNxY+TkVvZqP0a4UTCC45o=
Received: from slark_xiao$163.com ( [223.104.68.135] ) by
 ajax-webmail-wmsvr-40-148 (Coremail) ; Tue, 11 Jun 2024 09:45:20 +0800
 (CST)
Date: Tue, 11 Jun 2024 09:45:20 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Jeffrey Hugo" <quic_jhugo@quicinc.com>, 
	"Sergey Ryazanov" <ryazanov.s.a@gmail.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	quic_qianyu@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re:Re: [PATCH v1 1/2] bus: mhi: host: Import link_id item
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <38a9c3af.1408.19004e530de.Coremail.slark_xiao@163.com>
References: <20240607100114.452979-1-slark_xiao@163.com>
 <4370ae55-9521-d2da-62b9-42d26b6fbece@quicinc.com>
 <38a9c3af.1408.19004e530de.Coremail.slark_xiao@163.com>
X-NTES-SC: AL_Qu2aCvycv0sp5imebekfmk8Sg+84W8K3v/0v1YVQOpF8jCHrxgkRXXVJP2bq0du3MRiqkxKdVzhnxtxTR5BccI0hvN8Yy7J6Xqoxkno3YY5DAA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <402e5117.1cb4.19004f89f4f.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3X3gzrGdmVcg3AA--.39728W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwP5ZGV4JtK1gQAGsC
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI0LTA2LTExIDA5OjI0OjA3LCAiU2xhcmsgWGlhbyIgPHNsYXJrX3hpYW9AMTYzLmNv
bT4gd3JvdGU6Cj4KPitNb3JlIG1haW50YWluZXIgdG8gdGhpcyBmaXJzdCBwYXRjaCBsaXN0Lgo+
Cj5BdCAyMDI0LTA2LTA3IDIzOjAxOjAwLCAiSmVmZnJleSBIdWdvIiA8cXVpY19qaHVnb0BxdWlj
aW5jLmNvbT4gd3JvdGU6Cj4+JFN1YmplY3Qgc2F5cyB0aGlzIGlzIHBhdGNoIDEgb2YgMiwgYnV0
IEkgZG9uJ3Qgc2VlIGEgc2Vjb25kIHBhdGNoIG5vciBhIAo+PmNvdmVyIGxldHRlci4KPj4KSGkg
SmVmZnJleSwKSSBhZGRlZCB5b3UgaW4gYW5vdGhlciBwYXRjaCBqdXN0IG5vdy4gUGxlYXNlIGhl
bHAgdGFrZSBhIHZpZXcgb24gdGhhdC4KVGhhbmtzLgoKPj5PbiA2LzcvMjAyNCA0OjAxIEFNLCBT
bGFyayBYaWFvIHdyb3RlOgo+Pj4gRm9yIFNEWDcyIE1CSU0gbW9kZSwgaXQgc3RhcnRzIGRhdGEg
bXV4IGlkIGZyb20gMTEyIGluc3RlYWQgb2YgMC4KPj4+IFRoaXMgd291bGQgbGVhZCB0byBkZXZp
Y2UgY2FuJ3QgcGluZyBvdXRzaWRlIHN1Y2Nlc3NmdWxseS4KPj4+IEFsc28gTUJJTSBzaWRlIHdv
dWxkIHJlcG9ydCAiYmFkIHBhY2tldCBzZXNzaW9uICgxMTIpIi4KPj4+IFNvIHdlIGFkZCBhIGxp
bmsgaWQgZGVmYXVsdCB2YWx1ZSBmb3IgU0RYNzIuCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IFNs
YXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL2J1cy9t
aGkvaG9zdC9wY2lfZ2VuZXJpYy5jIHwgMyArKysKPj4+ICAgaW5jbHVkZS9saW51eC9taGkuaCAg
ICAgICAgICAgICAgICB8IDEgKwo+Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMu
YyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPj4+IGluZGV4IDBiNDgzYzdj
NzZhMS4uMWY5ZGUyNzMwNzY2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3Qv
cGNpX2dlbmVyaWMuYwo+Pj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMu
Ywo+Pj4gQEAgLTUzLDYgKzUzLDcgQEAgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gewo+Pj4gICAJ
dW5zaWduZWQgaW50IGRtYV9kYXRhX3dpZHRoOwo+Pj4gICAJdW5zaWduZWQgaW50IG1ydV9kZWZh
dWx0Owo+Pj4gICAJYm9vbCBzaWRlYmFuZF93YWtlOwo+Pj4gKwl1bnNpZ25lZCBpbnQgbGlua19k
ZWZhdWx0Owo+Pj4gICB9Owo+Pj4gICAKPj4+ICAgI2RlZmluZSBNSElfQ0hBTk5FTF9DT05GSUdf
VUwoY2hfbnVtLCBjaF9uYW1lLCBlbF9jb3VudCwgZXZfcmluZykgXAo+Pj4gQEAgLTQ2OSw2ICs0
NzAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5f
c2R4NzJfaW5mbyA9IHsKPj4+ICAgCS5kbWFfZGF0YV93aWR0aCA9IDMyLAo+Pj4gICAJLm1ydV9k
ZWZhdWx0ID0gMzI3NjgsCj4+PiAgIAkuc2lkZWJhbmRfd2FrZSA9IGZhbHNlLAo+Pj4gKwkubGlu
a19kZWZhdWx0ID0gMTEyLAo+Pj4gICB9Owo+Pj4gICAKPj4+ICAgc3RhdGljIGNvbnN0IHN0cnVj
dCBtaGlfY2hhbm5lbF9jb25maWcgbWhpX212M3hfY2hhbm5lbHNbXSA9IHsKPj4+IEBAIC0xMDM1
LDYgKzEwMzcsNyBAQCBzdGF0aWMgaW50IG1oaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBk
ZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPj4+ICAgCW1oaV9jbnRybC0+cnVu
dGltZV9nZXQgPSBtaGlfcGNpX3J1bnRpbWVfZ2V0Owo+Pj4gICAJbWhpX2NudHJsLT5ydW50aW1l
X3B1dCA9IG1oaV9wY2lfcnVudGltZV9wdXQ7Cj4+PiAgIAltaGlfY250cmwtPm1ydSA9IGluZm8t
Pm1ydV9kZWZhdWx0Owo+Pj4gKwltaGlfY250cmwtPmxpbmtfaWQgPSBpbmZvLT5saW5rX2RlZmF1
bHQ7Cj4+PiAgIAo+Pj4gICAJaWYgKGluZm8tPmVkbF90cmlnZ2VyKQo+Pj4gICAJCW1oaV9jbnRy
bC0+ZWRsX3RyaWdnZXIgPSBtaGlfcGNpX2dlbmVyaWNfZWRsX3RyaWdnZXI7Cj4+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9taGkuaCBiL2luY2x1ZGUvbGludXgvbWhpLmgKPj4+IGluZGV4
IGI1NzNmMTU3NjJmOC4uNGRhMTBiOTljOTZlIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51
eC9taGkuaAo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9taGkuaAo+Pj4gQEAgLTQ0NSw2ICs0NDUs
NyBAQCBzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgewo+Pj4gICAJYm9vbCB3YWtlX3NldDsKPj4+ICAg
CXVuc2lnbmVkIGxvbmcgaXJxX2ZsYWdzOwo+Pj4gICAJdTMyIG1ydTsKPj4+ICsJdTMyIGxpbmtf
aWQ7Cj4+PiAgIH07Cj4+PiAgIAo+Pj4gICAvKioKPj4KPj5Ob25lIG9mIHRoaXMgaXMgYWN0dWFs
bHkgdXNlZC4gIERlYWQgY29kZSBpcyBnZW5lcmFsbHkgbm90IGFjY2VwdGVkLgo+Pgo+Pi1KZWZm
Cg==

