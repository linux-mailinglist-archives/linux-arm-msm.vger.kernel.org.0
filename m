Return-Path: <linux-arm-msm+bounces-109985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GOFIWvEFmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:16:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FDA5E2783
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3A5930A0CA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 10:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0E9280318;
	Wed, 27 May 2026 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XOdjqRbG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBBC3EDE55;
	Wed, 27 May 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876542; cv=none; b=Zaziz57ZJ5wCtCenGFihlVY1a8rY7oAD8P8bUh3lb7wgngdtgIDLBUFQ3bBE76J66nsI/LmY6quajPPT1VYGZJFWFzjsDSCkYP0kkB+lbg2j5nhj41jGVVxN/8wyaPv+2SfyMyDgDL+8XIwgXa9k4CnhWRycj0u4sp5bkch92gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876542; c=relaxed/simple;
	bh=eSQov8m0buTVNACUnG1JtFHVNxi8ivPK0jME9icLeHc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Loe0BEpZDMhazPQhfcE56gOmR0jMcWfP2g12XyIw2b+LHljpo+TLtwsVlE/W0eIF/7TxjKWxxv6xoje9RnzRLCe7opt5d4kjRT+S/rTsgYLX7fFunzpo6BygS0KF3CymNW4x/RtkSkF6WaqKZh2SgXxWrBKanVwhbxg665+V3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XOdjqRbG; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=eSQov8m0buTVNACUnG1JtFHVNxi8ivPK0jME9icLeHc=; b=X
	OdjqRbGAtkuBLm6wrRSADucFvkhkjPa8GkK7tdD1WMBv/C88ImptNz687S1SCjif
	hkMOMnPR4TCQgNHNqeLBUProscjyzB+/tkbHuelcr2I+VSg/hgWshEmOLAsC8UCq
	otBOUxnYilDI2ZsCwmWMgrsijQfuSeePqbn2w38va4=
Received: from slark_xiao$163.com (
 [2408:8459:3850:6a97:b654:c004:abab:41da] ) by ajax-webmail-wmsvr-40-145
 (Coremail) ; Wed, 27 May 2026 18:08:23 +0800 (CST)
Date: Wed, 27 May 2026 18:08:23 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH] bus: mhi: host: pci_generic: Fix the physical function
 check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260527085220.14139-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260527085220.14139-1-manivannan.sadhasivam@oss.qualcomm.com>
