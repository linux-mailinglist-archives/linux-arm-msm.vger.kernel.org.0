Return-Path: <linux-arm-msm+bounces-22267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A4902DFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 03:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A159B21B62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 01:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417BA8467;
	Tue, 11 Jun 2024 01:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="h4KUG/VN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87160EDF;
	Tue, 11 Jun 2024 01:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718069815; cv=none; b=A/y0kmFoMctbXxYgKhgrQM1VTFQXqJFpi64q9bvSjxiNpGEUgh2Ip/vyMwCkPmqoUEEe+k5eUbmiRndFB4NQvEgBHlULhtR4mMUqvMog76a1G1vRN/7gdXFCuPErBidtWgJwUCv0r5Aqbm+UJO8zIJSpTAt7cRF1673ehJ/ndFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718069815; c=relaxed/simple;
	bh=mf4qVlzMUzfRL9BvC3X0oZecvghDtTV1GYZ1nErXJHc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=qUjSGmP/Fy8oVIERrIJIx24AXJXJHpmR+o5k8U9p+WIvbL03A7A/XpTXGWiWosjfZoykYCApWcek1n8wW46y8LqFTQ6C/Qyz8+vJqYLeTz1jmpxAI7F+WEv92/Y/EAAdV1/gAL7FbfaRe5NOwZ+m8Z3blkl1uxjqJOcf3duiRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=h4KUG/VN reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QL5dZ9wzjqu7SD+S9DX03UlVdElUpOveLiguRCC/9Zc=; b=h
	4KUG/VNBJ/AQPAzF0E8SHvU+q42nq1TQuMSgGfXC6CkWIGAmNJjXCBLvrdEv42H6
	jOHcCx00Gw3tiNFI+JPn/GE1AJ0Ay8yZrwWnwAaseitZ6U7nt65ebZW2lL2CJ2Rs
	L4tCIJD4EyQsqekrQKIWjUhiVzXskAyJMZgphG6fjo=
Received: from slark_xiao$163.com ( [223.104.68.135] ) by
 ajax-webmail-wmsvr-40-148 (Coremail) ; Tue, 11 Jun 2024 09:36:26 +0800
 (CST)
Date: Tue, 11 Jun 2024 09:36:26 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Sergey Ryazanov" <ryazanov.s.a@gmail.com>, quic_jhugo@quicinc.com, 
	"Qiang Yu" <quic_qianyu@quicinc.com>
Cc: loic.poulain@linaro.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re:Re: [PATCH v1 2/2] net: wwan: Fix SDX72 ping failure issue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <30d71968-d32d-4121-b221-d95a4cdfedb8@gmail.com>
References: <20240607100309.453122-1-slark_xiao@163.com>
 <30d71968-d32d-4121-b221-d95a4cdfedb8@gmail.com>
