Return-Path: <linux-arm-msm+bounces-22406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58320905048
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D52B9B21E91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4575C16E893;
	Wed, 12 Jun 2024 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="n5DlUksY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE37836B17;
	Wed, 12 Jun 2024 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718187588; cv=none; b=agysGQ4huktBFTWEYJN3sLhdT+oXUJya+NqD19RLp6A5EgpRUzWnvr5SsZ9/+nZ3ZKXIXOdbXv2W8cts2ejgbpmhb781+DMFsET3/t/tS/8NVHX5zZTrJ0bzSf/XQpbqxl3l9ZCebNe80TSVHTexBrPnpsHn4fSC8yc/8irS1zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718187588; c=relaxed/simple;
	bh=B0hP15R6Jl3ptMCUkoYa9BaYaQfmxH/f1q1mXMxVXqk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=l1iesABU4cGfH2fijb4naFeaFF448QBV1PfGqeJEkubWDzCcPLdE1I40eApEwoqVYj5eOOY1wTYr/XECdwnb3yX3J4HuAwN3t3/4tW3ONxfNdVTw4r6+ExTZrEi1T/MR0G/YGqQjwdyjJzG/M3klnS6LopcyMV41HdxPngU31Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=n5DlUksY reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=duIBgIDUPF5CPcPPjuQN/iPqeJI6MUsldASWGbg0cp4=; b=n
	5DlUksYNKhpr8NyL0mz6sM1tZyFKH/cN3Fe0qbEBVCH1XpbPI0ovTlfrCy4Zn3e+
	+da6sHEkODQo0jEBW7TuO3ho83DzYi6wTSnoAlWRu3tvH3+i0lEaYcYC9tlLQXRY
	mpQJpwp2/5vl4ueu1/vLXbkUNMabIOg4yiaObaNXK4=
Received: from slark_xiao$163.com ( [112.97.57.186] ) by
 ajax-webmail-wmsvr-40-149 (Coremail) ; Wed, 12 Jun 2024 18:19:07 +0800
 (CST)
