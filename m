Return-Path: <linux-arm-msm+bounces-115802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KvseHa6CRWp3BQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 23:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F36F1C3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 23:12:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VOQerWQO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115802-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115802-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D30CF30465EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 21:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524C339BFEF;
	Wed,  1 Jul 2026 21:07:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A49A3148D3;
	Wed,  1 Jul 2026 21:07:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940055; cv=none; b=LIRFdQdrVGvlixRwJaSC81eM65orW2jYXzeRBuuVOnUaGimbJNqE90RNgylcTlmc0Z2G7KkcbDekvG2ub41ofP8Ue2T1nBoFctU3ZDxkL7m+ViPWEVCi0Y5Q1jg/ZfMaLsANePPrQ/K6oo0r9ITxvIo8ejBuw+IVTHlb7ICnO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940055; c=relaxed/simple;
	bh=Se619ilXFmnOD4vsuJEgr+1gTZlFx7k0OJ2EzEelEWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fRyJvfE2U88F22mvQTeSvsPhNyh+/vo066ABGbFKGPVfoRYwpBgyrLOLOX5J0p1+sx81hWj1hRaE/KtSf79RepcOrpH9REs+OtYEl8OJJUhTKfhOLF07/OFxRH1K75MjKh1482HY18vaS3ziCUhtJ15OrU677mDrCgiMTTZc380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOQerWQO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3171F1F000E9;
	Wed,  1 Jul 2026 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782940053;
	bh=cHw32tRK3AgkBd4BhJ4E2eTb3oeKdtreyLog08NiLw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VOQerWQO/pRBRiZJukB8yjpLQAtaUtF2v7SFJSjcZhJYuCROjyMAn76g/IxW0dnS9
	 MDFK+K/nvksLyGUEwnuSOMPenKs3zNzEN07WcouGoqMo77FllAthOMP7HCWso5/hkv
	 7cNSceWycX3EaWFSTPI9rP7blbgbLpl028p/tK/v1K0TJYTex04F5JV1cbHRBUX3/C
	 3+N+hbGCcck/sdHUqLI7+ShClMH7Qu/5+0Wl6qzfp5SdTm9qHaw5+eMyk6t+oExg9T
	 edMWyQ5GfPmSKhZfpsov3phP+UyJ2WlAB823obbaTT/TKe4rM/oFsQLlukishckqn9
	 BpsMzKo8t+/Bw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abel Vesa <abelvesa@kernel.org>, Junrui Luo <moonafterrain@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
 stable@vger.kernel.org
In-Reply-To: <SYBPR01MB78817DBE3397783540CE3372AF122@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB78817DBE3397783540CE3372AF122@SYBPR01MB7881.ausprd01.prod.outlook.com>
Subject: Re: [PATCH] misc: fastrpc: take fl->lock when moving mmaps on
 interrupted invoke
Message-Id: <178294005196.13032.14515168616227927407.b4-ty@kernel.org>
Date: Wed, 01 Jul 2026 22:07:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115802-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:moonafterrain@outlook.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:danisjiang@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[qti.qualcomm.com,arndb.de,linuxfoundation.org,kernel.org,outlook.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51F36F1C3D


On Tue, 02 Jun 2026 13:29:58 +0800, Junrui Luo wrote:
> When an invoke is interrupted by a signal,
> wait_for_completion_interruptible() returns -ERESTARTSYS and
> fastrpc_internal_invoke() moves every buffer from fl->mmaps onto
> cctx->invoke_interrupted_mmaps. This list_del()/list_add_tail() walk
> runs without holding fl->lock, the lock that serialises fl->mmaps in
> fastrpc_req_mmap() and fastrpc_req_munmap() everywhere else.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: take fl->lock when moving mmaps on interrupted invoke
      commit: fbb084ef5f984af90aa56fa063d278a54e677cf9

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


