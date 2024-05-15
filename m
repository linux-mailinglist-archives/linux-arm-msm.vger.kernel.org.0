Return-Path: <linux-arm-msm+bounces-19860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E82278C5EC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 03:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C32F281B32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 01:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95493A2A;
	Wed, 15 May 2024 01:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="oBzZo/OV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C506816;
	Wed, 15 May 2024 01:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715736601; cv=none; b=YdSvFD/Vz3Fp7PnkD58pmD0tVYpjW16zT2OmOMqr7Pkr5wk3DjL9Hgpv2ZhNtmmZ71LdtWXpaO0L1fVsEJTd2JJpyMcHPQjkvyDXtv2xM1XZQdzhCdJOgJZV5VRT4l1kdhmlw2oeVn/8XQerWqZhgYKVayc6yFrrcHZEspDUpG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715736601; c=relaxed/simple;
	bh=peQoSaJm5r7/rNi/49CSPH85oFpV+vigzRHrPMTFNb8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Eoyk6u3dleWa3gOZ1OBeWjaq9ijqZuRATn7sybnARw6WsRLzpGRddlrey23hPEC7qvXO7wso+PJPETuXCtMtEnY+y3WYFQ+ZmQXiGmVuM5C3+A/4fnVQITMBLh2uYvz71wf8QFRzFTDTeAXdbR/pAF4oAi5L5dkmhehLJPp7spw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=oBzZo/OV reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=dH/gpF16Z7nc/BPL3pmSYU9XRCHIeE+cpF7SwrMJQwg=; b=o
	BzZo/OV42n/AUxeFg+tVhjTDrgIFUdt9YzGgXa2ztP3aVnHXbBevPj/APNH3Z3ha
	dKqWyPkP+4fBZ4iUKx0957Y7tDee8YpA3lUL8E9W6OKkpe/ySDo4xDOBkp1Zpung
	AqAs4n2lC3u+L5gHOPYMYDJxH/ZvlUIeCNDjQ3dnHs=
