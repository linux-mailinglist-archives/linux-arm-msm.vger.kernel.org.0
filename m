Return-Path: <linux-arm-msm+bounces-19883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A12178C663F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3C1C1C21ACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 12:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B54F762FF;
	Wed, 15 May 2024 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="ar/MmW0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52651745D6;
	Wed, 15 May 2024 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775471; cv=none; b=MvUO46KGlUl0ltdbc9McfHKEbfxiHKugcxorjsdSUp7hGzSjvjnxU88Gc54T94n3duSv8bmPjwG+5hQhTRb6DiDcqaFq4sISJvvoz+Y/FsQGwAMeflbz+NAmjQQPEb9s+DdGMJvh2CqmhRI3CDfNcFDiaGvAXQ1pkMLJwHo1cpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775471; c=relaxed/simple;
	bh=kIrXXfLs1VN1FNZyXDFHR3/pqM8Kq3RYwEEvkVJrfhY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=WDT20N9FRFuxyFY7LvhHkOOKzmNawz5TZbvVy6iKhylEhJD8a8vg6Lz1d+WQpHK36BFkNQWB44DpJrIw38NY32e2ZdLZvKgeYmoIbmPUiL6tIgHN7jNLIozOskTJUQGDxe8V6gU+BSSf7pllagrz/2GGtpS8nZi1j4XE7aqbMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=ar/MmW0n reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Qr8y9VujmtGdZGdj9glcB1Bx1KCTeohG0AzG0YCdoXs=; b=a
	r/MmW0na7cbsW/dx9rAQLNQsX8hJYTezj9SL8aFW7WjsQ3DWfJ30EYCZajRR8Y+C
	AeHV1opBBkVVRjeHmrOAoD9OvSsmY1Y8P8lxZSMKRsP6gwuJ1GOJw3U1Euzja3ed
	CX5UztNpMM/0Alnn5zH54CfsGFmzaijoAsOw6wUUtw=
Received: from slark_xiao$163.com ( [112.97.57.72] ) by
 ajax-webmail-wmsvr-40-109 (Coremail) ; Wed, 15 May 2024 20:17:23 +0800
 (CST)
Date: Wed, 15 May 2024 20:17:23 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>, 
	loic.poulain@linaro.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_qianyu@quicinc.com
Subject: Re:Re: Re: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240515115239.GD4488@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <20240515074119.GA2445@thinkpad>
 <5eee5967.7bdf.18f7b4567b7.Coremail.slark_xiao@163.com>
 <20240515115239.GD4488@thinkpad>
