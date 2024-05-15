Return-Path: <linux-arm-msm+bounces-19867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170A8C6257
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 09:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D68891F2210E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 07:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2171948CCD;
	Wed, 15 May 2024 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="bwIdvmve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB82A482E9;
	Wed, 15 May 2024 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715759898; cv=none; b=I86FZU8xftwK2SLv+U+myEt85VV7ZvujBUry7E6fXt7jtf2lgWncYW0kv/fFO5CEotXXTdAvzBJUPV00XLU8tvQ/iBV3iD3hWn4CQqeTwLKz3KYMXBuRYhUb4hPtSaL+8pwXtrwDliPqFD/oQw+FY47tJidHL/2W2SXP+Dopy6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715759898; c=relaxed/simple;
	bh=hJMKYClT3rIcCrTCK6ORUFF1P5fFlzLKjJG4W7J5QFo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=lCmJzlfXrz9QtV60ulBT6xZ7tHenOSZUaeEL5HHs8dhwSvS5qX6BRc5pQPjKDwGgXI6yXodGqia/xz+59gdpIyYheIN614f4L3AAZAICZB1ZzUZS6Xcbjr96ExhOrhP33F0Qk7kHcZrbrptMXhb/GdJvxea3017fafQvpK0haUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=bwIdvmve reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=MrGCgqKguiY7hQ9HCx9sc6Em/KsIRxXTbthTm4JpM3w=; b=b
	wIdvmveH7dRBOheQkZ2ibyUbL1QZ4jKhXWhqk1WZAa093edVxyu4Z0gN5tAeOQQE
	xeeijkedHo8ZaUClMN6SFhkFRebUc1P8fUavS1p4/c24mluDODkeNbM47ljG8W9h
	buON4Z6Gi2XtzDP8mfOYwk2lUmJeaa5k78bfgPPSbQ=
