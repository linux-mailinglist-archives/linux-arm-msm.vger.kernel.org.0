Return-Path: <linux-arm-msm+bounces-19861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A18C5ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 03:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2718EB21365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 01:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083091FC4;
	Wed, 15 May 2024 01:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="kInQ84cV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EADC1109;
	Wed, 15 May 2024 01:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715737450; cv=none; b=ndBZpsl1SExNN8lT+wlKfAiU6X73BZ7sji/bfKRNRtrA0/T9jtdzrLfZHEaxbEcHvyp3dzyrb9BA0OIsMZVsVucNFHDHqnbRJIS/kGBhdgBvixbfkzFKxI4FROQvxDAmrLrBlx1/Cvt/lZ7TJX9jaXv7EJcgCXbAAEcR3AGovLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715737450; c=relaxed/simple;
	bh=Zn8XQsRdiG603rt3IatBcUnuA3f8VBIXFHPJz1noX9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Drg3yWd9OZUuXSSkxzT+vj77ZfqXYEVi82ksidtVSAZiAwd2keJTcv5vRdXbqLE7tTB0EzOe24vkYyysDyiKA9/ponRs/Ho6xTgo1R1DAJyJPlI3bZ2EsNKqS5Ytp/RHwhxvZnvbOuL8mtzUQ2wWFeqd+xkhgY7+p54L4qB2Lc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=kInQ84cV reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=OIEJ6ll5SJoL0DXC7T+HWpTTADt3IUKTAy+S0CyjIV8=; b=k
	InQ84cV6vpO/hLFp80Wtjk/y6JId/v5lL+Q/QXUrR+Wqaq51IeaYxkEUcl5M+g6k
	GoBjLqmWkpDb3PUlAVFwfokVpuS8nSq3TBFjC4TA2FIagu1a/WdQQjit69ljs2KG
	6MBL94u1pu4XYbVkSBUN4bqOGBe1JISNzyb6EO22cE=
