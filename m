Return-Path: <linux-arm-msm+bounces-24059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C60915C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 04:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D82E81F21E89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 02:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8855E2E403;
	Tue, 25 Jun 2024 02:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="dVChevC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6EA25774;
	Tue, 25 Jun 2024 02:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719281460; cv=none; b=SpN02QPEoI2aXa8/9fwdkTgiGfhAcCSa/emgJBNTOmx1jS2KxpLdHWloUsaLax6ITUW1lHuLtIqV5oPk4qwH3EtSYWXMByr4Ofa/5rtTYv693R+epnaHup9vmHmXWQsfzxdj87IVo9jq2pQezFfCIUuRWtYsxH8osPjbcVHGRfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719281460; c=relaxed/simple;
	bh=t2OvzFUVLxTJ7w29qrGVplPqAY0SWMZYR1K7WFcvN2k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=tfufzLi4V1IaYls4ipEFSjEuSOG1aH4H+yaiYWLACaDy123TaOWbj3SF1X3OHiwj3V95CdVBMVVXjkOM96iRFuUWYY0GVXQNf3VLciWindN3EdUU5rsjq7/AYcKOUmGoyBRaSl1TrMXwuidzaPUo42KrbRHbHTUofgo4y7+JzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=dVChevC7 reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=OGX+wfw0o56RZ3xuMOBQdw4f3IcXXKU/20rzcEL1bCA=; b=d
	VChevC70rrRbLo4orhH5OAtYwhb1tbIOI/w3miweTK2AL/m7WiDhWC3OAgykm1Ve
	8aRfILjK3ZFfqn2GzIH5EOZfu31jo8h+zssqofyDJ9AATTmw8LnJlTkTk3Ce//y7
	z/cx+nflS5BPzMwcUjMcE7zPcfzTnoIFKxRWEVJDhs=
