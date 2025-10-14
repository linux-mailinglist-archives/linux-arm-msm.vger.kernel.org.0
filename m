Return-Path: <linux-arm-msm+bounces-77104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43DBD80C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16E104EC3DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C7B26E704;
	Tue, 14 Oct 2025 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="oXXstdut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02906155322;
	Tue, 14 Oct 2025 08:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428850; cv=none; b=sSI9vc4FONr4gvsA4Xs5KR3I8b/mS1rDKM6Tq59iPkL9DcAe5mX3av0XhITZSwVb4o3W20B2S0PRBJvWVSJGNVb7d9oNQQ2dE2cwdTsJA00s36rOA9Rj10nDKWz6+VUV5CD3iBoNzcPeD1V2gsHSO37E8IKhOm8CCiaTc0WgFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428850; c=relaxed/simple;
	bh=0IQM1RrUw9SRFVJgo6ML1hvd0WX4hboR1AQ2Xzou/Gc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JU9K6r13rCHtQXiPpaVQN1EQupYt+sAXryP6BtR2naVRHwj+sponW5Oz7LfAmFtE8+LPwoW/iMW4sm979dDghco1PjxY7+JlaVhVQ+JmK2D+qB7T/Zx0XQbu7PfcHA3BU1NtqhjwL3DQ/VFFRMd8bXX7FGe+xIuZ6GIaqakICIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=oXXstdut reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=V10i33KAKsIaBT1Gj4pvZVCl6oYsR+Aa3vuGKpnyAOI=; b=o
	XXstdutscWmC9/ir7HisNq0SnRfOwM7GsmdfLumF/2rA/DwB/FdEnLJFdLklzaOX
	uCMGVoda+pCEuYXCiMTII8F3V1P3p/1uKJHEAonOSWfrFUKfBMNaw3L3+sEZOon5
	gY3sxoW00IgaWmnIiONL6SSdDp6KV3ftuVhwwDfaZI=
Received: from slark_xiao$163.com (
 [2408:8459:3810:3fe3:4774:f539:b70a:47e3] ) by ajax-webmail-wmsvr-40-101
 (Coremail) ; Tue, 14 Oct 2025 15:50:03 +0800 (CST)
Date: Tue, 14 Oct 2025 15:50:03 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re:Re: [PATCH] bus: mhi: host: Update session id for each
 suspend and resume
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <4205cc0b.3a60.199508f0d03.Coremail.slark_xiao@163.com>
References: <20250912100827.294443-1-slark_xiao@163.com>
 <6510264c-d91a-45f3-b484-18d334c515e8@oss.qualcomm.com>
 <4205cc0b.3a60.199508f0d03.Coremail.slark_xiao@163.com>