Received: from slark_xiao$163.com ( [223.104.68.205] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Wed, 15 May 2024 09:29:20 +0800
 (CST)
Date: Wed, 15 May 2024 09:29:20 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240514143741.GA2306@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
X-NTES-SC: AL_Qu2aB/uYuU0t5iifYukfm0kaj+c/WMGzu/8m3oFXO51wjA/p9R8Ab25qLX/Vwd6AAAyRtzG+XDNV0PRYYrFmXaQGqGfN1UJIgwrgTeS8H8cepw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3v9LwD0RmKxheAA--.442W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNRneZGV4Hlw0FAADsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNC0wNS0xNCAyMjozNzo0MSwgIk1hbml2YW5uYW4gU2FkaGFzaXZhbSIgPG1hbml2YW5u
YW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3cm90ZToKPk9uIEZyaSwgTWF5IDEwLCAyMDI0IGF0
IDExOjI2OjU3QU0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IEFsaWduIHdpdGggUWNvbSBT
RFg3MiwgYWRkIHJlYWR5IHRpbWVvdXQgaXRlbSBmb3IgRm94Y29ubiBTRFg3Mi4KPj4gQW5kIGFs
c28sIGFkZCBmaXJlaG9zZSBzdXBwb3J0IHNpbmNlIFNEWDcyLgo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogU2xhcmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvYnVz
L21oaS9ob3N0L3BjaV9nZW5lcmljLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyBiL2RyaXZlcnMvYnVzL21oaS9o
b3N0L3BjaV9nZW5lcmljLmMKPj4gaW5kZXggMDg4NDRlZTc5NjU0Li4wZmQ5NGMxOTNmYzYgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPj4gKysrIGIv
ZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+PiBAQCAtMzk5LDYgKzM5OSw4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX2NoYW5uZWxfY29uZmlnIG1oaV9mb3hjb25uX3NkeDU1
X2NoYW5uZWxzW10gPSB7Cj4+ICAJTUhJX0NIQU5ORUxfQ09ORklHX0RMKDEzLCAiTUJJTSIsIDMy
LCAwKSwKPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfVUwoMzIsICJEVU4iLCAzMiwgMCksCj4+ICAJ
TUhJX0NIQU5ORUxfQ09ORklHX0RMKDMzLCAiRFVOIiwgMzIsIDApLAo+PiArCU1ISV9DSEFOTkVM
X0NPTkZJR19VTF9GUCgzNCwgIkZJUkVIT1NFIiwgMzIsIDApLAo+PiArCU1ISV9DSEFOTkVMX0NP
TkZJR19ETF9GUCgzNSwgIkZJUkVIT1NFIiwgMzIsIDApLAo+Cj5UaGlzIG1lYW5zIFNEWDU1IGlz
IGFsc28gc3VwcG9ydGluZyBGSVJFSE9TRSBjaGFubmVscywgd2hpY2ggaXMgbm90IHRydWUgSQo+
YmVsaWV2ZS4KQWN0dWFsbHksIEkganVzdCB2ZXJpZmllZCBpdCB3aXRoIG15IHNkeDU1IGFuZCB0
aGUgYW5zd2VyIGlzIFllcy4gVGhlc2UgY2hhbm5lbHMKYXJlIGNvbW1vbiBzZXR0aW5ncyBmb3Ig
UWNvbSBkZXZpY2Ugd2hpY2ggc3VwcG9ydCBQQ0llIG1vZGUuIEJUVywgdGhlCmRlZmF1bHQgc2V0
dGluZ3Mgb2YgUWNvbSBhbmQgUXVlY3RlbCBzdXBwb3J0IGZpcmVob3NlIGZvciB0aGVpciBzZHg1
NSBwcm9kdWN0cy4KPgo+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19IV19VTCgxMDAsICJJUF9IVzBf
TUJJTSIsIDEyOCwgMiksCj4+ICAJTUhJX0NIQU5ORUxfQ09ORklHX0hXX0RMKDEwMSwgIklQX0hX
MF9NQklNIiwgMTI4LCAzKSwKPj4gIH07Cj4+IEBAIC00MTksNiArNDIxLDE2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbWhpX2NvbnRyb2xsZXJfY29uZmlnIG1vZGVtX2ZveGNvbm5fc2R4NTVfY29u
ZmlnID0gewo+PiAgCS5ldmVudF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4+ICB9
Owo+PiAgCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2Rl
bV9mb3hjb25uX3NkeDcyX2NvbmZpZyA9IHsKPj4gKwkubWF4X2NoYW5uZWxzID0gMTI4LAo+PiAr
CS50aW1lb3V0X21zID0gMjAwMDAsCj4+ICsJLnJlYWR5X3RpbWVvdXRfbXMgPSA1MDAwMCwKPj4g
KwkubnVtX2NoYW5uZWxzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1NV9jaGFubmVscyks
Cj4+ICsJLmNoX2NmZyA9IG1oaV9mb3hjb25uX3NkeDU1X2NoYW5uZWxzLAo+PiArCS5udW1fZXZl
bnRzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMpLAo+PiArCS5ldmVudF9j
ZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4+ICt9Owo+PiArCj4+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fc2R4MjRfaW5mbyA9IHsKPj4g
IAkubmFtZSA9ICJmb3hjb25uLXNkeDI0IiwKPj4gIAkuY29uZmlnID0gJm1vZGVtX2ZveGNvbm5f
c2R4NTVfY29uZmlnLAo+PiBAQCAtNDQ4LDYgKzQ2MCwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fc2R4NjVfaW5mbyA9IHsKPj4gIAkuc2lkZWJh
bmRfd2FrZSA9IGZhbHNlLAo+PiAgfTsKPj4gIAo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlf
cGNpX2Rldl9pbmZvIG1oaV9mb3hjb25uX3NkeDcyX2luZm8gPSB7Cj4+ICsJLm5hbWUgPSAiZm94
Y29ubi1zZHg3MiIsCj4+ICsJLmVkbCA9ICJxY29tL3NkeDcybS94Ymxfc19kZXZwcmdfbnMubWVs
ZiIsCj4KPldoYXQgaXMgJy5tZWxmJz8gSXMgdGhlIGZpcm13YXJlIGF2YWlsYWJsZSBzb21ld2hl
cmU/IERpZCB5b3UgcGxhbiB0byB1cHN0cmVhbQo+aXQgdG8gbGludXgtZmlybXdhcmU/Cj4KVGhp
cyBmaWxlIHNpbWlsYXIgd2l0aCAiZWRsLm1ibiIuIEluIFNEWDcyIHByb2R1Y3QsIHRoZSBkZWZh
dWx0ICJlZGwiIGZpbGUgbmFtZSBpcwoieGJsX3NfZGV2cHJnX25zLm1lbGYiLiBDdXJyZW50bHkg
d2UgZG9uJ3QgcGxhbiB0byB1cHN0cmVhbSBpdCB0byBsaW51eC1maXJtd2FyZQpzaW5jZSAyIHJl
YXNvbnM6IDE6IHdlIHNoYXJlIHRoZSBzYW1lIGZvbGQgbmFtZSBzZHg3Mm0gd2l0aCBxY29tIG9y
IG90aGVyIHZlbmRvcnMKMjogdGhpcyBmaWxlIG1heSBiZSBjaGFuZ2VkIHNpbmNlIHNkeDcyIHBy
b2R1Y3Qgc3RpbGwgdW5kZXIgZGV2ZWxvcGluZyBpbiBvdXIgc2lkZS4gd2UKbWF5IGNoYW5nZSB0
aGUgYmFzZSBsaW5lIGFjY29yZGluZyB0byBRQ09NIHJlbGVhc2UuCj4tIE1hbmkKPgo+LS0gCj7g
rq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCg==

