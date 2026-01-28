Return-Path: <linux-arm-msm+bounces-91038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKY3BNUXemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:06:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B59A27A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F181E3004636
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2657223C4FD;
	Wed, 28 Jan 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RyE3btwH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D2221F06;
	Wed, 28 Jan 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609170; cv=none; b=lJQNXX4qF3sqsx3O6LX3oNWIwwTplGqsrhHq4r8fGTnyZMikuezkm4eokSVs1NArPT5HjgWDoyJ2C/6tOMAZxv/T7EA4lFW7SQxwkRIynLMDo6MKXvTQpda6d3GKFOpXoKQZYc47E4AhCEJPY5eMl6Q4cTvnZUC/IPkToTSvgSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609170; c=relaxed/simple;
	bh=SvNcbqUH1Fgk/BrgY4iyQrexDVAjNohFRb5IbXK20I0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ex9TMUTtkHP+XM7QKW2aiyHO5guh3wh5xEVmfwZVsfgoEt8TipFOwke0AHFz6II3lkTQH9SEHL+pBv3yZ4c3e9zBT59qFCpYA3MwYI0+zXAd6IB+pcyiV3ipMO5FZLWgwPhZQso1ZubKRTUAg0r2+cPFcKi/KFSodjBemOiYoKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RyE3btwH; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=SvNcbqUH1Fgk/BrgY4iyQrexDVAjNohFRb5IbXK20I0=; b=R
	yE3btwHtfLWn3+FAJAKQco17vJ2bDR1tCPhwmsbU9ygkM+6aA7kqLo5PK71tIIV9
	upi0VpSny0O6jyqKpqD2Se0yYyuJG6dGI3TvOlq1NwupBGKul52vLTE4t/oti+XC
	ZlX/FnkzD9qa+NXZ08HeHKf79nYJijPERPrJezro2I=
Received: from wwfu06$163.com ( [221.13.0.204] ) by
 ajax-webmail-wmsvr-40-126 (Coremail) ; Wed, 28 Jan 2026 22:05:42 +0800
 (CST)
Date: Wed, 28 Jan 2026 22:05:42 +0800 (CST)
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
In-Reply-To: <033aebad-b148-4cb9-9259-8f6e65dfc39d@oss.qualcomm.com>
References: <20260121112721.2981491-1-wwfu06@163.com>
 <20260121112721.2981491-3-wwfu06@163.com>
 <033aebad-b148-4cb9-9259-8f6e65dfc39d@oss.qualcomm.com>
X-NTES-SC: AL_Qu2dC/qbtkkv5CSaZukfnU8Th+c2Wsa4vfku1YdUc8wEmj/M1S0NRl9iEVr33PCOMCKyqD6oayBNwcB2R7db7uKE9N9GbKSwP720se2trA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <a1e3fe8.91f5.19c04eca0a8.Coremail.wwfu06@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:figvCgDnH6C3F3pp9AZhAA--.2622W
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC9xfrxml6F7fAoAAA3e
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_PRIO_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91038-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	DBL_PROHIBIT(0.00)[0.0.0.47:email,0.0.0.28:email,0.0.0.10:email,0.0.0.15:email,0.0.0.43:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wwfu06@163.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,4f:email]
X-Rspamd-Queue-Id: 97B59A27A7
X-Rspamd-Action: no action

