Return-Path: <linux-arm-msm+bounces-118444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uwLwI5InUmrvMgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 13:22:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50A7415F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 13:22:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=unisoc.com header.s=default header.b=Tsud9637;
	dmarc=pass (policy=quarantine) header.from=unisoc.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118444-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118444-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D464D301A3AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 11:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE013BB9E3;
	Sat, 11 Jul 2026 11:22:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4CC30F938;
	Sat, 11 Jul 2026 11:22:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783768975; cv=none; b=VtyMrh0cXCGFaLTSVjUkRSChiwqzFOGj+QfIDRIaFhRNO+th9cXj+cFm/XaCxOBs1voSzORMG6FpFRk9MXNakElNa0NnLj1+ii6JDM735VLkBFem/PP2i8CHwSozvSAh5UZKuZfaBBJPd9XBBfglLzwT1yEMdI7iePv1crEXqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783768975; c=relaxed/simple;
	bh=D0dwrnSmOBKFI/0heE7SKN6tSLsYQ71yibQoUv3B/yM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M4ilcS2GTvNP3Aje/2s4Rhf0OHCTnCqPkYDydlLxiK0KwGCkVhaglyQo6rgwuDxbk2JKH5ydd/fwr3vbwrEzORteuEv0XO7m1kcThwWxPGbCgXFRYUVPev0EuSlSRPEqm+lFRPeyrIcnrKUSAA/vNdaZDA+h41itPrXtJrRsdLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=Tsud9637; arc=none smtp.client-ip=222.66.158.135
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTPS id 66BBLSuf006507
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 11 Jul 2026 19:21:28 +0800 (+08)
	(envelope-from kui.sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (zeshmbx09.spreadtrum.com [10.29.3.107])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4gy5qL5npcz2PXf5R;
	Sat, 11 Jul 2026 19:21:02 +0800 (CST)
Received: from zeshmbx08.spreadtrum.com (10.29.3.106) by
 zeshmbx09.spreadtrum.com (10.29.3.107) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Sat, 11 Jul 2026 19:21:26 +0800
Received: from zeshmbx08.spreadtrum.com ([fe80::e01e:2441:3a50:dadb]) by
 zeshmbx08.spreadtrum.com ([fe80::e01e:2441:3a50:dadb%17]) with mapi id
 15.00.1497.048; Sat, 11 Jul 2026 19:21:26 +0800
From: =?utf-8?B?5a2Z6a2BIChLdWkgU3VuKQ==?= <kui.sun@unisoc.com>
To: "'Bart Van Assche'" <bvanassche@acm.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "Avri
 Altman" <avri.altman@wdc.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        "andre.draszik@linaro.org"
	<andre.draszik@linaro.org>
CC: Peter Griffin <peter.griffin@linaro.org>,
        Tudor Ambarus
	<tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "kernel-team@android.com"
	<kernel-team@android.com>,
        "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>,
        "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org"
	<stable@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        =?utf-8?B?5byg5aaC5rOJIChSYWluIFpoYW5nKQ==?=
	<Rain.Zhang@unisoc.com>,
        "cixi.geng@linux.dev" <cixi.geng@linux.dev>,
        =?utf-8?B?5ZSQ5pyI5p6XIChZdWVsaW4gVGFuZyk=?= <yuelin.tang@unisoc.com>,
        =?utf-8?B?6ZmI5paH6LaFIChXZW5jaGFvIENoZW4p?= <Wenchao.Chen@unisoc.com>,
        =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Subject: =?utf-8?B?562U5aSNOiBbUkZDXSBTaWduaWZpY2FudCBSYW5kb20gSS9PIFBlcmZvcm1h?=
 =?utf-8?B?bmNlIFJlZ3Jlc3Npb24gaW4gTGludXggS2VybmVsIDYuMTggKFVwIHRvIDI3?=
 =?utf-8?Q?.7%)_Likely_Caused_by_Commit_3c7ac40d7322?=
Thread-Topic: [RFC] Significant Random I/O Performance Regression in Linux
 Kernel 6.18 (Up to 27.7%) Likely Caused by Commit 3c7ac40d7322
