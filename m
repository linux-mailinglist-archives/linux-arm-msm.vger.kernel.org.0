Return-Path: <linux-arm-msm+bounces-19868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E60948C626C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 10:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C35A285408
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 08:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CFC48CC6;
	Wed, 15 May 2024 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="pVlwPtt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A308A3D966;
	Wed, 15 May 2024 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715760126; cv=none; b=n3m5e7O9qZop0iNvaW7UT3ft2MocPxlmXDWIGXD5C/HASkh+F8N9rDnvgjfk1BvZopX9P/Jr+KI0sgHHNHC4kgFuPF5dKBVL8cm6RobZDEirv61nRW8O/zY3NQXcIuE9LjhbakduBrEzvfERrzwfYaHUcjvzCCEy+U+2A3b+bfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715760126; c=relaxed/simple;
	bh=hrHHrCthnDkbhxmwWf3PyO/8Em4Rz6s5sS4Z9rFR2OY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZylrcQzK/B+H1/ZJzWvzbPfG2C9wIyKKgUjpFIPjuM6gBPO+2EIMK6VfuX+w5E77Y7Kj9qqXv+xaCpyC6caR3fllPlYbhplqMFasILJP8xXzfl0k2nJhOXdhVdP/jGsLeSZNW3AyW2CqUXysnGDzUNWAXe/bpxxe+6ypaqyqvZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=pVlwPtt7 reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=AjGiKpbZdJesgOpOC4FifaNjod7IrpMhlevvNRGAQdU=; b=p
	VlwPtt7qP7p6pA7YSumPWzW1mn+JSnYMGuczcnnSuitjVjDptSqt3nQFz2gd74Jj
	VUqr5csYeGYj1iyNEv3SY4PPLs+Vq9fxDsQ6BN99pKEP5H5IF9fNuYVKSVsw+9i7
	lKaa08DDRxIwOUO0OOtG+siRSb8OZM/CnipG7TwTzY=
