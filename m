Return-Path: <linux-arm-msm+bounces-82633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BECAC72DBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3DCE35BCCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AE5314B7A;
	Thu, 20 Nov 2025 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="kRmrKjJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8E831354F;
	Thu, 20 Nov 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763627029; cv=none; b=T4GeqIb59ErTVEC1Mt52wYqLhc3AigH9FyQtFoy7nboZk48iPq1/xBgtiV3Mk075wtbWI7W3UaCOPdhx1GuYNznHXNLBtyIEmfJTGLKTPa0ZdexNBGOcEnTXwzIw+RexfeK1N1hzn95Qki87vSwZ3Lc6CKqaBLItbMLJ6m4uGlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763627029; c=relaxed/simple;
	bh=I4OuTk4KWd136mUPhGduSNpZZqcUHVslyKUCJNl5tlo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=jIVn2AubHA+90ZgzndlxNlOrfjK2bcjNYSz/AQETK7N61m6cPdfGyTk1qHJTCsBu/+cF+cmOcyJdLKIeHA8E0w3Qqb4k6oUeOLbEDlS0ceMv0szq2zE2EBbKutPTHtEq+JkNoljn67sLU6813MNh9Sf6+scR0rJ9QtaCTn371Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=kRmrKjJD reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=NYAcTM7nDsHLuFDi8ivh7DNKiDUeX1ma+C6wZPtbPFU=; b=k
	RmrKjJD0uhpAg+sUGWLvIFAdBOAi801bra0cS5RM5q4Zu9DdnBMPZMbY8/39gc18
	wd3pJyne38iMnSJr/a/g1PNycPIEalRJSHyb6cXe+4ELZwJnXX5ODnmvY2rQvBht
	jERQMU8pLCFy5wo63A5jJ6+Ntb2AxN7vnnlNNqugmw=