Received: from slark_xiao$163.com ( [223.104.68.32] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Tue, 25 Jun 2024 10:10:17 +0800
 (CST)
Date: Tue, 25 Jun 2024 10:10:17 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: "Jeffrey Hugo" <quic_jhugo@quicinc.com>, 
	"Loic Poulain" <loic.poulain@linaro.org>, ryazanov.s.a@gmail.com, 
	johannes@sipsolutions.net, netdev@vger.kernel.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:Re: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240623134430.GD58184@thinkpad>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
 <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>
 <20240612145147.GB58302@thinkpad>
 <CAMZdPi-6GPWkj-wu4_mRucRBWXR03eYXu4vgbjtcns6mr0Yk9A@mail.gmail.com>
 <c275ee49-ac59-058c-7482-c8a92338e7a2@quicinc.com>
 <5055db15.37d8.19038cc602c.Coremail.slark_xiao@163.com>
 <20240623134430.GD58184@thinkpad>
X-NTES-SC: AL_Qu2aC/6Tvkwq4SSdY+kfmk8Sg+84W8K3v/0v1YVQOpF8jDjp1hw8TERlMl7GyvKtBRyGjT6xdD11w897ZK5jX60SKttW4jR1Ts7r1fg139C9GQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6365d9b8.265a.1904d287cfa.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wDXP6gJJ3pmRFoFAA--.32161W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJQ0IZGVOB3NBkQACsJ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNC0wNi0yMyAyMTo0NDozMCwgIk1hbml2YW5uYW4gU2FkaGFzaXZhbSIgPG1hbml2YW5u
YW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3cm90ZToKPk9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0
IDExOjE3OjE2QU0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IAo+PiBBdCAyMDI0LTA2LTE0
IDIyOjMxOjAzLCAiSmVmZnJleSBIdWdvIiA8cXVpY19qaHVnb0BxdWljaW5jLmNvbT4gd3JvdGU6
Cj4+ID5PbiA2LzE0LzIwMjQgNDoxNyBBTSwgTG9pYyBQb3VsYWluIHdyb3RlOgo+PiA+PiBPbiBX
ZWQsIDEyIEp1biAyMDI0IGF0IDE2OjUxLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0KPj4gPj4gPG1h
bml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3cm90ZToKPj4gPj4+Cj4+ID4+PiBPbiBX
ZWQsIEp1biAxMiwgMjAyNCBhdCAwODoxOToxM0FNIC0wNjAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6
Cj4+ID4+Pj4gT24gNi8xMi8yMDI0IDM6NDYgQU0sIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90
ZToKPj4gPj4+Pj4gT24gV2VkLCBKdW4gMTIsIDIwMjQgYXQgMDU6Mzg6NDJQTSArMDgwMCwgU2xh
cmsgWGlhbyB3cm90ZToKPj4gPj4+Pj4KPj4gPj4+Pj4gU3ViamVjdCBjb3VsZCBiZSBpbXByb3Zl
ZDoKPj4gPj4+Pj4KPj4gPj4+Pj4gYnVzOiBtaGk6IGhvc3Q6IEFkZCBjb25maWd1cmFibGUgbXV4
X2lkIGZvciBNQklNIG1vZGUKPj4gPj4+Pj4KPj4gPj4+Pj4+IEZvciBTRFg3MiBNQklNIG1vZGUs
IGl0IHN0YXJ0cyBkYXRhIG11eCBpZCBmcm9tIDExMiBpbnN0ZWFkIG9mIDAuCj4+ID4+Pj4+PiBU
aGlzIHdvdWxkIGxlYWQgdG8gZGV2aWNlIGNhbid0IHBpbmcgb3V0c2lkZSBzdWNjZXNzZnVsbHku
Cj4+ID4+Pj4+PiBBbHNvIE1CSU0gc2lkZSB3b3VsZCByZXBvcnQgImJhZCBwYWNrZXQgc2Vzc2lv
biAoMTEyKSIuCj4+ID4+Pj4+PiBTbyB3ZSBhZGQgYSBkZWZhdWx0IG11eF9pZCB2YWx1ZSBmb3Ig
U0RYNzIuIEFuZCB0aGlzIHZhbHVlCj4+ID4+Pj4+PiB3b3VsZCBiZSB0cmFuc2ZlcnJlZCB0byB3
d2FuIG1iaW0gc2lkZS4KPj4gPj4+Pj4+Cj4+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTbGFyayBY
aWFvIDxzbGFya194aWFvQDE2My5jb20+Cj4+ID4+Pj4+PiAtLS0KPj4gPj4+Pj4+ICAgIGRyaXZl
cnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMgfCAzICsrKwo+PiA+Pj4+Pj4gICAgaW5jbHVk
ZS9saW51eC9taGkuaCAgICAgICAgICAgICAgICB8IDIgKysKPj4gPj4+Pj4+ICAgIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+ID4+Pj4+Pgo+PiA+Pj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMgYi9kcml2ZXJzL2J1cy9taGkvaG9z
dC9wY2lfZ2VuZXJpYy5jCj4+ID4+Pj4+PiBpbmRleCAwYjQ4M2M3Yzc2YTEuLjllOWFkZjgzMjBk
MiAxMDA2NDQKPj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmlj
LmMKPj4gPj4+Pj4+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPj4g
Pj4+Pj4+IEBAIC01Myw2ICs1Myw3IEBAIHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZvIHsKPj4gPj4+
Pj4+ICAgICAgICAgICAgdW5zaWduZWQgaW50IGRtYV9kYXRhX3dpZHRoOwo+PiA+Pj4+Pj4gICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgbXJ1X2RlZmF1bHQ7Cj4+ID4+Pj4+PiAgICAgICAgICAgIGJv
b2wgc2lkZWJhbmRfd2FrZTsKPj4gPj4+Pj4+ICsgdW5zaWduZWQgaW50IG11eF9pZDsKPj4gPj4+
Pj4+ICAgIH07Cj4+ID4+Pj4+PiAgICAjZGVmaW5lIE1ISV9DSEFOTkVMX0NPTkZJR19VTChjaF9u
dW0sIGNoX25hbWUsIGVsX2NvdW50LCBldl9yaW5nKSBcCj4+ID4+Pj4+PiBAQCAtNDY5LDYgKzQ3
MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94Y29ubl9z
ZHg3Ml9pbmZvID0gewo+PiA+Pj4+Pj4gICAgICAgICAgICAuZG1hX2RhdGFfd2lkdGggPSAzMiwK
Pj4gPj4+Pj4+ICAgICAgICAgICAgLm1ydV9kZWZhdWx0ID0gMzI3NjgsCj4+ID4+Pj4+PiAgICAg
ICAgICAgIC5zaWRlYmFuZF93YWtlID0gZmFsc2UsCj4+ID4+Pj4+PiArIC5tdXhfaWQgPSAxMTIs
Cj4+ID4+Pj4+PiAgICB9Owo+PiA+Pj4+Pj4gICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfY2hh
bm5lbF9jb25maWcgbWhpX212M3hfY2hhbm5lbHNbXSA9IHsKPj4gPj4+Pj4+IEBAIC0xMDM1LDYg
KzEwMzcsNyBAQCBzdGF0aWMgaW50IG1oaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPj4gPj4+Pj4+ICAgICAgICAgICAgbWhp
X2NudHJsLT5ydW50aW1lX2dldCA9IG1oaV9wY2lfcnVudGltZV9nZXQ7Cj4+ID4+Pj4+PiAgICAg
ICAgICAgIG1oaV9jbnRybC0+cnVudGltZV9wdXQgPSBtaGlfcGNpX3J1bnRpbWVfcHV0Owo+PiA+
Pj4+Pj4gICAgICAgICAgICBtaGlfY250cmwtPm1ydSA9IGluZm8tPm1ydV9kZWZhdWx0Owo+PiA+
Pj4+Pj4gKyBtaGlfY250cmwtPmxpbmtfaWQgPSBpbmZvLT5tdXhfaWQ7Cj4+ID4+Pj4+Cj4+ID4+
Pj4+IEFnYWluLCAnbGlua19pZCcgaXMganVzdCBhIFdXQU4gdGVybS4gVXNlICdtdXhfaWQnIGhl
cmUgYWxzby4KPj4gPj4+Pgo+PiA+Pj4+IERvZXMgdGhpcyByZWFsbHkgYmVsb25nIGluIE1IST8g
IElmIHRoaXMgd2FzIERULCBJIGRvbid0IHRoaW5rIHdlIHdvdWxkIHB1dAo+PiA+Pj4+IHRoaXMg
dmFsdWUgaW4gRFQsIGJ1dCByYXRoZXIgaGF2ZSB0aGUgZHJpdmVyIChNQklNKSBkZXRlY3QgdGhl
IGRldmljZSBhbmQKPj4gPj4+PiBjb2RlIGluIHRoZSByZXF1aXJlZCB2YWx1ZS4KPj4gPj4+Pgo+
PiA+Pj4KPj4gPj4+IEkgYmVsaWV2ZSB0aGlzIGlzIGEgbW9kZW0gdmFsdWUgcmF0aGVyIHRoYW4g
TUhJLiBCdXQgSSB3YXMgT0sgd2l0aCBrZWVwaW5nIGl0IGluCj4+ID4+PiBNSEkgZHJpdmVyIHNp
bmNlIHdlIGtpbmQgb2Yga2VlcCBtb2RlbSBzcGVjaWZpYyBjb25maWcuCj4+ID4+Pgo+PiA+Pj4g
QnV0IGlmIFdXQU4gY2FuIGRldGVjdCB0aGUgZGV2aWNlIGFuZCBhcHBseSB0aGUgY29uZmlnLCBJ
J20gYWxsIG92ZXIgaXQuCj4+ID4+IAo+PiA+PiBUaGF0IHdvdWxkIHJlcXVpcmUgYXQgbGVhc3Qg
c29tZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBNSEkgYnVzIGZvciB0aGUKPj4gPj4gTUJJTSBkcml2
ZXIKPj4gPj4gdG8gbWFrZSBhIGRlY2lzaW9uLCBzdWNoIGFzIGEgZ2VuZXJpYyBkZXZpY2UgSUQs
IG9yIHF1aXJrIGZsYWdzLi4uCj4+ID4KPj4gPkkgZG9uJ3Qgc2VlIHdoeS4KPj4gPgo+PiA+VGhl
ICJzaW1wbGUiIHdheSB0byBkbyBpdCB3b3VsZCBiZSB0byBoYXZlIHRoZSBjb250cm9sbGVyIGRl
ZmluZSBhIAo+PiA+ZGlmZmVyZW50IGNoYW5uZWwgbmFtZSwgYW5kIHRoZW4gaGF2ZSB0aGUgTUJJ
TSBkcml2ZXIgcHJvYmUgb24gdGhhdC4gCj4+ID5UaGUgTUJJTSBkcml2ZXIgY291bGQgYXR0YWNo
IGRyaXZlciBkYXRhIHNheWluZyB0aGF0IGl0IG5lZWRzIHRvIGhhdmUgYSAKPj4gPnNwZWNpZmlj
IG11eF9pZC4KPj4gPgo+PiA+T3IsIHdpdGggemVybyBNSEkvQ29udHJvbGxlciBjaGFuZ2VzLCB0
aGUgTUJJTSBkcml2ZXIgY291bGQgcGFyc2UgdGhlIAo+PiA+bWhpX2RldmljZSBzdHJ1Y3QsIGdl
dCB0byB0aGUgc3RydWN0IGRldmljZSwgZm9yIHRoZSB1bmRlcmx5aW5nIGRldmljZSwgCj4+ID5h
bmQgZXh0cmFjdCB0aGUgUENJZSBEZXZpY2UgSUQgYW5kIG1hdGNoIHRoYXQgdG8gYSB3aGl0ZSBs
aXN0IG9mIGtub3duIAo+PiA+ZGV2aWNlcyB0aGF0IG5lZWQgdGhpcyBwcm9wZXJ0eS4KPj4gPgo+
PiA+SSBndWVzcyBpZiB0aGUgY29udHJvbGxlciBjb3VsZCBhdHRhY2ggYSBwcml2YXRlIHZvaWQg
KiB0byB0aGUgCj4+ID5taGlfZGV2aWNlIHRoYXQgaXMgb3BhcXVlIHRvIE1ISSwgYnV0IGFsbG93
cyBNQklNIHRvIG1ha2UgYSBkZWNpc2lvbiwgCj4+ID50aGF0IHdvdWxkIGJlIG9rLiAgU3VjaCBh
IG1lY2hhbmlzbSB3b3VsZCBiZSBnZW5lcmljLCBhbmQgZXh0ZW5zaWJsZSB0byAKPj4gPm90aGVy
IHVzZWNhc2VzIG9mIHRoZSBzYW1lICJjbGFzcyIuCj4+ID4KPj4gPi1KZWZmCj4+IAo+PiBIaSBn
dXlzLAo+PiBUaGlzIHBhdGNoIG1haW5seSByZWZlciB0byB0aGUgZmVhdHVyZSBvZiBtcnUgc2V0
dGluZyBiZXR3ZWVuIG1oaSBhbmQgd3dhbiBzaWRlLgo+PiBXZSByYW5zZmVyIHRoaXMgdmFsdWUg
dG8gd3dhbiBzaWRlIGlmIHdlIGRlZmluZSBpdCBpbiBtaGkgc2lkZSwgb3RoZXJ3aXNlIGEgZGVm
YXVsdAo+PiB2YWx1ZSB3b3VsZCBiZSB1c2VkIGluIHd3YW4gc2lkZS4gV2h5IGRvbid0IHdlIGp1
c3QgYWxpZ24gd2l0aCB0aGF0Pwo+PiAKPgo+V2VsbCwgdGhlIHByb2JsZW0gaXMgdGhhdCBNUlUg
aGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBNSEkuIEkgaW5pdGlhbGx5IHRob3VnaHQKPnRoYXQgaXQg
Y291bGQgZml0IGluc2lkZSB0aGUgY29udHJvbGxlciBjb25maWcsIGJ1dCB0aGlua2luZyBtb3Jl
IEkgYWdyZWUgd2l0aAo+SmVmZiB0aGF0IHRoaXMgZG9lc24ndCBiZWxvbmcgdG8gTUhJIGF0IGFs
bC4KPgo+QXQgdGhlIHNhbWUgdGltZSwgSSBhbHNvIGRvIG5vdCB3YW50IHRvIGV4dHJhY3QgdGhl
IFBDSSBpbmZvIGZyb20gdGhlIGNsaWVudAo+ZHJpdmVycyBzaW5jZSB0aGUgdW5kZXJseWluZyB0
cmFuc3BvcnQgY291bGQgY2hhbmdlIHdpdGggTUhJLiBTbyB0aGUgYmVzdAo+c29sdXRpb24gSSBj
YW4gdGhpbmsgb2YgaXMgZXhwb3NpbmcgdGhlIG1vZGVtIG5hbWUgaW4gJ21oaV9jb250cm9sbGVy
X2NvbmZpZycgc28KPnRoYXQgdGhlIGNsaWVudCBkcml2ZXJzIGNhbiBkbyBhIG1hdGNoLgo+Cj5Q
bGVhc2UgdHJ5IHRvIGltcGxlbWVudCB0aGF0Lgo+Cj4tIE1hbmkKPgo+LS0gCj7grq7grqPgrr/g
rrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCkhpIE1hbmksCkN1cnJl
bnRseSB0aGVyZSBhcmUgbWFueSBwcm9kdWN0cyBzaGFyZSBhIHNhbWUgbWhpX2NvbnRyb2xsZXJf
Y29uZmlnCnNldHRpbmdzLiBGb3IgZXhhbXBsZSwgYWxsIGZveGNvbm4gZGV2aWNlIHVzZSBtb2Rl
bV9mb3hjb25uX3NkeDU1X2NvbmZpZy4KQnV0IG15IGRldmljZSBtYXkgYmUgYSBTRFgyNCwgb3Ig
U0RYNzIsIG9yIGV2ZW4gU0RYNjUuICBBbnkgb3RoZXIgaWRlYT8KClRoYW5rcw==