Received: from slark_xiao$163.com ( [223.104.68.205] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Wed, 15 May 2024 09:43:53 +0800
 (CST)
Date: Wed, 15 May 2024 09:43:53 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:Re:Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
X-NTES-SC: AL_Qu2aB/uYuEwo5SGfYOkfm0kaj+c/WMGzu/8m3oFXO51wjA/p9R8Ab25qLX/Vwd6AAAyRtzG+XDNV0PRYYrFmXaQGJVGI3nZVfx2duCnWQOCh5A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <fc42977.1ac5.18f79eb945a.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3v9JZE0RmuWJeAA--.1037W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiox-fZGVODY+MbwABsM
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

ClNlbmQgYWdhaW4gd2l0aCB0ZXh0IG1vZGUuCkF0IDIwMjQtMDUtMTUgMDk6Mjk6MjAsICJTbGFy
ayBYaWFvIiA8c2xhcmtfeGlhb0AxNjMuY29tPiB3cm90ZToKPkF0IDIwMjQtMDUtMTQgMjI6Mzc6
NDEsICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJv
Lm9yZz4gd3JvdGU6Cj4+T24gRnJpLCBNYXkgMTAsIDIwMjQgYXQgMTE6MjY6NTdBTSArMDgwMCwg
U2xhcmsgWGlhbyB3cm90ZToKPj4+IEFsaWduIHdpdGggUWNvbSBTRFg3MiwgYWRkIHJlYWR5IHRp
bWVvdXQgaXRlbSBmb3IgRm94Y29ubiBTRFg3Mi4KPj4+IEFuZCBhbHNvLCBhZGQgZmlyZWhvc2Ug
c3VwcG9ydCBzaW5jZSBTRFg3Mi4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogU2xhcmsgWGlhbyA8
c2xhcmtfeGlhb0AxNjMuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9idXMvbWhpL2hvc3QvcGNp
X2dlbmVyaWMuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dl
bmVyaWMuYwo+Pj4gaW5kZXggMDg4NDRlZTc5NjU0Li4wZmQ5NGMxOTNmYzYgMTAwNjQ0Cj4+PiAt
LS0gYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+PiArKysgYi9kcml2ZXJz
L2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+PiBAQCAtMzk5LDYgKzM5OSw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbWhpX2NoYW5uZWxfY29uZmlnIG1oaV9mb3hjb25uX3NkeDU1X2NoYW5u
ZWxzW10gPSB7Cj4+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19ETCgxMywgIk1CSU0iLCAzMiwgMCks
Cj4+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19VTCgzMiwgIkRVTiIsIDMyLCAwKSwKPj4+ICAJTUhJ
X0NIQU5ORUxfQ09ORklHX0RMKDMzLCAiRFVOIiwgMzIsIDApLAo+Pj4gKwlNSElfQ0hBTk5FTF9D
T05GSUdfVUxfRlAoMzQsICJGSVJFSE9TRSIsIDMyLCAwKSwKPj4+ICsJTUhJX0NIQU5ORUxfQ09O
RklHX0RMX0ZQKDM1LCAiRklSRUhPU0UiLCAzMiwgMCksCj4+Cj4+VGhpcyBtZWFucyBTRFg1NSBp
cyBhbHNvIHN1cHBvcnRpbmcgRklSRUhPU0UgY2hhbm5lbHMsIHdoaWNoIGlzIG5vdCB0cnVlIEkK
Pj5iZWxpZXZlLgo+QWN0dWFsbHksIEkganVzdCB2ZXJpZmllZCBpdCB3aXRoIG15IHNkeDU1IGFu
ZCB0aGUgYW5zd2VyIGlzIFllcy4gVGhlc2UgY2hhbm5lbHMKPmFyZSBjb21tb24gc2V0dGluZ3Mg
Zm9yIFFjb20gZGV2aWNlIHdoaWNoIHN1cHBvcnQgUENJZSBtb2RlLiBCVFcsIHRoZQo+ZGVmYXVs
dCBzZXR0aW5ncyBvZiBRY29tIGFuZCBRdWVjdGVsIHN1cHBvcnQgZmlyZWhvc2UgZm9yIHRoZWly
IHNkeDU1IHByb2R1Y3RzLgo+Pgo+Pj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfSFdfVUwoMTAwLCAi
SVBfSFcwX01CSU0iLCAxMjgsIDIpLAo+Pj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfSFdfREwoMTAx
LCAiSVBfSFcwX01CSU0iLCAxMjgsIDMpLAo+Pj4gIH07Cj4+PiBAQCAtNDE5LDYgKzQyMSwxNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2RlbV9mb3hjb25u
X3NkeDU1X2NvbmZpZyA9IHsKPj4+ICAJLmV2ZW50X2NmZyA9IG1oaV9mb3hjb25uX3NkeDU1X2V2
ZW50cywKPj4+ICB9Owo+Pj4gIAo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX2NvbnRyb2xs
ZXJfY29uZmlnIG1vZGVtX2ZveGNvbm5fc2R4NzJfY29uZmlnID0gewo+Pj4gKwkubWF4X2NoYW5u
ZWxzID0gMTI4LAo+Pj4gKwkudGltZW91dF9tcyA9IDIwMDAwLAo+Pj4gKwkucmVhZHlfdGltZW91
dF9tcyA9IDUwMDAwLAo+Pj4gKwkubnVtX2NoYW5uZWxzID0gQVJSQVlfU0laRShtaGlfZm94Y29u
bl9zZHg1NV9jaGFubmVscyksCj4+PiArCS5jaF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9jaGFu
bmVscywKPj4+ICsJLm51bV9ldmVudHMgPSBBUlJBWV9TSVpFKG1oaV9mb3hjb25uX3NkeDU1X2V2
ZW50cyksCj4+PiArCS5ldmVudF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4+PiAr
fTsKPj4+ICsKPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2Zv
eGNvbm5fc2R4MjRfaW5mbyA9IHsKPj4+ICAJLm5hbWUgPSAiZm94Y29ubi1zZHgyNCIsCj4+PiAg
CS5jb25maWcgPSAmbW9kZW1fZm94Y29ubl9zZHg1NV9jb25maWcsCj4+PiBAQCAtNDQ4LDYgKzQ2
MCwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5f
c2R4NjVfaW5mbyA9IHsKPj4+ICAJLnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4+ICB9Owo+Pj4g
IAo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94Y29ubl9z
ZHg3Ml9pbmZvID0gewo+Pj4gKwkubmFtZSA9ICJmb3hjb25uLXNkeDcyIiwKPj4+ICsJLmVkbCA9
ICJxY29tL3NkeDcybS94Ymxfc19kZXZwcmdfbnMubWVsZiIsCj4+Cj4+V2hhdCBpcyAnLm1lbGYn
PyBJcyB0aGUgZmlybXdhcmUgYXZhaWxhYmxlIHNvbWV3aGVyZT8gRGlkIHlvdSBwbGFuIHRvIHVw
c3RyZWFtCj4+aXQgdG8gbGludXgtZmlybXdhcmU/Cj4+Cj5UaGlzIGZpbGUgc2ltaWxhciB3aXRo
ICJlZGwubWJuIi4gSW4gU0RYNzIgcHJvZHVjdCwgdGhlIGRlZmF1bHQgImVkbCIgZmlsZSBuYW1l
IGlzCj4ieGJsX3NfZGV2cHJnX25zLm1lbGYiLiBDdXJyZW50bHkgd2UgZG9uJ3QgcGxhbiB0byB1
cHN0cmVhbSBpdCB0byBsaW51eC1maXJtd2FyZQo+c2luY2UgMiByZWFzb25zOiAxOiB3ZSBzaGFy
ZSB0aGUgc2FtZSBmb2xkIG5hbWUgc2R4NzJtIHdpdGggcWNvbSBvciBvdGhlciB2ZW5kb3JzCj4y
OiB0aGlzIGZpbGUgbWF5IGJlIGNoYW5nZWQgc2luY2Ugc2R4NzIgcHJvZHVjdCBzdGlsbCB1bmRl
ciBkZXZlbG9waW5nIGluIG91ciBzaWRlLiB3ZQo+bWF5IGNoYW5nZSB0aGUgYmFzZSBsaW5lIGFj
Y29yZGluZyB0byBRQ09NIHJlbGVhc2UuCj4+LSBNYW5pCj4+CkFuZCBJIHdhbnQgdG8gc2F5LCB0
aGUgb3Mgb3IgZHJpdmVyIGNhbid0IHJlY292ZXIgZGV2aWNlIHdpdGggdGhpcyAiZWRsIiBmaWxl
IG9ubHkuIFRoaXMgZmlsZQpvbmx5IHVzZWQgd2hlbiBkZXZpY2UgbmVlZHMgdG8gYmUgY2hhbmdl
ZCB0byBmaXJlaG9zZSBtb2RlLiBBZnRlciB0aGF0LCB3ZSBuZWVkCmEgdG9vbCBhbmQgYSBjb21w
bGV0ZSBmaXJtd2FyZSBwYWNrYWdlIHRvIGRvIHRoZSBmaXJlaG9zZSBkb3dubG9hZC4gVW5mb3J0
dW5hdGVseSwKdGhlcmUgaXMgbm8gb3BlbiBzb3VyY2UgdG9vbCB0byBzdXBwb3J0IHRoaXMgZG93
bmxvYWQuIEV2ZW4gUWNvbSBQQ0FUIHRvb2wgb25seQpzdXBwb3J0cyB0aGVpciBvd24gVklEL1BJ
RCB3aXRoIHRoZWlyIG93biBkcml2ZXIuIFNvIHRoZSBmdW5jdGlvbiBvZiBtaGkgZHJpdmVyIGlz
OgpQdXQgZGV2aWNlIGludG8gZmlyZWhvc2UgbW9kZSBhbmQgZW51bWVyYXRlIHRoZSB3d2FuMGZp
cmVob3NlMCBwb3J0LiBUaGUgcmVzdApzaGFsbCBiZSBkb25lIGJ5IGVuZHVzZXIgdGhlbXNlbHZl
cy4gCj4+LS0gCj4+4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+Cu
teCuruCvjQo=