X-NTES-SC: AL_Qu2aCvydtk8j4CmaZukfmk8Sg+84W8K3v/0v1YVQOpF8jCHrxgkRXXVJP2bq0du3MRiqkxKdVzhnxtxTR5BccI0hd2jp34DAWcNsIPZQjnwBMQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <97a4347.18d5.19004f07932.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3H+saqmdmT_16AA--.4W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwP5ZGV4JtK1gQAFsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgorTW9yZSBtYWludGFpbmVyIHRvIHRoaXMgc2Vjb25kIHBhdGNoIGxpc3QuCgpBdCAyMDI0LTA2
LTA4IDA2OjI4OjQ4LCAiU2VyZ2V5IFJ5YXphbm92IiA8cnlhemFub3Yucy5hQGdtYWlsLmNvbT4g
d3JvdGU6Cj5IZWxsbyBTbGFyaywKPgo+d2l0aG91dCB0aGUgZmlyc3QgcGF0Y2ggaXQgaXMgY2xv
c2UgdG8gaW1wb3NzaWJsZSB0byB1bmRlcnN0YW5kIHRoaXMgCj5vbmUuIE5leHQgdGltZSBwbGVh
c2Ugc2VuZCBzdWNoIHRpZ2h0bHkgY29ubmVjdGVkIHBhdGNoZXMgdG8gYm90aCAKPm1haWxpbmcg
bGlzdHMuCj4KU29ycnkgZm9yIHRoaXMgbWlzdGFrZSBzaW5jZSBpdCdzIG15IGZpcnN0IGNvbW1p
dCBhYm91dCBjb21taXR0aW5nIGNvZGUgdG8gMgpkaWZmZXJlbmNlIGFyZWE6IG1oaSBhbmQgbWJp
bS4gQm90aCB0aGUgbWFpbnRhaW5lcnMgYXJlIGRpZmZlcmVuY2UuCkluIGNhc2UgYSBuZXcgdmVy
c2lvbiBjb21taXQgd291bGQgYmUgY3JlYXRlZCwgSSB3b3VsZCBsaWtlIHRvIGFzayBpZgpzaG91
bGQgSSBhZGQgYm90aCBzaWRlIG1haW50YWluZXJzIG9uIHRoZXNlIDIgcGF0Y2hlcyA/CiAKPk9u
IDA3LjA2LjIwMjQgMTM6MDMsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IEZvciBTRFg3MiBNQklNIGRl
dmljZSwgaXQgc3RhcnRzIGRhdGEgbXV4IGlkIGZyb20gMTEyIGluc3RlYWQgb2YgMC4KPj4gVGhp
cyB3b3VsZCBsZWFkIHRvIGRldmljZSBjYW4ndCBwaW5nIG91dHNpZGUgc3VjY2Vzc2Z1bGx5Lgo+
PiBBbHNvIE1CSU0gc2lkZSB3b3VsZCByZXBvcnQgImJhZCBwYWNrZXQgc2Vzc2lvbiAoMTEyKSIu
Cj4+IFNvIHdlIGFkZCBhIGxpbmsgaWQgZGVmYXVsdCB2YWx1ZSBmb3IgdGhlc2UgU0RYNzIgcHJv
ZHVjdHMgd2hpY2gKPj4gd29ya3MgaW4gTUJJTSBtb2RlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTog
U2xhcmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29tPgo+Cj5TaW5jZSBpdCBhIGJ1dCBmaXgsIGl0
IG5lZWRzIGEgJ0ZpeGVzOicgdGFnLgo+CkFjdHVhbGx5LCBJIHRob3VnaHQgaXQncyBhIGZpeCBm
b3IgY29tbW9uIFNEWDcyIHByb2R1Y3QuIEJ1dCBub3cgSSB0aGluawppdCBzaG91bGQgYmUgb25s
eSBtZWV0IGZvciBteSBTRFg3MiBNQklNIHByb2R1Y3QuIFByZXZpb3VzIGNvbW1pdCAKaGFzIG5v
dCBiZWVuIGFwcGxpZWQuIFNvIHRoZXJlIGlzIG5vIGNvbW1pdCBpZCBmb3IgIkZpeGVzIi4KQnV0
IEkgdGhpbmsgSSBzaGFsbCBpbmNsdWRlIHRoYXQgcGF0Y2ggaW4gVjIgdmVyc2lvbi4KUGxlYXNl
IHJlZjogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA1MjAwNzA2MzMuMzA4OTEz
LTEtc2xhcmtfeGlhb0AxNjMuY29tLwoKPj4gLS0tCj4+ICAgZHJpdmVycy9uZXQvd3dhbi9taGlf
d3dhbl9tYmltLmMgfCAzICsrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93d2FuL21oaV93
d2FuX21iaW0uYyBiL2RyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5jCj4+IGluZGV4IDNm
NzJhZTk0M2IyOS4uNGNhNWM4NDUzOTRiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC93d2Fu
L21oaV93d2FuX21iaW0uYwo+PiArKysgYi9kcml2ZXJzL25ldC93d2FuL21oaV93d2FuX21iaW0u
Ywo+PiBAQCAtNjE4LDcgKzYxOCw4IEBAIHN0YXRpYyBpbnQgbWhpX21iaW1fcHJvYmUoc3RydWN0
IG1oaV9kZXZpY2UgKm1oaV9kZXYsIGNvbnN0IHN0cnVjdCBtaGlfZGV2aWNlX2lkCj4+ICAgCW1i
aW0tPnJ4X3F1ZXVlX3N6ID0gbWhpX2dldF9mcmVlX2Rlc2NfY291bnQobWhpX2RldiwgRE1BX0ZS
T01fREVWSUNFKTsKPj4gICAKPj4gICAJLyogUmVnaXN0ZXIgd3dhbiBsaW5rIG9wcyB3aXRoIE1I
SSBjb250cm9sbGVyIHJlcHJlc2VudGluZyBXV0FOIGluc3RhbmNlICovCj4+IC0JcmV0dXJuIHd3
YW5fcmVnaXN0ZXJfb3BzKCZjbnRybC0+bWhpX2Rldi0+ZGV2LCAmbWhpX21iaW1fd3dhbl9vcHMs
IG1iaW0sIDApOwo+PiArCXJldHVybiB3d2FuX3JlZ2lzdGVyX29wcygmY250cmwtPm1oaV9kZXYt
PmRldiwgJm1oaV9tYmltX3d3YW5fb3BzLCBtYmltLAo+PiArCQltaGlfZGV2LT5taGlfY250cmwt
PmxpbmtfaWQgPyBtaGlfZGV2LT5taGlfY250cmwtPmxpbmtfaWQgOiAwKTsKPgo+SXMgaXQgcG9z
c2libGUgdG8gZHJvcCB0aGUgdGVybmFyeSBvcGVyYXRvciBhbmQgcGFzcyB0aGUgbGlua19pZCBk
aXJlY3RseT8KPgo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgdm9pZCBtaGlfbWJpbV9yZW1vdmUo
c3RydWN0IG1oaV9kZXZpY2UgKm1oaV9kZXYpCg==