Received: from slark_xiao$163.com ( [112.97.80.230] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Thu, 20 Nov 2025 16:22:57 +0800
 (CST)
Date: Thu, 20 Nov 2025 16:22:57 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for
 Foxconn T99W760
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAFEp6-1kSMGY0ydJjTvZqB4okXQgcwkvhMni8r-tOMzXyY7P_g@mail.gmail.com>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
 <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
 <moob5m5ek4jialx4vbxdkuagrkvvv7ioaqm2yhvei5flrdrzxi@c45te734h3yf>
 <CAFEp6-1kSMGY0ydJjTvZqB4okXQgcwkvhMni8r-tOMzXyY7P_g@mail.gmail.com>
X-NTES-SC: AL_Qu2dAfqZuUEs4SSeY+kfmk8Sg+84W8K3v/0v1YVQOpF8jBLo8zg9YXRILWfX3/qKFg6yij6FVRVc+85mdrtmcoA73P/dSqEOUofPo65KGg8sCQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <20c33ad2.791f.19aa05c08c3.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iSgvCgD3H+bhzx5ptWMmAA--.4020W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibgYMZGkexYwmAwACsZ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNS0xMS0yMCAxNTo0NDoxNCwgIkxvaWMgUG91bGFpbiIgPGxvaWMucG91bGFpbkBvc3Mu
cXVhbGNvbW0uY29tPiB3cm90ZToKPk9uIFRodSwgTm92IDIwLCAyMDI1IGF0IDY6NDHigK9BTSBN
YW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFdl
ZCwgTm92IDE5LCAyMDI1IGF0IDAyOjA4OjMzUE0gKzAxMDAsIExvaWMgUG91bGFpbiB3cm90ZToK
Pj4gPiBPbiBXZWQsIE5vdiAxOSwgMjAyNSBhdCAxMjoyN+KAr1BNIERtaXRyeSBCYXJ5c2hrb3YK
Pj4gPiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPj4gPiA+Cj4+
ID4gPiBPbiBXZWQsIE5vdiAxOSwgMjAyNSBhdCAwNjo1NjoxNVBNICswODAwLCBTbGFyayBYaWFv
IHdyb3RlOgo+PiA+ID4gPiBUOTlXNzYwIGlzIGRlc2lnbmVkIGJhc2VkIG9uIFF1YWxjb21tIFNE
WDM1IGNoaXAuIEl0IHVzZSBzaW1pbGFyCj4+ID4gPiA+IGFyY2hpdGVjaHR1cmUgd2l0aCBTRFg3
Mi9TRFg3NSBjaGlwLiBTbyB3ZSBuZWVkIHRvIGFzc2lnbiBpbml0aWFsCj4+ID4gPiA+IGxpbmsg
aWQgZm9yIHRoaXMgZGV2aWNlIHRvIG1ha2Ugc3VyZSBuZXR3b3JrIGF2YWlsYWJsZS4KPj4gPiA+
ID4KPj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2xhcmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29t
Pgo+PiA+ID4gPiAtLS0KPj4gPiA+ID4gIGRyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5j
IHwgMyArKy0KPj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4gPiA+ID4KPj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3d3YW4v
bWhpX3d3YW5fbWJpbS5jIGIvZHJpdmVycy9uZXQvd3dhbi9taGlfd3dhbl9tYmltLmMKPj4gPiA+
ID4gaW5kZXggYzgxNGZiZDc1NmExLi5hMTQyYWY1OWE5MWYgMTAwNjQ0Cj4+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5jCj4+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
bmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5jCj4+ID4gPiA+IEBAIC05OCw3ICs5OCw4IEBAIHN0YXRp
YyBzdHJ1Y3QgbWhpX21iaW1fbGluayAqbWhpX21iaW1fZ2V0X2xpbmtfcmN1KHN0cnVjdCBtaGlf
bWJpbV9jb250ZXh0ICptYmltCj4+ID4gPiA+ICBzdGF0aWMgaW50IG1oaV9tYmltX2dldF9saW5r
X211eF9pZChzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKmNudHJsKQo+PiA+ID4gPiAgewo+PiA+ID4g
PiAgICAgICBpZiAoc3RyY21wKGNudHJsLT5uYW1lLCAiZm94Y29ubi1kdzU5MzRlIikgPT0gMCB8
fAo+PiA+ID4gPiAtICAgICAgICAgc3RyY21wKGNudHJsLT5uYW1lLCAiZm94Y29ubi10OTl3NTE1
IikgPT0gMCkKPj4gPiA+ID4gKyAgICAgICAgIHN0cmNtcChjbnRybC0+bmFtZSwgImZveGNvbm4t
dDk5dzUxNSIpID09IDAgfHwKPj4gPiA+ID4gKyAgICAgICAgIHN0cmNtcChjbnRybC0+bmFtZSwg
ImZveGNvbm4tdDk5dzc2MCIpID09IDApCj4+ID4gPgo+PiA+ID4gQ2FuIHdlIHJlcGxhY2UgdGhp
cyBsaXN0IG9mIHN0cmluYyBjb21wYXJpc29ucyB3aXRoIHNvbWUga2luZCBvZiBkZXZpY2UKPj4g
PiA+IGRhdGEsIGJlaW5nIHNldCBpbiB0aGUgbWhpLXBjaS1nZW5lcmljIGRyaXZlcj8KPj4gPgo+
PiA+IElmIHdlIG1vdmUgdGhpcyBNQklNLXNwZWNpZmljIGluZm9ybWF0aW9uIGludG8gbWhpLXBj
aS1nZW5lcmljLCB3ZQo+PiA+IHNob3VsZCBjb25zaWRlciB1c2luZyBhIHNvZnR3YXJlIG5vZGUg
KGUuZy4gdmlhCj4+ID4gZGV2aWNlX2FkZF9zb2Z0d2FyZV9ub2RlKSBzbyB0aGF0IHRoZXNlIHBy
b3BlcnRpZXMgY2FuIGJlIGFjY2Vzc2VkCj4+ID4gdGhyb3VnaCB0aGUgZ2VuZXJpYyBkZXZpY2Ut
cHJvcGVydHkgQVBJLgo+PiA+Cj4+Cj4+IE1ISSBoYXMgdG8gYnVzaW5lc3MgaW4gZGVhbGluZyB3
aXRoIE1CSU0gc3BlY2lmaWMgaW5mb3JtYXRpb24gYXMgd2UgYWxyZWFkeQo+PiBjb25jbHVkZWQu
IFNvIGl0IHNob3VsZCBiZSBoYW5kbGVkIHdpdGhpbiB0aGUgV1dBTiBzdWJzeXN0ZW0uCj4KPml0
IGRvZXNu4oCZdCBtYWtlIHNlbnNlIHRvIGluY2x1ZGUgTUJJTS1zcGVjaWZpYyBmaWVsZHMgaW4g
YSBnZW5lcmljIE1ISQo+c3RydWN0dXJlLiBIb3dldmVyLCBhdHRhY2hpbmcgZndub2RlIHByb3Bl
cnRpZXMgY291bGQgYmUgcmVhc29uYWJsZQo+c2luY2UgdGhlIE1ISSBQQ0kgZHJpdmVyIGlzIHJl
c3BvbnNpYmxlIGZvciBkZXZpY2UgZW51bWVyYXRpb24sIGFuZAo+dGhhdCB3b3VsZCBrZWVwIGRl
dmljZSBtb2RlbCBzcGVjaWZpYyBoYW5kbGluZyBmdWxseSBjb3ZlcmVkIGluIHRoYXQKPmRyaXZl
ci4KPgo+SXTigJlzIGZpbmUgdG8ga2VlcCBkZXZpY2Utc3BlY2lmaWMgaGFuZGxpbmcgd2l0aGlu
IFdXQU4vTUJJTS4gSG93ZXZlciwKPm5leHQgdGltZSwgcGxlYXNlIGludHJvZHVjZSBhIGRlZGlj
YXRlZCBkZXZpY2UgZGF0YSBzdHJ1Y3R1cmUgZm9yIHRoZQo+bXV4LWlkIGluc3RlYWQgb2YgYWRk
aW5nIGFub3RoZXIgc3RyY21wLgo+CkhpIExvaWMsClNvIHlvdSBhbnN3ZXIgaXMgeWVzIGZvciB0
aGlzIHRpbWUuIEkgYXBwcmVjaWF0ZSBpdCB2ZXJ5IG11Y2guCkFuZCBJIHdpbGwgY29tbWl0IGFu
b3RoZXIgcGF0Y2ggZm9yIGZpeGluZyB0aGUgbmFtZSAidDk5dzUxNSIgdG8gCiJ0OTl3NjQwIi4g
SSBoYXZlIHVwZGF0ZWQgaXQgaW4gbWhpIHNpZGUgaW4gMjAyNS82LkJ1dCBJIGZvcmdvdCB0byAK
c3luYyBpbiBNQklNIHNpZGUuIFBsZWFzZSByZWZlciB0bzogCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI1MDYwNjA5NTAxOS4zODM5OTItMS1zbGFya194aWFvQDE2My5jb20vCkhvcGUg
dGhhdCBjb21taXQgd29uJ3QgYnJlYWsgeW91ciBkZWNpc2lvbi4KClRvIGF2b2lkIHN1Y2ggbWlz
bWF0Y2ggaXNzdWUsIEkgYWdyZWUgdG8gdXNlIGEgbmV3IG1lY2hhbmlzbSB0bwptYWtlIGl0IG1v
cmUgY29udmVuaWVudC4KQ3VycmVudGx5LCBpdCBzZWVtcyBvbmx5IFNEWDc1L1NEWDM1IE1CSU0g
c29sdXRpb24gaGF2ZSB0aGlzIGlzc3VlLgpGb3Igd2hvbGUgTUhJIHN1cHBvcnQgcHJvZHVjdHMs
IG9ubHkgRm94Y29ubiBmZWxsIGludG8gdGhpcyB0cmFwLgpTbyBJIGhvcGUgY29tbXVuaXR5IGNv
dWxkIGhlbHAgdGhpcyBmb3IgdGhlIG5ldyBkZXNpZ24uCgpUaGFua3MK