Received: from slark_xiao$163.com ( [223.104.68.205] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Wed, 15 May 2024 15:57:59 +0800
 (CST)
Date: Wed, 15 May 2024 15:57:59 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:Re: Re:Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240515074315.GB2445@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <fc42977.1ac5.18f79eb945a.Coremail.slark_xiao@163.com>
 <20240515074315.GB2445@thinkpad>
X-NTES-SC: AL_Qu2aB/uetkAs7yKQZ+kfm0kaj+c/WMGzu/8m3oFXO51wjA/p9R8Ab25qLX/Vwd6AAAyRtzG+XDNV0PRYYrFmXaQGNN5TjrI9qoCZ/7m7datPbg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4717acb4.7aa5.18f7b421477.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3f4AHa0RmpV4BAA--.2951W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJR3fZGVOBNIhwAACsd
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNC0wNS0xNSAxNTo0MzoxNSwgIk1hbml2YW5uYW4gU2FkaGFzaXZhbSIgPG1hbml2YW5u
YW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3cm90ZToKPk9uIFdlZCwgTWF5IDE1LCAyMDI0IGF0
IDA5OjQzOjUzQU0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IAo+PiBTZW5kIGFnYWluIHdp
dGggdGV4dCBtb2RlLgo+PiBBdCAyMDI0LTA1LTE1IDA5OjI5OjIwLCAiU2xhcmsgWGlhbyIgPHNs
YXJrX3hpYW9AMTYzLmNvbT4gd3JvdGU6Cj4+ID5BdCAyMDI0LTA1LTE0IDIyOjM3OjQxLCAiTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdy
b3RlOgo+PiA+Pk9uIEZyaSwgTWF5IDEwLCAyMDI0IGF0IDExOjI2OjU3QU0gKzA4MDAsIFNsYXJr
IFhpYW8gd3JvdGU6Cj4+ID4+PiBBbGlnbiB3aXRoIFFjb20gU0RYNzIsIGFkZCByZWFkeSB0aW1l
b3V0IGl0ZW0gZm9yIEZveGNvbm4gU0RYNzIuCj4+ID4+PiBBbmQgYWxzbywgYWRkIGZpcmVob3Nl
IHN1cHBvcnQgc2luY2UgU0RYNzIuCj4+ID4+PiAKPj4gPj4+IFNpZ25lZC1vZmYtYnk6IFNsYXJr
IFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4gPj4+IC0tLQo+PiA+Pj4gIGRyaXZlcnMvYnVz
L21oaS9ob3N0L3BjaV9nZW5lcmljLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+PiA+Pj4gCj4+ID4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyBiL2RyaXZl
cnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPj4gPj4+IGluZGV4IDA4ODQ0ZWU3OTY1NC4u
MGZkOTRjMTkzZmM2IDEwMDY0NAo+PiA+Pj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNp
X2dlbmVyaWMuYwo+PiA+Pj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMu
Ywo+PiA+Pj4gQEAgLTM5OSw2ICszOTksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jaGFu
bmVsX2NvbmZpZyBtaGlfZm94Y29ubl9zZHg1NV9jaGFubmVsc1tdID0gewo+PiA+Pj4gIAlNSElf
Q0hBTk5FTF9DT05GSUdfREwoMTMsICJNQklNIiwgMzIsIDApLAo+PiA+Pj4gIAlNSElfQ0hBTk5F
TF9DT05GSUdfVUwoMzIsICJEVU4iLCAzMiwgMCksCj4+ID4+PiAgCU1ISV9DSEFOTkVMX0NPTkZJ
R19ETCgzMywgIkRVTiIsIDMyLCAwKSwKPj4gPj4+ICsJTUhJX0NIQU5ORUxfQ09ORklHX1VMX0ZQ
KDM0LCAiRklSRUhPU0UiLCAzMiwgMCksCj4+ID4+PiArCU1ISV9DSEFOTkVMX0NPTkZJR19ETF9G
UCgzNSwgIkZJUkVIT1NFIiwgMzIsIDApLAo+PiA+Pgo+PiA+PlRoaXMgbWVhbnMgU0RYNTUgaXMg
YWxzbyBzdXBwb3J0aW5nIEZJUkVIT1NFIGNoYW5uZWxzLCB3aGljaCBpcyBub3QgdHJ1ZSBJCj4+
ID4+YmVsaWV2ZS4KPj4gPkFjdHVhbGx5LCBJIGp1c3QgdmVyaWZpZWQgaXQgd2l0aCBteSBzZHg1
NSBhbmQgdGhlIGFuc3dlciBpcyBZZXMuIFRoZXNlIGNoYW5uZWxzCj4+ID5hcmUgY29tbW9uIHNl
dHRpbmdzIGZvciBRY29tIGRldmljZSB3aGljaCBzdXBwb3J0IFBDSWUgbW9kZS4gQlRXLCB0aGUK
Pj4gPmRlZmF1bHQgc2V0dGluZ3Mgb2YgUWNvbSBhbmQgUXVlY3RlbCBzdXBwb3J0IGZpcmVob3Nl
IGZvciB0aGVpciBzZHg1NSBwcm9kdWN0cy4KPj4gPj4KPj4gPj4+ICAJTUhJX0NIQU5ORUxfQ09O
RklHX0hXX1VMKDEwMCwgIklQX0hXMF9NQklNIiwgMTI4LCAyKSwKPj4gPj4+ICAJTUhJX0NIQU5O
RUxfQ09ORklHX0hXX0RMKDEwMSwgIklQX0hXMF9NQklNIiwgMTI4LCAzKSwKPj4gPj4+ICB9Owo+
PiA+Pj4gQEAgLTQxOSw2ICs0MjEsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfY29udHJv
bGxlcl9jb25maWcgbW9kZW1fZm94Y29ubl9zZHg1NV9jb25maWcgPSB7Cj4+ID4+PiAgCS5ldmVu
dF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4+ID4+PiAgfTsKPj4gPj4+ICAKPj4g
Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2RlbV9mb3hj
b25uX3NkeDcyX2NvbmZpZyA9IHsKPj4gPj4+ICsJLm1heF9jaGFubmVscyA9IDEyOCwKPj4gPj4+
ICsJLnRpbWVvdXRfbXMgPSAyMDAwMCwKPj4gPj4+ICsJLnJlYWR5X3RpbWVvdXRfbXMgPSA1MDAw
MCwKPj4gPj4+ICsJLm51bV9jaGFubmVscyA9IEFSUkFZX1NJWkUobWhpX2ZveGNvbm5fc2R4NTVf
Y2hhbm5lbHMpLAo+PiA+Pj4gKwkuY2hfY2ZnID0gbWhpX2ZveGNvbm5fc2R4NTVfY2hhbm5lbHMs
Cj4+ID4+PiArCS5udW1fZXZlbnRzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1NV9ldmVu
dHMpLAo+PiA+Pj4gKwkuZXZlbnRfY2ZnID0gbWhpX2ZveGNvbm5fc2R4NTVfZXZlbnRzLAo+PiA+
Pj4gK307Cj4+ID4+PiArCj4+ID4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9p
bmZvIG1oaV9mb3hjb25uX3NkeDI0X2luZm8gPSB7Cj4+ID4+PiAgCS5uYW1lID0gImZveGNvbm4t
c2R4MjQiLAo+PiA+Pj4gIAkuY29uZmlnID0gJm1vZGVtX2ZveGNvbm5fc2R4NTVfY29uZmlnLAo+
PiA+Pj4gQEAgLTQ0OCw2ICs0NjAsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rl
dl9pbmZvIG1oaV9mb3hjb25uX3NkeDY1X2luZm8gPSB7Cj4+ID4+PiAgCS5zaWRlYmFuZF93YWtl
ID0gZmFsc2UsCj4+ID4+PiAgfTsKPj4gPj4+ICAKPj4gPj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fc2R4NzJfaW5mbyA9IHsKPj4gPj4+ICsJLm5h
bWUgPSAiZm94Y29ubi1zZHg3MiIsCj4+ID4+PiArCS5lZGwgPSAicWNvbS9zZHg3Mm0veGJsX3Nf
ZGV2cHJnX25zLm1lbGYiLAo+PiA+Pgo+PiA+PldoYXQgaXMgJy5tZWxmJz8gSXMgdGhlIGZpcm13
YXJlIGF2YWlsYWJsZSBzb21ld2hlcmU/IERpZCB5b3UgcGxhbiB0byB1cHN0cmVhbQo+PiA+Pml0
IHRvIGxpbnV4LWZpcm13YXJlPwo+PiA+Pgo+PiA+VGhpcyBmaWxlIHNpbWlsYXIgd2l0aCAiZWRs
Lm1ibiIuIEluIFNEWDcyIHByb2R1Y3QsIHRoZSBkZWZhdWx0ICJlZGwiIGZpbGUgbmFtZSBpcwo+
PiA+InhibF9zX2RldnByZ19ucy5tZWxmIi4gQ3VycmVudGx5IHdlIGRvbid0IHBsYW4gdG8gdXBz
dHJlYW0gaXQgdG8gbGludXgtZmlybXdhcmUKPj4gPnNpbmNlIDIgcmVhc29uczogMTogd2Ugc2hh
cmUgdGhlIHNhbWUgZm9sZCBuYW1lIHNkeDcybSB3aXRoIHFjb20gb3Igb3RoZXIgdmVuZG9ycwo+
PiA+MjogdGhpcyBmaWxlIG1heSBiZSBjaGFuZ2VkIHNpbmNlIHNkeDcyIHByb2R1Y3Qgc3RpbGwg
dW5kZXIgZGV2ZWxvcGluZyBpbiBvdXIgc2lkZS4gd2UKPj4gPm1heSBjaGFuZ2UgdGhlIGJhc2Ug
bGluZSBhY2NvcmRpbmcgdG8gUUNPTSByZWxlYXNlLgo+PiA+Pi0gTWFuaQo+PiA+Pgo+PiBBbmQg
SSB3YW50IHRvIHNheSwgdGhlIG9zIG9yIGRyaXZlciBjYW4ndCByZWNvdmVyIGRldmljZSB3aXRo
IHRoaXMgImVkbCIgZmlsZSBvbmx5LiBUaGlzIGZpbGUKPj4gb25seSB1c2VkIHdoZW4gZGV2aWNl
IG5lZWRzIHRvIGJlIGNoYW5nZWQgdG8gZmlyZWhvc2UgbW9kZS4gQWZ0ZXIgdGhhdCwgd2UgbmVl
ZAo+PiBhIHRvb2wgYW5kIGEgY29tcGxldGUgZmlybXdhcmUgcGFja2FnZSB0byBkbyB0aGUgZmly
ZWhvc2UgZG93bmxvYWQuIFVuZm9ydHVuYXRlbHksCj4+IHRoZXJlIGlzIG5vIG9wZW4gc291cmNl
IHRvb2wgdG8gc3VwcG9ydCB0aGlzIGRvd25sb2FkLiBFdmVuIFFjb20gUENBVCB0b29sIG9ubHkK
Pj4gc3VwcG9ydHMgdGhlaXIgb3duIFZJRC9QSUQgd2l0aCB0aGVpciBvd24gZHJpdmVyLiBTbyB0
aGUgZnVuY3Rpb24gb2YgbWhpIGRyaXZlciBpczoKPj4gUHV0IGRldmljZSBpbnRvIGZpcmVob3Nl
IG1vZGUgYW5kIGVudW1lcmF0ZSB0aGUgd3dhbjBmaXJlaG9zZTAgcG9ydC4gVGhlIHJlc3QKPj4g
c2hhbGwgYmUgZG9uZSBieSBlbmR1c2VyIHRoZW1zZWx2ZXMuIAo+Cj5DYW4ndCB5b3UgdXNlIFFE
TCB0b29sPyBodHRwczovL2dpdGh1Yi5jb20vbGludXgtbXNtL3FkbAo+Cj4tIE1hbmkKPgpOby4g
V2UgdXNlZCB0aGlzIHRvb2wgZm9yIFVTQiBvbmx5LiBUaGlzIHRvb2wgZG9uJ3Qgc3VwcG9ydCBQ
Q0lFIGRldmljZSBjdXJyZW50bHkuCnFkbCB3aWxsIGNhbGwgdGhlIGZ1bmN0aW9uIHVzYl9vcGVu
IHRvIGdldCBkZXZpY2Ugbm9kZSBpbiAKL2Rldi9idXMvdXNiLiBCdXQgZm9yIFBDSUUgZGV2aWNl
ICwgd2Ugd2lsbCBjb21tdW5pY2F0ZSBkZXZpY2Ugd2l0aCB3d2FuMGZpcmVob3NlMApwb3J0LiAK
Pi0tIAo+4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCv
jQo=