Date: Wed, 12 Jun 2024 18:19:07 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	quic_jhugo@quicinc.com, netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240612094609.GA58302@thinkpad>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
X-NTES-SC: AL_Qu2aCv2TuE0v4SefYekfmk8Sg+84W8K3v/0v1YVQOpF8jCLr2i0Ae2JeB2vv28GgBweVgAWKSTVB1ORidJJbYbMNPZbOFBNYqIHYzG5FBQsNKg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <62661484.af58.1900bf55c85.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3n90bdmlmW6d9AA--.805W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRxf7ZGV4JvIMKAADsh
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDYtMTIgMTc6NDY6MDksICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pdmFu
bmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj5PbiBXZWQsIEp1biAxMiwgMjAyNCBh
dCAwNTozODo0MlBNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+Cj5TdWJqZWN0IGNvdWxkIGJl
IGltcHJvdmVkOgo+Cj5idXM6IG1oaTogaG9zdDogQWRkIGNvbmZpZ3VyYWJsZSBtdXhfaWQgZm9y
IE1CSU0gbW9kZQo+CgpXb3VsZCBiZSB1cGRhdGVkIGluIHYzIHZlcnNpb24uCgo+PiBGb3IgU0RY
NzIgTUJJTSBtb2RlLCBpdCBzdGFydHMgZGF0YSBtdXggaWQgZnJvbSAxMTIgaW5zdGVhZCBvZiAw
Lgo+PiBUaGlzIHdvdWxkIGxlYWQgdG8gZGV2aWNlIGNhbid0IHBpbmcgb3V0c2lkZSBzdWNjZXNz
ZnVsbHkuCj4+IEFsc28gTUJJTSBzaWRlIHdvdWxkIHJlcG9ydCAiYmFkIHBhY2tldCBzZXNzaW9u
ICgxMTIpIi4KPj4gU28gd2UgYWRkIGEgZGVmYXVsdCBtdXhfaWQgdmFsdWUgZm9yIFNEWDcyLiBB
bmQgdGhpcyB2YWx1ZQo+PiB3b3VsZCBiZSB0cmFuc2ZlcnJlZCB0byB3d2FuIG1iaW0gc2lkZS4K
Pj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4g
LS0tCj4+ICBkcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIHwgMyArKysKPj4gIGlu
Y2x1ZGUvbGludXgvbWhpLmggICAgICAgICAgICAgICAgfCAyICsrCj4+ICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9o
b3N0L3BjaV9nZW5lcmljLmMgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+
IGluZGV4IDBiNDgzYzdjNzZhMS4uOWU5YWRmODMyMGQyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj4+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0
L3BjaV9nZW5lcmljLmMKPj4gQEAgLTUzLDYgKzUzLDcgQEAgc3RydWN0IG1oaV9wY2lfZGV2X2lu
Zm8gewo+PiAgCXVuc2lnbmVkIGludCBkbWFfZGF0YV93aWR0aDsKPj4gIAl1bnNpZ25lZCBpbnQg
bXJ1X2RlZmF1bHQ7Cj4+ICAJYm9vbCBzaWRlYmFuZF93YWtlOwo+PiArCXVuc2lnbmVkIGludCBt
dXhfaWQ7Cj4+ICB9Owo+PiAgCj4+ICAjZGVmaW5lIE1ISV9DSEFOTkVMX0NPTkZJR19VTChjaF9u
dW0sIGNoX25hbWUsIGVsX2NvdW50LCBldl9yaW5nKSBcCj4+IEBAIC00NjksNiArNDcwLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9mb3hjb25uX3NkeDcyX2lu
Zm8gPSB7Cj4+ICAJLmRtYV9kYXRhX3dpZHRoID0gMzIsCj4+ICAJLm1ydV9kZWZhdWx0ID0gMzI3
NjgsCj4+ICAJLnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4gKwkubXV4X2lkID0gMTEyLAo+PiAg
fTsKPj4gIAo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfY2hhbm5lbF9jb25maWcgbWhpX212
M3hfY2hhbm5lbHNbXSA9IHsKPj4gQEAgLTEwMzUsNiArMTAzNyw3IEBAIHN0YXRpYyBpbnQgbWhp
X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgKmlkKQo+PiAgCW1oaV9jbnRybC0+cnVudGltZV9nZXQgPSBtaGlfcGNpX3J1bnRpbWVfZ2V0
Owo+PiAgCW1oaV9jbnRybC0+cnVudGltZV9wdXQgPSBtaGlfcGNpX3J1bnRpbWVfcHV0Owo+PiAg
CW1oaV9jbnRybC0+bXJ1ID0gaW5mby0+bXJ1X2RlZmF1bHQ7Cj4+ICsJbWhpX2NudHJsLT5saW5r
X2lkID0gaW5mby0+bXV4X2lkOwo+Cj5BZ2FpbiwgJ2xpbmtfaWQnIGlzIGp1c3QgYSBXV0FOIHRl
cm0uIFVzZSAnbXV4X2lkJyBoZXJlIGFsc28uCj4KPi0gTWFuaQoKSSBoYXZlIHVwZGF0ZWQgdGhl
IGl0ZW0gbmFtZSBpbiBtaGkgc2lkZSBidXQga2VwdCBpbiB3d2FuIHNpZGUuIFRoZSB2YWx1ZSAK
Im1oaV9jbnRybC0+bGlua19pZCIgd291bGQgYmUgY2FsbGVkIGluIGZ1bmN0aW9uIG1oaV9tYmlt
X3Byb2JlKCkgb2YgCm1oaV93d2FuX21iaW0uYy4gQWNjb3JkaW5nIHRoZSBkZXNjcmlwdGlvbiBv
ZiBsYXN0IHBhcmFtZXRlciBvZiBmdW5jdGlvbiAKJ3d3YW5fcmVnaXN0ZXJfb3BzKCknIGluIG1o
aV9tYmltX3Byb2JlKCkgOgoKKiBAZGVmX2xpbmtfaWQ6IGlkIG9mIGRlZmF1bHQgbGluayB0aGF0
IHdpbGwgYmUgYXV0b21hdGljYWxseSBjcmVhdGVkIGJ5CiogICAgIHRoZSBXV0FOIGNvcmUgZm9y
IHRoZSBXV0FOIGRldmljZS4KClNvIGFyZSB5b3Ugc3VyZSB3ZSBzaGFsbCB1c2UgbXV4X2lkIGlu
IHd3YW4gc2lkZT8gUGxlYXNlIGhlbHAgcmVjb25maXJtIGl0LgoKVGhhbmtzIQo+Cj4tLSAKPuCu
ruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40K

