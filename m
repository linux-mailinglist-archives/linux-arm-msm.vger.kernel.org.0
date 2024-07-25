Return-Path: <linux-arm-msm+bounces-27017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B852B93BE3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 10:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D249B20EE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 08:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C7B196D80;
	Thu, 25 Jul 2024 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="dHL/TqvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1072333CA;
	Thu, 25 Jul 2024 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897830; cv=none; b=aesva0sxHZhG+UgQl2dYTkHYH83pHyE8tCUm7mxEl/zAPpicK/8fBztQOT8dmwWQptdHbqXpUUPAHInF71ohuomVKeegBkwbMZVRNva9+Vi0aHCvHWSuKgYqBMe9lHCuWxSCN7pgq8wJvLozvCWTE4kN7Pq6mXO6czTwfcqYxsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897830; c=relaxed/simple;
	bh=cCe/W3zgu1gUXJBJUN/ACbmn9lEkAEzzTgEodx2P7mU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=jIf3RR6dLV/PCzO0Ohh/EbIECN5ahR9bXtK5Q6wQoikdIAXiVxNXMA6Cw3CAnoQyfRR4snn5wh81SWzdjPlzhJgXePKHZ2HjTR019t5in5D9KHf1JBn2NoSG7q9LRPfxwKBHMCEmWMvsv3SrpJsAguvw/1dnOkorYKEOVPZlBxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=dHL/TqvR reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=415WvEc5v8hdNyfSBtoAs90xkEKJPirj037ZuwYqdww=; b=d
	HL/TqvR/rPvAVJ5W6UTKOlTKy62hLDH8xiFcmUWvIXD5YPDtH/aQula5cdlOuuSm
	0ZyG9p/tI0lP6C6nxT73ykMsRZ6FDrSs9UnT3OvenOWCYdYykvr2ajFCqm1vU0Gs
	ubrR+ZCmPDIYm4Sb5CsdatncDb6hL6FnMp2rCH+jto=