Thread-Index: Ad0PYz14eL5yCSXkTdewaVgxWTlWPgA1fqOAADuDkfA=
Date: Sat, 11 Jul 2026 11:21:26 +0000
Message-ID: <7863f3e51a8e4d52acdd24a6aea9cf5f@zeshmbx08.spreadtrum.com>
References: <12a8417dc8644a71b9cb25c53c93805a@zeshmbx08.spreadtrum.com>
 <d426b4d5-cdf5-4090-8e94-62e652f712dc@acm.org>
In-Reply-To: <d426b4d5-cdf5-4090-8e94-62e652f712dc@acm.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:SHSQR01.spreadtrum.com 66BBLSuf006507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1783768894;
	bh=D0dwrnSmOBKFI/0heE7SKN6tSLsYQ71yibQoUv3B/yM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Tsud9637hXldYBRVZtnzlyGuVje6EnMmzmwqtyW7eCY6iunWo1/QpxhyzuQed7c+b
	 1MzD23C+0iLNeYPkYCe2N1UUwN+Z/FIhtj5+L9TWsIk55hpvrPC/eK1c7H/SQK8ZFk
	 nAsPiQwC45ojsp6vF6zE0wtCI6riMkbKzrIenthuGwFpxq5jgNkP0Y3fDVEx6RO+aA
	 NiDXZNzCPoyCATMvnD3lfeIEcEgxvJfh1L2qr/EPHGSqj+xQCs0OFMMn6Gko0Ehmtw
	 PWYn5wOuSSl+l7QLVRpc1UfY1wmMSxPvlyo19cMHPe78kD98U+CrAtmqYYCoJ1ce4Q
	 oC+xUX/dakAuw==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[unisoc.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[unisoc.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118444-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:neil.armstrong@linaro.org,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:andre.draszik@linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:willmcvicker@google.com,m:mani@kernel.org,m:kernel-team@android.com,m:linux-samsung-soc@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Rain.Zhang@unisoc.com,m:cixi.geng@linux.dev,m:yuelin.tang@unisoc.com,m:Wenchao.Chen@unisoc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kui.sun@unisoc.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[unisoc.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kui.sun@unisoc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C50A7415F1

V2UgaGF2ZSBhbHJlYWR5IGluY2x1ZGVkIHRoZXNlIHR3byBmaXhlcywgd2hpY2ggYXJlIHJlbGF0
ZWQgdG8gc3RhYmlsaXR5LiBUaGUgaXNzdWUgd2UncmUgZW5jb3VudGVyaW5nIGlzIHBlcmZvcm1h
bmNlLXJlbGF0ZWQNCg0KVGhhbmsgWW91Lg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hk
u7bkuro6IEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPiANCuWPkemAgeaXtumX
tDogMjAyNuW5tDfmnIgxMOaXpSAyMjo1Ng0K5pS25Lu25Lq6OiDlrZnprYEgKEt1aSBTdW4pIDxr
dWkuc3VuQHVuaXNvYy5jb20+OyBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZz47IEFsaW0gQWtodGFyIDxhbGltLmFraHRhckBzYW1zdW5nLmNvbT47IEF2cmkgQWx0bWFu
IDxhdnJpLmFsdG1hbkB3ZGMuY29tPjsgSmFtZXMgRS5KLiBCb3R0b21sZXkgPEphbWVzLkJvdHRv
bWxleUBIYW5zZW5QYXJ0bmVyc2hpcC5jb20+OyBNYXJ0aW4gSy4gUGV0ZXJzZW4gPG1hcnRpbi5w
ZXRlcnNlbkBvcmFjbGUuY29tPjsgYW5kcmUuZHJhc3ppa0BsaW5hcm8ub3JnDQrmioTpgIE6IFBl
dGVyIEdyaWZmaW4gPHBldGVyLmdyaWZmaW5AbGluYXJvLm9yZz47IFR1ZG9yIEFtYmFydXMgPHR1
ZG9yLmFtYmFydXNAbGluYXJvLm9yZz47IFdpbGwgTWNWaWNrZXIgPHdpbGxtY3ZpY2tlckBnb29n
bGUuY29tPjsgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+OyBrZXJuZWwt
dGVhbUBhbmRyb2lkLmNvbTsgbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1zY3NpQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgc3Rh
YmxlQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IOW8oOWm
guaziSAoUmFpbiBaaGFuZykgPFJhaW4uWmhhbmdAdW5pc29jLmNvbT47IGNpeGkuZ2VuZ0BsaW51
eC5kZXY7IOWUkOaciOaelyAoWXVlbGluIFRhbmcpIDx5dWVsaW4udGFuZ0B1bmlzb2MuY29tPjsg
6ZmI5paH6LaFIChXZW5jaGFvIENoZW4pIDxXZW5jaGFvLkNoZW5AdW5pc29jLmNvbT47IEFuZHLD
qSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+DQrkuLvpopg6IFJlOiBbUkZDXSBT
aWduaWZpY2FudCBSYW5kb20gSS9PIFBlcmZvcm1hbmNlIFJlZ3Jlc3Npb24gaW4gTGludXggS2Vy
bmVsIDYuMTggKFVwIHRvIDI3LjclKSBMaWtlbHkgQ2F1c2VkIGJ5IENvbW1pdCAzYzdhYzQwZDcz
MjINCg0KDQrms6jmhI86IOi/meWwgemCruS7tuadpeiHquS6juWklumDqOOAgumZpOmdnuS9oOeh
ruWumumCruS7tuWGheWuueWuieWFqO+8jOWQpuWImeS4jeimgeeCueWHu+S7u+S9lemTvuaOpeWS
jOmZhOS7tuOAgg0KQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBv
ZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUuDQoNCg0KDQpPbiA3LzEwLzI2IDEyOjE3IEFNLCDlrZnprYEgKEt1aSBTdW4pIHdyb3Rl
Og0KPiBUaHJvdWdoIGludmVzdGlnYXRpb24sIHdlIGlkZW50aWZpZWQgdGhhdCB1cHN0cmVhbSBj
b21taXQgDQo+IDNjN2FjNDBkNzMyMjMyZmVjMGJhMzFkMGE1ZTNjYzljMTEyZmMyZTcsIG1lcmdl
ZCBpbiBBcHJpbCAyMDI1LCBpcyANCj4gbGlrZWx5IHJlc3BvbnNpYmxlIGZvciB0aGlzIHBlcmZv
cm1hbmNlIGRyb3AuDQpUd28gZml4ZXMgZm9yIHRoYXQgY29tbWl0IGFyZSBwcmVzZW50IGluIHRo
ZSB1cHN0cmVhbSBrZXJuZWwuIEFyZSB0aGVzZSBmaXhlcyBwcmVzZW50IGluIHlvdXIga2VybmVs
IHRyZWU/DQoNCmNvbW1pdCBlYWJjYWM4MDhjYTNlZTk4NzgyMjNkNGI0OWI3NTA5NzkwMjkwMTZi
DQpBdXRob3I6IEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPg0KRGF0ZTogICBG
cmkgQXVnIDE1IDA4OjU4OjIzIDIwMjUgLTA3MDANCg0KICAgICBzY3NpOiB1ZnM6IGNvcmU6IEZp
eCBJUlEgbG9jayBpbnZlcnNpb24gZm9yIHRoZSBTQ1NJIGhvc3QgbG9jaw0KDQpjb21taXQgMDM0
ZDMxOWM4ODk5ZThjNWMwYTM1YzY2OTJjN2ZjN2U4YzEyYzM3NA0KQXV0aG9yOiBOaXRpbiBSYXdh
dCA8cXVpY19uaXRpcmF3YUBxdWljaW5jLmNvbT4NCkRhdGU6ICAgVHVlIEp1bCAyOSAwNDoyNzox
MSAyMDI1ICswNTMwDQoNCiAgICAgc2NzaTogdWZzOiBjb3JlOiBGaXggaW50ZXJydXB0IGhhbmRs
aW5nIGZvciBNQ1EgTW9kZQ0KDQpUaGFua3MsDQoNCkJhcnQuDQo=

