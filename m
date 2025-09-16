Return-Path: <linux-arm-msm+bounces-73626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1C6B58C53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 05:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E43041B25F9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 03:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C514D24887E;
	Tue, 16 Sep 2025 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="F5P2lshM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7B123A9B3;
	Tue, 16 Sep 2025 03:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757993206; cv=none; b=siCNF+OBW/UhDM6efCjv1L3qYDgxY2OpZ2l1DJta3o1SvTAnBmMPUTqWcKt1yYwHQxGZj30Bx9BqZJJ3fQWjXxieRo5OMYZShzin/9p4FTxa/evzU795otQyeJTixUQpW4Gl82h78GVxfN7yX2wxH7cu0ya3ulpxp/zOCFbSmmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757993206; c=relaxed/simple;
	bh=GgE+jPhovRXRztdC78zniHgC5T/Ikz8ZbYXaNTuOHJY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JT3ckr95BvQgwY14nWeWg1ycWKDaYoCMjii6M9f8qvV1ZfhoWsYBTfgE2+7JN0Z8l2KXqkDyEJHafa1khBhuw76ZoKEuMXPuZbKV4iMbDEMms0SnZ9DOr6/GVxAXt/9UUz3rXCxbSJbfNz/AFK9QVLNUirofNfBark4Jr7wIWHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=F5P2lshM reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=P8m8LXz+xjgqpGR7AOllK+m4YYQWWgR0nZcgBF7amAQ=; b=F
	5P2lshMj7TwTgU0guvH+WDTvFXWO+QVnvLzI2Z2iP0OWqeIzLJ19mayEZqph4nt1
	OtkWWOsCmUGdnBfikM7Uu/LuKft65tZOwD+GQVd85NbLKAYm6tBFgfTDzkfpfvkx
	RA6gkCW+dHO9qGJn1As1XENyfcmbJhpKAB0bGYA8k0=
Received: from slark_xiao$163.com ( [2408:8459:3c60:81a:8817:506b:6403:2a62]
 ) by ajax-webmail-wmsvr-40-110 (Coremail) ; Tue, 16 Sep 2025 11:26:16 +0800
 (CST)
Date: Tue, 16 Sep 2025 11:26:16 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] bus: mhi: host: Update session id for each suspend
 and resume
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <6510264c-d91a-45f3-b484-18d334c515e8@oss.qualcomm.com>
References: <20250912100827.294443-1-slark_xiao@163.com>
 <6510264c-d91a-45f3-b484-18d334c515e8@oss.qualcomm.com>