CgoKCgoKCkF0IDIwMjYtMDEtMjggMjA6MjU6MjIsICJLb25yYWQgRHliY2lvIiA8a29ucmFkLmR5
YmNpb0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPk9uIDEvMjEvMjYgMTI6MjcgUE0sIHdlaWZ1
IHd1IHdyb3RlOgo+PiBBZGQgaW5pdGlhbCBkZXZpY2UgdHJlZSBmb3IgQWNlciBTd2lmdCBTRkEx
NC0xMSBsYXB0b3AgYmFzZWQgb24gUXVhbGNvbW0gWDFFNzgxMDAgU29DLgo+PiAKPj4gR2VuZXJh
dGVkIGJhc2VkIG9uIHgxZTc4MTAwLWxlbm92by10aGlua3BhZC10MTRzLmR0cy4KPj4gCj4+IEFk
anVzdGVkIG5vZGUgb3JkZXJpbmcgYWNjb3JkaW5nIHRvIHJldmlldyBmZWVkYmFjay4KPj4gCj4+
IFBhc3NlZCBmb3JtYXQgY2hlY2tzIGFuZCBzdWNjZXNzZnVsbHkgYnVpbHQgd2l0aG91dCBlcnJv
cnMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiB3ZWlmdSB3dSA8d3dmdTA2QDE2My5jb20+Cj4+IC0t
LQo+Cj5bLi4uXQo+Cj4+ICsjaW5jbHVkZSAiaGFtb2EuZHRzaSIKPj4gKyNpbmNsdWRlICJoYW1v
YS1wbWljcy5kdHNpIgo+PiArCj4+ICsvIHsKPj4gKwltb2RlbCA9ICJBY2VyIFN3aWZ0IDE0IEdv
IFBybyBBSSAoU0ZBMTQtMTEpIjsKPj4gKwljb21wYXRpYmxlID0gImFjZXIsc3dpZnQtc2ZhMTQt
MTEiLCAibGVub3ZvLHRoaW5rcGFkLXQxNHMiLCAicWNvbSx4MWU3ODEwMCIsICJxY29tLHgxZTgw
MTAwIjsKPgo+VGhlIGxlbm92byBwYXJ0IG5lZWRzIHRvIGdvClLvvJoKSSBoYXZlIHJldmlld2Vk
IHRoZSBEVFMgZmlsZXMgZm9yIHR3byBvdGhlciBBY2VyIG1vZGVscyBpbiB0aGUgc2FtZSBzZXJp
ZXMgc3VibWl0dGVkIGJ5IG90aGVyIGNvbnRyaWJ1dG9ycywgYW5kIHRoZXkgYWxsIGRpcmVjdGx5
IHV0aWxpemUgY2VydGFpbiBkcml2ZXJzIGZvciB0aGUgVDE0cy4KwqBEdWUgdG8gdGhlIGxhY2sg
b2Ygb2ZmaWNpYWwgc3VwcG9ydCBmcm9tIEFjZXIsIHJlbW92aW5nIHRoZSAibGVub3ZvLHRoaW5r
cGFkLXQxNHMiIG5vZGUgd2lsbCBsaWtlbHkgY2F1c2Ugc29tZSBoYXJkd2FyZSBjb21wb25lbnRz
IHRvIG1hbGZ1bmN0aW9uLgo+Cj5bLi4uXQo+Cj4KPj4gKwkvKiB0d28gbXV4ZXMgdG9nZXRoZXIg
c3VwcG9ydCBDVElBIGFuZCBPTVRQIHN3aXRjaGluZyAqLwo+PiArCXVzX2V1cm9fbXV4X2N0cmw6
IG11eC1jb250cm9sbGVyIHsKPj4gKwkJY29tcGF0aWJsZSA9ICJncGlvLW11eCI7Cj4+ICsJCXBp
bmN0cmwtMCA9IDwmdXNfZXVyb19oc19zZWw+Owo+PiArCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOwo+PiArCQltdXgtc3VwcGx5ID0gPCZ2cmVnX2wxNmJfMnA1PjsKPj4gKwkJI211eC1jb250
cm9sLWNlbGxzID0gPDA+Owo+PiArCQltdXgtZ3Bpb3MgPSA8JnRsbW0gNjggR1BJT19BQ1RJVkVf
SElHSD47Cj4+ICsJfTsKPgo+QXJlIHlvdSBzdXJlIHRoaXMgaXMgcHJlc2VudCBvbiB0aGUgQWNl
ciBhcyB3ZWxsPwpS77yaVW50ZXN0ZWQhCj4KPlsuLi5dCj4KPj4gKyZpMmMwIHsKPj4gKwljbG9j
ay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsKPj4gKwo+PiArCXBpbmN0cmwtMCA9IDwmcXVwX2kyYzBf
ZGF0YV9jbGs+LCA8JnRwYWRfZGVmYXVsdD47Cj4+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKPj4gKwo+PiArCXN0YXR1cyA9ICJva2F5IjsKPj4gKwo+PiArCS8qIEVMQU4wNkUyIG9yIEVM
QU4wNkUzICovCj4+ICsJdG91Y2hwYWRAMTUgewo+PiArCQljb21wYXRpYmxlID0gImhpZC1vdmVy
LWkyYyI7Cj4+ICsJCXJlZyA9IDwweDE1PjsKPj4gKwo+PiArCQloaWQtZGVzY3ItYWRkciA9IDww
eDE+Owo+PiArCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZ0bG1tIDMgSVJRX1RZUEVfTEVWRUxf
TE9XPjsKPj4gKwo+PiArCQl2ZGQtc3VwcGx5ID0gPCZ2cmVnX21pc2NfM3AzPjsKPj4gKwkJdmRk
bC1zdXBwbHkgPSA8JnZyZWdfbDEyYl8xcDI+Owo+PiArCj4+ICsJCXdha2V1cC1zb3VyY2U7Cj4+
ICsJfTsKPj4gKwo+PiArCS8qIFNZTkE4MDIyIG9yIFNZTkE4MDI0ICovCj4+ICsJdG91Y2hwYWRA
MmMgewo+PiArCQljb21wYXRpYmxlID0gImhpZC1vdmVyLWkyYyI7Cj4+ICsJCXJlZyA9IDwweDJj
PjsKPj4gKwo+PiArCQloaWQtZGVzY3ItYWRkciA9IDwweDIwPjsKPj4gKwkJaW50ZXJydXB0cy1l
eHRlbmRlZCA9IDwmdGxtbSAzIElSUV9UWVBFX0xFVkVMX0xPVz47Cj4+ICsKPj4gKwkJdmRkLXN1
cHBseSA9IDwmdnJlZ19taXNjXzNwMz47Cj4+ICsJCXZkZGwtc3VwcGx5ID0gPCZ2cmVnX2wxMmJf
MXAyPjsKPj4gKwo+PiArCQl3YWtldXAtc291cmNlOwo+PiArCX07Cj4+ICsKPj4gKwkvKiBFTEFO
MDZGMSBvciBTWU5BMDZGMiAqLwo+Cj5UaGVzZSBsb29rIGRpcmVjdGx5IGNvcHlwYXN0ZWQgZnJv
bSB0aGUgTGVub3ZvIERULCBzbyBJIGhhdmUgY29uY2VybnMKPmFib3V0IHRoZWlyIHZhbGlkaXR5
Cj4KUjpJdCBpcyBtb3N0bHkgdGhlIExlbm92byBEVCB3aXRoIG9ubHkgdmVyeSBtaW5vciBtb2Rp
ZmljYXRpb25zLgo+Wy4uLl0KPgo+PiArJmkyYzUgewo+PiArCWNsb2NrLWZyZXF1ZW5jeSA9IDw0
MDAwMDA+Owo+PiArCj4+ICsJc3RhdHVzID0gIm9rYXkiOwo+PiArCj4+ICsJZXVzYjVfcmVwZWF0
ZXI6IHJlZHJpdmVyQDQzIHsKPj4gKwkJY29tcGF0aWJsZSA9ICJueHAscHRuMzIyMiI7Cj4+ICsJ
CXJlZyA9IDwweDQzPjsKPj4gKwkJI3BoeS1jZWxscyA9IDwwPjsKPj4gKwo+PiArCQl2ZGQzdjMt
c3VwcGx5ID0gPCZ2cmVnX2wxM2JfM3AwPjsKPj4gKwkJdmRkMXY4LXN1cHBseSA9IDwmdnJlZ19s
NGJfMXA4PjsKPj4gKwo+PiArCQlyZXNldC1ncGlvcyA9IDwmdGxtbSA3IEdQSU9fQUNUSVZFX0xP
Vz47Cj4+ICsKPj4gKwkJcGluY3RybC0wID0gPCZldXNiNV9yZXNldF9uPjsKPj4gKwkJcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gKwl9Owo+PiArCj4+ICsJZXVzYjNfcmVwZWF0ZXI6IHJl
ZHJpdmVyQDQ3IHsKPj4gKwkJY29tcGF0aWJsZSA9ICJueHAscHRuMzIyMiI7Cj4+ICsJCXJlZyA9
IDwweDQ3PjsKPj4gKwkJI3BoeS1jZWxscyA9IDwwPjsKPj4gKwo+PiArCQl2ZGQzdjMtc3VwcGx5
ID0gPCZ2cmVnX2wxM2JfM3AwPjsKPj4gKwkJdmRkMXY4LXN1cHBseSA9IDwmdnJlZ19sNGJfMXA4
PjsKPj4gKwo+PiArCQlyZXNldC1ncGlvcyA9IDwmdGxtbSA2IEdQSU9fQUNUSVZFX0xPVz47Cj4+
ICsKPj4gKwkJcGluY3RybC0wID0gPCZldXNiM19yZXNldF9uPjsKPj4gKwkJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsKPj4gKwl9Owo+PiArCj4+ICsJZXVzYjZfcmVwZWF0ZXI6IHJlZHJpdmVy
QDRmIHsKPj4gKwkJY29tcGF0aWJsZSA9ICJueHAscHRuMzIyMiI7Cj4+ICsJCXJlZyA9IDwweDRm
PjsKPj4gKwkJI3BoeS1jZWxscyA9IDwwPjsKPj4gKwo+PiArCQl2ZGQzdjMtc3VwcGx5ID0gPCZ2
cmVnX2wxM2JfM3AwPjsKPj4gKwkJdmRkMXY4LXN1cHBseSA9IDwmdnJlZ19sNGJfMXA4PjsKPj4g
Kwo+PiArCQlyZXNldC1ncGlvcyA9IDwmdGxtbSAxODQgR1BJT19BQ1RJVkVfTE9XPjsKPj4gKwo+
PiArCQlwaW5jdHJsLTAgPSA8JmV1c2I2X3Jlc2V0X24+Owo+PiArCQlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+PiArCX07Cj4KPlRoaXMgbGFwdG9wIHNlZW1zIHRvIGhhdmUgMiBVU0ItQSBw
b3J0cyBhbmQgbm8gZmluZ2VycHJpbnQvU0RDYXJkIHJlYWRlciwKPmFyZSB5b3Ugc3VyZSBhbGwg
b2YgdGhlc2UgYXJlIHByZXNlbnQgb25ib2FyZD8KPgpS77yaClRoaXMgbGFwdG9wIGZlYXR1cmVz
IDIgVVNCLUEgcG9ydHMsIDEgVVNCLUMgcG9ydCBhbmQgYSBmaW5nZXJwcmludCByZWFkZXIsIHdp
dGggbm8gU0QgY2FyZCByZWFkZXIuCj4+ICt9Owo+PiArCj4+ICsmaTJjNiB7Cj4+ICsJY2xvY2st
ZnJlcXVlbmN5ID0gPDQwMDAwMD47Cj4+ICsKPj4gKwlzdGF0dXMgPSAib2theSI7Cj4+ICsKPj4g
KwllbWJlZGRlZC1jb250cm9sbGVyQDI4IHsKPj4gKwkJY29tcGF0aWJsZSA9ICJsZW5vdm8sdGhp
bmtwYWQtdDE0cy1lYyI7Cj4KPkkgaGlnaGx5IGRvdWJ0IHRoaXMgaXMgdGhlIGNhc2UKPgpS77ya
Ckl0IGhhcyBhdCBsZWFzdCBiZWVuIHRlc3RlZCBvbiB0aGUgcGh5c2ljYWwgZGV2aWNlLiBEdWUg
dG8gbXkgbGFjayBvZiBwcm9mZXNzaW9uYWwgZXhwZXJ0aXNlLCBtYWtpbmcgZXhjZXNzaXZlIG1v
ZGlmaWNhdGlvbnMgcmFzaGx5IHdvdWxkIGJlIG1vcmUgbGlrZWx5IHRvIGNhdXNlIGhhcmR3YXJl
IGRhbWFnZS4gVG8gYmUgY2xlYXIsIHdoZW4gYm9vdGluZyB0aGUgc2ZhMTQtMTEgd2l0aCB0aGUg
VDE0cyBEVEIgdW5kZXIgTGludXgsIHRoZSBwb3dlciBjb25zdW1wdGlvbiBhbmQgaGVhdCBnZW5l
cmF0aW9uIGFyZSBib3RoIG1vcmUgc2V2ZXJlIGNvbXBhcmVkIHRvIFdPQS4gSG93ZXZlciwgYmFz
ZWQgb24gd2hhdCBJ4oCZdmUgbGVhcm5lZCBmcm9tIHRoZSBVYnVudHUgY29tbXVuaXR5LCB0aGlz
IGlzIGxpa2VseSBhbiBpc3N1ZSB3aXRoIHRoZSBRdWFsY29tbSBwb3dlciBtYW5hZ2VtZW50IGRy
aXZlciBpdHNlbGYuCj5bLi4uXQo+Cj4+ICsmaTJjOCB7Cj4+ICsJY2xvY2stZnJlcXVlbmN5ID0g
PDQwMDAwMD47Cj4+ICsKPj4gKwlzdGF0dXMgPSAib2theSI7Cj4+ICsKPj4gKwkvKiBJTElUMjkx
MSBvciBHVENIMTU2MyAqLwo+PiArCXRvdWNoc2NyZWVuQDEwIHsKPj4gKwkJY29tcGF0aWJsZSA9
ICJoaWQtb3Zlci1pMmMiOwo+PiArCQlyZWcgPSA8MHgxMD47Cj4+ICsKPj4gKwkJaGlkLWRlc2Ny
LWFkZHIgPSA8MHgxPjsKPj4gKwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmdGxtbSA1MSBJUlFf
VFlQRV9MRVZFTF9MT1c+Owo+PiArCj4+ICsJCXZkZC1zdXBwbHkgPSA8JnZyZWdfbWlzY18zcDM+
Owo+PiArCQl2ZGRsLXN1cHBseSA9IDwmdnJlZ19sMTViXzFwOD47Cj4+ICsKPj4gKwkJcGluY3Ry
bC0wID0gPCZ0czBfZGVmYXVsdD47Cj4+ICsJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+
ICsJfTsKPj4gKwo+PiArCS8qIFRPRE86IHNlY29uZC1zb3VyY2VkIHRvdWNoc2NyZWVuIEAgMHg0
MSAqLwo+Cj5UaGlzIGFnYWluIGxvb2tzIGRpcmVjdGx5IGNvcHlwYXN0ZWQKPgpSOiAKSW5kZWVk
IQo+Wy4uLl0KPgo+PiArJnVzYl8xX3NzMl9xbXBwaHkgewo+PiArCXZkZGEtcGh5LXN1cHBseSA9
IDwmdnJlZ19sMmpfMXAyPjsKPj4gKwl2ZGRhLXBsbC1zdXBwbHkgPSA8JnZyZWdfbDJkXzBwOT47
Cj4+ICsKPj4gKwkvZGVsZXRlLXByb3BlcnR5LyBtb2RlLXN3aXRjaDsKPj4gKwkvZGVsZXRlLXBy
b3BlcnR5LyBvcmllbnRhdGlvbi1zd2l0Y2g7Cj4+ICsKPj4gKwlzdGF0dXMgPSAib2theSI7Cj4+
ICsKPj4gKwlwb3J0cyB7Cj4+ICsJCXBvcnRAMCB7Cj4+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPj4gKwkJCSNzaXplLWNlbGxzID0gPDA+Owo+PiArCj4+ICsJCQkvZGVsZXRlLW5vZGUvIGVu
ZHBvaW50Owo+PiArCj4+ICsJCQl1c2JfMV9zczJfcW1wcGh5X291dF9kcDogZW5kcG9pbnRAMCB7
Cj4+ICsJCQkJcmVnID0gPDA+Owo+PiArCj4+ICsJCQkJZGF0YS1sYW5lcyA9IDwzIDIgMSAwPjsK
Pj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfYnJpZGdlX2RwX2luPjsKPgo+SSBkb24n
dCBzZWUgYSBIRE1JIHBvcnQgb24gdGhpcyBsYXB0b3AKPgpSOiBUaGlzIGxhcHRvcCBkb2VzIGhh
dmUgYW4gSERNSSBwb3J0Lgo+TW9yZW92ZXIsIEknbSBoaWdobHkgY29uY2VybmVkIGFib3V0IHRo
ZSByZWd1bGF0b3Igc2V0dGluZ3MsIHdoaWNoCj5kaWZmZXIgYmV0d2VlbiBib2FyZHMgYW5kIG1h
eSBsZWFkIHRvIHBlcm1hbmVudCBoYXJkd2FyZSBkYW1hZ2UgaWYKPm1pc2NvbmZpZ3VyZWQuIElm
IHlvdSB0b29rIHRoZSB2YWx1ZXMgZnJvbSB0aGUgVDE0cyBEVCBhcy1pcywgeW91Cj5tYXkgYmUg
ZG9pbmcgeW91cnNlbGYgYSBiYWQgZmF2b3IuLgo+ClI6IFRoYW5rIHlvdSBmb3IgeW91ciBjYXJl
ZnVsIHJldmlldy4gSSBiZWxpZXZlIHRoYXQgY3VycmVudGx5LCB3aXRoIHRoZSBleGNlcHRpb24g
b2YgYSBmZXcgc3BlY2lmaWMgbGFwdG9wIG1vZGVscyAoZS5nLiwgdGhlIFRoaW5rUGFkIFQxNHMp
LCBhbGwgb3RoZXIgbGFwdG9wcyB1dGlsaXppbmcgdGhlIFgxIEVsaXRlL1BsdXMgU29DIGV4cGVy
aWVuY2UgbW9yZSBvciBsZXNzIGlzc3VlcyB3aGVuIHJ1bm5pbmcgTGludXggb24gQVJN4oCUYW5k
IHRoZSBTRkExNC0xMSBpcyBubyBleGNlcHRpb24uIFRoYXQgc2FpZCwgSSBob3BlIHRvIHJhaXNl
IGl0cyB2aXNpYmlsaXR5IGFuZCBpbXByb3ZlIGl0IHRocm91Z2ggbXkgZWZmb3J0cy4KQmVzdCBy
ZWdhcmRzLAp3ZWlmdSB3dQoKCgoKCgoKCgoKCg==

