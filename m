Return-Path: <linux-arm-msm+bounces-23489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D66289118FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 05:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F8E1C21178
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 03:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D218528F;
	Fri, 21 Jun 2024 03:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="nd6HCeTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3D3197;
	Fri, 21 Jun 2024 03:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718940392; cv=none; b=iUT5Gz0u3ccNBPOGUpRX6cYxgEAr8oorAX2CJhwhA8UbQkL3EFj/MuFsNI3VfD2SO1q7lqkdXV673FkllixPI18/lXVyxX0Rl7QxgDSCLwpv26maT2tF0bo3N3pJ8prbRrWXvre3Xs4QJSFtuRvS4QQzybS4mZviC10JTaFKpd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718940392; c=relaxed/simple;
	bh=vMWTWeQ8yQS1mpLRBhYhJ7DiJfhYh9N2PlX1oHWDMOA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=OcKzG9uU9YPxqB3Z8Os4Tc/m4NPBtGAPR0Xei9cN3yFI1r/mfkUD4YDlOjoQipRMVA1BVXfDpq4zVleyprbvy+l8Emb9g+EKSxOB3DudrT5rce9wPuCLh5QOuo8A4ktREDkeV1kfala8tkzn2IPoVThLQgPDg97A3okGf1BqRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=nd6HCeTf reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Fo88QUrNuP7FNnqZTa22w81geRP5wEvUU2/XeQwG2es=; b=n
	d6HCeTf6QiASWhaY0ImjRdDTGScSDlGz7xhjT/z1nJCz0tEFKHykXb6XArxtTkpz
	iaWH2gOjWcIY3hr2NQD1HE+aGR+2nxRFZvfrtIRGjAhsK8in8acdx3fTTRwxvOoS
	1PRDmJ4sOsoM436vXqjS6IRbbE3h0zeX40rSrWZa+k=
Received: from slark_xiao$163.com ( [223.104.68.12] ) by
 ajax-webmail-wmsvr-40-116 (Coremail) ; Fri, 21 Jun 2024 11:10:21 +0800
 (CST)
Date: Fri, 21 Jun 2024 11:10:21 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Sergey Ryazanov" <ryazanov.s.a@gmail.com>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	johannes@sipsolutions.net, quic_jhugo@quicinc.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2 2/2] net: wwan: mhi: make default data link id
 configurable
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <0b24c10f-1c20-4bd1-958b-dbf89cb28792@gmail.com>
References: <20240612093941.359904-1-slark_xiao@163.com>
 <0b24c10f-1c20-4bd1-958b-dbf89cb28792@gmail.com>
