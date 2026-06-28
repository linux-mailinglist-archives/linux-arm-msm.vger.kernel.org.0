Return-Path: <linux-arm-msm+bounces-114747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VwXUNULZQGq1igkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 10:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0E6D3685
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 10:20:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=JWA1eYym;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3A8C30137BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 08:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CC535C180;
	Sun, 28 Jun 2026 08:20:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.ms.icloud.com (ms-2001a-snip4-10.eps.apple.com [57.103.73.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A12F12AC
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 08:20:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782634816; cv=none; b=bMDuUphfdJyMt/2+DwYnnYmYkWvec19uk2SfAop705MBgeA06asR7yxGgvlWEsKjlx2VPFcCA50sG9FE+nxPddOOH9SuBvagwqA4rZ2LbTz2mfIzEjeB29t9sjnPNMcPGiIUvZtsRUAMwEBujH852Ac0McWrtFzC2rNvbh4f6Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782634816; c=relaxed/simple;
	bh=JviAdiTcfJz6vFjriNcDql9o5ZTpCJWP1L7bjRa/mBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Te81DEdKpoRyZylG28AKhdh+onwlTsbPYUMse4TQvQfZL6KjOmAm8fU+lx5nvKtUN9FCmRJfOo35KFhWFIK8tsiDmJDxlrHxSQqbzeyHZFI17In9umMbPUJLUyk4aqnft37tRf7lUL6u+SkgZER8S586am+OY11FAldQqjpfcHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=JWA1eYym; arc=none smtp.client-ip=57.103.73.140
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-2 (Postfix) with ESMTPS id 6FE661800119;
	Sun, 28 Jun 2026 08:20:10 +0000 (UTC)
X-ICL-RepId: 019f0d50-8ef8-79fa-856c-26c0afb4d977
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VfAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICUABXQdeHEQJSABbGlofHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782634813; x=1785226813; bh=05LtDJ7uose52mBQuiXJ1gLnRqMC+6RHFILJocNhOKg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=JWA1eYymP39XsFWcMR1l/c+Td3CO+gDJXukoHEfQKbO+7cabbioc/nOfc7+86usAJnaA6Z8ZGRBkpdW+L9KV5gh46uG1za2ajUh6Ez79ZgGNwYvmboELu9KsZG3j/21IPPsRpirgNybBJO/BGqV6iJpAU+TKAM6vbB+7fdSwX/gNuirpXbTK8pifGuv/51ii2Mmct6PGS88wE67g9XJtKYvMLkWeHSJCW4QRc2wxy4ZM8vKxVO/e9t43qNA0IpnhMsoKsjZDKGsC9bMLuE8mUbUxgD0oxEeAOg27IoI3KsrkLdjAYSRBVvmJs6Sn3TtNqjeTi9YWQg1yPSIQcwzzhg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-2 (Postfix) with ESMTPSA id A5F0B18000BF;
	Sun, 28 Jun 2026 08:20:09 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@etehtsea.me,
	robh@kernel.org
Subject: Re: [PATCH v3 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Sun, 28 Jun 2026 15:20:05 +0700
Message-ID: <20260628082005.40036-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2aed327e-abf6-401a-a05b-ba3f4a5cd7f3@oss.qualcomm.com>
References: <2aed327e-abf6-401a-a05b-ba3f4a5cd7f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k3FwEiC6k7yhXrZ_868bX7Mp-FtWOOFa
X-Proofpoint-ORIG-GUID: k3FwEiC6k7yhXrZ_868bX7Mp-FtWOOFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDA3MSBTYWx0ZWRfX31sRqHAIgEC7
 uN5zEyXWkTZN1CuncnbIGuhkjpr0HKAciGg9VfJ88OPwABSktDOZ4WeG8RsVWMpxrBM54Z9/CVd
 lLCilGKDS4OoBbD06/lT08kgl7G3g1k3QwQchrcfNmd8fBVwGsqB95X/tPDJTAgZQQfrpWf5mr0
 gJ+tCSY91euatEB5OHGUt9TRs3AaVB0GJHiy9Ibl+MMYMuun5g0M5vgLXHsud1T0PHjoLbIycSX
 vFaZPQL35DE8pMMcp0PPXGDRs/H/gYg2BzmB+cCGjjNHCklE8yCu4tJIKIL0KuPh+ien+BUyQG4
 tFKYTfISpeD4fzU60iF
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-114747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mail@etehtsea.me,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,etehtsea.me:dkim,etehtsea.me:mid,etehtsea.me:from_mime,linux-hardware.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31D0E6D3685

On Wed, 24 Jun 2026 14:10:10 +0200, Konrad Dybcio wrote:
>> +&iris {
>> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";
>
> Is that a model name, or a placeholder?
Yes, this is a model name (Intel variant of this laptop has MRA-XXX [1]).

[1]: https://linux-hardware.org/?view=computers&type=notebook&vendor=HONOR&model=MRA-XXX

