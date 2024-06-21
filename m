Return-Path: <linux-arm-msm+bounces-23488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 517969118FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 05:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA471C21159
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 03:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0237E82D94;
	Fri, 21 Jun 2024 03:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="CUhEEb2D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71569197;
	Fri, 21 Jun 2024 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718939862; cv=none; b=iOj4Om4YgrS86OC9+XDQhCJUcNO+nqs26gjKG5dJWkJLwlbLZdxvnX6G0ktotdJcmu51smi9aV5NPK6q7ysmCppR7H6mXBApyU3MENeaIcddYu7ggwQvfwQEzEjCA4sMThUlg02BEmMl3HiKDs/1WiuFerKAXpqpdnUmXVP807k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718939862; c=relaxed/simple;
	bh=zLIJ2NUYDCtAiU8SbwxgK3XmrucsiNa/tzwKEMuF0oo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZuW5DZ7+IgL13cfgB50+a0G7EkYr+sA84gw1rC3hBKH9Y0F9OwR5O5OvNwZbMgEJ6LWQxI5MsORrJ9Hli+XtTp6+x5GD/bodcszZDdoUS2UcEsa9qpCPoUx/c0jP38ULUnVGMIXCFaMr95hO/1ankgx5ZqZxJRd95PtXA8RKrEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=CUhEEb2D reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=wr4I4iNRseCiBnqESPfc1AXICjmoXcqm2f1JWm2tHvQ=; b=C
	UhEEb2DQtJ429uxHuVbHCnihtRRmva4OcgObpg33whxZp+XrRVKhnpqgcyaytslT
	XANcZ/Ef4jbeVhyeaXD0JJFUiLYVgs9T+2bO6Y0DTZITQBCHXSX+ocq/bYrhEsIk
	N4VW2YNfHLsBJbwZT2Yj6YE/xs+j/xTuyJgwe2crAE=
Received: from slark_xiao$163.com ( [223.104.68.12] ) by
 ajax-webmail-wmsvr-40-116 (Coremail) ; Fri, 21 Jun 2024 11:17:16 +0800
 (CST)
Date: Fri, 21 Jun 2024 11:17:16 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Jeffrey Hugo" <quic_jhugo@quicinc.com>
Cc: "Loic Poulain" <loic.poulain@linaro.org>, 
	"Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <c275ee49-ac59-058c-7482-c8a92338e7a2@quicinc.com>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
 <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>
 <20240612145147.GB58302@thinkpad>
 <CAMZdPi-6GPWkj-wu4_mRucRBWXR03eYXu4vgbjtcns6mr0Yk9A@mail.gmail.com>
 <c275ee49-ac59-058c-7482-c8a92338e7a2@quicinc.com>
