Return-Path: <linux-arm-msm+bounces-112475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0cZdM7NpKWq/WQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:42:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A998669D9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="U BD94fU";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112475-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112475-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7478330330C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB18409E0F;
	Wed, 10 Jun 2026 13:32:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CE40B38D;
	Wed, 10 Jun 2026 13:32:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098338; cv=none; b=nYdjPS4ob1ZDtp2O9TfIs/AYQMsFSNDuCcLlAjwHR1F7us85hArm+/+P4XLkY4E5vFtX6g3nhiIy1lEmJmw/rroD90iEu8xwWfBoA7JCvRhsMrmH9p+H+3CUW6MnAW4kj/5DW+Qju+PkwDx4c8PmHIcJz17uCgiWQdaG/yzShD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098338; c=relaxed/simple;
	bh=GDueoNOR0Gv19HvxBu/9Lx2vEf5PdMPDk+r3vyyw1/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=DlUv4uT458MOrp1bMtlBwD/7KM4oBKI3w1Z8p8i+/gupvpGueSiz+tVKOlu3BalGfhbbbg/6wfhqNszSgnVGv1+ruZXhQ2QoT9ZOBypJjtNISHm5VfKDO0G9DtY+Cv3pUOyB0ODgONV7pKzcum5KeBhHj31cFwVAY1b4JF73YU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UBD94fUv; arc=none smtp.client-ip=117.135.210.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=GDueoNOR0Gv19HvxBu/9Lx2vEf5PdMPDk+r3vyyw1/I=; b=U
	BD94fUv/adJBOb6PBaXiJyVdXuylVMTKdXvQ3GDpn2Vkoj2ucyBTFGm8qdEv2Cpx
	IJgCvpwDJZxBAuqfi5wFG31DQnbP7teXthKASWo4ujBh7eb6tU9cvPe2QlTyYgH/
	1SOAaZov3p9OHZF6wOfhTPX0hJsYNTRPHIyNZZ6swQ=