X-NTES-SC: AL_Qu2aB/ucukwv5SGabOkfm0kaj+c/WMGzu/8m3oFXO51wjCPp1gwsYEBzNlDQ8uaiChq+kSinfRJQ0uNTeKx7XIgohyisvubGBat/+fNwLde3Zw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <58fb648d.ab03.18f7c2f90bd.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3X0_Tp0RmxF0sAA--.3665W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNRffZGV4HmslfwAFsu
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI0LTA1LTE1IDE5OjUyOjM5LCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaUBr
ZXJuZWwub3JnPiB3cm90ZToKPk9uIFdlZCwgTWF5IDE1LCAyMDI0IGF0IDA0OjAxOjM3UE0gKzA4
MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IAo+PiBBdCAyMDI0LTA1LTE1IDE1OjQxOjE5LCAiTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdy
b3RlOgo+PiA+KyBRaWFuZwo+PiA+Cj4+ID5PbiBXZWQsIE1heSAxNSwgMjAyNCBhdCAwOToyOToy
MEFNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+PiA+PiBBdCAyMDI0LTA1LTE0IDIyOjM3OjQx
LCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5v
cmc+IHdyb3RlOgo+PiA+PiA+T24gRnJpLCBNYXkgMTAsIDIwMjQgYXQgMTE6MjY6NTdBTSArMDgw
MCwgU2xhcmsgWGlhbyB3cm90ZToKPj4gPj4gPj4gQWxpZ24gd2l0aCBRY29tIFNEWDcyLCBhZGQg
cmVhZHkgdGltZW91dCBpdGVtIGZvciBGb3hjb25uIFNEWDcyLgo+PiA+PiA+PiBBbmQgYWxzbywg
YWRkIGZpcmVob3NlIHN1cHBvcnQgc2luY2UgU0RYNzIuCj4+ID4+ID4+IAo+PiA+PiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2My5jb20+Cj4+ID4+ID4+IC0tLQo+
PiA+PiA+PiAgZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyB8IDMxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+PiA+PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2Vy
dGlvbnMoKykKPj4gPj4gPj4gCj4+ID4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkv
aG9zdC9wY2lfZ2VuZXJpYy5jIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+
PiA+PiA+PiBpbmRleCAwODg0NGVlNzk2NTQuLjBmZDk0YzE5M2ZjNiAxMDA2NDQKPj4gPj4gPj4g
LS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+PiA+PiA+PiArKysgYi9k
cml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+ID4+ID4+IEBAIC0zOTksNiArMzk5
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfY2hhbm5lbF9jb25maWcgbWhpX2ZveGNvbm5f
c2R4NTVfY2hhbm5lbHNbXSA9IHsKPj4gPj4gPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfREwoMTMs
ICJNQklNIiwgMzIsIDApLAo+PiA+PiA+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19VTCgzMiwgIkRV
TiIsIDMyLCAwKSwKPj4gPj4gPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfREwoMzMsICJEVU4iLCAz
MiwgMCksCj4+ID4+ID4+ICsJTUhJX0NIQU5ORUxfQ09ORklHX1VMX0ZQKDM0LCAiRklSRUhPU0Ui
LCAzMiwgMCksCj4+ID4+ID4+ICsJTUhJX0NIQU5ORUxfQ09ORklHX0RMX0ZQKDM1LCAiRklSRUhP
U0UiLCAzMiwgMCksCj4+ID4+ID4KPj4gPj4gPlRoaXMgbWVhbnMgU0RYNTUgaXMgYWxzbyBzdXBw
b3J0aW5nIEZJUkVIT1NFIGNoYW5uZWxzLCB3aGljaCBpcyBub3QgdHJ1ZSBJCj4+ID4+ID5iZWxp
ZXZlLgo+PiA+PiBBY3R1YWxseSwgSSBqdXN0IHZlcmlmaWVkIGl0IHdpdGggbXkgc2R4NTUgYW5k
IHRoZSBhbnN3ZXIgaXMgWWVzLiBUaGVzZSBjaGFubmVscwo+PiA+PiBhcmUgY29tbW9uIHNldHRp
bmdzIGZvciBRY29tIGRldmljZSB3aGljaCBzdXBwb3J0IFBDSWUgbW9kZS4gQlRXLCB0aGUKPj4g
Pj4gZGVmYXVsdCBzZXR0aW5ncyBvZiBRY29tIGFuZCBRdWVjdGVsIHN1cHBvcnQgZmlyZWhvc2Ug
Zm9yIHRoZWlyIHNkeDU1IHByb2R1Y3RzLgo+PiA+Cj4+ID5RaWFuZywgY2FuIHlvdSBwbGVhc2Ug
Y29uZmlybSB0aGF0IFNEWDU1IHN1cHBvcnRzIEZJUkVIT1NFIGNoYW5uZWxzPwo+PiA+Cj4+ID4+
ID4KPj4gPj4gPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfSFdfVUwoMTAwLCAiSVBfSFcwX01CSU0i
LCAxMjgsIDIpLAo+PiA+PiA+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19IV19ETCgxMDEsICJJUF9I
VzBfTUJJTSIsIDEyOCwgMyksCj4+ID4+ID4+ICB9Owo+PiA+PiA+PiBAQCAtNDE5LDYgKzQyMSwx
NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2RlbV9mb3hj
b25uX3NkeDU1X2NvbmZpZyA9IHsKPj4gPj4gPj4gIAkuZXZlbnRfY2ZnID0gbWhpX2ZveGNvbm5f
c2R4NTVfZXZlbnRzLAo+PiA+PiA+PiAgfTsKPj4gPj4gPj4gIAo+PiA+PiA+PiArc3RhdGljIGNv
bnN0IHN0cnVjdCBtaGlfY29udHJvbGxlcl9jb25maWcgbW9kZW1fZm94Y29ubl9zZHg3Ml9jb25m
aWcgPSB7Cj4+ID4+ID4+ICsJLm1heF9jaGFubmVscyA9IDEyOCwKPj4gPj4gPj4gKwkudGltZW91
dF9tcyA9IDIwMDAwLAo+PiA+PiA+PiArCS5yZWFkeV90aW1lb3V0X21zID0gNTAwMDAsCj4+ID4+
ID4+ICsJLm51bV9jaGFubmVscyA9IEFSUkFZX1NJWkUobWhpX2ZveGNvbm5fc2R4NTVfY2hhbm5l
bHMpLAo+PiA+PiA+PiArCS5jaF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9jaGFubmVscywKPj4g
Pj4gPj4gKwkubnVtX2V2ZW50cyA9IEFSUkFZX1NJWkUobWhpX2ZveGNvbm5fc2R4NTVfZXZlbnRz
KSwKPj4gPj4gPj4gKwkuZXZlbnRfY2ZnID0gbWhpX2ZveGNvbm5fc2R4NTVfZXZlbnRzLAo+PiA+
PiA+PiArfTsKPj4gPj4gPj4gKwo+PiA+PiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNp
X2Rldl9pbmZvIG1oaV9mb3hjb25uX3NkeDI0X2luZm8gPSB7Cj4+ID4+ID4+ICAJLm5hbWUgPSAi
Zm94Y29ubi1zZHgyNCIsCj4+ID4+ID4+ICAJLmNvbmZpZyA9ICZtb2RlbV9mb3hjb25uX3NkeDU1
X2NvbmZpZywKPj4gPj4gPj4gQEAgLTQ0OCw2ICs0NjAsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9mb3hjb25uX3NkeDY1X2luZm8gPSB7Cj4+ID4+ID4+ICAJ
LnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4gPj4gPj4gIH07Cj4+ID4+ID4+ICAKPj4gPj4gPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94Y29ubl9zZHg3Ml9p
bmZvID0gewo+PiA+PiA+PiArCS5uYW1lID0gImZveGNvbm4tc2R4NzIiLAo+PiA+PiA+PiArCS5l
ZGwgPSAicWNvbS9zZHg3Mm0veGJsX3NfZGV2cHJnX25zLm1lbGYiLAo+PiA+PiA+Cj4+ID4+ID5X
aGF0IGlzICcubWVsZic/IElzIHRoZSBmaXJtd2FyZSBhdmFpbGFibGUgc29tZXdoZXJlPyBEaWQg
eW91IHBsYW4gdG8gdXBzdHJlYW0KPj4gPj4gPml0IHRvIGxpbnV4LWZpcm13YXJlPwo+PiA+PiA+
Cj4+ID4+IFRoaXMgZmlsZSBzaW1pbGFyIHdpdGggImVkbC5tYm4iLiBJbiBTRFg3MiBwcm9kdWN0
LCB0aGUgZGVmYXVsdCAiZWRsIiBmaWxlIG5hbWUgaXMKPj4gPj4gInhibF9zX2RldnByZ19ucy5t
ZWxmIi4gQ3VycmVudGx5IHdlIGRvbid0IHBsYW4gdG8gdXBzdHJlYW0gaXQgdG8gbGludXgtZmly
bXdhcmUKPj4gPj4gc2luY2UgMiByZWFzb25zOiAxOiB3ZSBzaGFyZSB0aGUgc2FtZSBmb2xkIG5h
bWUgc2R4NzJtIHdpdGggcWNvbSBvciBvdGhlciB2ZW5kb3JzCj4+ID4+IDI6IHRoaXMgZmlsZSBt
YXkgYmUgY2hhbmdlZCBzaW5jZSBzZHg3MiBwcm9kdWN0IHN0aWxsIHVuZGVyIGRldmVsb3Bpbmcg
aW4gb3VyIHNpZGUuIHdlCj4+ID4+IG1heSBjaGFuZ2UgdGhlIGJhc2UgbGluZSBhY2NvcmRpbmcg
dG8gUUNPTSByZWxlYXNlLgo+PiA+Cj4+ID5UaGVuIEkgd291bGQgYXNrIHlvdSB0byBhZGQgc3Vw
cG9ydCB3aGVuIHlvdSBoYXZlIGEgc3RhYmxlIGZpcm13YXJlLiBJIGRvIG5vdAo+PiA+d2FudCB0
byBjaGFuZ2UgdGhlIGZpcm13YXJlIG5hbWUgYWZ0ZXIgc29tZSB0aW1lIGFzIGl0IHdpbGwgY29u
ZnVzZSB1c2Vycy4KPj4gPgo+PiA+LSBNYW5pCj4+IElmIGEgc3RhYmxlIGZpcm13YXJlIG11c3Qg
YmUgcHJvdmlkZWQsIEkgdGhpbmsgSSBzaGFsbCBjaGFuZ2UgdGhlIGZvbGRlciBuYW1lIGZyb20g
cWNvbSB0bwo+PiBmb3gsIGRvIHlvdSBhZ3JlZSB0aGlzPwo+Cj5FdmVuIGluIHRoYXQgY2FzZSwg
d2hlcmUgY2FuIHRoZSB1c2VyIGZpbmQgdGhlIGZpcm13YXJlPwo+CkkgdGhpbmsgdGhpcyBlZGwg
ZmlsZSBjb3VsZCBoZWxwIHVzZXIgbGV0IGRldmljZSBlbnRlciBpbnRvIGVkbCBtb2RlKHd3YW4w
ZmlyZWhvc2UwKS4KRm9yIFBDSUUgZGV2aWNlLCB0aGVyZSBpcyBubyBvcGVuc291cmNlIHRvb2wg
dG8gc3VwcG9ydCBQQ0lFIGVkbCBkb3dubG9hZC4gSWYgdXNlcgpjb3VsZCBnZXQgdGhlIHRvb2wg
dG8gZG8gdGhlIGZpcmVob3NlIGRvd25sb2FkLCBJIHRoaW5rIGl0J3Mgbm90IGhhcmQgdG8gZ2V0
IGNvbXBsZXRlIGZpcm13YXJlCmZyb20gUEMgdmVuZG9yIG9yIHNvbWV3aGVyZSBlbHNlLgo+PiBC
VFcsIEkgbmVlZCB0byBjaGVjayBpZiBpdCB3b3JrcyBhZnRlciB1cGRhdGluZyAnZWRsIGZ3JyBm
cm9tICB4Ymxfc19kZXZwcmdfbnMubWVsZiB0bwo+PiBlZGwubWJuLiAKCj4KPk9rYXkuIElNTywg
d2Ugc2hvdWxkIHVwc3RyZWFtIHRoZSBwcm9kdWN0IHN1cHBvcnQgb25seSBhZnRlciBhIHN0YWJs
ZSBmaXJtd2FyZQo+cmVsZWFzZSAod2VsbCBzdGFibGUgaW4gdGhlIHNlbnNlIGEgc3RhYmxlIG5h
bWUgYXQgbGVhc3QpLgo+Cj4tIE1hbmkKVGhlIGNoZWNrIHJlc3VsdCBpcyB3ZSBjYW4gcmVuYW1l
IGl0IHRvIGFsaWduIHdpdGggcHJldmlvdXMgZm9ybWF0LiBVbnRpbCBub3csIApJIGRpZG4ndCBz
ZWUgYW55IG1oaSBkZXZpY2UgaGFzIHVwc3RyZWFtIHRoZWlyIGZpcm13YXJlIHRvIC9saWIvZmly
bXdhcmUvcWNvbSBmb2xkZXIuCklmIGl0J3MgYSBtdXN0LCBJIHRoaW5rIHdlIGNhbiB1cHN0cmVh
bSB0aGUgZWRsIGZpbGUgbGF0ZXIuICBBbnl3YXksIHdlIGhvcGUgd2UgY2FuCm1lcmdlIHRoaXMg
c2R4NzIgc3VwcG9ydCBpbnRvIDYuMTAgc2luY2UgY3VzdG9tZXIoRGVsbCkgd291bGQgdXNlIHRo
aXMga2VybmVsIGZvciBvZmZpY2lhbApyZWxlYXNlLiBCdXQgbm8gd29ycnksIHdlIGNhbiBtYWtl
IHN1cmUgdGhpcyBmaXJlaG9zZSBkb3dubG9hZCBtZXRob2Qgd29ya3Mgd2VsbCBpbgogb3VyIGxv
Y2FsIHNpZGUuCkFuZCBhbHNvLCBwbGVhc2UgaGVscCBhIHJldmlldyBhYm91dCBteSBwcmV2aW91
cyBlbWFpbCBhYm91dCBmaXggc2R4NzIgcGluZyBmYWlsdXJlIGlzc3VlLgpUaGVyZSBpcyBhIGZp
eCBzb2x1dGlvbiBmcm9tIHVzLiAKClRoYW5rcwoKPgo+LS0gCj7grq7grqPgrr/grrXgrqPgr43g
rqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCg==

