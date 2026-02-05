Return-Path: <linux-arm-msm+bounces-91896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKUvMHpthGmJ2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:14:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A931F13B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28D7F301AA56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0E83A4F5D;
	Thu,  5 Feb 2026 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Dfgid+rS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161D35D5E5;
	Thu,  5 Feb 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770286452; cv=none; b=bU+i5ZHLDW3EhPWS6/uBFoXvy1R4LHKUqjueMHxKhSR5fe7xx/Sa56FH+sbWiaGF9qzGnq/IDws/1kk4qxp7/WAdRqQHu/ZoPgXyhXxnSgA7bDAhcFMq/hxso+qGQf/v0xoMrIyqkKNZci6thDCDcSepN7S3ry/G8WMqbrJTTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770286452; c=relaxed/simple;
	bh=NCgVPAe9VqNj2kJDXdsC3ClwQHbDI1sK1dp1blK+3GQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=QIUXYW2rCRTGrImNEpue3+ZiZv5eF/aSVwI8uV6Z0D/yuyqBh8lHkM8fJOc3Oxbn0xAKKsFNCSPQd18deu5c3JBuoBeEIy6euJw8pZDC+I9oRsE901YVxj5n/uIILxPNj7/nU2ZN23t0BZCnE9YJCnyLl/2mlGchQxv5xDRNl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Dfgid+rS; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=NCgVPAe9VqNj2kJDXdsC3ClwQHbDI1sK1dp1blK+3GQ=; b=D
	fgid+rSVp5XyoCd0+/I5ZuO8YcaOKUbPcADLoZscjEFqdUuO1SH7rFMRGgI+2qgn
	4zK3WMKhAkAtgtiZNyz22cam2x1OsSTB7+k9mngfivZDfMTOMdbcJU7XottZGKB4
	9zQmEv+Z/2+UwN+vtzvQfbNL+jBJ+kw+Z+yjsi8ggY=
Received: from wwfu06$163.com ( [221.13.0.203] ) by
 ajax-webmail-wmsvr-40-140 (Coremail) ; Thu, 5 Feb 2026 18:13:44 +0800 (CST)
Date: Thu, 5 Feb 2026 18:13:44 +0800 (CST)
From: wwf  <wwfu06@163.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, andersson@kernel.org,
	"Krzysztof Kozlowski" <krzk@kernel.org>
Subject: Re:Re: [PATCH v3 2/2] arm64: dts: qcom: add Acer Swift SFA14-11
 device tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <a13003ea-27be-43ea-b739-8d5d6ba69d0d@oss.qualcomm.com>
References: <20260121112721.2981491-1-wwfu06@163.com>
 <20260121112721.2981491-3-wwfu06@163.com>
 <033aebad-b148-4cb9-9259-8f6e65dfc39d@oss.qualcomm.com>
 <a1e3fe8.91f5.19c04eca0a8.Coremail.wwfu06@163.com>
 <a13003ea-27be-43ea-b739-8d5d6ba69d0d@oss.qualcomm.com>
