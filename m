Return-Path: <linux-arm-msm+bounces-82484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F0C6E2C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 12:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E3A74EF2DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44491351FB6;
	Wed, 19 Nov 2025 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Kkh9r5c5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D3B24886E;
	Wed, 19 Nov 2025 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550419; cv=none; b=XH2SNAoK5zOrIE1YH1+QBGmVn1+C4CYG27RiRD/z5Td7fOIGSxOU7enNSU+tm0ysCodrhEip32cT69A/LMlR54i1owpnIn3dtUU7tTklvvNBeFP+686NEXKhzcog+fq949+ZE046UwIRt/UoTPTiDAA1JMzsA1v/ECY38GGoZ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550419; c=relaxed/simple;
	bh=vxeKL9n8sesvnbmXcAPsqsCVyIM733KeN+FhouEaeic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=G+HYQ0x+1RGHj7ocPEqSoIj5Yg1Mj39ekZP3gRMLUZTUrdjjPPpOazTi65u4fYwIBleuRALVKOk4dIhkSn0BAAg/NJB8KUMADJgexBJYFRSfudnw5gG1hz2yGvX5KRi2d7k+MFR9V9ch5TqNQMs9msP6iKZTSROg8mkML9/UsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Kkh9r5c5 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=4LTf8U1ZnZvkLJFXeL+wl/+iB8gycPhi64DhPGHK4dM=; b=K
	kh9r5c5MpFH741jS/ua0haRopQMcT+zAj/HS/7xlc0yr8H96iV5t+eu7lmRdXt9p
	NwejTKkDd3BBct7KKphr70Ihp4Mdr9eVobUstjOJ2DwL+AkkjzKxQOmBMa8gj7PR
	gOiih3OE+5sOGYGFHVIH4/0QngBmYEpdptZGj6p3n0=
Received: from slark_xiao$163.com ( [2408:8459:3860:2d7a:924e:a1a:3ee9:828d]
 ) by ajax-webmail-wmsvr-40-132 (Coremail) ; Wed, 19 Nov 2025 19:05:27 +0800
 (CST)
Date: Wed, 19 Nov 2025 19:05:27 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, mani@kernel.org,
	loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn
 T99W760 modem
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <8adcb880-a2d3-4987-88c8-c3441963fc53@oss.qualcomm.com>
References: <20251119084537.34303-1-slark_xiao@163.com>
 <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
 <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
 <8adcb880-a2d3-4987-88c8-c3441963fc53@oss.qualcomm.com>
X-NTES-SC: AL_Qu2dAfmev0sp4SSZZOkfmk8Sg+84W8K3v/0v1YVQOpF8jAPo8yMnU0Z6BF76zeyeFiCHvwOXfzlsx/10ebdUWrsh9SC3/ElWd/pccoOCxVBObA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4c801771.9d89.19a9bca727f.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hCgvCgAnXMR3pB1pSdMlAA--.30W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCwBfnTGkdpHfDWAAA3A
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMTEtMTkgMTc6MjE6MzMsICJLb25yYWQgRHliY2lvIiA8a29ucmFkLmR5YmNpb0Bv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPk9uIDExLzE5LzI1IDEwOjEyIEFNLCBTbGFyayBYaWFv
IHdyb3RlOgo+PiAKPj4gQXQgMjAyNS0xMS0xOSAxNzowNToxNywgIkRtaXRyeSBCYXJ5c2hrb3Yi
IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pj4gT24gV2VkLCBO
b3YgMTksIDIwMjUgYXQgMDQ6NDU6MzdQTSArMDgwMCwgU2xhcmsgWGlhbyB3cm90ZToKPj4+PiBU
OTlXNzYwIG1vZGVtIGlzIGJhc2VkIG9uIFF1YWxjb21tIFNEWDM1IGNoaXBzZXQuCj4+Pj4gSXQg
dXNlIHRoZSBzYW1lIGNoYW5uZWwgc2V0dGluZ3Mgd2l0aCBGb3hjb25uIFNEWDYxLgo+Pj4+IGVk
bCBmaWxlIGhhcyBiZWVuIGNvbW1pdHRlZCB0byBsaW51eC1maXJtd2FyZS4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4+PiAtLS0KPj4+
PiB2MjogQWRkIG5ldCBhbmQgTUhJIG1haW50YWluZXIgdG9nZXRoZXIKPj4+PiAtLS0KPj4+PiAg
ZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyB8IDEzICsrKysrKysrKysrKysKPj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBOb3RlOiBvbmx5IDEv
MiBtYWRlIGl0IHRvIGxpbnV4LWFybS1tc20uIElzIGl0IGludGVudGlvbmFsIG9yIHdhcyB0aGVy
ZQo+Pj4gYW55IGtpbmQgb2YgYW4gZXJyb3Igd2hpbGUgc2VuZGluZyB0aGUgcGF0Y2hlcz8KPj4+
Cj4+PiAtLSAKPj4+IFdpdGggYmVzdCB3aXNoZXMKPj4+IERtaXRyeQo+PiBCb3RoIHBhdGNoZXMg
aGF2ZSBjYyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZy4KPj4gQW5kIG5vdyBJIGNhbiBm
aW5kIGJvdGggcGF0Y2hlcyBpbjoKPj4gcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1hcm0tbXNtL2xpc3QvCj4KPkl0IHNlZW1zIGxpa2UgdGhleSdyZSB0aGVyZSwgYnV0IG5vdCBw
YXJ0IG9mIHRoZSBzYW1lIHRocmVhZAo+Cj5QbGVhc2UgdHJ5IHVzaW5nIHRoZSBiNCB0b29sOgo+
Cj5odHRwczovL2I0LmRvY3Mua2VybmVsLm9yZy8KPgo+d2hpY2ggd2lsbCBoZWxwIGF2b2lkIHN1
Y2ggaXNzdWVzCj4KPktvbnJhZApJIHNlbmQgYSB2ZXJzaW9uIDMgYWdhaW4uIEl0IHNlZW1zIE9L
IG5vdy4KUGxlYXNlIGhlbHAgdGFrZSBhIGxvb2sgb24gdGhhdC4KClRoYW5rcy4K