X-NTES-SC: AL_Qu2dAviZt0or5SaaZ+kfmk8Sg+84W8K3v/0v1YVQOpF8jCvpyDwGUXZKMUDmwPO0MQysnR+weRRz6eNCYK5DbZgxLO3I0KR4Xp4BJyYL9+DCBQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2d5c6560.6e9e.199e1b29e6f.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZSgvCgB3gh2rAO5oPLwKAA--.714W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCwAsAZGjuAKvLLAAA3l
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNS0wOS0xNiAxMToyNjoxNiwgIlNsYXJrIFhpYW8iIDxzbGFya194aWFvQDE2My5jb20+
IHdyb3RlOgo+Cj4KPkF0IDIwMjUtMDktMTUgMTU6MjY6MzMsICJLcmlzaG5hIENoYWl0YW55YSBD
aHVuZHJ1IiA8a3Jpc2huYS5jaHVuZHJ1QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pgo+Pgo+
Pk9uIDkvMTIvMjAyNSAzOjM4IFBNLCBTbGFyayBYaWFvIHdyb3RlOgo+Pj4gT24gUXVhbGNvbW0g
bW9kdWxlIHNpZGUsIHRoZXJlIGlzIGEgVUFSVCBwcmludCBhcyBiZWxvdzoKPj4+IHNlc3Npb24g
aWQ6IDB4MzU1ZmU2ODkgc3RhdGU6Mgo+Pj4gc2Vzc2lvbiBpZDogMHgxZjQ3OGU0MiBzdGF0ZTo1
Cj4+PiBUaGUgc2Vzc2lvbiBpZCByZWFkcyBmcm9tIHJlZ2lzdGVyIEJISV9JTUdUWERCKDB4MjE4
KSwgYW5kIHRoZQo+Pj4gc3RhdGUgaW5kaWNhdGVzIHRoZSBEMyBvciBEMCBzdGF0ZS4KPj4+IAo+
Pj4gSW4gV2luZG93cyBzaWRlLCBNSEkgZHJpdmVyIHdvdWxkIHVwZGF0ZSB0aGlzIHNlc3Npb24g
aWQgZm9yIGVhY2gKPj4+IHN1c3BlbmQvcmVzdW1lIHByb2dyZXNzLiBXZSBiZW5lZml0IGZyb20g
dGhpcyBtZWNoYW5pc20gc2luY2UgaXQKPj4+IGNvdWxkIGhlbHAgc3luYyBlYWNoIHN1c3BlbmQg
YW5kIHJlc3VtZSBwcm9ncmVzcyBiZXR3ZWVuIGhvc3QgYW5kCj4+PiBkZXZpY2UsIGVzcGVjaWFs
bHkgZm9yIHNvbWUgc3VzcGVuZCBpc3N1ZSB3aGljaCBuZWVkcyB0byB0YWtlCj4+PiBodW5kcmVk
cyBvciB0aG91c2FuZHMgY3ljbGUuIFdlIGNhbiBlYXN5IHRvIGZpZ3VyZSBvdXQgd2hpY2gKPj4+
IHN1c3BlbmQgY3ljbGUgZ2V0IGEgcHJvYmxlbSBhbmQgd2hhdCdzIGhhcHBlbmVkIGF0IHRoYXQg
dGltZSBmb3IKPj4+IGJvdGggaG9zdCBhbmQgZGV2aWNlIGJlY2F1c2UgdGhleSBoYXZlIHNhbWUg
aWQuCj4+PiAKPj4+IEJ1dCBpbiBMaW51eCBzaWRlLCB0aGlzIHNlc3Npb24gaWQgdmFsdWUgd291
bGQgYWx3YXlzIGJlIDB4MC4KPj4+IFNvIHdlIGFkZCBpdCBmb3IgcG90ZW50aWFsIGRlYnVnIHVz
YWdlLgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2My5j
b20+Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy9idXMvbWhpL2hvc3QvcG0uYyB8IDE1ICsrKysrKysr
KysrKysrKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pj4gCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcG0uYyBiL2RyaXZlcnMvYnVzL21oaS9o
b3N0L3BtLmMKPj4+IGluZGV4IDMzZDkyYmYyZmMzZS4uYTY1NzNmNjg3MzYzIDEwMDY0NAo+Pj4g
LS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcG0uYwo+Pj4gKysrIGIvZHJpdmVycy9idXMvbWhp
L2hvc3QvcG0uYwo+Pj4gQEAgLTg2NCw2ICs4NjQsMTMgQEAgaW50IG1oaV9wbV9zdXNwZW5kKHN0
cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsKQo+Pj4gICAJc3RydWN0IGRldmljZSAqZGV2
ID0gJm1oaV9jbnRybC0+bWhpX2Rldi0+ZGV2Owo+Pj4gICAJZW51bSBtaGlfcG1fc3RhdGUgbmV3
X3N0YXRlOwo+Pj4gICAJaW50IHJldDsKPj4+ICsJdm9pZCBfX2lvbWVtICpiYXNlID0gbWhpX2Nu
dHJsLT5iaGk7Cj4+PiArCXUzMiBzZXNzaW9uX2lkOwo+Pj4gKwo+Pj4gKwlzZXNzaW9uX2lkID0g
TUhJX1JBTkRPTV9VMzJfTk9OWkVSTyhCSElfVFhEQl9TRVFOVU1fQk1TSyk7Cj4+PiArCWRldl9k
YmcoZGV2LCAiU3RhcnRpbmcgZW50ZXIgc3VzcGVuZCwgc2Vzc2lvbiBpZDogMHgleFxuIiwKPj4+
ICsJCXNlc3Npbl9pZCk7Cj4+PiArCW1oaV93cml0ZV9yZWcobWhpX2NudHJsLCBiYXNlLCBCSElf
SU1HVFhEQiwgc2Vzc2lvbl9pZCk7Cj4+SSBhZ3JlZSB0aGlzIHdpbGwgaGVscCBpbiBkZWJ1Z2dp
bmcsIGJ1dCB1bmxlc3MgaXQgaXMgZG9jdW1lbnRlZAo+PmluIHRoZSBNSEkgc3BlYyB3ZSBjYW4n
dCBoYXZlIHRoaXMuIFNpbmNlIGluIGZ1dHVyZSBpZiB0aGVyZSBpcwo+PnNvbWUgb3RoZXIgcHVy
cG9zZSBmb3IgdGhpcyByZWdpc3RlciB3ZSBlbmQgdXAgZmFjaW5nIGlzc3Vlcy4KPj4KPj5pZiBp
dCBhbHJlYWR5IHBhcnQgb2Ygc3BlYyBwb2ludCBpdCBpbiB0aGUgY29tbWl0IHRleHQuCj4+Cj4+
LSBLcmlzaG5hIENoYWl0YW55YS4KPkhpIEtyaXNobmEsCj5JIGFtIG5vdCBhIG1lbWJlciBvZiBR
dWFsY29tbSBzbyBJIGRvbid0IGhhdmUgYSBkZXRhaWxlZCBNSEkKPnNwZWMgdG8gZGVzY3JpYmUg
dGhpcyByZWdpc3RlciB1c2FnZS4KPkJ1dCBJIGdldCBzb21lIGluZm9ybWF0aW9uIGZyb20gdGhl
aXIgV2luZG93cyBNSEkgZHJpdmVyOgo+Cj4xLiBUaGVyZSBpcyByZWxlYXNlIG5vdGUgd2hpY2gg
ZGVzY3JpYmUgaXQ6Cj5VREUvUU1JL3dpbi9xY3VkZS9pbnN0YWxsZXIvUmVhZE1lLnR4dCAKPlVE
RS9RQ1VERS5TdGFuZGFsb25lLlNvdXJjZS4xLjAwLjQ0LldpbmRvd3MtQW55Q1BVX1JlYWRNZV8x
LnR4dAo+Li4uLi4uCj5NSEkgZHJpdmVyIDEuMS4wLjIKPiAgYi4gQWRkIHdyaXRlIHRvIEJISV9J
TUdUWERCIGZvciBkZWJ1ZyBwdXJwb3Nlcy4KPi4uLi4uLgo+Cj4yLkZyb20gdGhlIGNvZGUgc2lk
ZSwgIHRoZXJlIGlzIGEgc2FtZSBvcGVyYXRpb24gZm9yIE1ISSBkcml2ZXIKPmVudGVyIGludG8g
TTA6Cj5Ib3N0RHJpdmVyL3dpbi9OVEFEL01oaUhvc3QvTWhpL3NyYy9NaGkuYwo+Li4uLi4uCj52
b2lkIE1oaVJlcXVlc3RNMChQTUhJX0RFVl9DVFhUIE1oaUN0eHQpCj57Cj4uLi4uLgo+ICAgLyog
U2V0IEJISV9JTUdUWERCICovCj4gICBLZVF1ZXJ5U3lzdGVtVGltZSgmcmFuZFNlZWQpOwo+ICAg
TWhpQ3R4dC0+U2Vzc2lvbklEID0gUnRsUmFuZG9tRXgoJnJhbmRTZWVkLkxvd1BhcnQpOwo+ICAg
TWhpVHJhY2UoVFJBQ0VfTEVWRUxfRVJST1IsIFRSQUNFX0ZMQUdfTUhJQ09ORklHLCAiTkVXIFNl
c3Npb25JRDogMHgleFxuIiwgTWhpQ3R4dC0+U2Vzc2lvbklEKTsKPiAgIE1ISV9XUklURV9SRUco
ZGV2aWNlQ29udGV4dC0+QkhJQ29udGV4dC5CaGlCYXNlLCBCSElfSU1HVFhEQiwgTWhpQ3R4dC0+
U2Vzc2lvbklEKTsKPgo+ICAgTWhpVHJhY2UoVFJBQ0VfTEVWRUxfRVJST1IsIFRSQUNFX0ZMQUdf
TUhJQ09ORklHLCAiUmVxIC0+IE0wXG4iKTsKPi4uLi4uLgo+Cj5Ob3Qgc3VyZSBpZiBhYm92ZSBp
bmZvcm1hdGlvbiBpcyBlbm91Z2ggZm9yIHRoaXMgY29tbWl0Lgo+Cj5UaGFua3MKCkFueSB1cGRh
dGVzIGFib3V0IHRoaXMgY29tbWl0PwoKCj4+PiAgIAo+Pj4gICAJaWYgKG1oaV9jbnRybC0+cG1f
c3RhdGUgPT0gTUhJX1BNX0RJU0FCTEUpCj4+PiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4+PiBAQCAt
OTUyLDYgKzk1OSwxNCBAQCBzdGF0aWMgaW50IF9fbWhpX3BtX3Jlc3VtZShzdHJ1Y3QgbWhpX2Nv
bnRyb2xsZXIgKm1oaV9jbnRybCwgYm9vbCBmb3JjZSkKPj4+ICAgCXN0cnVjdCBkZXZpY2UgKmRl
diA9ICZtaGlfY250cmwtPm1oaV9kZXYtPmRldjsKPj4+ICAgCWVudW0gbWhpX3BtX3N0YXRlIGN1
cl9zdGF0ZTsKPj4+ICAgCWludCByZXQ7Cj4+PiArCXZvaWQgX19pb21lbSAqYmFzZSA9IG1oaV9j
bnRybC0+YmhpOwo+Pj4gKwl1MzIgc2Vzc2lvbl9pZDsKPj4+ICsKPj4+ICsJc2Vzc2lvbl9pZCA9
IE1ISV9SQU5ET01fVTMyX05PTlpFUk8oQkhJX1RYREJfU0VRTlVNX0JNU0spOwo+Pj4gKwlkZXZf
ZGJnKGRldiwgIlN0YXJ0aW5nIGVudGVyIHJlc3VtZSwgc2Vzc2lvbiBpZDogMHgleFxuIiwKPj4+
ICsJCXNlc3Npb25faWQpOwo+Pj4gKwo+Pj4gKwltaGlfd3JpdGVfcmVnKG1oaV9jbnRybCwgYmFz
ZSwgQkhJX0lNR1RYREIsIHNlc3Npb25faWQpOwo+Pj4gICAKPj4+ICAgCWRldl9kYmcoZGV2LCAi
RW50ZXJlZCB3aXRoIFBNIHN0YXRlOiAlcywgTUhJIHN0YXRlOiAlc1xuIiwKPj4+ICAgCQl0b19t
aGlfcG1fc3RhdGVfc3RyKG1oaV9jbnRybC0+cG1fc3RhdGUpLAo=

