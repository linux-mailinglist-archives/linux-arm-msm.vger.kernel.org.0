Return-Path: <linux-arm-msm+bounces-119130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FIs/HnHtVmpBDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCB75A068
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:16:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="Y 2H+ocz";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119130-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119130-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A8AE300691E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C9818DB01;
	Wed, 15 Jul 2026 02:16:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193902836E;
	Wed, 15 Jul 2026 02:16:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784081771; cv=none; b=gklv/Y5vzpeeZCKVbdMfaOFaOPbQgwlI5fUNqIeNtbE72rKH2UUcYB7B+mmxr4aD9ArQS9ZGXs6ych8SqRptMdtAPHu4e4A64nbUKj9e4Ek8HVWbXuPB7CY1HkY2ubJAE505UsRZ7nByOn3WGEb44pFI88pWuPracC9bnUzxPm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784081771; c=relaxed/simple;
	bh=cvJo62jzo8GEatvtucWOxHpxMBXHaV5+0ux4r3mR61w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Xy4+3e+WoaVQA3t2J5YDchU2nZfiWaiKDboufTwNL87LHQT6d3vCW69iMFiR3H64jV+iAQwwjUP2WcykVDuJtdoXB1TAIk+N1h6sQxWjVA/u4HOSFmpwenYUuiYxYXli53ZSrtK6l9Bh0LlL7uY7gkbayH93MhPWUW0DKgMVfpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Y2H+oczY; arc=none smtp.client-ip=117.135.210.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=cvJo62jzo8GEatvtucWOxHpxMBXHaV5+0ux4r3mR61w=; b=Y
	2H+oczYwtZRM8xJdVBxNUaZmDL2QDXI14xVVXb6EY4GfR7l+/fir+zus0Wa9Ih9/
	4Wr1uu/+qZOthWa7DOO7nXqsJLWV5SBiLlsVmaUtBJ9q5uG0BwwgeshY+E7fIdSB
	zxEgQbrHN+NO/rv9fn1bDj8+bwZoKsYoDyWgAULxvg=
Received: from xiongwm2026$163.com ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Wed, 15 Jul 2026 10:15:03 +0800
 (CST)
Date: Wed, 15 Jul 2026 10:15:03 +0800 (CST)
From: xiongwm2026  <xiongwm2026@163.com>
To: "Robin Murphy" <robin.murphy@arm.com>
Cc: "Pranjal Shrivastava" <praan@google.com>,
	"Will Deacon" <will@kernel.org>, "Joerg Roedel" <joro@8bytes.org>,
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
	"Rob Clark" <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re:Re: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe
 cleanup
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <0e405cb3-1227-4ad2-96ff-aa0db3124381@arm.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <alZCbIIuawpugaQe@google.com>
 <0e405cb3-1227-4ad2-96ff-aa0db3124381@arm.com>
X-NTES-SC: AL_Qu2TBvyTvk8r5SSZYukckk8Ugeg8Xsewsvgh249ec/4EmyzdyAcGXkRiO2PO1vm+DhyhuTyzfwlA7OdxRZVbBl9ZsUbd7u3gDD92HriihQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <78f42e18.1be7.19f638e6201.Coremail.xiongwm2026@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dSgvCgDn7xwo7VZqYlMeAA--.733W
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzQi1RWpW7Sg5eAAA3N
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:praan@google.com,m:will@kernel.org,m:joro@8bytes.org,m:benjamin.gaignard@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xiongwm2026@163.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119130-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiongwm2026@163.com,linux-arm-msm@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BFCB75A068

