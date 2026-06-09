Return-Path: <linux-arm-msm+bounces-112275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HUfvIgyUKGrwGQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:30:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 744A166495B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:30:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="S V5mNrV";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112275-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112275-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 891413040595
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 22:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230EF3F6C2A;
	Tue,  9 Jun 2026 22:26:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879130C629;
	Tue,  9 Jun 2026 22:26:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043984; cv=none; b=HOY3gXHXbKZ5wq52JV/4XZkMeZO7CPzcH40F4N68e36qnv02yP9E9aSv3zafFIN92Xrb6nTQFnovmOeYXBPD+bP8zPG/TTJWFyBcJiJPSsvfl7jcYCz4UlFwrxiDkjw+qFmWOgz7+NiANmGSHwAgg2rEoE1j2Ji/dCj6GhcTnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043984; c=relaxed/simple;
	bh=HWm4DkF3Mf2TnZuAPa4kEWhAGOf7Lxd7r5damhMUGjw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ub6bjT255mJJ1eal14Gda/gW47SrFv1nZmZUGVgBQAAmXbVHIFMQy7CwVeBlrNiUMUKYm2ASNKU39psZLSEKF3e3mPdWbb96+D2UTz4ZfezsA/LWFhe1eenkQNzjpS/c6YnAZIceFQFP/Hjb/Az64E/EwEJJyYakvd3eSVtFirA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SV5mNrVT; arc=none smtp.client-ip=220.197.31.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HWm4DkF3Mf2TnZuAPa4kEWhAGOf7Lxd7r5damhMUGjw=; b=S
	V5mNrVTz0OyfcOauMuuAAxlMSj207aPSaghXY5Ynk6yCnnA14q79q4W7L3lU2gd3
	9cxSpEXFOoe4F7fpcpz8M140YmkbUIDEu3MlIuz0NeaVMQPlbt7MpZImgbA5Dz6i
	sUPz1yhrSUTOBaX/lEXDTK1r8TpWqx3ptVNLwLxGwk=
Received: from ks002278$163.com ( [101.241.83.252] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Wed, 10 Jun 2026 06:26:03 +0800
 (CST)
Date: Wed, 10 Jun 2026 06:26:03 +0800 (CST)
From: "thomas.kuang" <ks002278@163.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [alsa-devel] [BUG] Lenovo ThinkBook 16 G7 QOY (Snapdragon X)
 - No soundcards detected
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <3c28dd62-223c-4447-8cec-c7c527aa49e3@oss.qualcomm.com>
References: <5fc3ab80.a3e2.19ea717f09f.Coremail.ks002278@163.com>
 <3c28dd62-223c-4447-8cec-c7c527aa49e3@oss.qualcomm.com>
X-NTES-SC: AL_Qu2TA/yfvEEt5SmZZukcnEgSg+g2WMS1vvkv24BUc/oEmCf/wAcGX1RuNGXK3v2GMQKqjDetTiBQ+v10batH8oWFFgzNAFQTaGHtxX4F6g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5c57153a.79.19eae7e2814.Coremail.ks002278@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cigvCgD3d0H8kihq9gQGAA--.37W
X-CM-SenderInfo: dnvqijqsxyqiywtou0bp/xtbC-xuHKGookvu12gAA3P
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:alsa-devel@alsa-project.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ks002278@163.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112275-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ks002278@163.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 744A166495B

CgpncmVwIF4gL3N5cy9jbGFzcy9yZW1vdGVwcm9jLyovc3RhdGUKL3N5cy9jbGFzcy9yZW1vdGVw
cm9jL3JlbW90ZXByb2MwL3N0YXRlOm9mZmxpbmUKL3N5cy9jbGFzcy9yZW1vdGVwcm9jL3JlbW90
ZXByb2MxL3N0YXRlOm9mZmxpbmUKCgpncmVwIF4gL3N5cy9jbGFzcy9yZW1vdGVwcm9jLyovbmFt
ZQovc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzAvbmFtZTphZHNwCi9zeXMvY2xhc3Mv
cmVtb3RlcHJvYy9yZW1vdGVwcm9jMS9uYW1lOmNkc3AKCgoKCgoKCgoKCgpBdCAyMDI2LTA2LTA5
IDE3OjI0OjU3LCAiS29ucmFkIER5YmNpbyIgPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj5PbiA2LzgvMjYgMTo1NyBQTSwgdGhvbWFzLmt1YW5nIHdyb3RlOgo+PiAKPj4g
Cj4+IEhhcmR3YXJlOiBMZW5vdm8gVGhpbmtCb29rIDE2IEc3IFFPWSAoUXVhbGNvbW0gU25hcGRy
YWdvbiBYIC8gWCBQbHVzIC8gWCBFbGl0ZSkKPj4gS2VybmVsIHZlcnNpb246IDcuMC4wLTIyLWdl
bmVyaWMgKFVidW50dSAyNi4wNCBMVFMpCj4+IEFyY2hpdGVjdHVyZTogYWFyY2g2NAo+PiAKPj4g
UHJvYmxlbSBEZXNjcmlwdGlvbjoKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBBdWRpbyBpcyBu
b3Qgd29ya2luZyBvbiB0aGlzIFNuYXBkcmFnb24gWC1iYXNlZCBsYXB0b3AuIFRoZSBzeXN0ZW0g
ZmFpbHMgdG8gZGV0ZWN0IGFueSBzb3VuZGNhcmRzLAo+PiBldmVuIHRob3VnaCB0aGUgUXVhbGNv
bW0gYXVkaW8gZHJpdmVyIG1vZHVsZXMgYXJlIGxvYWRlZC4KPgo+UGxlYXNlIHBvc3QgdGhlIG91
dHB1dCBvZgo+Cj5ncmVwIF4gL3N5cy9jbGFzcy9yZW1vdGVwcm9jLyovc3RhdGUKPmdyZXAgXiAv
c3lzL2NsYXNzL3JlbW90ZXByb2MvKi9uYW1lCj4KPktvbnJhZAo=