X-NTES-SC: AL_Qu2aCvWYtkAo4CSdYOkfmk0SheY6UMayv/4v1IZSPZ98jD3p3QcLX3NqG1LaysKhCzCnijG+azJw1u9ZWrBoQqwXnIaFbSPXG9inUBy1S+wRxg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5055db15.37d8.19038cc602c.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3_yu88HRmswUPAA--.46727W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQoFZGV4IM2ADQAEsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDYtMTQgMjI6MzE6MDMsICJKZWZmcmV5IEh1Z28iIDxxdWljX2podWdvQHF1aWNp
bmMuY29tPiB3cm90ZToKPk9uIDYvMTQvMjAyNCA0OjE3IEFNLCBMb2ljIFBvdWxhaW4gd3JvdGU6
Cj4+IE9uIFdlZCwgMTIgSnVuIDIwMjQgYXQgMTY6NTEsIE1hbml2YW5uYW4gU2FkaGFzaXZhbQo+
PiA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIFdl
ZCwgSnVuIDEyLCAyMDI0IGF0IDA4OjE5OjEzQU0gLTA2MDAsIEplZmZyZXkgSHVnbyB3cm90ZToK
Pj4+PiBPbiA2LzEyLzIwMjQgMzo0NiBBTSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+
Pj4+PiBPbiBXZWQsIEp1biAxMiwgMjAyNCBhdCAwNTozODo0MlBNICswODAwLCBTbGFyayBYaWFv
IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBTdWJqZWN0IGNvdWxkIGJlIGltcHJvdmVkOgo+Pj4+Pgo+Pj4+
PiBidXM6IG1oaTogaG9zdDogQWRkIGNvbmZpZ3VyYWJsZSBtdXhfaWQgZm9yIE1CSU0gbW9kZQo+
Pj4+Pgo+Pj4+Pj4gRm9yIFNEWDcyIE1CSU0gbW9kZSwgaXQgc3RhcnRzIGRhdGEgbXV4IGlkIGZy
b20gMTEyIGluc3RlYWQgb2YgMC4KPj4+Pj4+IFRoaXMgd291bGQgbGVhZCB0byBkZXZpY2UgY2Fu
J3QgcGluZyBvdXRzaWRlIHN1Y2Nlc3NmdWxseS4KPj4+Pj4+IEFsc28gTUJJTSBzaWRlIHdvdWxk
IHJlcG9ydCAiYmFkIHBhY2tldCBzZXNzaW9uICgxMTIpIi4KPj4+Pj4+IFNvIHdlIGFkZCBhIGRl
ZmF1bHQgbXV4X2lkIHZhbHVlIGZvciBTRFg3Mi4gQW5kIHRoaXMgdmFsdWUKPj4+Pj4+IHdvdWxk
IGJlIHRyYW5zZmVycmVkIHRvIHd3YW4gbWJpbSBzaWRlLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4g
ICAgZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyB8IDMgKysrCj4+Pj4+PiAgICBp
bmNsdWRlL2xpbnV4L21oaS5oICAgICAgICAgICAgICAgIHwgMiArKwo+Pj4+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3Bj
aV9nZW5lcmljLmMKPj4+Pj4+IGluZGV4IDBiNDgzYzdjNzZhMS4uOWU5YWRmODMyMGQyIDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+Pj4+Pj4g
KysrIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+Pj4+Pj4gQEAgLTUzLDYg
KzUzLDcgQEAgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gewo+Pj4+Pj4gICAgICAgICAgICB1bnNp
Z25lZCBpbnQgZG1hX2RhdGFfd2lkdGg7Cj4+Pj4+PiAgICAgICAgICAgIHVuc2lnbmVkIGludCBt
cnVfZGVmYXVsdDsKPj4+Pj4+ICAgICAgICAgICAgYm9vbCBzaWRlYmFuZF93YWtlOwo+Pj4+Pj4g
KyB1bnNpZ25lZCBpbnQgbXV4X2lkOwo+Pj4+Pj4gICAgfTsKPj4+Pj4+ICAgICNkZWZpbmUgTUhJ
X0NIQU5ORUxfQ09ORklHX1VMKGNoX251bSwgY2hfbmFtZSwgZWxfY291bnQsIGV2X3JpbmcpIFwK
Pj4+Pj4+IEBAIC00NjksNiArNDcwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rl
dl9pbmZvIG1oaV9mb3hjb25uX3NkeDcyX2luZm8gPSB7Cj4+Pj4+PiAgICAgICAgICAgIC5kbWFf
ZGF0YV93aWR0aCA9IDMyLAo+Pj4+Pj4gICAgICAgICAgICAubXJ1X2RlZmF1bHQgPSAzMjc2OCwK
Pj4+Pj4+ICAgICAgICAgICAgLnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4+Pj4+ICsgLm11eF9p
ZCA9IDExMiwKPj4+Pj4+ICAgIH07Cj4+Pj4+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9j
aGFubmVsX2NvbmZpZyBtaGlfbXYzeF9jaGFubmVsc1tdID0gewo+Pj4+Pj4gQEAgLTEwMzUsNiAr
MTAzNyw3IEBAIHN0YXRpYyBpbnQgbWhpX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
Y29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQo+Pj4+Pj4gICAgICAgICAgICBtaGlfY250
cmwtPnJ1bnRpbWVfZ2V0ID0gbWhpX3BjaV9ydW50aW1lX2dldDsKPj4+Pj4+ICAgICAgICAgICAg
bWhpX2NudHJsLT5ydW50aW1lX3B1dCA9IG1oaV9wY2lfcnVudGltZV9wdXQ7Cj4+Pj4+PiAgICAg
ICAgICAgIG1oaV9jbnRybC0+bXJ1ID0gaW5mby0+bXJ1X2RlZmF1bHQ7Cj4+Pj4+PiArIG1oaV9j
bnRybC0+bGlua19pZCA9IGluZm8tPm11eF9pZDsKPj4+Pj4KPj4+Pj4gQWdhaW4sICdsaW5rX2lk
JyBpcyBqdXN0IGEgV1dBTiB0ZXJtLiBVc2UgJ211eF9pZCcgaGVyZSBhbHNvLgo+Pj4+Cj4+Pj4g
RG9lcyB0aGlzIHJlYWxseSBiZWxvbmcgaW4gTUhJPyAgSWYgdGhpcyB3YXMgRFQsIEkgZG9uJ3Qg
dGhpbmsgd2Ugd291bGQgcHV0Cj4+Pj4gdGhpcyB2YWx1ZSBpbiBEVCwgYnV0IHJhdGhlciBoYXZl
IHRoZSBkcml2ZXIgKE1CSU0pIGRldGVjdCB0aGUgZGV2aWNlIGFuZAo+Pj4+IGNvZGUgaW4gdGhl
IHJlcXVpcmVkIHZhbHVlLgo+Pj4+Cj4+Pgo+Pj4gSSBiZWxpZXZlIHRoaXMgaXMgYSBtb2RlbSB2
YWx1ZSByYXRoZXIgdGhhbiBNSEkuIEJ1dCBJIHdhcyBPSyB3aXRoIGtlZXBpbmcgaXQgaW4KPj4+
IE1ISSBkcml2ZXIgc2luY2Ugd2Uga2luZCBvZiBrZWVwIG1vZGVtIHNwZWNpZmljIGNvbmZpZy4K
Pj4+Cj4+PiBCdXQgaWYgV1dBTiBjYW4gZGV0ZWN0IHRoZSBkZXZpY2UgYW5kIGFwcGx5IHRoZSBj
b25maWcsIEknbSBhbGwgb3ZlciBpdC4KPj4gCj4+IFRoYXQgd291bGQgcmVxdWlyZSBhdCBsZWFz
dCBzb21lIGluZm9ybWF0aW9uIGZyb20gdGhlIE1ISSBidXMgZm9yIHRoZQo+PiBNQklNIGRyaXZl
cgo+PiB0byBtYWtlIGEgZGVjaXNpb24sIHN1Y2ggYXMgYSBnZW5lcmljIGRldmljZSBJRCwgb3Ig
cXVpcmsgZmxhZ3MuLi4KPgo+SSBkb24ndCBzZWUgd2h5Lgo+Cj5UaGUgInNpbXBsZSIgd2F5IHRv
IGRvIGl0IHdvdWxkIGJlIHRvIGhhdmUgdGhlIGNvbnRyb2xsZXIgZGVmaW5lIGEgCj5kaWZmZXJl
bnQgY2hhbm5lbCBuYW1lLCBhbmQgdGhlbiBoYXZlIHRoZSBNQklNIGRyaXZlciBwcm9iZSBvbiB0
aGF0LiAKPlRoZSBNQklNIGRyaXZlciBjb3VsZCBhdHRhY2ggZHJpdmVyIGRhdGEgc2F5aW5nIHRo
YXQgaXQgbmVlZHMgdG8gaGF2ZSBhIAo+c3BlY2lmaWMgbXV4X2lkLgo+Cj5Pciwgd2l0aCB6ZXJv
IE1ISS9Db250cm9sbGVyIGNoYW5nZXMsIHRoZSBNQklNIGRyaXZlciBjb3VsZCBwYXJzZSB0aGUg
Cj5taGlfZGV2aWNlIHN0cnVjdCwgZ2V0IHRvIHRoZSBzdHJ1Y3QgZGV2aWNlLCBmb3IgdGhlIHVu
ZGVybHlpbmcgZGV2aWNlLCAKPmFuZCBleHRyYWN0IHRoZSBQQ0llIERldmljZSBJRCBhbmQgbWF0
Y2ggdGhhdCB0byBhIHdoaXRlIGxpc3Qgb2Yga25vd24gCj5kZXZpY2VzIHRoYXQgbmVlZCB0aGlz
IHByb3BlcnR5Lgo+Cj5JIGd1ZXNzIGlmIHRoZSBjb250cm9sbGVyIGNvdWxkIGF0dGFjaCBhIHBy
aXZhdGUgdm9pZCAqIHRvIHRoZSAKPm1oaV9kZXZpY2UgdGhhdCBpcyBvcGFxdWUgdG8gTUhJLCBi
dXQgYWxsb3dzIE1CSU0gdG8gbWFrZSBhIGRlY2lzaW9uLCAKPnRoYXQgd291bGQgYmUgb2suICBT
dWNoIGEgbWVjaGFuaXNtIHdvdWxkIGJlIGdlbmVyaWMsIGFuZCBleHRlbnNpYmxlIHRvIAo+b3Ro
ZXIgdXNlY2FzZXMgb2YgdGhlIHNhbWUgImNsYXNzIi4KPgo+LUplZmYKCkhpIGd1eXMsClRoaXMg
cGF0Y2ggbWFpbmx5IHJlZmVyIHRvIHRoZSBmZWF0dXJlIG9mIG1ydSBzZXR0aW5nIGJldHdlZW4g
bWhpIGFuZCB3d2FuIHNpZGUuCldlIHJhbnNmZXIgdGhpcyB2YWx1ZSB0byB3d2FuIHNpZGUgaWYg
d2UgZGVmaW5lIGl0IGluIG1oaSBzaWRlLCBvdGhlcndpc2UgYSBkZWZhdWx0CnZhbHVlIHdvdWxk
IGJlIHVzZWQgaW4gd3dhbiBzaWRlLiBXaHkgZG9uJ3Qgd2UganVzdCBhbGlnbiB3aXRoIHRoYXQ/
CgpUaGFua3MKCg==