X-NTES-SC: AL_Qu2cC/ScuU0r5SKbbekcnUsag+42XsC4vPUi1YJec+oGth/v5CIDbVJlPV3Ky8SyCR2HkQSGbRdH6dZlQat6y+3AraSRsFEEGYSqCQ/UkA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <12aa604a.8d99.19e68e81ed2.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kSgvCgDXv46XwhZqDiOtAA--.5965W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCwBf1WmoWwpcQYAAA3h
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109985-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.889];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[slark_xiao@163.com,linux-arm-msm@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D7FDA5E2783
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QXQgMjAyNi0wNS0yNyAxNjo1MjoyMCwgIk1hbml2YW5uYW4gU2FkaGFzaXZhbSIgPG1hbml2YW5u
YW4uc2FkaGFzaXZhbUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPkNvbW1pdCBiNGQwMWM1Yjlh
OWQgKCJidXM6IG1oaTogaG9zdDogcGNpX2dlbmVyaWM6IFJlYWQgU1VCU1lTVEVNX1ZFTkRPUl9J
RAo+Zm9yIFZGJ3MgdG8gY2hlY2sgc3RhdHVzIikgYWRkZWQgdGhlIGNoZWNrIGZvciBwaHlzaWNh
bCBmdW5jdGlvbiBieQo+Y2hlY2tpbmcgZm9yICdwZGV2LT5pc19waHlzZm4uIEJ1dCAncGRldi0+
aXNfcGh5c2ZuJyBpcyBvbmx5IHNldCBmb3IgdGhlCj5waHlzaWNhbCBmdW5jdGlvbiBvZiBhIFNS
LUlPViBjYXBhYmxlIGRldmljZS4gQnV0IGZvciB0aGUgbm9uLVNSLUlPViBkZXZpY2UKPnRoaXMg
dmFyaWFibGUgd2lsbCBiZSAwLiBTbyB0aGlzIGNoZWNrIGVuZGVkIHVwIGJyZWFraW5nIHRoZSBo
ZWFsdGggY2hlY2sKPmZ1bmN0aW9uYWxpdHkgZm9yIGFsbCBub24tU1ItSU9WIGRldmljZXMuCj4K
PkZpeCBpdCBieSBjaGVja2luZyBmb3IgJyFwZGV2LT5pc192aXJ0Zm4nIHRvIG1ha2Ugc3VyZSB0
aGF0IHRoZSBjaGVjayBpcwo+b25seSBza2lwcGVkIGZvciB2aXJ0dWFsIGZ1bmN0aW9ucy4KPgo+
UmVwb3J0ZWQtYnk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPkZpeGVzOiBiNGQw
MWM1YjlhOWQgKCJidXM6IG1oaTogaG9zdDogcGNpX2dlbmVyaWM6IFJlYWQgU1VCU1lTVEVNX1ZF
TkRPUl9JRCBmb3IgVkYncyB0byBjaGVjayBzdGF0dXMiKQo+U2lnbmVkLW9mZi1ieTogTWFuaXZh
bm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1Ab3NzLnF1YWxjb21tLmNvbT4K
Pi0tLQo+IGRyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMgfCAyMCArKysrKysrKysr
LS0tLS0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMg
Yi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj5pbmRleCA1ODM2ZWNiMGVhMzIu
LjBkMGQ5YzdmZmE0YiAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5l
cmljLmMKPisrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPkBAIC0xMjYx
LDcgKzEyNjEsNyBAQCBzdGF0aWMgdm9pZCBtaGlfcGNpX3JlY292ZXJ5X3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQo+IAo+IAlkZXZfd2FybigmcGRldi0+ZGV2LCAiZGV2aWNlIHJlY292
ZXJ5IHN0YXJ0ZWRcbiIpOwo+IAo+LQlpZiAocGRldi0+aXNfcGh5c2ZuKQo+KwlpZiAoIXBkZXYt
PmlzX3ZpcnRmbikKPiAJCXRpbWVyX2RlbGV0ZSgmbWhpX3BkZXYtPmhlYWx0aF9jaGVja190aW1l
cik7Cj4gCj4gCXBtX3J1bnRpbWVfZm9yYmlkKCZwZGV2LT5kZXYpOwo+QEAgLTEyOTEsNyArMTI5
MSw3IEBAIHN0YXRpYyB2b2lkIG1oaV9wY2lfcmVjb3Zlcnlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCj4gCj4gCXNldF9iaXQoTUhJX1BDSV9ERVZfU1RBUlRFRCwgJm1oaV9wZGV2LT5z
dGF0dXMpOwo+IAo+LQlpZiAocGRldi0+aXNfcGh5c2ZuKQo+KwlpZiAoIXBkZXYtPmlzX3ZpcnRm
bikKPiAJCW1vZF90aW1lcigmbWhpX3BkZXYtPmhlYWx0aF9jaGVja190aW1lciwgamlmZmllcyAr
IEhFQUxUSF9DSEVDS19QRVJJT0QpOwo+IAo+IAlyZXR1cm47Cj5AQCAtMTM4Miw3ICsxMzgyLDcg
QEAgc3RhdGljIGludCBtaGlfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCj4gCQltaGlfY250cmxfY29uZmlnID0gaW5mby0+Y29u
ZmlnOwo+IAo+IAkvKiBJbml0aWFsaXplIGhlYWx0aCBjaGVjayBtb25pdG9yIG9ubHkgZm9yIFBo
eXNpY2FsIGZ1bmN0aW9ucyAqLwo+LQlpZiAocGRldi0+aXNfcGh5c2ZuKQo+KwlpZiAoIXBkZXYt
PmlzX3ZpcnRmbikKPiAJCXRpbWVyX3NldHVwKCZtaGlfcGRldi0+aGVhbHRoX2NoZWNrX3RpbWVy
LCBoZWFsdGhfY2hlY2ssIDApOwo+IAo+IAltaGlfY250cmwgPSAmbWhpX3BkZXYtPm1oaV9jbnRy
bDsKPkBAIC0xNDA0LDcgKzE0MDQsNyBAQCBzdGF0aWMgaW50IG1oaV9wY2lfcHJvYmUoc3RydWN0
IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPiAJbWhpX2Nu
dHJsLT5tcnUgPSBpbmZvLT5tcnVfZGVmYXVsdDsKPiAJbWhpX2NudHJsLT5uYW1lID0gaW5mby0+
bmFtZTsKPiAKPi0JaWYgKHBkZXYtPmlzX3BoeXNmbikKPisJaWYgKCFwZGV2LT5pc192aXJ0Zm4p
Cj4gCQltaGlfcGRldi0+cmVzZXRfb25fcmVtb3ZlID0gaW5mby0+cmVzZXRfb25fcmVtb3ZlOwo+
IAo+IAlpZiAoaW5mby0+ZWRsX3RyaWdnZXIpCj5AQCAtMTQ1Myw3ICsxNDUzLDcgQEAgc3RhdGlj
IGludCBtaGlfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqaWQpCj4gCXNldF9iaXQoTUhJX1BDSV9ERVZfU1RBUlRFRCwgJm1oaV9wZGV2
LT5zdGF0dXMpOwo+IAo+IAkvKiBzdGFydCBoZWFsdGggY2hlY2sgKi8KPi0JaWYgKHBkZXYtPmlz
X3BoeXNmbikKPisJaWYgKCFwZGV2LT5pc192aXJ0Zm4pCj4gCQltb2RfdGltZXIoJm1oaV9wZGV2
LT5oZWFsdGhfY2hlY2tfdGltZXIsIGppZmZpZXMgKyBIRUFMVEhfQ0hFQ0tfUEVSSU9EKTsKPiAK
PiAJLyogQWxsb3cgcnVudGltZSBzdXNwZW5kIG9ubHkgaWYgYm90aCBQTUUgZnJvbSBEM0hvdCBh
bmQgTTMgYXJlIHN1cHBvcnRlZCAqLwo+QEAgLTE0ODIsNyArMTQ4Miw3IEBAIHN0YXRpYyB2b2lk
IG1oaV9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+IAlwbV9ydW50aW1lX2ZvcmJp
ZCgmcGRldi0+ZGV2KTsKPiAJcGNpX2Rpc2FibGVfc3Jpb3YocGRldik7Cj4gCj4tCWlmIChwZGV2
LT5pc19waHlzZm4pCj4rCWlmICghcGRldi0+aXNfdmlydGZuKQo+IAkJdGltZXJfZGVsZXRlX3N5
bmMoJm1oaV9wZGV2LT5oZWFsdGhfY2hlY2tfdGltZXIpOwo+IAljYW5jZWxfd29ya19zeW5jKCZt
aGlfcGRldi0+cmVjb3Zlcnlfd29yayk7Cj4gCj5AQCAtMTUxNCw3ICsxNTE0LDcgQEAgc3RhdGlj
IHZvaWQgbWhpX3BjaV9yZXNldF9wcmVwYXJlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+IAo+IAlk
ZXZfaW5mbygmcGRldi0+ZGV2LCAicmVzZXRcbiIpOwo+IAo+LQlpZiAocGRldi0+aXNfcGh5c2Zu
KQo+KwlpZiAoIXBkZXYtPmlzX3ZpcnRmbikKPiAJCXRpbWVyX2RlbGV0ZSgmbWhpX3BkZXYtPmhl
YWx0aF9jaGVja190aW1lcik7Cj4gCj4gCS8qIENsZWFuIHVwIE1ISSBzdGF0ZSAqLwo+QEAgLTE1
NjAsNyArMTU2MCw3IEBAIHN0YXRpYyB2b2lkIG1oaV9wY2lfcmVzZXRfZG9uZShzdHJ1Y3QgcGNp
X2RldiAqcGRldikKPiAJfQo+IAo+IAlzZXRfYml0KE1ISV9QQ0lfREVWX1NUQVJURUQsICZtaGlf
cGRldi0+c3RhdHVzKTsKPi0JaWYgKHBkZXYtPmlzX3BoeXNmbikKPisJaWYgKCFwZGV2LT5pc192
aXJ0Zm4pCj4gCQltb2RfdGltZXIoJm1oaV9wZGV2LT5oZWFsdGhfY2hlY2tfdGltZXIsIGppZmZp
ZXMgKyBIRUFMVEhfQ0hFQ0tfUEVSSU9EKTsKPiB9Cj4gCj5AQCAtMTYyNiw3ICsxNjI2LDcgQEAg
c3RhdGljIGludCAgX19tYXliZV91bnVzZWQgbWhpX3BjaV9ydW50aW1lX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KQo+IAlpZiAodGVzdF9hbmRfc2V0X2JpdChNSElfUENJX0RFVl9TVVNQRU5E
RUQsICZtaGlfcGRldi0+c3RhdHVzKSkKPiAJCXJldHVybiAwOwo+IAo+LQlpZiAocGRldi0+aXNf
cGh5c2ZuKQo+KwlpZiAoIXBkZXYtPmlzX3ZpcnRmbikKPiAJCXRpbWVyX2RlbGV0ZSgmbWhpX3Bk
ZXYtPmhlYWx0aF9jaGVja190aW1lcik7Cj4gCj4gCWNhbmNlbF93b3JrX3N5bmMoJm1oaV9wZGV2
LT5yZWNvdmVyeV93b3JrKTsKPkBAIC0xNjc5LDcgKzE2NzksNyBAQCBzdGF0aWMgaW50IF9fbWF5
YmVfdW51c2VkIG1oaV9wY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+IAl9
Cj4gCj4gCS8qIFJlc3VtZSBoZWFsdGggY2hlY2sgKi8KPi0JaWYgKHBkZXYtPmlzX3BoeXNmbikK
PisJaWYgKCFwZGV2LT5pc192aXJ0Zm4pCj4gCQltb2RfdGltZXIoJm1oaV9wZGV2LT5oZWFsdGhf
Y2hlY2tfdGltZXIsIGppZmZpZXMgKyBIRUFMVEhfQ0hFQ0tfUEVSSU9EKTsKPiAKPiAJLyogSXQg
Y2FuIGJlIGEgcmVtb3RlIHdha2V1cCAobm8gbWhpIHJ1bnRpbWVfZ2V0KSwgdXBkYXRlIGFjY2Vz
cyB0aW1lICovCj4tLSAKPjIuNTEuMAoKVGVzdGVkLWJ5OiBTbGFyayBYaWFvIDxzbGFya194aWFv
QDE2My5jb20+CgpUZXN0IHJlc3VsdCBpcyBleHBlY3RlZCBub3cgd2l0aCB0aGVzZSBjaGFuZ2Vz
LgpCVFcsIHNoYWxsIHdlIGFkZCB0aGlzIGNoYW5nZXMgaW50byBzdGFibGUgdmVyc2lvbj8gU2lu
Y2Uga2VybmVsIDYuMTggYW5kIDcuMCAgaGF2ZSBiZWVuIGFmZmVjdGVkLgoKVGhhbmtz

