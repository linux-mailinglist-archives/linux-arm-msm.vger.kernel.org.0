Return-Path: <linux-arm-msm+bounces-118183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Isb0H0aeUGrz2QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:24:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C06A738042
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:24:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=unisoc.com header.s=default header.b=scKGTpym;
	dmarc=pass (policy=quarantine) header.from=unisoc.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118183-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118183-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A746F3040213
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0943CBE86;
	Fri, 10 Jul 2026 07:19:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E5D3C81B5;
	Fri, 10 Jul 2026 07:19:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667967; cv=none; b=hjwmV7G+rYVPi5k6zpNiTEYkC7uMCDOGiYZXv03oMsll1gebnOxb1gJzBWhXqbY0rZnmevsXnlwJ8/EDoj2mwsV1Y2+avF7U/apTOARAiTefiY5lyjARyk1+lxPED8/8WG/bKiA9TSp4MgHAjA7wORdQRejinkKlxrVmtKGwC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667967; c=relaxed/simple;
	bh=aj+YhqhvAVDzbO/TXfxyrU3L93cMoH8Vbqhkw68VZIQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=avdYL8Pl2e0AdZGKJ3a3NChTXSvJR/Y0FOyM9zA7xzQ81GVTNUREkjcqjRfah47WC8AMX7Y+JpC0YSs4QPCeeVDZPfXP0GD/rfv3L0ISfd7VFE/17jNjJqWcl+YwWC0ByNBBDnaELaofLgHhx5aEab03ftfZ3VyW+G4nd/N3R3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=scKGTpym; arc=none smtp.client-ip=222.66.158.135
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTPS id 66A7HltP096563
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 15:17:47 +0800 (+08)
	(envelope-from kui.sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx06.spreadtrum.com [10.0.1.11])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4gxNSh1gx2z2RsTBD;
	Fri, 10 Jul 2026 15:17:24 +0800 (CST)
Received: from zeshmbx08.spreadtrum.com (10.29.3.106) by
 shmbx06.spreadtrum.com (10.0.1.11) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Fri, 10 Jul 2026 15:17:46 +0800
Received: from zeshmbx08.spreadtrum.com ([fe80::e01e:2441:3a50:dadb]) by
 zeshmbx08.spreadtrum.com ([fe80::e01e:2441:3a50:dadb%17]) with mapi id
 15.00.1497.048; Fri, 10 Jul 2026 15:17:46 +0800
From: =?gb2312?B?y++//SAoS3VpIFN1bik=?= <kui.sun@unisoc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bart Van Assche
	<bvanassche@acm.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman
	<avri.altman@wdc.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "\"Martin K. Petersen\""
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
        =?gb2312?B?1cXI58iqIChSYWluIFpoYW5nKQ==?=
	<Rain.Zhang@unisoc.com>,
        "cixi.geng@linux.dev" <cixi.geng@linux.dev>,
        =?gb2312?B?zMbUwsHWIChZdWVsaW4gVGFuZyk=?= <yuelin.tang@unisoc.com>,
        =?gb2312?B?s8LOxLOsIChXZW5jaGFvIENoZW4p?= <Wenchao.Chen@unisoc.com>
Subject: [RFC] Significant Random I/O Performance Regression in Linux Kernel
 6.18 (Up to 27.7%) Likely Caused by Commit 3c7ac40d7322
Thread-Topic: [RFC] Significant Random I/O Performance Regression in Linux
 Kernel 6.18 (Up to 27.7%) Likely Caused by Commit 3c7ac40d7322
