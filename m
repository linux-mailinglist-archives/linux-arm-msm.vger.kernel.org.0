Return-Path: <linux-arm-msm+bounces-111857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fg45CnevJmqjbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:03:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E30B655F09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:03:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="W C0TrYS";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111857-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111857-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 891F8300A39C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 11:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9417370D4C;
	Mon,  8 Jun 2026 11:57:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5532B370AFD;
	Mon,  8 Jun 2026 11:57:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919844; cv=none; b=cD4KnQLm7XqOtC+iqPuzL0SnsOxmxThulB9UKsowL7HJOwRcegxyNBKSPRr7dCRNF5TsAjJjceDVzOk/BJ4JGT3UrHv+S7m4gzOxT++U9NGnp6hUENvM2QkZ1vwliGGC2woVhZXmjQE5jkhNPT+MzIZQTezHVndvb+a3eXlGTZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919844; c=relaxed/simple;
	bh=PkBSbhQ7a1CxArVHmV4k7bkJzO93k39ayAPKZYMvb5Q=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=UEYoHogoeMAb7uz6Ib9SCf0wPSYz+5IOXAg+KZyZK3TtAB0c4VWO61wwY8QT2nitL0KBmrGJIQMTjNxtIKq4F48OHeYc6fS9mp430TTNXKcEf3yXTZkUkcFIlfis/vS0QanJDqRoHwS7wBQwMDeW57XFZpOk57V3SibdseWpstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WC0TrYS/; arc=none smtp.client-ip=117.135.210.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PkBSbhQ7a1CxArVHmV4k7bkJzO93k39ayAPKZYMvb5Q=; b=W
	C0TrYS/xgExvJtBsLyLGGVdXf2Ec+NGUt9kEBD5/Hw/2cw5okt633VZaC/l585uR
	wnfWp+sc72rUbuAlkrdxyzXe+d2tQAHaywICaW3M11L/LHkPnPPs6StuQqJNGO4y
	L6nuK7eb/41V9oP0bk9iU0HRNcznaauJrgfAeLdH7o=
Received: from ks002278$163.com ( [101.241.83.252] ) by
 ajax-webmail-wmsvr-40-109 (Coremail) ; Mon, 8 Jun 2026 19:57:04 +0800 (CST)
Date: Mon, 8 Jun 2026 19:57:04 +0800 (CST)
From: "thomas.kuang" <ks002278@163.com>
To: alsa-devel@alsa-project.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [BUG] Lenovo ThinkBook 16 G7 QOY (Snapdragon X) - No
 soundcards detected
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TAvWatkAp4iWbYOkcnEobges3WcG2uP8m1Ydfc+IEmx3o+SI7XEdRNkXX4s2FMg+cjT22fQZj0cRRXoJjSOXh2tFUJ6GADdwCGZq5Wg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5fc3ab80.a3e2.19ea717f09f.Coremail.ks002278@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bSgvCgDnL58QriZqyykFAA--.632W
X-CM-SenderInfo: dnvqijqsxyqiywtou0bp/xtbDABDTdGomrhD3BAAA32
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111857-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alsa-devel@alsa-project.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ks002278@163.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ks002278@163.com,linux-arm-msm@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,8.auto:url,6.auto:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E30B655F09

