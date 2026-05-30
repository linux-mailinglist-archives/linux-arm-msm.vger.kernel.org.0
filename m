Return-Path: <linux-arm-msm+bounces-110419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3qIWEKhEG2p5AgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:12:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A77AC6132FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D2B3300B754
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251421DFF0;
	Sat, 30 May 2026 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dttpqorZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A521C5F11
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 20:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171852; cv=none; b=fqKbxIqK0YPeYyl95zEWEbkajBVH1zn9bbJtwkzanl+hvuQq/E+JRPYWmBWPYjc4dpTVv2zohOwMYYE3Jol5p5AOFVtPpks3UK8aLxoUnbhYnw56ZJ4Yv05aYI3F28s+ybxuRyh9o+3Ayb+kagb+YhapBE4/quVMofhIOt34ZPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171852; c=relaxed/simple;
	bh=3xDTS1322lrLEPMiU3orYibIIsl9ZHe06oJriHz9rDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XMTtciSIfQyhFYfRyrirqqV3YdJnA9HHLPAliRrxfajpf7NSRaFNOYXBfsLeStF9n+ioA7NP3PqpLREWfIdm4MXJcyXH9XIk7v7czmuQKaSreMznE2pzkazWY49eXgCUV7m1o16mzgBc71F+uQ2HwmNm+TIj2wG/D4yx+eR2pF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dttpqorZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2114C1F00893;
	Sat, 30 May 2026 20:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780171850;
	bh=jqhF1houEFfXlUE4pT9KDW7+2l6mkrg5ApckXNQzUz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dttpqorZD4gxFaur8tpMC/1uVVtTps2SeCyMDeInTvJkvT9VEZ9rlHcK0Em17utrQ
	 wrTN+tsdgaQM1yg/YLTnIAosnMSxsLaXWaPP0sM7zGlEEbNbwVF0T6P+2yaCV7NQtN
	 oYGqnOY2SGg2sGs4sKLxQRiJhQ7Bot77KR+XU1nk1IM5kQ+dNSir19KrY6F1bGpVFF
	 mgzHETBZL/oVF9PYdLsZhlmbxhEPklsjIUfaMTRD6FcBABak+eNhkm1qy3CXxLiafZ
	 CPUIp8SBuCGjnAlG+mh6M5ifxnvSxWkDAxZ3fIrAlXczh1932XLJnZtqsuPH31pGBq
	 5wW/GfV4qgaRA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Zhenghang Xiao <kipreyyy@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
In-Reply-To: <20260526101343.44838-1-kipreyyy@gmail.com>
References: <20260526101343.44838-1-kipreyyy@gmail.com>
Subject: Re: [PATCH misc] misc: fastrpc: fix use-after-free race in
 fastrpc_map_create
Message-Id: <178017184983.12650.3587904335412115776.b4-ty@kernel.org>
Date: Sat, 30 May 2026 21:10:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110419-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qti.qualcomm.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A77AC6132FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 26 May 2026 18:13:43 +0800, Zhenghang Xiao wrote:
> fastrpc_map_lookup returns a raw pointer after releasing fl->lock. The
> caller fastrpc_map_create then calls fastrpc_map_get (kref_get_unless_zero)
> on this unprotected pointer. A concurrent MEM_UNMAP can free the map
> between the lock release and the kref operation, resulting in a
> use-after-free on the freed slab object.
> 
> Restore the take_ref parameter to fastrpc_map_lookup so the reference
> is acquired atomically under fl->lock before the pointer is exposed to
> the caller.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: fix use-after-free race in fastrpc_map_create
      commit: 052a0d88ef8f02128976db347112307c3bc4d1da

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


