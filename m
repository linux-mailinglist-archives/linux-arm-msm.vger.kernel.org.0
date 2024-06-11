Return-Path: <linux-arm-msm+bounces-22266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C6902DF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 03:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D2ACB218C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 01:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208BA749C;
	Tue, 11 Jun 2024 01:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="oABGaXWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3132863CB;
	Tue, 11 Jun 2024 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718069069; cv=none; b=jjegp2ns70l4axnbqN2iKgSDinyvIeYMy//wq5MFzzRqTjnjzlZWCBWGjhLyrh+MkfBy25smaafe53QCHx8f7rG4pueV1X2/7Lwm3go5H6fdYT20enKRXrOsTFZEvInar7RSgtucEdtAeUQtIFPL7hb0yobN0mvM1uIx0klybpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718069069; c=relaxed/simple;
	bh=zcXPl8Bzw642ICLfe5n+Eho01OwCsEZ/yr9ByuFu5Vw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JIGM/CjvlSrV9T5Y1oR2ItDEXTme6u1y3/zI0avBArm8nnmIYAlTQbaiMXXQ39+sG5dv3kA73Zxvpn3YQ5/Ie3bAc0JxBSEVv39K9a/38Rl65SaEQAUwgaj3iTXIEGhFTJE7nUM8LFTNxbKOprBrnqkHP19dYC9m28M+8VClOPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=oABGaXWl reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=JhawUknh1K4zYhm3WAOKPcVdF6zkQAYSoT/mXFi0W6I=; b=o
	ABGaXWlKJJiXpTt4ksJWYZaldwHf9eCF4gHxwQwIGYAB2sq4pDhM9fZyLR0W51Jt
	dAC34n9BV7A/uDHf0/wXoc241qQsWerdt+O/FRPTD9pAKXUN5IbyS+lvunYJSzgg
	2RV6I67mDKG9kGmHkbtxapHzcthwQtBmoKpEHalJzo=
Received: from slark_xiao$163.com ( [223.104.68.135] ) by
 ajax-webmail-wmsvr-40-148 (Coremail) ; Tue, 11 Jun 2024 09:24:07 +0800
 (CST)
Date: Tue, 11 Jun 2024 09:24:07 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Jeffrey Hugo" <quic_jhugo@quicinc.com>, 
	"Sergey Ryazanov" <ryazanov.s.a@gmail.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	quic_qianyu@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v1 1/2] bus: mhi: host: Import link_id item
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <4370ae55-9521-d2da-62b9-42d26b6fbece@quicinc.com>
References: <20240607100114.452979-1-slark_xiao@163.com>
 <4370ae55-9521-d2da-62b9-42d26b6fbece@quicinc.com>