X-NTES-SC: AL_Qu2aCvWYtkwp5ymcbekfmk0SheY6UMayv/4v1IZSPZ98jD3p3QcLX3NqG1LaysKhCzCnijG+azJw1u9ZWrBoQqwXkG7PRbh5R2RojK6tJeC24g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <269323e2.35a6.19038c60d00.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3v9Ae73RmTI90AA--.7927W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQoFZGV4IM2ADQACsh
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKCgoKCgoKQXQgMjAyNC0wNi0xMyAwNTo1NDowMywgIlNlcmdleSBSeWF6YW5vdiIgPHJ5YXph
bm92LnMuYUBnbWFpbC5jb20+IHdyb3RlOgo+SGVsbG8gU2xhcmssIE1hbml2YW5uYW4sCj4KPk9u
IDEyLjA2LjIwMjQgMTI6MzksIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IEZvciBTRFg3MiBNQklNIGRl
dmljZSwgaXQgc3RhcnRzIGRhdGEgbXV4IGlkIGZyb20gMTEyIGluc3RlYWQgb2YgMC4KPj4gVGhp
cyB3b3VsZCBsZWFkIHRvIGRldmljZSBjYW4ndCBwaW5nIG91dHNpZGUgc3VjY2Vzc2Z1bGx5Lgo+
PiBBbHNvIE1CSU0gc2lkZSB3b3VsZCByZXBvcnQgImJhZCBwYWNrZXQgc2Vzc2lvbiAoMTEyKSIu
Cj4+IFNvIHdlIGFkZCBhIGxpbmsgaWQgZGVmYXVsdCB2YWx1ZSBmb3IgdGhlc2UgU0RYNzIgcHJv
ZHVjdHMgd2hpY2gKPj4gd29ya3MgaW4gTUJJTSBtb2RlLgo+Cj5UaGUgcGF0Y2ggaXRzZWxmIGxv
b2tzIGdvb2QgdG8gbWUgZXhjZXB0IGEgdGlueSBuaXRwaWNrIChzZWUgYmVsb3cpLiAKPk1lYW53
aGlsZSwgSSBjYW4gbm90IHVuZGVyc3RhbmQgd2hlbiB3ZSBzaG91bGQgbWVyZ2UgaXQuIER1cmlu
ZyB0aGUgVjEgCj5kaXNjdXNzaW9uLCBJdCB3YXMgbWVudGlvbmVkIHRoYXQgd2UgbmVlZCB0aGlz
IGNoYW5nZSBzcGVjaWZpY2FsbHkgZm9yIAo+Rm94Y29ubiBTRFg3MiBtb2RlbS4gV2l0aG91dCBh
bnkgYWN0dWFsIHVzZXJzIHRoZSBjb25maWd1cmFibGUgZGVmYXVsdCAKPmRhdGEgbGluayBpZCBp
cyBhIGRlYWQgY29kZS4KPgo+QWNjb3JkaW5nIHRvIHRoZSBBUk0gTVNNIHBhdGNod29yayBbMV0s
IHRoZSBtYWluIEZveGNvbm4gU0RYNzIgCj5pbnRyb2R1Y2luZyBwYXRjaCBpcyAoYSkgbm90IHll
dCBtZXJnZWQsIChiKSBubyBtb3JlIGFwcGxpY2FibGUuIFNvLCBhcyAKPmZhciBhcyBJIHVuZGVy
c3RhbmQsIGl0IHNob3VsZCBiZSByZXNlbmQuIEluIHRoaXMgY29udGV4dCwgYSBiZXN0IHdheSB0
byAKPm1lcmdlIHRoZSBtb2RlbSBzdXBwb3J0IGlzIHRvIHByZXBlbmQgdGhlIG1vZGVtIGludHJv
ZHVjdGlvbiBwYXRjaCB3aXRoIAo+dGhlc2UgY2hhbmdlcyBmb3JtaW5nIGEgc2VyaWVzOgo+MS8z
OiBidXM6IG1oaTogaG9zdDogSW1wb3J0IG11eF9pZCBpdGVtCj4yLzM6IG5ldDogd3dhbjogbWhp
OiBtYWtlIGRlZmF1bHQgZGF0YSBsaW5rIGlkIGNvbmZpZ3VyYWJsZQo+My8zOiBidXM6IG1oaTog
aG9zdDogQWRkIEZveGNvbm4gU0RYNzIgcmVsYXRlZCBzdXBwb3J0Cj4KPkFuZCBtZXJnZSB0aGUg
c2VyaWVzIGFzIHdob2xlLCB3aGVuIGV2ZXJ5dGhpbmcgd2lsbCBiZSByZWFkeS4gVGhpcyB3aWxs
IAo+aGVscCB1cyB0byBhdm9pZCBwYXJ0aWFsbHkgbWVyZ2VkIHdvcmsgYW5kIHdpbGwga2VlcCB0
aGUgbW9kZW0gc3VwcG9ydCAKPmludHJvZHVjdGlvbiBjbGVhci4KPgoKWWVzLCBjdXJyZW50bHkg
dGhlc2UgMyBwYXRjaGVzIHdvdWxkIGJlIG1lcmdlZCBieSBNYW5pIGF0IHRoZSBzYW1lIHRpbWUu
ClNvIEkgdGhpbmsgdGhlcmUgaXMgbm8gYnVpbGQgZmFpbHVyZSByaXNrLgoKPk1hbml2YW5uYW4s
IGNvdWxkIHlvdSBzaGFyZSB0aGUgbWFpbiBbMV0gRm94Y29ubiBTRFg3MiBpbnRyb2R1Y3Rpb24g
Cj5wYXRjaCBzdGF0dXMsIGFuZCB5b3VyIHRob3VnaHRzIHJlZ2FyZGluZyB0aGUgbWVyZ2luZyBw
cm9jZXNzPwoKV2Ugd2VyZSBkaXNjdXNzaW5nIGFub3RoZXIgcGF0Y2ggaW4gbGFzdCB3ZWVrcy4g
QW5kIHdlIHN0aWxsIGhhdmUgbm90CnJlYWNoZWQgYSBjb25zZW5zdXMuIExldCdzIGZvY3VzIG9u
IHRoYXQgcGF0Y2ggZmlyc3RseS4KQW5kIE1hbmksIHBsZWFzZSBsZXQgdXMga25vdyBhYm91dCB0
aGUgbWVyZ2luZyBwcm9jZXNzIHNpbmNlIHRoZSBuZXcKbWVyZ2Ugd2luZG93IGlzIG9wZW4gb3Ig
d2lsbCBvcGVuIHNvb24/CgpUaGFua3MKPgo+Cj4xLiAKPmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1hcm0tbXNtL3BhdGNoLzIwMjQwNTIwMDcwNjMzLjMwODkxMy0x
LXNsYXJrX3hpYW9AMTYzLmNvbS8KPgo+PiBTaWduZWQtb2ZmLWJ5OiBTbGFyayBYaWFvIDxzbGFy
a194aWFvQDE2My5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJp
bS5jIHwgMyArKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd3dhbi9taGlfd3dhbl9tYmlt
LmMgYi9kcml2ZXJzL25ldC93d2FuL21oaV93d2FuX21iaW0uYwo+PiBpbmRleCAzZjcyYWU5NDNi
MjkuLmM3MzFmZTIwODE0ZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvd3dhbi9taGlfd3dh
bl9tYmltLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvd3dhbi9taGlfd3dhbl9tYmltLmMKPj4gQEAg
LTYxOCw3ICs2MTgsOCBAQCBzdGF0aWMgaW50IG1oaV9tYmltX3Byb2JlKHN0cnVjdCBtaGlfZGV2
aWNlICptaGlfZGV2LCBjb25zdCBzdHJ1Y3QgbWhpX2RldmljZV9pZAo+PiAgIAltYmltLT5yeF9x
dWV1ZV9zeiA9IG1oaV9nZXRfZnJlZV9kZXNjX2NvdW50KG1oaV9kZXYsIERNQV9GUk9NX0RFVklD
RSk7Cj4+ICAgCj4+ICAgCS8qIFJlZ2lzdGVyIHd3YW4gbGluayBvcHMgd2l0aCBNSEkgY29udHJv
bGxlciByZXByZXNlbnRpbmcgV1dBTiBpbnN0YW5jZSAqLwo+PiAtCXJldHVybiB3d2FuX3JlZ2lz
dGVyX29wcygmY250cmwtPm1oaV9kZXYtPmRldiwgJm1oaV9tYmltX3d3YW5fb3BzLCBtYmltLCAw
KTsKPj4gKwlyZXR1cm4gd3dhbl9yZWdpc3Rlcl9vcHMoJmNudHJsLT5taGlfZGV2LT5kZXYsICZt
aGlfbWJpbV93d2FuX29wcywgbWJpbSwKPj4gKwkJbWhpX2Rldi0+bWhpX2NudHJsLT5saW5rX2lk
KTsKPgo+SnVzdCBhIG5pdHBpY2suIFRoZSBzZWNvbmQgbGluZSBoYWQgYmV0dGVyIGJlIGFsaWdu
ZWQgd2l0aCB0aGUgb3BlbmluZyAKPmJyYWNrZXQ6Cj4KPnJldHVybiB3d2FuX3JlZ2lzdGVyX29w
cygmY250cmwtPi4uLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICBtaGlfZGV2LT4uLi4KPgo+
PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgdm9pZCBtaGlfbWJpbV9yZW1vdmUoc3RydWN0IG1oaV9k
ZXZpY2UgKm1oaV9kZXYpCj4KPi0tCj5TZXJnZXkK