X-NTES-SC: AL_Qu2eBfWSvEks4COZZekfmUobhuo3W8u1vvgn1YNfOJl8jCfp5AIPZ3ZKNkPH18OQBBuXoTa2YTJc5sdFYIJ4Q6Ip53i0RwueFEmTt9TtioFg3Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4205cc0b.3a60.199508f0d03.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bigvCgC37gfY2Mho64sxAA--.2300W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJQrJZGjId2372AAEsf
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA5LTE1IDE1OjI2OjMzLCAiS3Jpc2huYSBDaGFpdGFueWEgQ2h1bmRydSIgPGty
aXNobmEuY2h1bmRydUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+Cj5PbiA5LzEyLzIwMjUg
MzozOCBQTSwgU2xhcmsgWGlhbyB3cm90ZToKPj4gT24gUXVhbGNvbW0gbW9kdWxlIHNpZGUsIHRo
ZXJlIGlzIGEgVUFSVCBwcmludCBhcyBiZWxvdzoKPj4gc2Vzc2lvbiBpZDogMHgzNTVmZTY4OSBz
dGF0ZToyCj4+IHNlc3Npb24gaWQ6IDB4MWY0NzhlNDIgc3RhdGU6NQo+PiBUaGUgc2Vzc2lvbiBp
ZCByZWFkcyBmcm9tIHJlZ2lzdGVyIEJISV9JTUdUWERCKDB4MjE4KSwgYW5kIHRoZQo+PiBzdGF0
ZSBpbmRpY2F0ZXMgdGhlIEQzIG9yIEQwIHN0YXRlLgo+PiAKPj4gSW4gV2luZG93cyBzaWRlLCBN
SEkgZHJpdmVyIHdvdWxkIHVwZGF0ZSB0aGlzIHNlc3Npb24gaWQgZm9yIGVhY2gKPj4gc3VzcGVu
ZC9yZXN1bWUgcHJvZ3Jlc3MuIFdlIGJlbmVmaXQgZnJvbSB0aGlzIG1lY2hhbmlzbSBzaW5jZSBp
dAo+PiBjb3VsZCBoZWxwIHN5bmMgZWFjaCBzdXNwZW5kIGFuZCByZXN1bWUgcHJvZ3Jlc3MgYmV0
d2VlbiBob3N0IGFuZAo+PiBkZXZpY2UsIGVzcGVjaWFsbHkgZm9yIHNvbWUgc3VzcGVuZCBpc3N1
ZSB3aGljaCBuZWVkcyB0byB0YWtlCj4+IGh1bmRyZWRzIG9yIHRob3VzYW5kcyBjeWNsZS4gV2Ug
Y2FuIGVhc3kgdG8gZmlndXJlIG91dCB3aGljaAo+PiBzdXNwZW5kIGN5Y2xlIGdldCBhIHByb2Js
ZW0gYW5kIHdoYXQncyBoYXBwZW5lZCBhdCB0aGF0IHRpbWUgZm9yCj4+IGJvdGggaG9zdCBhbmQg
ZGV2aWNlIGJlY2F1c2UgdGhleSBoYXZlIHNhbWUgaWQuCj4+IAo+PiBCdXQgaW4gTGludXggc2lk
ZSwgdGhpcyBzZXNzaW9uIGlkIHZhbHVlIHdvdWxkIGFsd2F5cyBiZSAweDAuCj4+IFNvIHdlIGFk
ZCBpdCBmb3IgcG90ZW50aWFsIGRlYnVnIHVzYWdlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogU2xh
cmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2J1cy9taGkv
aG9zdC9wbS5jIHwgMTUgKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wbS5j
IGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcG0uYwo+PiBpbmRleCAzM2Q5MmJmMmZjM2UuLmE2NTcz
ZjY4NzM2MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcG0uYwo+PiArKysg
Yi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wbS5jCj4+IEBAIC04NjQsNiArODY0LDEzIEBAIGludCBt
aGlfcG1fc3VzcGVuZChzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCkKPj4gICAJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJm1oaV9jbnRybC0+bWhpX2Rldi0+ZGV2Owo+PiAgIAllbnVtIG1o
aV9wbV9zdGF0ZSBuZXdfc3RhdGU7Cj4+ICAgCWludCByZXQ7Cj4+ICsJdm9pZCBfX2lvbWVtICpi
YXNlID0gbWhpX2NudHJsLT5iaGk7Cj4+ICsJdTMyIHNlc3Npb25faWQ7Cj4+ICsKPj4gKwlzZXNz
aW9uX2lkID0gTUhJX1JBTkRPTV9VMzJfTk9OWkVSTyhCSElfVFhEQl9TRVFOVU1fQk1TSyk7Cj4+
ICsJZGV2X2RiZyhkZXYsICJTdGFydGluZyBlbnRlciBzdXNwZW5kLCBzZXNzaW9uIGlkOiAweCV4
XG4iLAo+PiArCQlzZXNzaW5faWQpOwo+PiArCW1oaV93cml0ZV9yZWcobWhpX2NudHJsLCBiYXNl
LCBCSElfSU1HVFhEQiwgc2Vzc2lvbl9pZCk7Cj5JIGFncmVlIHRoaXMgd2lsbCBoZWxwIGluIGRl
YnVnZ2luZywgYnV0IHVubGVzcyBpdCBpcyBkb2N1bWVudGVkCj5pbiB0aGUgTUhJIHNwZWMgd2Ug
Y2FuJ3QgaGF2ZSB0aGlzLiBTaW5jZSBpbiBmdXR1cmUgaWYgdGhlcmUgaXMKPnNvbWUgb3RoZXIg
cHVycG9zZSBmb3IgdGhpcyByZWdpc3RlciB3ZSBlbmQgdXAgZmFjaW5nIGlzc3Vlcy4KPgo+aWYg
aXQgYWxyZWFkeSBwYXJ0IG9mIHNwZWMgcG9pbnQgaXQgaW4gdGhlIGNvbW1pdCB0ZXh0Lgo+Cj4t
IEtyaXNobmEgQ2hhaXRhbnlhLgpIaSBLcmlzaG5hLApJIGFtIG5vdCBhIG1lbWJlciBvZiBRdWFs
Y29tbSBzbyBJIGRvbid0IGhhdmUgYSBkZXRhaWxlZCBNSEkKc3BlYyB0byBkZXNjcmliZSB0aGlz
IHJlZ2lzdGVyIHVzYWdlLgpCdXQgSSBnZXQgc29tZSBpbmZvcm1hdGlvbiBmcm9tIHRoZWlyIFdp
bmRvd3MgTUhJIGRyaXZlcjoKCjEuIFRoZXJlIGlzIHJlbGVhc2Ugbm90ZSB3aGljaCBkZXNjcmli
ZSBpdDoKVURFL1FNSS93aW4vcWN1ZGUvaW5zdGFsbGVyL1JlYWRNZS50eHQgClVERS9RQ1VERS5T
dGFuZGFsb25lLlNvdXJjZS4xLjAwLjQ0LldpbmRvd3MtQW55Q1BVX1JlYWRNZV8xLnR4dAouLi4u
Li4KTUhJIGRyaXZlciAxLjEuMC4yCiAgYi4gQWRkIHdyaXRlIHRvIEJISV9JTUdUWERCIGZvciBk
ZWJ1ZyBwdXJwb3Nlcy4KLi4uLi4uCgoyLkZyb20gdGhlIGNvZGUgc2lkZSwgIHRoZXJlIGlzIGEg
c2FtZSBvcGVyYXRpb24gZm9yIE1ISSBkcml2ZXIKZW50ZXIgaW50byBNMDoKSG9zdERyaXZlci93
aW4vTlRBRC9NaGlIb3N0L01oaS9zcmMvTWhpLmMKLi4uLi4uCnZvaWQgTWhpUmVxdWVzdE0wKFBN
SElfREVWX0NUWFQgTWhpQ3R4dCkKewouLi4uLgogICAvKiBTZXQgQkhJX0lNR1RYREIgKi8KICAg
S2VRdWVyeVN5c3RlbVRpbWUoJnJhbmRTZWVkKTsKICAgTWhpQ3R4dC0+U2Vzc2lvbklEID0gUnRs
UmFuZG9tRXgoJnJhbmRTZWVkLkxvd1BhcnQpOwogICBNaGlUcmFjZShUUkFDRV9MRVZFTF9FUlJP
UiwgVFJBQ0VfRkxBR19NSElDT05GSUcsICJORVcgU2Vzc2lvbklEOiAweCV4XG4iLCBNaGlDdHh0
LT5TZXNzaW9uSUQpOwogICBNSElfV1JJVEVfUkVHKGRldmljZUNvbnRleHQtPkJISUNvbnRleHQu
QmhpQmFzZSwgQkhJX0lNR1RYREIsIE1oaUN0eHQtPlNlc3Npb25JRCk7CgogICBNaGlUcmFjZShU
UkFDRV9MRVZFTF9FUlJPUiwgVFJBQ0VfRkxBR19NSElDT05GSUcsICJSZXEgLT4gTTBcbiIpOwou
Li4uLi4KCk5vdCBzdXJlIGlmIGFib3ZlIGluZm9ybWF0aW9uIGlzIGVub3VnaCBmb3IgdGhpcyBj
b21taXQuCgpUaGFua3MKPj4gICAKPj4gICAJaWYgKG1oaV9jbnRybC0+cG1fc3RhdGUgPT0gTUhJ
X1BNX0RJU0FCTEUpCj4+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPj4gQEAgLTk1Miw2ICs5NTksMTQg
QEAgc3RhdGljIGludCBfX21oaV9wbV9yZXN1bWUoc3RydWN0IG1oaV9jb250cm9sbGVyICptaGlf
Y250cmwsIGJvb2wgZm9yY2UpCj4+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZtaGlfY250cmwt
Pm1oaV9kZXYtPmRldjsKPj4gICAJZW51bSBtaGlfcG1fc3RhdGUgY3VyX3N0YXRlOwo+PiAgIAlp
bnQgcmV0Owo+PiArCXZvaWQgX19pb21lbSAqYmFzZSA9IG1oaV9jbnRybC0+YmhpOwo+PiArCXUz
MiBzZXNzaW9uX2lkOwo+PiArCj4+ICsJc2Vzc2lvbl9pZCA9IE1ISV9SQU5ET01fVTMyX05PTlpF
Uk8oQkhJX1RYREJfU0VRTlVNX0JNU0spOwo+PiArCWRldl9kYmcoZGV2LCAiU3RhcnRpbmcgZW50
ZXIgcmVzdW1lLCBzZXNzaW9uIGlkOiAweCV4XG4iLAo+PiArCQlzZXNzaW9uX2lkKTsKPj4gKwo+
PiArCW1oaV93cml0ZV9yZWcobWhpX2NudHJsLCBiYXNlLCBCSElfSU1HVFhEQiwgc2Vzc2lvbl9p
ZCk7Cj4+ICAgCj4+ICAgCWRldl9kYmcoZGV2LCAiRW50ZXJlZCB3aXRoIFBNIHN0YXRlOiAlcywg
TUhJIHN0YXRlOiAlc1xuIiwKPj4gICAJCXRvX21oaV9wbV9zdGF0ZV9zdHIobWhpX2NudHJsLT5w
bV9zdGF0ZSksCg==