X-NTES-SC: AL_Qu2aCvydtkgv4SWZZOkfmk8Sg+84W8K3v/0v1YVQOpF8jCHrxgkRXXVJP2bq0du3MRiqkxKdVzhnxtxTR5BccI0hp8AONAKtLIDoHtsNI7/Tkg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <38a9c3af.1408.19004e530de.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wDXP8g3p2dmWAg8AA--.24639W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwP5ZGV4JtK1gQACsG
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CitNb3JlIG1haW50YWluZXIgdG8gdGhpcyBmaXJzdCBwYXRjaCBsaXN0LgoKQXQgMjAyNC0wNi0w
NyAyMzowMTowMCwgIkplZmZyZXkgSHVnbyIgPHF1aWNfamh1Z29AcXVpY2luYy5jb20+IHdyb3Rl
Ogo+JFN1YmplY3Qgc2F5cyB0aGlzIGlzIHBhdGNoIDEgb2YgMiwgYnV0IEkgZG9uJ3Qgc2VlIGEg
c2Vjb25kIHBhdGNoIG5vciBhIAo+Y292ZXIgbGV0dGVyLgo+Cj5PbiA2LzcvMjAyNCA0OjAxIEFN
LCBTbGFyayBYaWFvIHdyb3RlOgo+PiBGb3IgU0RYNzIgTUJJTSBtb2RlLCBpdCBzdGFydHMgZGF0
YSBtdXggaWQgZnJvbSAxMTIgaW5zdGVhZCBvZiAwLgo+PiBUaGlzIHdvdWxkIGxlYWQgdG8gZGV2
aWNlIGNhbid0IHBpbmcgb3V0c2lkZSBzdWNjZXNzZnVsbHkuCj4+IEFsc28gTUJJTSBzaWRlIHdv
dWxkIHJlcG9ydCAiYmFkIHBhY2tldCBzZXNzaW9uICgxMTIpIi4KPj4gU28gd2UgYWRkIGEgbGlu
ayBpZCBkZWZhdWx0IHZhbHVlIGZvciBTRFg3Mi4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNsYXJr
IFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9idXMvbWhpL2hv
c3QvcGNpX2dlbmVyaWMuYyB8IDMgKysrCj4+ICAgaW5jbHVkZS9saW51eC9taGkuaCAgICAgICAg
ICAgICAgICB8IDEgKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+IAo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyBiL2RyaXZl
cnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPj4gaW5kZXggMGI0ODNjN2M3NmExLi4xZjlk
ZTI3MzA3NjYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmlj
LmMKPj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+PiBAQCAtNTMs
NiArNTMsNyBAQCBzdHJ1Y3QgbWhpX3BjaV9kZXZfaW5mbyB7Cj4+ICAgCXVuc2lnbmVkIGludCBk
bWFfZGF0YV93aWR0aDsKPj4gICAJdW5zaWduZWQgaW50IG1ydV9kZWZhdWx0Owo+PiAgIAlib29s
IHNpZGViYW5kX3dha2U7Cj4+ICsJdW5zaWduZWQgaW50IGxpbmtfZGVmYXVsdDsKPj4gICB9Owo+
PiAgIAo+PiAgICNkZWZpbmUgTUhJX0NIQU5ORUxfQ09ORklHX1VMKGNoX251bSwgY2hfbmFtZSwg
ZWxfY291bnQsIGV2X3JpbmcpIFwKPj4gQEAgLTQ2OSw2ICs0NzAsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fc2R4NzJfaW5mbyA9IHsKPj4gICAJ
LmRtYV9kYXRhX3dpZHRoID0gMzIsCj4+ICAgCS5tcnVfZGVmYXVsdCA9IDMyNzY4LAo+PiAgIAku
c2lkZWJhbmRfd2FrZSA9IGZhbHNlLAo+PiArCS5saW5rX2RlZmF1bHQgPSAxMTIsCj4+ICAgfTsK
Pj4gICAKPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jaGFubmVsX2NvbmZpZyBtaGlfbXYz
eF9jaGFubmVsc1tdID0gewo+PiBAQCAtMTAzNSw2ICsxMDM3LDcgQEAgc3RhdGljIGludCBtaGlf
cGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCAqaWQpCj4+ICAgCW1oaV9jbnRybC0+cnVudGltZV9nZXQgPSBtaGlfcGNpX3J1bnRpbWVfZ2V0
Owo+PiAgIAltaGlfY250cmwtPnJ1bnRpbWVfcHV0ID0gbWhpX3BjaV9ydW50aW1lX3B1dDsKPj4g
ICAJbWhpX2NudHJsLT5tcnUgPSBpbmZvLT5tcnVfZGVmYXVsdDsKPj4gKwltaGlfY250cmwtPmxp
bmtfaWQgPSBpbmZvLT5saW5rX2RlZmF1bHQ7Cj4+ICAgCj4+ICAgCWlmIChpbmZvLT5lZGxfdHJp
Z2dlcikKPj4gICAJCW1oaV9jbnRybC0+ZWRsX3RyaWdnZXIgPSBtaGlfcGNpX2dlbmVyaWNfZWRs
X3RyaWdnZXI7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21oaS5oIGIvaW5jbHVkZS9s
aW51eC9taGkuaAo+PiBpbmRleCBiNTczZjE1NzYyZjguLjRkYTEwYjk5Yzk2ZSAxMDA2NDQKPj4g
LS0tIGEvaW5jbHVkZS9saW51eC9taGkuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21oaS5oCj4+
IEBAIC00NDUsNiArNDQ1LDcgQEAgc3RydWN0IG1oaV9jb250cm9sbGVyIHsKPj4gICAJYm9vbCB3
YWtlX3NldDsKPj4gICAJdW5zaWduZWQgbG9uZyBpcnFfZmxhZ3M7Cj4+ICAgCXUzMiBtcnU7Cj4+
ICsJdTMyIGxpbmtfaWQ7Cj4+ICAgfTsKPj4gICAKPj4gICAvKioKPgo+Tm9uZSBvZiB0aGlzIGlz
IGFjdHVhbGx5IHVzZWQuICBEZWFkIGNvZGUgaXMgZ2VuZXJhbGx5IG5vdCBhY2NlcHRlZC4KPgo+
LUplZmYK