Received: from slark_xiao$163.com ( [223.104.68.205] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Wed, 15 May 2024 16:01:37 +0800
 (CST)
Date: Wed, 15 May 2024 16:01:37 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_qianyu@quicinc.com
Subject: Re:Re: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240515074119.GA2445@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <20240515074119.GA2445@thinkpad>
X-NTES-SC: AL_Qu2aB/udv0gi4SKYZukfm0kaj+c/WMGzu/8m3oFXO51wjA/p9R8Ab25qLX/Vwd6AAAyRtzG+XDNV0PRYYrFmXaQG/750QsxNFgxocXfmxbLkWA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5eee5967.7bdf.18f7b4567b7.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3XyXha0Rmr+EvAA--.3133W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJR3fZGVOBNIhwAAEsb
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDUtMTUgMTU6NDE6MTksICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pdmFu
bmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj4rIFFpYW5nCj4KPk9uIFdlZCwgTWF5
IDE1LCAyMDI0IGF0IDA5OjI5OjIwQU0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IEF0IDIw
MjQtMDUtMTQgMjI6Mzc6NDEsICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pdmFubmFuLnNh
ZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj4+ID5PbiBGcmksIE1heSAxMCwgMjAyNCBhdCAx
MToyNjo1N0FNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+PiA+PiBBbGlnbiB3aXRoIFFjb20g
U0RYNzIsIGFkZCByZWFkeSB0aW1lb3V0IGl0ZW0gZm9yIEZveGNvbm4gU0RYNzIuCj4+ID4+IEFu
ZCBhbHNvLCBhZGQgZmlyZWhvc2Ugc3VwcG9ydCBzaW5jZSBTRFg3Mi4KPj4gPj4gCj4+ID4+IFNp
Z25lZC1vZmYtYnk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4gPj4gLS0tCj4+
ID4+ICBkcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIHwgMzEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KQo+PiA+PiAKPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5l
cmljLmMgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+ID4+IGluZGV4IDA4
ODQ0ZWU3OTY1NC4uMGZkOTRjMTkzZmM2IDEwMDY0NAo+PiA+PiAtLS0gYS9kcml2ZXJzL2J1cy9t
aGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+ID4+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3Bj
aV9nZW5lcmljLmMKPj4gPj4gQEAgLTM5OSw2ICszOTksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG1oaV9jaGFubmVsX2NvbmZpZyBtaGlfZm94Y29ubl9zZHg1NV9jaGFubmVsc1tdID0gewo+PiA+
PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19ETCgxMywgIk1CSU0iLCAzMiwgMCksCj4+ID4+ICAJTUhJ
X0NIQU5ORUxfQ09ORklHX1VMKDMyLCAiRFVOIiwgMzIsIDApLAo+PiA+PiAgCU1ISV9DSEFOTkVM
X0NPTkZJR19ETCgzMywgIkRVTiIsIDMyLCAwKSwKPj4gPj4gKwlNSElfQ0hBTk5FTF9DT05GSUdf
VUxfRlAoMzQsICJGSVJFSE9TRSIsIDMyLCAwKSwKPj4gPj4gKwlNSElfQ0hBTk5FTF9DT05GSUdf
RExfRlAoMzUsICJGSVJFSE9TRSIsIDMyLCAwKSwKPj4gPgo+PiA+VGhpcyBtZWFucyBTRFg1NSBp
cyBhbHNvIHN1cHBvcnRpbmcgRklSRUhPU0UgY2hhbm5lbHMsIHdoaWNoIGlzIG5vdCB0cnVlIEkK
Pj4gPmJlbGlldmUuCj4+IEFjdHVhbGx5LCBJIGp1c3QgdmVyaWZpZWQgaXQgd2l0aCBteSBzZHg1
NSBhbmQgdGhlIGFuc3dlciBpcyBZZXMuIFRoZXNlIGNoYW5uZWxzCj4+IGFyZSBjb21tb24gc2V0
dGluZ3MgZm9yIFFjb20gZGV2aWNlIHdoaWNoIHN1cHBvcnQgUENJZSBtb2RlLiBCVFcsIHRoZQo+
PiBkZWZhdWx0IHNldHRpbmdzIG9mIFFjb20gYW5kIFF1ZWN0ZWwgc3VwcG9ydCBmaXJlaG9zZSBm
b3IgdGhlaXIgc2R4NTUgcHJvZHVjdHMuCj4KPlFpYW5nLCBjYW4geW91IHBsZWFzZSBjb25maXJt
IHRoYXQgU0RYNTUgc3VwcG9ydHMgRklSRUhPU0UgY2hhbm5lbHM/Cj4KPj4gPgo+PiA+PiAgCU1I
SV9DSEFOTkVMX0NPTkZJR19IV19VTCgxMDAsICJJUF9IVzBfTUJJTSIsIDEyOCwgMiksCj4+ID4+
ICAJTUhJX0NIQU5ORUxfQ09ORklHX0hXX0RMKDEwMSwgIklQX0hXMF9NQklNIiwgMTI4LCAzKSwK
Pj4gPj4gIH07Cj4+ID4+IEBAIC00MTksNiArNDIxLDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bWhpX2NvbnRyb2xsZXJfY29uZmlnIG1vZGVtX2ZveGNvbm5fc2R4NTVfY29uZmlnID0gewo+PiA+
PiAgCS5ldmVudF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4+ID4+ICB9Owo+PiA+
PiAgCj4+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2Rl
bV9mb3hjb25uX3NkeDcyX2NvbmZpZyA9IHsKPj4gPj4gKwkubWF4X2NoYW5uZWxzID0gMTI4LAo+
PiA+PiArCS50aW1lb3V0X21zID0gMjAwMDAsCj4+ID4+ICsJLnJlYWR5X3RpbWVvdXRfbXMgPSA1
MDAwMCwKPj4gPj4gKwkubnVtX2NoYW5uZWxzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1
NV9jaGFubmVscyksCj4+ID4+ICsJLmNoX2NmZyA9IG1oaV9mb3hjb25uX3NkeDU1X2NoYW5uZWxz
LAo+PiA+PiArCS5udW1fZXZlbnRzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1NV9ldmVu
dHMpLAo+PiA+PiArCS5ldmVudF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4+ID4+
ICt9Owo+PiA+PiArCj4+ID4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8g
bWhpX2ZveGNvbm5fc2R4MjRfaW5mbyA9IHsKPj4gPj4gIAkubmFtZSA9ICJmb3hjb25uLXNkeDI0
IiwKPj4gPj4gIAkuY29uZmlnID0gJm1vZGVtX2ZveGNvbm5fc2R4NTVfY29uZmlnLAo+PiA+PiBA
QCAtNDQ4LDYgKzQ2MCwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8g
bWhpX2ZveGNvbm5fc2R4NjVfaW5mbyA9IHsKPj4gPj4gIAkuc2lkZWJhbmRfd2FrZSA9IGZhbHNl
LAo+PiA+PiAgfTsKPj4gPj4gIAo+PiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rl
dl9pbmZvIG1oaV9mb3hjb25uX3NkeDcyX2luZm8gPSB7Cj4+ID4+ICsJLm5hbWUgPSAiZm94Y29u
bi1zZHg3MiIsCj4+ID4+ICsJLmVkbCA9ICJxY29tL3NkeDcybS94Ymxfc19kZXZwcmdfbnMubWVs
ZiIsCj4+ID4KPj4gPldoYXQgaXMgJy5tZWxmJz8gSXMgdGhlIGZpcm13YXJlIGF2YWlsYWJsZSBz
b21ld2hlcmU/IERpZCB5b3UgcGxhbiB0byB1cHN0cmVhbQo+PiA+aXQgdG8gbGludXgtZmlybXdh
cmU/Cj4+ID4KPj4gVGhpcyBmaWxlIHNpbWlsYXIgd2l0aCAiZWRsLm1ibiIuIEluIFNEWDcyIHBy
b2R1Y3QsIHRoZSBkZWZhdWx0ICJlZGwiIGZpbGUgbmFtZSBpcwo+PiAieGJsX3NfZGV2cHJnX25z
Lm1lbGYiLiBDdXJyZW50bHkgd2UgZG9uJ3QgcGxhbiB0byB1cHN0cmVhbSBpdCB0byBsaW51eC1m
aXJtd2FyZQo+PiBzaW5jZSAyIHJlYXNvbnM6IDE6IHdlIHNoYXJlIHRoZSBzYW1lIGZvbGQgbmFt
ZSBzZHg3Mm0gd2l0aCBxY29tIG9yIG90aGVyIHZlbmRvcnMKPj4gMjogdGhpcyBmaWxlIG1heSBi
ZSBjaGFuZ2VkIHNpbmNlIHNkeDcyIHByb2R1Y3Qgc3RpbGwgdW5kZXIgZGV2ZWxvcGluZyBpbiBv
dXIgc2lkZS4gd2UKPj4gbWF5IGNoYW5nZSB0aGUgYmFzZSBsaW5lIGFjY29yZGluZyB0byBRQ09N
IHJlbGVhc2UuCj4KPlRoZW4gSSB3b3VsZCBhc2sgeW91IHRvIGFkZCBzdXBwb3J0IHdoZW4geW91
IGhhdmUgYSBzdGFibGUgZmlybXdhcmUuIEkgZG8gbm90Cj53YW50IHRvIGNoYW5nZSB0aGUgZmly
bXdhcmUgbmFtZSBhZnRlciBzb21lIHRpbWUgYXMgaXQgd2lsbCBjb25mdXNlIHVzZXJzLgo+Cj4t
IE1hbmkKSWYgYSBzdGFibGUgZmlybXdhcmUgbXVzdCBiZSBwcm92aWRlZCwgSSB0aGluayBJIHNo
YWxsIGNoYW5nZSB0aGUgZm9sZGVyIG5hbWUgZnJvbSBxY29tIHRvCmZveCwgZG8geW91IGFncmVl
IHRoaXM/CkJUVywgSSBuZWVkIHRvIGNoZWNrIGlmIGl0IHdvcmtzIGFmdGVyIHVwZGF0aW5nICdl
ZGwgZncnIGZyb20gIHhibF9zX2RldnByZ19ucy5tZWxmIHRvCmVkbC5tYm4uIAo+Cj4tLSAKPuCu
ruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40K