Thread-Index: Ad0PYz14eL5yCSXkTdewaVgxWTlWPg==
Date: Fri, 10 Jul 2026 07:17:45 +0000
Message-ID: <12a8417dc8644a71b9cb25c53c93805a@zeshmbx08.spreadtrum.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:SHSQR01.spreadtrum.com 66A7HltP096563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1783667888;
	bh=aj+YhqhvAVDzbO/TXfxyrU3L93cMoH8Vbqhkw68VZIQ=;
	h=From:To:CC:Subject:Date;
	b=scKGTpymxuuIT9wVstpWw7R/fTHsMpLVRjg5/J/r3Jwg2FrGV8BKxFCionqkMiUsi
	 Q8huleQlx11NAicH6pbDJEqKbo+fqYaEHSI2Zgrku8Bw6VfK7S7kN3kdbAUNILiazG
	 /rk/m99XS8LoE1ZE6nu0JGhiBBnBV+wKuU14Zbc7EOZv2sVh41Y/fLDcGhsdgTwI8H
	 d+bIGk89GXxqmHJkWmaqUsKvhaZaiOAExaQ/wzQxO++vwG8wOOOUc/jVeLOzfNa7VJ
	 8ihw9jDQa6qQFJQIJP87jEiG4QQ5mFrPDN4HZe9U0j507+nzF55USIK0APHdZNkLkP
	 VcqdK9SxXxf/Q==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[unisoc.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[unisoc.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118183-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:bvanassche@acm.org,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:andre.draszik@linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:willmcvicker@google.com,m:mani@kernel.org,m:kernel-team@android.com,m:linux-samsung-soc@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Rain.Zhang@unisoc.com,m:cixi.geng@linux.dev,m:yuelin.tang@unisoc.com,m:Wenchao.Chen@unisoc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zeshmbx08.spreadtrum.com:mid];
	FORGED_SENDER(0.00)[kui.sun@unisoc.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C06A738042

RGVhciBLZXJuZWwgTWFpbnRhaW5lcnMsDQoNCkR1cmluZyBvdXIgdXBncmFkZSBmcm9tIExpbnV4
IGtlcm5lbCA1LjE1IHRvIExpbnV4IGtlcm5lbCA2LjE4LCB3ZSBvYnNlcnZlZCBhIHNpZ25pZmlj
YW50IHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gaW4gcmFuZG9tIEkvTyB3b3JrbG9hZHOhqndpdGgg
YSBtYXhpbXVtIGRlZ3JhZGF0aW9uIG9mIDI3LjclLg0KVGhpcyBpc3N1ZSBpcyBwYXJ0aWN1bGFy
bHkgcHJvbm91bmNlZCBpbiBzaW5nbGUtdGhyZWFkZWQsIHNtYWxsLWJsb2NrIEkvTyBzY2VuYXJp
b3Ohow0KDQpUbyBpbGx1c3RyYXRlIHRoZSBpbXBhY3QsIHdlIGNvbmR1Y3RlZCBiZW5jaG1hcmsg
dGVzdHMgdXNpbmcgQW5UdVR1IG9uIFVuaXNvYyBUNjE1IGRldmljZXMuDQpUaGUgcmVzdWx0cyBh
cmUgc3VtbWFyaXplZCBiZWxvdzoNCg0KVGFibGUgIDGjulJhbmRvbSBSZWFkL1dyaXRlIFNwZWVk
IFNjb3Jlcw0KRGV2aWNlICBLZXJuZWwgVmVyc2lvbiAgVGVzdCAxICBUZXN0IDIgIFRlc3QgMyAg
QXZlcmFnZQ0KVDYxNSAgICA1LjE1ICAgICAgICAgICAgMjA5MDYgICAyMDUwOCAgIDIxMzYyICAg
MjA5MjUuMzMNClQ2MTUgICAgNi4xOCAgICAgICAgICAgIDIwMTY0ICAgMjExMDcgICAyMTA3NyAg
IDIwNzgyLjY3DQoNClRhYmxlICAyo7pNdWx0aS10aHJlYWRlZCBNaXhlZCBSYW5kb20gUmVhZC9X
cml0ZSBTY29yZXMNCkRldmljZSAgS2VybmVsIFZlcnNpb24gIFRlc3QgMSAgVGVzdCAyICBUZXN0
IDMgIEF2ZXJhZ2UNClQ2MTUgICAgNS4xNSAgICAgICAgICAgIDQ2NzAgICAgNDcwMSAgICA0NDU3
ICAgIDQ2MDkuMzMNClQ2MTUgICAgNi4xOCAgICAgICAgICAgIDQzMTEgICAgNDY5NyAgICA0NDcx
ICAgIDQ0OTMuMDANCg0KVGFibGUgICAzo7pNaXhlZCBSYW5kb20gUmVhZC9Xcml0ZSBTcGVlZCBT
Y29yZXOjqFNpbmdsZS10aHJlYWRlZKOpDQpEZXZpY2UgIEtlcm5lbCBWZXJzaW9uICBUZXN0IDEg
IFRlc3QgMiAgVGVzdCAzICBBdmVyYWdlDQpUNjE1ICAgIDUuMTUgICAgICAgICAgICAxODYwNCAg
IDE4MzE0ICAgMTc3MzIgICAxODIxNi42Nw0KVDYxNSAgICA2LjE4ICAgICAgICAgICAgMTMzNzIg
ICAxMzA4MSAgIDEzMDgxICAgMTMxNzguMDCjqKH9MjcuNjYlo6kNCg0KTm90YWJseSwgb25seSB0
aGUgc2luZ2xlLXRocmVhZGVkIHRlc3QgKFRhYmxlIDMpIHNob3dzIHNldmVyZSBkZWdyYWRhdGlv
biwgd2hpbGUgbXVsdGktdGhyZWFkZWQgdGVzdHMgZXhoaWJpdCBtaW5pbWFsIGNoYW5nZSAoPDMl
KS4NClRoaXMgc3Ryb25nbHkgc3VnZ2VzdHMgdGhlIHJlZ3Jlc3Npb24gaXMgdGllZCB0byBpbmNy
ZWFzZWQgcGVyLXJlcXVlc3Qgc2NoZWR1bGluZyBvciBpbnRlcnJ1cHQgb3ZlcmhlYWQgaW4gbG93
LWNvbmN1cnJlbmN5LCBzbWFsbC1ibG9jayAoZS5nLiwgNEtCKSBJL08gcGF0aHMuDQoNClJvb3Qg
Q2F1c2UgSWRlbnRpZmljYXRpb24NCg0KVGhyb3VnaCBpbnZlc3RpZ2F0aW9uLCB3ZSBpZGVudGlm
aWVkIHRoYXQgdXBzdHJlYW0gY29tbWl0IDNjN2FjNDBkNzMyMjMyZmVjMGJhMzFkMGE1ZTNjYzlj
MTEyZmMyZTcsIG1lcmdlZCBpbiBBcHJpbCAyMDI1LCBpcyBsaWtlbHkgcmVzcG9uc2libGUgZm9y
IHRoaXMgcGVyZm9ybWFuY2UgZHJvcC4NCkFmdGVyIGxvY2FsbHkgcmV2ZXJ0aW5nIHRoaXMgY29t
bWl0IG9uIGtlcm5lbCA2LjE4LCBwZXJmb3JtYW5jZSBmdWxseSByZWNvdmVyZWQ6DQoNClRhYmxl
IDSjuk1peGVkIFJhbmRvbSBSZWFkL1dyaXRlIFNwZWVkIFNjb3Jlc6OoQWZ0ZXIgUmV2ZXJ0o6kN
CkRldmljZSAgS2VybmVsIFZlcnNpb24gICAgICAgICAgICAgICAgICBUZXN0MSAgIFRlc3QyICAg
VGVzdDMgICBBdmVyYWdlDQpUNjE1ICAgIDUuMTUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAxODYwNCAgIDE4MzE0ICAgMTc3MzIgICAxODIxNi42Nw0KVDYxNSAgICA2LjE4ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDEzMzcyICAgMTMwODEgICAxMzA4MSAgIDEzMTc4LjAw
o6ih/TI3LjY2JaOpDQpUNjE1ICAgIDYuMTijqHJldmVydGVkIDNjN2FjNDApICAxODMxNCAgIDE4
NjA0ICAgMTg2MDQgICAxODUwNy4zMw0KDQpUZWNobmljYWwgQW5hbHlzaXMNCg0KV2UgYmVsaWV2
ZSB0aGUgY2hhbmdlIGludHJvZHVjZWQgYWRkaXRpb25hbCBpbnRlcnJ1cHQgb3Igc2NoZWR1bGlu
ZyBsYXRlbmN5Lg0KSW4gbXVsdGktdGhyZWFkZWQgd29ya2xvYWRzLCBhIHNpbmdsZSBpbnRlcnJ1
cHQgY2FuIHByb2Nlc3MgbXVsdGlwbGUgNEtCIHJlcXVlc3RzIChlLmcuLCA4IHJlcXVlc3RzKSwg
YW1vcnRpemluZyB0aGUgc2NoZWR1bGluZyBjb3N0IHRvIE0vOCBwZXIgcmVxdWVzdCAod2hlcmUg
TSBpcyB0aGUgdG90YWwgb3ZlcmhlYWQpLg0KSW4gY29udHJhc3QsIHNpbmdsZS10aHJlYWRlZCBJ
L08gaGFuZGxlcyBvbmx5IG9uZSByZXF1ZXN0IHBlciBpbnRlcnJ1cHQsIGluY3VycmluZyB0aGUg
ZnVsbCBjb3N0IE0gcGVyIG9wZXJhdGlvbi4NCkNvbnNlcXVlbnRseSwgc2luZ2xlLXRocmVhZGVk
IHNtYWxsIEkvTyBpcyBoaWdobHkgc2Vuc2l0aXZlIHRvIHN1Y2ggbGF0ZW5jeSBpbmNyZWFzZXMs
IGV4cGxhaW5pbmcgdGhlIGRpc3Byb3BvcnRpb25hdGUgaW1wYWN0IG9ic2VydmVkIGluIFRhYmxl
IDMuDQoNClJlcXVlc3QgYW5kIFJlY29tbWVuZGF0aW9ucw0KDQpHaXZlbiB0aGUgdGFuZ2libGUg
aW1wYWN0IG9uIG1vYmlsZSB1c2VyIGV4cGVyaWVuY2UsIHdlIGtpbmRseSByZXF1ZXN0IHRoZSBj
b21tdW5pdHkgdG86DQoxLiAgICAgIENvbnNpZGVyIHJldmVydGluZyBjb21taXQgM2M3YWM0MGQ3
MzIyMzJmZWMwYmEzMWQwYTVlM2NjOWMxMTJmYzJlNywgb3INCjIuICAgICAgUmUtZXZhbHVhdGUg
dGhlIHByb3Bvc2VkIGNoYW5nZSBpbiBsaWdodCBvZiBpdHMgZWZmZWN0IG9uIGxvdy1jb25jdXJy
ZW5jeSBJL08gcGF0aHMsIGFzIGRpc2N1c3NlZCBoZXJlOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC84OGQzMWEyNThmZWIzNjQyNWFkNzNkMDMyMzA3Nzk3MmY4NWY4MzQxLmNhbWVsQGxp
bmFyby5vcmcvDQozLCAgICAgIENvdWxkIHdlIGFkZCBhIGZsYWcgdG8gYWxsb3cgb3VyIFVGUyBk
cml2ZXIgdG8gY2hvb3NlIGJldHdlZW4gdXNpbmcgYW4gaW50ZXJydXB0IG9yIGFuIGludGVycnVw
dCB0aHJlYWQ/IFsxXQ0KDQpGdXJ0aGVybW9yZSwgd2UgcmVjb21tZW5kIHRoYXQgZnV0dXJlIGV2
YWx1YXRpb25zIG9mIHNpbWlsYXIgY2hhbmdlcyBpbmNsdWRlOg0KKiAgICAgICBTbWFsbC1ibG9j
ayAoZS5nLiwgNEtCIG9yIDhLQikgcmFuZG9tIHJlYWQvd3JpdGUgYmVuY2htYXJrcywgYW5kDQoq
ICAgICAgIFNpbmdsZS10aHJlYWRlZCB3b3JrbG9hZHMsDQphcyB0aGVzZSBhcmUgY3JpdGljYWwg
Zm9yIG1vYmlsZSBhbmQgZW1iZWRkZWQgc3lzdGVtcy4NCg0KV2UgYXBwcmVjaWF0ZSB5b3VyIGF0
dGVudGlvbiBhbmQgYXJlIGhhcHB5IHRvIHByb3ZpZGUgYWRkaXRpb25hbCBkYXRhIG9yIGFzc2lz
dCBpbiB2YWxpZGF0aW5nIHBvdGVudGlhbCBmaXhlcy4NCg0KWzFdOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1zY3NpLzIwMjYwNzEwMDY1OTQ4LjQ2NzUxNC0xLWt1aS5zdW5AdW5pc29j
LmNvbS9ULyN1DQo=