CgpIaSBQcmFuamFsLCBIaSBSb2JpbiwKCgoKVGhhbmtzIGEgbG90IGZvciB0aGUgY2FyZWZ1bCBy
ZXZpZXcgYW5kIGZvciBjbGFyaWZ5aW5nIHRoZQpyZWZjb3VudCBzZW1hbnRpY3MgaGVyZS4KCgpJ
IHNlZSBJIGNvbmZsYXRlZCB0aGUgZXh0cmEgcmVmZXJlbmNlIHRha2VuIGJ5CmJ1c19maW5kX2Rl
dmljZSooKSB3aXRoIG9iamVjdCBsaWZldGltZS4gUHV0dGluZyB0aGF0CnJlZmVyZW5jZSBhZnRl
ciB0aGUgbG9va3VwIGlzIG1lYW50IHRvIHJlc3RvcmUgdGhlIHByZS1maW5kCmJhbGFuY2U7IGl0
IGRvZXMgbm90IGJ5IGl0c2VsZiBpbXBseSB0aGF0IHRoZSBkZXZpY2UgaXMgZ29uZQpvciB0aGF0
IGxhdGVyIHVzZSBvZiBkcml2ZXIgcHJpdmF0ZSBkYXRhIGlzIGEgdXNlLWFmdGVyLXB1dC4KQXMg
eW91IGJvdGggcG9pbnRlZCBvdXQsIGEgcHV0IHRoYXQgcmVhY2hlcyB6ZXJvIGluc2lkZSBwcm9i
ZQp3b3VsZCBwb2ludCBhdCBhIGRlZXBlciBvd25lcnNoaXAgYnVnIGVsc2V3aGVyZSwgd2hpY2gg
SSBoYXZlCm5vdCBkZW1vbnN0cmF0ZWQuCgoKSSBkbyBub3QgY3VycmVudGx5IGhhdmUgYSBLQVNB
TiByZXBvcnQsIG9vcHMsIG9yIG90aGVyCmZhaWxpbmcgbG9nIHRoYXQgc2hvd3MgYSBjb25jcmV0
ZSBicmVha2FnZSBmb3IgdGhlc2UgcGF0aHMuCkdpdmVuIHRoYXQsIEkgd2lsbCBub3QgcHVyc3Vl
IHRoZSAibG9va3VwIGxpZmV0aW1lIiBmcmFtaW5nCmZ1cnRoZXIgYW5kIHdpbGwgZHJvcCB0aGlz
IHNlcmllcyBhcyBwcm9wb3NlZC4KCgpSb2JpbjogaWYgdXNlZnVsIGFzIGEgZm9sbG93LXVwLCBJ
IGNhbiBzZW5kIGEgc21hbGwgY2xlYW51cAp0aGF0IHJlbW92ZXMgdGhlIG5vdy1yZWR1bmRhbnQg
TlVMTCBjaGVja3MgYWZ0ZXIKMTdkZTNmNWZkZDM1ICgiaW9tbXU6IFJldGlyZSBidXMgb3BzIiks
IHdpdGhvdXQgY2xhaW1pbmcgYQpsaWZldGltZSBmaXguIFBsZWFzZSBsZXQgbWUga25vdyBpZiB5
b3Ugd291bGQgbGlrZSB0aGF0LgoKClRoYW5rcyBhZ2FpbiBmb3IgdGhlIGV4cGxhbmF0aW9uLgoK
CkJlc3QgcmVnYXJkcywKV2VpbWluCgoKQXQgMjAyNi0wNy0xNCAyMzo1Njo1MCwgIlJvYmluIE11
cnBoeSIgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPk9uIDE0LzA3LzIwMjYgMzowNiBw
bSwgUHJhbmphbCBTaHJpdmFzdGF2YSB3cm90ZToKPj4gT24gVHVlLCBKdWwgMTQsIDIwMjYgYXQg
MDI6MDk6MjZQTSArMDgwMCwgd2VpbWluIHhpb25nIHdyb3RlOgo+Pj4gRml4IGEgZmV3IElPTU1V
IGRyaXZlciBsaWZldGltZSBhbmQgZXJyb3ItcGF0aCBpc3N1ZXMgZm91bmQgd2hpbGUKPj4+IGF1
ZGl0aW5nIGZ3bm9kZS1iYXNlZCBkZXZpY2UgbG9va3VwIGFuZCBwcm9iZSBjbGVhbnVwIHBhdGhz
Lgo+Pj4KPj4+IFRoZSBmaXJzdCB0aHJlZSBwYXRjaGVzIGF2b2lkIGRlcml2aW5nIGRyaXZlciBw
cml2YXRlIGRhdGEgYWZ0ZXIKPj4+IGRyb3BwaW5nIHRoZSBkZXZpY2UgcmVmZXJlbmNlIHJldHVy
bmVkIGJ5IGJ1c19maW5kX2RldmljZV9ieV9md25vZGUoKS4KPj4+IFRoZXkgYWxzbyBtYWtlIHRo
ZSBBUk0gU01NVSB2MiBhbmQgVlNJIHByb2JlIHBhdGhzIGZhaWwgY2xlYW5seSB3aGVuIHRoZQo+
Pj4gSU9NTVUgbG9va3VwIGZhaWxzLgo+PiAKPj4gSSdtIG5vdCBzdXJlIGlmIHRoYXQncyByZWFs
bHkgbmVlZGVkPyBBbGwgdGhlc2UgZHJpdmVycyBhcmUgZG9pbmcgaXMKPj4gZHJvcHBpbmcgdGhl
ICJleHRyYSIgcmVmY291bnQgKGluY3JlbWVudGVkIGJ5IGNhbGxpbmcgZmluZF9kZXZpY2UpICBi
YWNrCj4+IHRvIHRoZSBzdGF0ZSAqYmVmb3JlKiB0aGUgZndub2RlIGZ1bmN0aW9uIGNhbGwuIElm
IHlvdSBmaW5kIHRoYXQgdGhpcwo+PiBwdXRfZGV2aWNlIGNhdXNlZCB0aGUgY291bnQgdG8gZHJv
cCB0byAwLCBJIGJlbGlldmUgdGhhdCdzIHRoZSByZWFsCj4+IHByb2JsZW0vYnVnLiBUaGVzZSBm
d25vZGUgZnVuY3Rpb25zIGFyZSB1c3VhbGx5IGNhbGxlZCBpbiBwcm9iZSBhbmQgdGhlCj4+IHJl
ZmNvdW50IHNob3VsZG4ndCBiZSAwIGluc2lkZSBwcm9iZS4KPj4gCj4+IENvdWxkIHlvdSBzaGFy
ZSB5b3VyIG9ic2VydmF0aW9uIC8gZmFpbGluZyBsb2dzIHdoZXJlIHRoaXMgZmFpbHM/IE1heWJl
Cj4+IHNvbWV0aGluZyBlbHNlIGlzIHdyb25nIHdpdGggdGhlIHN5c3RlbT8KPgo+SSBkb24ndCBo
YXZlIGFueSB0cmFjZSBvZiB0aGUgb3JpZ2luYWwgcGF0Y2hlcyAodGhhbmtzLCBNaWNyb3NvZnQu
Li4pIAo+YnV0IGxvb2tpbmcgb24gbG9yZSwgeWVzIHRoZXNlICJsaWZldGltZSIgY29uY2VybnMg
YXJlIHNwdXJpb3VzOyBpdCdzIAo+anVzdCBhIHBhcnRpY3VsYXIgc2l0dWF0aW9uIHdoZXJlIGR1
ZSB0byB0aGUgQVBJLCB0aGUgZHJpdmVycyBhcmUgdGFraW5nIAo+YSBzbGlnaHRseSByb3VuZGFi
b3V0IHJvdXRlIHRvIGxvb2sgdXAgdGhlaXIgb3duIHZhbGlkIGRldmljZSBpbnN0YW5jZS4KPgo+
VGhlIElPTU1VIGRldmljZSBtdXN0IGFscmVhZHkgaGF2ZSBhdCBsZWFzdCBvbmUgaGVsZCByZWZl
cmVuY2UgZnJvbSB3YXkgCj5iYWNrIGluIGl0cyBkZXZpY2VfaW5pdGlhbGlzZSgpLCB3aGljaCB3
aWxsIG5vdCBiZSByZWxlYXNlZCB1bmxlc3MgYW5kIAo+dW50aWwgZGV2aWNlX3VucmVnaXN0ZXIo
KSBpcyBjYWxsZWQgKHdoaWNoIGlzIHByb2JhYmx5IG5ldmVyIGZvciBhIAo+bm9uLWhvdHBsdWdn
YWJsZSBwbGF0Zm9ybSBkZXZpY2Ugb25jZSBpdCBoYXMgYmVlbiBzdWNjZXNzZnVsbHkgY3JlYXRl
ZCkuIAo+SWYgc29tZW9uZSB1bnJlZ2lzdGVyZWQgYSBwbGF0Zm9ybSBkZXZpY2Ugd2hpbGUgaXQg
c3RpbGwgaGFkIGEgZHJpdmVyIAo+Ym91bmQsIG9yIHRoZSBJT01NVSBkcml2ZXIgY291bGQgYmUg
dW5ib3VuZCB3aXRob3V0IHVucmVnaXN0ZXJpbmcgdGhlIAo+aW9tbXVfZGV2aWNlIHRocm91Z2gg
d2hpY2ggaXRzIC0+b2ZfeGxhdGUgb3IgLT5wcm9iZV9kZXZpY2UgY291bGQgYmUgCj5jYWxsZWQs
IHNvIG1hbnkgb3RoZXIgdGhpbmdzIHdvdWxkIGJlIGJsb3dpbmcgdXAgYWxyZWFkeSB0aGF0IHRo
aXMgd291bGQgCj5zdGlsbCBiZSBpcnJlbGV2YW50Lgo+Cj5TaW5jZSAxN2RlM2Y1ZmRkMzUgKCJp
b21tdTogUmV0aXJlIGJ1cyBvcHMiKSB0aGVzZSBsb29rdXBzIHNob3VsZCBhbHNvIAo+bmV2ZXIg
cmV0dXJuIE5VTEwgZm9yIHRoZSBzYW1lIHJlYXNvbnMsIHNvIGRvIGZlZWwgZnJlZSB0byBjbGVh
biB1cCAKPnRob3NlIHJlZHVuZGFudCBjaGVja3MgaWYgaXQgaGVscHMgbWFrZSB0aGluZ3MgYSBi
aXQgY2xlYXJlci4KPgo+VGhhbmtzLAo+Um9iaW4uCg==