Received: from ks002278$163.com ( [101.241.83.252] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Wed, 10 Jun 2026 21:31:47 +0800
 (CST)
Date: Wed, 10 Jun 2026 21:31:47 +0800 (CST)
From: "thomas.kuang" <ks002278@163.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [alsa-devel] [BUG] Lenovo ThinkBook 16 G7 QOY (Snapdragon X)
 - No soundcards detected
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <0a578098-7003-4048-9c29-affb632c44c9@oss.qualcomm.com>
References: <5fc3ab80.a3e2.19ea717f09f.Coremail.ks002278@163.com>
 <3c28dd62-223c-4447-8cec-c7c527aa49e3@oss.qualcomm.com>
 <5c57153a.79.19eae7e2814.Coremail.ks002278@163.com>
 <0a578098-7003-4048-9c29-affb632c44c9@oss.qualcomm.com>
X-NTES-SC: AL_Qu2TA/ySt0sr4SaaZukcnEgSg+g2WMS1vvkv24BUc+sEqBvX3hwKeG9dNlnW9u+2Kj6xsD6YWj5Fz/9oRplS5bvBRoOdYSWhdbFTo5L5fA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6aac2e60.9b61.19eb1bb6031.Coremail.ks002278@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD3nxpDZylq28IGAA--.5737W
X-CM-SenderInfo: dnvqijqsxyqiywtou0bp/xtbC-wPOb2opZ0PFswAA3M
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:alsa-devel@alsa-project.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ks002278@163.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-112475-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ks002278@163.com,linux-arm-msm@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A998669D9F

Cgp3aGVuIHJ1bsKgCnN1ZG8gc2ggLWMgJ2VjaG8gInN0YXJ0IiA+IC9zeXMvY2xhc3MvcmVtb3Rl
cHJvYy9yZW1vdGVwcm9jMC9zdGF0ZScKc3VkbyBzaCAtYyAnZWNobyAic3RhcnQiID4gL3N5cy9j
bGFzcy9yZW1vdGVwcm9jL3JlbW90ZXByb2MxL3N0YXRlJwoKCmRtZXNnIGlzIGZvbGxvd2luZzoK
wqAgNjI1LjkyOTI2NV0gcmVtb3RlcHJvYyByZW1vdGVwcm9jMDogcG93ZXJpbmcgdXAgYWRzcApb
wqAgNjI1LjkyOTI5Nl0gcmVtb3RlcHJvYyByZW1vdGVwcm9jMDogRGlyZWN0IGZpcm13YXJlIGxv
YWQgZm9yIHFjb20veDFwNDIxMDAvTEVOT1ZPLzIxTkgvcWNhZHNwODM4MC5tYm4gZmFpbGVkIHdp
dGggZXJyb3IgLTIKW8KgIDYyNS45MjkyOTldIHJlbW90ZXByb2MgcmVtb3RlcHJvYzA6IHJlcXVl
c3RfZmlybXdhcmUgZmFpbGVkOiAtMgpbwqAgNjI1LjkyOTMwMl0gcmVtb3RlcHJvYyByZW1vdGVw
cm9jMDogQm9vdCBmYWlsZWQ6IC0yClvCoCA2MjUuOTM2NTI5XSByZW1vdGVwcm9jIHJlbW90ZXBy
b2MxOiBwb3dlcmluZyB1cCBjZHNwClvCoCA2MjUuOTM2NTUyXSByZW1vdGVwcm9jIHJlbW90ZXBy
b2MxOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgcWNvbS94MXA0MjEwMC9MRU5PVk8vMjFOSC9x
Y2Nkc3A4MzgwLm1ibiBmYWlsZWQgd2l0aCBlcnJvciAtMgpbwqAgNjI1LjkzNjU1NV0gcmVtb3Rl
cHJvYyByZW1vdGVwcm9jMTogcmVxdWVzdF9maXJtd2FyZSBmYWlsZWQ6IC0yClvCoCA2MjUuOTM2
NTU3XSByZW1vdGVwcm9jIHJlbW90ZXByb2MxOiBCb290IGZhaWxlZDogLTIKCgoKCgoKCgoKCgoK
CkF0IDIwMjYtMDYtMTAgMTg6MzI6NDMsICJLb25yYWQgRHliY2lvIiA8a29ucmFkLmR5YmNpb0Bv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPk9uIDYvMTAvMjYgMTI6MjYgQU0sIHRob21hcy5rdWFu
ZyB3cm90ZToKPj4gCj4+IAo+PiBncmVwIF4gL3N5cy9jbGFzcy9yZW1vdGVwcm9jLyovc3RhdGUK
Pj4gL3N5cy9jbGFzcy9yZW1vdGVwcm9jL3JlbW90ZXByb2MwL3N0YXRlOm9mZmxpbmUKPj4gL3N5
cy9jbGFzcy9yZW1vdGVwcm9jL3JlbW90ZXByb2MxL3N0YXRlOm9mZmxpbmUKPj4gCj4+IAo+PiBn
cmVwIF4gL3N5cy9jbGFzcy9yZW1vdGVwcm9jLyovbmFtZQo+PiAvc3lzL2NsYXNzL3JlbW90ZXBy
b2MvcmVtb3RlcHJvYzAvbmFtZTphZHNwCj4+IC9zeXMvY2xhc3MvcmVtb3RlcHJvYy9yZW1vdGVw
cm9jMS9uYW1lOmNkc3AKPgo+VHJ5IHdyaXRpbmcgc3RhcnQgaW50byA+IC9zdGF0ZQo+Cj5UaGlz
IHdpbGwgYXR0ZW1wdCB0byBwb3dlciBvbiB0aGUgRFNQcywgbW9zdCBpbXBvcnRhbnRseSB0aGUg
QSh1ZGlvKURTUAo+d2hpY2ggaXMgbmVjZXNzYXJ5IGZvciBhdWRpbyB0byB3b3JrLiBJZiB0aGF0
IGZhaWxzLCBjaGVjayBkbWVzZyBhcyB5b3UKPm1heSBiZSBtaXNzaW5nIHNvbWUgZmlybXdhcmUg
ZmlsZXMuCj4KPktvbnJhZAo=