X-NTES-SC: AL_Qu2cAv6TuUwp4iebZekfnU8Th+c2Wsa4vfku1YdUc94Foxnd5g8vZVpKO0DM3MaJOzyqjjiWSB1n++dKRaplZ+1oYpcxru3Y2fGJdSPPPw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <c44865c.82d3.19c2d4b22ab.Coremail.wwfu06@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jCgvCgDXb4RZbYRpzaZlAA--.45161W
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC2xnsx2mEbVlQWgAA36
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_PRIO_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91896-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	DBL_PROHIBIT(0.00)[0.0.0.43:email,0.0.0.28:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wwfu06@163.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.10:email,0.0.0.47:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A931F13B6
X-Rspamd-Action: no action

CgoKCkhlcmUgaXMgdGhlIGNvbXBsZXRlIGNvbnRlbnQgb2YgdGhlIGVtYWlsOiBNeSBjdXJyZW50
IGNhcGFiaWxpdHkgb25seSBhbGxvd3MgbWUgdG8gYWNoaWV2ZSB0aGlzIG11Y2guIEkgaGF2ZSB0
byB0ZW1wb3JhcmlseSBnaXZlIHVwIG9uIHB1c2hpbmcgZm9yIHN1cHBvcnQgZm9yIHRoaXMgbW9k
ZWwgYW5kIGhvcGUgdGhhdCBvdGhlciBwcm9mZXNzaW9uYWxzIGNhbiBjb250aW51ZSB0aGlzIHdv
cmsuIEFkZGl0aW9uYWxseSwgdGhlIGltYWdlIGluIHlvdXIgcmVwbHkgaXMgb2YgdGhlIHNmMTQt
MTEsIHdoZXJlYXMgdGhlIG1vZGVsIEkgcmVxdWVzdGVkIHN1cHBvcnQgZm9yIGlzIHRoZSBzZmEx
NC0xMS5odHRwczovL2d3Y2FjaGUuYWNlci5jb20uY24vdXBsb2Fkcy9zZXJ2ZXIvNmU4ZjA2ZDFk
ODg4NGRkNTEzNmQ4MmI5MWZkZjI4NGQuanBnwqDCoMKgVGhlIGRpZmZlcmVuY2VzIGJldHdlZW4g
dGhlc2UgdHdvIG1vZGVscyBhcmUgc2lnbmlmaWNhbnQ6IHRoZSBkaXNwbGF5LCBDUFUsIFVTQiwg
YW5kIG90aGVyIHBlcmlwaGVyYWxzIGFyZSBhbGwgZGlmZmVyZW50LiBDdXJyZW50bHksIGl0IGFw
cGVhcnMgdGhhdCB0aGUgc2ZhMTQtMTEgaXMgb25seSBzb2xkIGluIG1haW5sYW5kIENoaW5hLiAK
QmVzdCByZWdhcmRzLAp3ZWlmdSB3dQoKCgoKCgoKCgoKCkF0IDIwMjYtMDItMDMgMTk6MDI6NDQs
ICJLb25yYWQgRHliY2lvIiA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToK
Pk9uIDEvMjgvMjYgMzowNSBQTSwgd3dmIHdyb3RlOgo+PiAKPj4gCj4+IAo+PiAKPj4gCj4+IAo+
PiAKPj4gQXQgMjAyNi0wMS0yOCAyMDoyNToyMiwgIktvbnJhZCBEeWJjaW8iIDxrb25yYWQuZHli
Y2lvQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pj4gT24gMS8yMS8yNiAxMjoyNyBQTSwgd2Vp
ZnUgd3Ugd3JvdGU6Cj4+Pj4gQWRkIGluaXRpYWwgZGV2aWNlIHRyZWUgZm9yIEFjZXIgU3dpZnQg
U0ZBMTQtMTEgbGFwdG9wIGJhc2VkIG9uIFF1YWxjb21tIFgxRTc4MTAwIFNvQy4KPj4+Pgo+Pj4+
IEdlbmVyYXRlZCBiYXNlZCBvbiB4MWU3ODEwMC1sZW5vdm8tdGhpbmtwYWQtdDE0cy5kdHMuCj4+
Pj4KPj4+PiBBZGp1c3RlZCBub2RlIG9yZGVyaW5nIGFjY29yZGluZyB0byByZXZpZXcgZmVlZGJh
Y2suCj4+Pj4KPj4+PiBQYXNzZWQgZm9ybWF0IGNoZWNrcyBhbmQgc3VjY2Vzc2Z1bGx5IGJ1aWx0
IHdpdGhvdXQgZXJyb3JzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogd2VpZnUgd3UgPHd3ZnUw
NkAxNjMuY29tPgo+Pj4+IC0tLQo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+ICsjaW5jbHVkZSAiaGFt
b2EuZHRzaSIKPj4+PiArI2luY2x1ZGUgImhhbW9hLXBtaWNzLmR0c2kiCj4+Pj4gKwo+Pj4+ICsv
IHsKPj4+PiArCW1vZGVsID0gIkFjZXIgU3dpZnQgMTQgR28gUHJvIEFJIChTRkExNC0xMSkiOwo+
Pj4+ICsJY29tcGF0aWJsZSA9ICJhY2VyLHN3aWZ0LXNmYTE0LTExIiwgImxlbm92byx0aGlua3Bh
ZC10MTRzIiwgInFjb20seDFlNzgxMDAiLCAicWNvbSx4MWU4MDEwMCI7Cj4+Pgo+Pj4gVGhlIGxl
bm92byBwYXJ0IG5lZWRzIHRvIGdvCj4+IFLvvJoKPj4gSSBoYXZlIHJldmlld2VkIHRoZSBEVFMg
ZmlsZXMgZm9yIHR3byBvdGhlciBBY2VyIG1vZGVscyBpbiB0aGUgc2FtZSBzZXJpZXMgc3VibWl0
dGVkIGJ5IG90aGVyIGNvbnRyaWJ1dG9ycywgYW5kIHRoZXkgYWxsIGRpcmVjdGx5IHV0aWxpemUg
Y2VydGFpbiBkcml2ZXJzIGZvciB0aGUgVDE0cy4KPj4gwqBEdWUgdG8gdGhlIGxhY2sgb2Ygb2Zm
aWNpYWwgc3VwcG9ydCBmcm9tIEFjZXIsIHJlbW92aW5nIHRoZSAibGVub3ZvLHRoaW5rcGFkLXQx
NHMiIG5vZGUgd2lsbCBsaWtlbHkgY2F1c2Ugc29tZSBoYXJkd2FyZSBjb21wb25lbnRzIHRvIG1h
bGZ1bmN0aW9uLgo+Cj5UaGlzIGlzIHBsYWlubHkgdW50cnVlLiBUaGUgVDE0cyBpcyBub3Qgc3Bl
Y2lhbCBpbiBhbnkgcmVnYXJkLCBhbmQgdGhlcmUKPmRvZXNuJ3QgZXhpc3QgYW55IHNvcnQgb2Yg
IiJUMTRzIGRyaXZlcnMiIiBmb3IgdGhlIFgxIFNvQy4KPgo+SWYgeW91IGNhbWUgdXAgd2l0aCB0
aGlzIHJlYXNvbmluZywgZ3JlcCBmb3IgdGhlIFQxNHMgY29tcGF0aWJsZSBzdHJpbmcKPmluIHRo
ZSBrZXJuZWwgYW5kIGNvbnZpbmNlIHlvdXJzZWxmIHRoYXQncyBub3QgdGhlIGNhc2UuCj4KPklm
IGFuIExMTSBzdWdnZXN0ZWQgdGhpcywgaXQncyBoYWxsdWNpbmF0aW5nLCB2ZXJ5IGJhZGx5Lgo+
Cj4+Pgo+Pj4gWy4uLl0KPj4+Cj4+Pgo+Pj4+ICsJLyogdHdvIG11eGVzIHRvZ2V0aGVyIHN1cHBv
cnQgQ1RJQSBhbmQgT01UUCBzd2l0Y2hpbmcgKi8KPj4+PiArCXVzX2V1cm9fbXV4X2N0cmw6IG11
eC1jb250cm9sbGVyIHsKPj4+PiArCQljb21wYXRpYmxlID0gImdwaW8tbXV4IjsKPj4+PiArCQlw
aW5jdHJsLTAgPSA8JnVzX2V1cm9faHNfc2VsPjsKPj4+PiArCQlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOwo+Pj4+ICsJCW11eC1zdXBwbHkgPSA8JnZyZWdfbDE2Yl8ycDU+Owo+Pj4+ICsJCSNt
dXgtY29udHJvbC1jZWxscyA9IDwwPjsKPj4+PiArCQltdXgtZ3Bpb3MgPSA8JnRsbW0gNjggR1BJ
T19BQ1RJVkVfSElHSD47Cj4+Pj4gKwl9Owo+Pj4KPj4+IEFyZSB5b3Ugc3VyZSB0aGlzIGlzIHBy
ZXNlbnQgb24gdGhlIEFjZXIgYXMgd2VsbD8KPj4gUu+8mlVudGVzdGVkIQo+Cj5XaHkgd291bGQg
eW91IGluY2x1ZGUgaXQgdGhlbj8KPgo+Wy4uLl0KPgo+Pj4+ICsJLyogRUxBTjA2RjEgb3IgU1lO
QTA2RjIgKi8KPj4+Cj4+PiBUaGVzZSBsb29rIGRpcmVjdGx5IGNvcHlwYXN0ZWQgZnJvbSB0aGUg
TGVub3ZvIERULCBzbyBJIGhhdmUgY29uY2VybnMKPj4+IGFib3V0IHRoZWlyIHZhbGlkaXR5Cj4+
Pgo+PiBSOkl0IGlzIG1vc3RseSB0aGUgTGVub3ZvIERUIHdpdGggb25seSB2ZXJ5IG1pbm9yIG1v
ZGlmaWNhdGlvbnMuCj4KPkFnYWluLCB0aGF0J3Mgbm90IHRoZSB3YXkgdG8gZ28KPgo+Wy4uLl0K
Pgo+Pj4gWy4uLl0KPj4+Cj4+Pj4gKyZpMmM1IHsKPj4+PiArCWNsb2NrLWZyZXF1ZW5jeSA9IDw0
MDAwMDA+Owo+Pj4+ICsKPj4+PiArCXN0YXR1cyA9ICJva2F5IjsKPj4+PiArCj4+Pj4gKwlldXNi
NV9yZXBlYXRlcjogcmVkcml2ZXJANDMgewo+Pj4+ICsJCWNvbXBhdGlibGUgPSAibnhwLHB0bjMy
MjIiOwo+Pj4+ICsJCXJlZyA9IDwweDQzPjsKPj4+PiArCQkjcGh5LWNlbGxzID0gPDA+Owo+Pj4+
ICsKPj4+PiArCQl2ZGQzdjMtc3VwcGx5ID0gPCZ2cmVnX2wxM2JfM3AwPjsKPj4+PiArCQl2ZGQx
djgtc3VwcGx5ID0gPCZ2cmVnX2w0Yl8xcDg+Owo+Pj4+ICsKPj4+PiArCQlyZXNldC1ncGlvcyA9
IDwmdGxtbSA3IEdQSU9fQUNUSVZFX0xPVz47Cj4+Pj4gKwo+Pj4+ICsJCXBpbmN0cmwtMCA9IDwm
ZXVzYjVfcmVzZXRfbj47Cj4+Pj4gKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4+PiAr
CX07Cj4+Pj4gKwo+Pj4+ICsJZXVzYjNfcmVwZWF0ZXI6IHJlZHJpdmVyQDQ3IHsKPj4+PiArCQlj
b21wYXRpYmxlID0gIm54cCxwdG4zMjIyIjsKPj4+PiArCQlyZWcgPSA8MHg0Nz47Cj4+Pj4gKwkJ
I3BoeS1jZWxscyA9IDwwPjsKPj4+PiArCj4+Pj4gKwkJdmRkM3YzLXN1cHBseSA9IDwmdnJlZ19s
MTNiXzNwMD47Cj4+Pj4gKwkJdmRkMXY4LXN1cHBseSA9IDwmdnJlZ19sNGJfMXA4PjsKPj4+PiAr
Cj4+Pj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JnRsbW0gNiBHUElPX0FDVElWRV9MT1c+Owo+Pj4+ICsK
Pj4+PiArCQlwaW5jdHJsLTAgPSA8JmV1c2IzX3Jlc2V0X24+Owo+Pj4+ICsJCXBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7Cj4+Pj4gKwl9Owo+Pj4+ICsKPj4+PiArCWV1c2I2X3JlcGVhdGVyOiBy
ZWRyaXZlckA0ZiB7Cj4+Pj4gKwkJY29tcGF0aWJsZSA9ICJueHAscHRuMzIyMiI7Cj4+Pj4gKwkJ
cmVnID0gPDB4NGY+Owo+Pj4+ICsJCSNwaHktY2VsbHMgPSA8MD47Cj4+Pj4gKwo+Pj4+ICsJCXZk
ZDN2My1zdXBwbHkgPSA8JnZyZWdfbDEzYl8zcDA+Owo+Pj4+ICsJCXZkZDF2OC1zdXBwbHkgPSA8
JnZyZWdfbDRiXzFwOD47Cj4+Pj4gKwo+Pj4+ICsJCXJlc2V0LWdwaW9zID0gPCZ0bG1tIDE4NCBH
UElPX0FDVElWRV9MT1c+Owo+Pj4+ICsKPj4+PiArCQlwaW5jdHJsLTAgPSA8JmV1c2I2X3Jlc2V0
X24+Owo+Pj4+ICsJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+Pj4gKwl9Owo+Pj4KPj4+
IFRoaXMgbGFwdG9wIHNlZW1zIHRvIGhhdmUgMiBVU0ItQSBwb3J0cyBhbmQgbm8gZmluZ2VycHJp
bnQvU0RDYXJkIHJlYWRlciwKPj4+IGFyZSB5b3Ugc3VyZSBhbGwgb2YgdGhlc2UgYXJlIHByZXNl
bnQgb25ib2FyZD8KPj4+Cj4+IFLvvJoKPj4gVGhpcyBsYXB0b3AgZmVhdHVyZXMgMiBVU0ItQSBw
b3J0cywgMSBVU0ItQyBwb3J0IGFuZCBhIGZpbmdlcnByaW50IHJlYWRlciwgd2l0aCBubyBTRCBj
YXJkIHJlYWRlci4KPgo+VGhlbiB1bmxlc3MgdGhlcmUncyBzb21ldGhpbmcgZWxzZSBkYW5nbGlu
ZyBvZmYgdGhlIFVTQiBidXMsIG5vdCBhbGwgb2YKPnRoZXNlIHJlZHJpdmVycyBhcmUgcGh5c2lj
YWxseSBwcmVzZW50Lgo+Cj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICsmaTJjNiB7Cj4+Pj4gKwljbG9j
ay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsKPj4+PiArCj4+Pj4gKwlzdGF0dXMgPSAib2theSI7Cj4+
Pj4gKwo+Pj4+ICsJZW1iZWRkZWQtY29udHJvbGxlckAyOCB7Cj4+Pj4gKwkJY29tcGF0aWJsZSA9
ICJsZW5vdm8sdGhpbmtwYWQtdDE0cy1lYyI7Cj4+Pgo+Pj4gSSBoaWdobHkgZG91YnQgdGhpcyBp
cyB0aGUgY2FzZQo+Pj4KPj4gUu+8mgo+PiBJdCBoYXMgYXQgbGVhc3QgYmVlbiB0ZXN0ZWQgb24g
dGhlIHBoeXNpY2FsIGRldmljZS4gRHVlIHRvIG15IGxhY2sgb2YgcHJvZmVzc2lvbmFsIGV4cGVy
dGlzZSwgbWFraW5nIGV4Y2Vzc2l2ZSBtb2RpZmljYXRpb25zIHJhc2hseSB3b3VsZCBiZSBtb3Jl
IGxpa2VseSB0byBjYXVzZSBoYXJkd2FyZSBkYW1hZ2UuIFRvIGJlIGNsZWFyLCB3aGVuIGJvb3Rp
bmcgdGhlIHNmYTE0LTExIHdpdGggdGhlIFQxNHMgRFRCIHVuZGVyIExpbnV4LCB0aGUgcG93ZXIg
Y29uc3VtcHRpb24gYW5kIGhlYXQgZ2VuZXJhdGlvbiBhcmUgYm90aCBtb3JlIHNldmVyZSBjb21w
YXJlZCB0byBXT0EuIEhvd2V2ZXIsIGJhc2VkIG9uIHdoYXQgSeKAmXZlIGxlYXJuZWQgZnJvbSB0
aGUgVWJ1bnR1IGNvbW11bml0eSwgdGhpcyBpcyBsaWtlbHkgYW4gaXNzdWUgd2l0aCB0aGUgUXVh
bGNvbW0gcG93ZXIgbWFuYWdlbWVudCBkcml2ZXIgaXRzZWxmLgo+Cj5JIHVuZGVyc3RhbmQgeW91
ciBwb3NpdGlvbiwgaG93ZXZlciBkdWUgdG8geW91IGFkbWl0dGluZyB5b3UncmUganVzdAo+Y29w
eXBhc3RpbmcgdGhpbmdzIGFuZCBob3BpbmcgdGhleSB3b3JrLCB3ZSBjYW4gbm90IGFjY2VwdCB0
aGlzIHN1Ym1pc3Npb24KPmluIGl0cyBjdXJyZW50IHN0YXRlLCBhcyB0aGVyZSBhcmUgcGFydHMg
b2YgaXQgdGhhdCBhcmUgY2xlYXJseSBpbmNvcnJlY3QKPgo+Pj4gWy4uLl0KPj4+Cj4+Pj4gKyZp
MmM4IHsKPj4+PiArCWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+Owo+Pj4+ICsKPj4+PiArCXN0
YXR1cyA9ICJva2F5IjsKPj4+PiArCj4+Pj4gKwkvKiBJTElUMjkxMSBvciBHVENIMTU2MyAqLwo+
Pj4+ICsJdG91Y2hzY3JlZW5AMTAgewo+Pj4+ICsJCWNvbXBhdGlibGUgPSAiaGlkLW92ZXItaTJj
IjsKPj4+PiArCQlyZWcgPSA8MHgxMD47Cj4+Pj4gKwo+Pj4+ICsJCWhpZC1kZXNjci1hZGRyID0g
PDB4MT47Cj4+Pj4gKwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmdGxtbSA1MSBJUlFfVFlQRV9M
RVZFTF9MT1c+Owo+Pj4+ICsKPj4+PiArCQl2ZGQtc3VwcGx5ID0gPCZ2cmVnX21pc2NfM3AzPjsK
Pj4+PiArCQl2ZGRsLXN1cHBseSA9IDwmdnJlZ19sMTViXzFwOD47Cj4+Pj4gKwo+Pj4+ICsJCXBp
bmN0cmwtMCA9IDwmdHMwX2RlZmF1bHQ+Owo+Pj4+ICsJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7Cj4+Pj4gKwl9Owo+Pj4+ICsKPj4+PiArCS8qIFRPRE86IHNlY29uZC1zb3VyY2VkIHRvdWNo
c2NyZWVuIEAgMHg0MSAqLwo+Pj4KPj4+IFRoaXMgYWdhaW4gbG9va3MgZGlyZWN0bHkgY29weXBh
c3RlZAo+Pj4KPj4gUjogCj4+IEluZGVlZCEKPj4+IFsuLi5dCj4+Pgo+Pj4+ICsmdXNiXzFfc3My
X3FtcHBoeSB7Cj4+Pj4gKwl2ZGRhLXBoeS1zdXBwbHkgPSA8JnZyZWdfbDJqXzFwMj47Cj4+Pj4g
Kwl2ZGRhLXBsbC1zdXBwbHkgPSA8JnZyZWdfbDJkXzBwOT47Cj4+Pj4gKwo+Pj4+ICsJL2RlbGV0
ZS1wcm9wZXJ0eS8gbW9kZS1zd2l0Y2g7Cj4+Pj4gKwkvZGVsZXRlLXByb3BlcnR5LyBvcmllbnRh
dGlvbi1zd2l0Y2g7Cj4+Pj4gKwo+Pj4+ICsJc3RhdHVzID0gIm9rYXkiOwo+Pj4+ICsKPj4+PiAr
CXBvcnRzIHsKPj4+PiArCQlwb3J0QDAgewo+Pj4+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
Pj4+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4+Pj4gKwo+Pj4+ICsJCQkvZGVsZXRlLW5vZGUv
IGVuZHBvaW50Owo+Pj4+ICsKPj4+PiArCQkJdXNiXzFfc3MyX3FtcHBoeV9vdXRfZHA6IGVuZHBv
aW50QDAgewo+Pj4+ICsJCQkJcmVnID0gPDA+Owo+Pj4+ICsKPj4+PiArCQkJCWRhdGEtbGFuZXMg
PSA8MyAyIDEgMD47Cj4+Pj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfYnJpZGdlX2Rw
X2luPjsKPj4+Cj4+PiBJIGRvbid0IHNlZSBhIEhETUkgcG9ydCBvbiB0aGlzIGxhcHRvcAo+Pj4K
Pj4gUjogVGhpcyBsYXB0b3AgZG9lcyBoYXZlIGFuIEhETUkgcG9ydC4KPgo+SSBkb24ndCB0aGlu
ayB0aGF0J3MgdGhlIGNhc2UsIHNlZSB0aGlzIGltYWdlIGZyb20gQWNlci4gVW5sZXNzIHRoZQo+
U0tVIHRoYXQgdGhleSBzZWxsIGluIEV1cm9wZSBpcyBkaWZmZXJlbnQsIHdpdGggdGhlIHNhbWUg
bW9kZWwgbnVtYmVyLi4KPgo+aHR0cHM6Ly9zdGF0aWMyLWVjZW1lYS5hY2VyLmNvbS9tZWRpYS9j
YXRhbG9nL3Byb2R1Y3QvXy9hL19hY2VyLXN3aWZ0LTE0LWFpLXNmMTQtMTEtd2l0aC1mcC13aXRo
LWJsLW9uLXdwLWNvcGlsb3QtZ3JheV8xMV9ueC5renhlcC4wMDIucG5nP3F1YWxpdHk9ODAmYmct
Y29sb3I9MjU1LDI1NSwyNTUmZml0PWJvdW5kcyZoZWlnaHQ9NTAwJndpZHRoPTUwMCZjYW52YXM9
NTAwOjUwMCZmb3JtYXQ9anBlZwo+Cj4KPj4+IE1vcmVvdmVyLCBJJ20gaGlnaGx5IGNvbmNlcm5l
ZCBhYm91dCB0aGUgcmVndWxhdG9yIHNldHRpbmdzLCB3aGljaAo+Pj4gZGlmZmVyIGJldHdlZW4g
Ym9hcmRzIGFuZCBtYXkgbGVhZCB0byBwZXJtYW5lbnQgaGFyZHdhcmUgZGFtYWdlIGlmCj4+PiBt
aXNjb25maWd1cmVkLiBJZiB5b3UgdG9vayB0aGUgdmFsdWVzIGZyb20gdGhlIFQxNHMgRFQgYXMt
aXMsIHlvdQo+Pj4gbWF5IGJlIGRvaW5nIHlvdXJzZWxmIGEgYmFkIGZhdm9yLi4KPj4+Cj4+IFI6
IFRoYW5rIHlvdSBmb3IgeW91ciBjYXJlZnVsIHJldmlldy4gSSBiZWxpZXZlIHRoYXQgY3VycmVu
dGx5LCB3aXRoIHRoZSBleGNlcHRpb24gb2YgYSBmZXcgc3BlY2lmaWMgbGFwdG9wIG1vZGVscyAo
ZS5nLiwgdGhlIFRoaW5rUGFkIFQxNHMpLCBhbGwgb3RoZXIgbGFwdG9wcyB1dGlsaXppbmcgdGhl
IFgxIEVsaXRlL1BsdXMgU29DIGV4cGVyaWVuY2UgbW9yZSBvciBsZXNzIGlzc3VlcyB3aGVuIHJ1
bm5pbmcgTGludXggb24gQVJN4oCUYW5kIHRoZSBTRkExNC0xMSBpcyBubyBleGNlcHRpb24uIFRo
YXQgc2FpZCwgSSBob3BlIHRvIHJhaXNlIGl0cyB2aXNpYmlsaXR5IGFuZCBpbXByb3ZlIGl0IHRo
cm91Z2ggbXkgZWZmb3J0cy4KPgo+WW91ciByZXBseSBkb2Vzbid0IGF0IGFsbCBhZGRyZXNzIG15
IHNlcmlvdXMgY29uY2VybiBzdGF0ZWQgYWJvdmUuCj4KPktvbnJhZAo=