CgpIYXJkd2FyZTogTGVub3ZvIFRoaW5rQm9vayAxNiBHNyBRT1kgKFF1YWxjb21tIFNuYXBkcmFn
b24gWCAvIFggUGx1cyAvIFggRWxpdGUpCktlcm5lbCB2ZXJzaW9uOiA3LjAuMC0yMi1nZW5lcmlj
IChVYnVudHUgMjYuMDQgTFRTKQpBcmNoaXRlY3R1cmU6IGFhcmNoNjQKClByb2JsZW0gRGVzY3Jp
cHRpb246Ci0tLS0tLS0tLS0tLS0tLS0tLS0KQXVkaW8gaXMgbm90IHdvcmtpbmcgb24gdGhpcyBT
bmFwZHJhZ29uIFgtYmFzZWQgbGFwdG9wLiBUaGUgc3lzdGVtIGZhaWxzIHRvIGRldGVjdCBhbnkg
c291bmRjYXJkcywKZXZlbiB0aG91Z2ggdGhlIFF1YWxjb21tIGF1ZGlvIGRyaXZlciBtb2R1bGVz
IGFyZSBsb2FkZWQuCgpTeW1wdG9tczoKLS0tLS0tLS0tCi0gYGFwbGF5IC1sYCBzaG93czogIm5v
IHNvdW5kY2FyZHMgZm91bmQuLi4iCi0gYGNhdCAvcHJvYy9hc291bmQvY2FyZHNgIHNob3dzOiAi
LS0tIG5vIHNvdW5kY2FyZHMgLS0tIgotIGAvZGV2L3NuZC9gIG9ubHkgY29udGFpbnMgc2VxIGFu
ZCB0aW1lciBkZXZpY2VzLCBubyBwY20gZGV2aWNlcwoKUmVsZXZhbnQgU3lzdGVtIEluZm9ybWF0
aW9uOgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgokIHVuYW1lIC1hCkxpbnV4IGtzLVRo
aW5rQm9vay0xNi1HNy1RT1kgNy4wLjAtMjItZ2VuZXJpYyAjMjItVWJ1bnR1IFNNUCBQUkVFTVBU
X0RZTkFNSUMgTW9uIE1heSAyNSAxNTozNzo0OSBVVEMgMjAyNiBhYXJjaDY0IEdOVS9MaW51eAoK
JCBjYXQgL3Byb2MvdmVyc2lvbgpMaW51eCB2ZXJzaW9uIDcuMC4wLTIyLWdlbmVyaWMgKGJ1aWxk
ZEBib3MwMy1hcm02NC0wODMpIChhYXJjaDY0LWxpbnV4LWdudS1nY2MgKFVidW50dSAxNS4yLjAt
MTZ1YnVudHUxKSAxNS4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzIGZvciBVYnVudHUpIDIuNDYp
ICMyMi1VYnVudHUgU01QIFBSRUVNUFRfRFlOQU1JQyBNb24gTWF5IDI1IDE1OjM3OjQ5IFVUQyAy
MDI2CgokIGNhdCAvc3lzL2RldmljZXMvdmlydHVhbC9kbWkvaWQvcHJvZHVjdF9uYW1lCjIxTkgK
CiQgY2F0IC9zeXMvZGV2aWNlcy92aXJ0dWFsL2RtaS9pZC9wcm9kdWN0X3ZlcnNpb24KVGhpbmtC
b29rIDE2IEc3IFFPWQoKJCBjYXQgL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZG1pL2lkL3N5c192ZW5k
b3IKTEVOT1ZPCgpMb2FkZWQgQXVkaW8gTW9kdWxlczoKLS0tLS0tLS0tLS0tLS0tLS0tLS0KJCBs
c21vZCB8IGdyZXAgLWkgcWNvbSB8IGdyZXAgLWkgc291bmQKc25kX3NvY19xY29tX3Nkd8KgIMKg
IMKgIMKgIDEyMjg4wqAgMSBzbmRfc29jX3gxZTgwMTAwCnNuZF9zb2NfcWNvbV9jb21tb27CoCDC
oCDCoDE2Mzg0wqAgMSBzbmRfc29jX3gxZTgwMTAwCnNvdW5kd2lyZV9xY29twqAgwqAgwqAgwqAg
wqAgMzY4NjTCoCAwCgokIGxzbW9kIHwgZ3JlcCBzbmRfc29jX3gxZTgwMTAwCnNuZF9zb2NfeDFl
ODAxMDDCoCDCoCDCoCDCoCAxNjM4NMKgIDAKClBsYXRmb3JtIERldmljZXM6Ci0tLS0tLS0tLS0t
LS0tLS0tCiQgbHMgL3N5cy9idXMvcGxhdGZvcm0vZGV2aWNlcy8gfCBncmVwIGF1ZGlvCmF1ZGlv
LWNvZGVjCmhkbWktYXVkaW8tY29kZWMuNi5hdXRvCmhkbWktYXVkaW8tY29kZWMuNy5hdXRvCmhk
bWktYXVkaW8tY29kZWMuOC5hdXRvCgpQaXBlV2lyZSBTdGF0dXM6Ci0tLS0tLS0tLS0tLS0tLS0K
4pePIHBpcGV3aXJlLnNlcnZpY2UgLSBQaXBlV2lyZSBNdWx0aW1lZGlhIFNlcnZpY2UKwqAgwqAg
wqBMb2FkZWQ6IGxvYWRlZCAoL3Vzci9saWIvc3lzdGVtZC91c2VyL3BpcGV3aXJlLnNlcnZpY2U7
IGVuYWJsZWQ7IHByZXNldDogZW5hYmxlZCkKwqAgwqAgwqBBY3RpdmU6IGFjdGl2ZSAocnVubmlu
Zykgc2luY2UgTW9uIDIwMjYtMDYtMDggMTg6NDA6NTAgQ1NUOyAzMG1pbiBhZ28KCuKXjyBwaXBl
d2lyZS1wdWxzZS5zZXJ2aWNlIC0gUGlwZVdpcmUgUHVsc2VBdWRpbwrCoCDCoCDCoExvYWRlZDog
bG9hZGVkICgvdXNyL2xpYi9zeXN0ZW1kL3VzZXIvcGlwZXdpcmUtcHVsc2Uuc2VydmljZTsgZW5h
YmxlZDsgcHJlc2V0OiBlbmFibGVkKQrCoCDCoCDCoEFjdGl2ZTogYWN0aXZlIChydW5uaW5nKSBz
aW5jZSBNb24gMjAyNi0wNi0wOCAxODo0MDo1MCBDU1Q7IDMwbWluIGFnbwoK4pePIHdpcmVwbHVt
YmVyLnNlcnZpY2UgLSBNdWx0aW1lZGlhIFNlcnZpY2UgU2Vzc2lvbiBNYW5hZ2VyCsKgIMKgIMKg
TG9hZGVkOiBsb2FkZWQgKC91c3IvbGliL3N5c3RlbWQvdXNlci93aXJlcGx1bWJlci5zZXJ2aWNl
OyBlbmFibGVkOyBwcmVzZXQ6IGVuYWJsZWQpCsKgIMKgIMKgQWN0aXZlOiBhY3RpdmUgKHJ1bm5p
bmcpIHNpbmNlIE1vbiAyMDI2LTA2LTA4IDE4OjQwOjUwIENTVDsgMzBtaW4gYWdvCgpBZGRpdGlv
bmFsIE5vdGVzOgotLS0tLS0tLS0tLS0tLS0tLQpUaGlzIGFwcGVhcnMgdG8gYmUgc2ltaWxhciB0
byBpc3N1ZXMgcmVwb3J0ZWQgb24gb3RoZXIgU25hcGRyYWdvbiBYIEVsaXRlIGRldmljZXMKKERl
bGwgTGF0aXR1ZGUgNzQ1NSwgRGVsbCBYUFMgMTMgOTM0NSkuIFRoZSBhdWRpbyBkcml2ZXIgbW9k
dWxlcyBsb2FkIGNvcnJlY3RseSwKYnV0IHRoZSBzb3VuZCBjYXJkIHJlZ2lzdHJhdGlvbiBmYWls
cy4KCkEgd29ya2Fyb3VuZCBtZW50aW9uZWQgaW4gY29tbXVuaXR5IGRpc2N1c3Npb25zIGlzIHRv
IGFkZDoKwqAgc25kLXNvYy14MWU4MDEwMC5pX2FjY2VwdF90aGVfZGFuZ2VyPTEKdG8gdGhlIGtl
cm5lbCBjb21tYW5kIGxpbmUsIHdoaWNoIHN1Z2dlc3RzIHRoaXMgbWF5IGJlIHJlbGF0ZWQgdG8g
c3BlYWtlcgpwcm90ZWN0aW9uIG1lY2hhbmlzbXMgbm90IGJlaW5nIGZ1bGx5IGltcGxlbWVudGVk
IGZvciB0aGlzIHBsYXRmb3JtLgoKQW55IGhlbHAgb3IgZ3VpZGFuY2Ugd291bGQgYmUgZ3JlYXRs
eSBhcHByZWNpYXRlZC4KCkJlc3QgcmVnYXJkcywKdGhvbWFzLmt1YW5nCgo=