Received: from slark_xiao$163.com ( [112.97.54.121] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Thu, 25 Jul 2024 16:56:03 +0800
 (CST)
Date: Thu, 25 Jul 2024 16:56:03 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file
 path for Foxconn SDX55/SDX72
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240725035954.GA2317@thinkpad>
References: <20240725022941.65948-1-slark_xiao@163.com>
 <20240725035954.GA2317@thinkpad>
X-NTES-SC: AL_Qu2ZA/SSuE8t5SGaYekfmk8Sg+84W8K3v/0v1YVQOpF8jDDp5SwdYHBaJVbNysSUISmhuQGOUzlL19VTQbVJQpM1NUZtkUrkiipU+J1XiMb/Pw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6dd00891.8235.190e91ac139.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3X9ojE6JmeVpYAA--.29543W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRx0nZGV4KfHPGQABsL
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDctMjUgMTE6NTk6NTQsICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pdmFu
bmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj5PbiBUaHUsIEp1bCAyNSwgMjAyNCBh
dCAxMDoyOTo0MEFNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+PiBUbyBzZXBhcmF0ZSB0aGUg
aW1hZ2VzIG9mIEZveGNvbm4gZnJvbSBvdGhlciB2ZW5kb3JzLCBhZGRpbmcgYQo+PiBuZXcgZm94
Y29ubiBzdWJmb2xkZXIgdW5kZXIgcWNvbS88cGxhdGZvcm0+IGZvciBlZGwgaW1hZ2UgcGF0aC4K
Pj4gQW5kIGRlbGV0ZSB0aGUgZncgcGF0Y2ggc2luY2UgaXQncyB1c2VsZXNzIGZvciBGb3hjb25u
IGRldmljZXMuCj4+IAo+PiBGaXhlczogYmYzMGE3NWU2ZTAwICgiYnVzOiBtaGk6IGhvc3Q6IEFk
ZCBzdXBwb3J0IGZvciBGb3hjb25uIFNEWDcyIG1vZGVtcyIpCj4+IFNpZ25lZC1vZmYtYnk6IFNs
YXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4gLS0tCj4+IHYyOiBjaGFuZ2UgdGhlIGZv
bGRlciBwYXRoIGFyY2hpdGVjdHVyZQo+PiAtLS0KPj4gIGRyaXZlcnMvYnVzL21oaS9ob3N0L3Bj
aV9nZW5lcmljLmMgfCAxMyArKysrKy0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVz
L21oaS9ob3N0L3BjaV9nZW5lcmljLmMgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJp
Yy5jCj4+IGluZGV4IDE0YTExODgwYmNlYS4uZjE1OWE5ZGQ1M2U3IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+ICsrKyBiL2RyaXZlcnMvYnVzL21o
aS9ob3N0L3BjaV9nZW5lcmljLmMKPj4gQEAgLTQzMyw4ICs0MzMsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2RlbV9mb3hjb25uX3NkeDcyX2NvbmZpZyA9
IHsKPj4gIAo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9mb3hj
b25uX3NkeDU1X2luZm8gPSB7Cj4+ICAJLm5hbWUgPSAiZm94Y29ubi1zZHg1NSIsCj4+IC0JLmZ3
ID0gInFjb20vc2R4NTVtL3NibDEubWJuIiwKPj4gLQkuZWRsID0gInFjb20vc2R4NTVtL2VkbC5t
Ym4iLAo+PiArCS5lZGwgPSAicWNvbS9zZHg1NW0vZm94Y29ubi9wcm9nX2ZpcmVob3NlX3NkeDU1
Lm1ibiIsCj4KPkkgdGhpbmsgeW91IG1pc3VuZGVyc3Rvb2Qgd2hhdCBJIHN1Z2dlc3RlZCBpbiBl
YXJsaWVyIHJldmlzaW9uLiBZb3Ugc2hvdWxkIGFkZAo+dGhlIEZveGNvbm4gc3BlY2lmaWMgZncg
b25seSBpZiBpdCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgcWNvbSBvbmUuIElzIGl0IHJlYWxseQo+
ZGlmZmVyZW50IGZvciBhbGwgdGhlc2UgbW9kZW1zPyBPdGhlcndpc2UsIHdoYXQgaXMgdGhlIHBv
aW50IG9mIGFkZGluZyB0aGVtPwo+Cj4tIE1hbmkKCj4KSGkgTWFuaSwKWWVzLCBhbGwgcHJvZ3Jh
bWVyIGZpbGVzIGFyZSBkaWZmZXJlbnQgd2l0aCBkZWZhdWx0LiBXZSBhZGQgYSBzaWduIHN0ZXAg
Zm9yIGVhY2ggaW1hZ2UKZmlsZS4gVGhhdCBtZWFucyBvdGhlciB2ZW5kb3IncyBlZGwgaW1hZ2Uo
aW5jbHVkaW5nIFF1YWxjb21tKSBjYW4ndCBiZSBhcHBsaWVkIGZvcgpGb3hjb25uIGRldmljZXMu
IAoKPj4gIAkuY29uZmlnID0gJm1vZGVtX2ZveGNvbm5fc2R4NTVfY29uZmlnLAo+PiAgCS5iYXJf
bnVtID0gTUhJX1BDSV9ERUZBVUxUX0JBUl9OVU0sCj4+ICAJLmRtYV9kYXRhX3dpZHRoID0gMzIs
Cj4+IEBAIC00NDQsOCArNDQzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9p
bmZvIG1oaV9mb3hjb25uX3NkeDU1X2luZm8gPSB7Cj4+ICAKPj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94Y29ubl90OTl3MTc1X2luZm8gPSB7Cj4+ICAJLm5h
bWUgPSAiZm94Y29ubi10OTl3MTc1IiwKPj4gLQkuZncgPSAicWNvbS9zZHg1NW0vc2JsMS5tYm4i
LAo+PiAtCS5lZGwgPSAicWNvbS9zZHg1NW0vZWRsLm1ibiIsCj4+ICsJLmVkbCA9ICJxY29tL3Nk
eDU1bS9mb3hjb25uL3Byb2dfZmlyZWhvc2Vfc2R4NTUubWJuIiwKPj4gIAkuY29uZmlnID0gJm1v
ZGVtX2ZveGNvbm5fc2R4NTVfY29uZmlnLAo+PiAgCS5iYXJfbnVtID0gTUhJX1BDSV9ERUZBVUxU
X0JBUl9OVU0sCj4+ICAJLmRtYV9kYXRhX3dpZHRoID0gMzIsCj4+IEBAIC00NTUsOCArNDUzLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9mb3hjb25uX3Q5OXcx
NzVfaW5mbyA9IHsKPj4gIAo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZv
IG1oaV9mb3hjb25uX2R3NTkzMGVfaW5mbyA9IHsKPj4gIAkubmFtZSA9ICJmb3hjb25uLWR3NTkz
MGUiLAo+PiAtCS5mdyA9ICJxY29tL3NkeDU1bS9zYmwxLm1ibiIsCj4+IC0JLmVkbCA9ICJxY29t
L3NkeDU1bS9lZGwubWJuIiwKPj4gKwkuZWRsID0gInFjb20vc2R4NTVtL2ZveGNvbm4vcHJvZ19m
aXJlaG9zZV9zZHg1NS5tYm4iLAo+PiAgCS5jb25maWcgPSAmbW9kZW1fZm94Y29ubl9zZHg1NV9j
b25maWcsCj4+ICAJLmJhcl9udW0gPSBNSElfUENJX0RFRkFVTFRfQkFSX05VTSwKPj4gIAkuZG1h
X2RhdGFfd2lkdGggPSAzMiwKPj4gQEAgLTUwMiw3ICs0OTksNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fZHc1OTMyZV9pbmZvID0gewo+PiAgCj4+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fdDk5dzUx
NV9pbmZvID0gewo+PiAgCS5uYW1lID0gImZveGNvbm4tdDk5dzUxNSIsCj4+IC0JLmVkbCA9ICJm
b3gvc2R4NzJtL2VkbC5tYm4iLAo+PiArCS5lZGwgPSAicWNvbS9zZHg3Mm0vZm94Y29ubi9lZGwu
bWJuIiwKPj4gIAkuZWRsX3RyaWdnZXIgPSB0cnVlLAo+PiAgCS5jb25maWcgPSAmbW9kZW1fZm94
Y29ubl9zZHg3Ml9jb25maWcsCj4+ICAJLmJhcl9udW0gPSBNSElfUENJX0RFRkFVTFRfQkFSX05V
TSwKPj4gQEAgLTUxMyw3ICs1MTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2
X2luZm8gbWhpX2ZveGNvbm5fdDk5dzUxNV9pbmZvID0gewo+PiAgCj4+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fZHc1OTM0ZV9pbmZvID0gewo+PiAg
CS5uYW1lID0gImZveGNvbm4tZHc1OTM0ZSIsCj4+IC0JLmVkbCA9ICJmb3gvc2R4NzJtL2VkbC5t
Ym4iLAo+PiArCS5lZGwgPSAicWNvbS9zZHg3Mm0vZm94Y29ubi9lZGwubWJuIiwKPj4gIAkuZWRs
X3RyaWdnZXIgPSB0cnVlLAo+PiAgCS5jb25maWcgPSAmbW9kZW1fZm94Y29ubl9zZHg3Ml9jb25m
aWcsCj4+ICAJLmJhcl9udW0gPSBNSElfUENJX0RFRkFVTFRfQkFSX05VTSwKPj4gLS0gCj4+IDIu
MjUuMQo+PiAKPgo+LS0gCj7grq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a
4K6/4K614K6u4K+NCg==

