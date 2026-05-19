Return-Path: <linux-arm-msm+bounces-108559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yATcKQ6LDGo1iwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:08:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B80581FB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9C1230FBC09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE292E2852;
	Tue, 19 May 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwrYU15d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E72D46B3;
	Tue, 19 May 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206525; cv=none; b=BI966oOeH9roxI8EIRXxbt3TQ8m6bRzPKTb3fTSrcJwLXqd5TQ71Dwj1dxddvn4GO1ySUeoT/BEkbf9F00MxnrRwM9sVMzYGb4PuMQrOihcCnOEXxGGTfjOyCHFLBDZddZ7nfRyDoPY0HlM9VCU6rS2QV+4YR6YzOk2e1Z+/wyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206525; c=relaxed/simple;
	bh=H6jZ26cdR6c1FE51+ZuaH/BzQgAqaYpLufrEPC0KbOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BVJzXXxkhxblbYSR8ovHjmESh2QVTGAA09WOLcYyVFAZ19aFhLhlO7Hep6SYHThP5re6P0HGwZEJwuj3ImNNtykVH5iSdgG+pANtDKGcYii9Wj0Bs3SQvdNJP4CN7TWg6VWcMro9FXkVZXaxok5Hf2tuyaapqbk2ZynmEa/ndCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwrYU15d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C6AC2BCB8;
	Tue, 19 May 2026 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206522;
	bh=H6jZ26cdR6c1FE51+ZuaH/BzQgAqaYpLufrEPC0KbOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GwrYU15dST8GtVPgjFaJ/IZ4FBZrSitau+ioN9iJ2dk1L9AYdwUb9uBYR+wlun/6r
	 xKAjq0WLhsZug2aqjVO7YE4QF/sgUmAFGyD9X2/UEwzvwTe+U3D3dQaaQGWnq35/wv
	 HdPNFVQHfnsrB4HsmdCKZeHUFKwAku8NviQcRh4CkXa7IpQeN431nrA+T2LWniQcis
	 P2peDayiGnVDTY0qXEAKxAma899THBPeEH6Mh825RI1hcaLNkGfE7Q2YNr8FGwix1k
	 O0SsWEc5f+lCWwLbfrZJxHK8MxT0Wnyh1T9JKAogtzL8y+NDOarmgqNj02Mug32hPa
	 9RYC81IKEqOSQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Junrui Luo <moonafterrain@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>
In-Reply-To: <SYBPR01MB78819393A1F4FA658B2AB076AF042@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB78819393A1F4FA658B2AB076AF042@SYBPR01MB7881.ausprd01.prod.outlook.com>
Subject: Re: [PATCH] misc: fastrpc: fix DMA address corruption due to
 find_vma misuse
Message-Id: <177920652114.51472.15795921379739203667.b4-ty@kernel.org>
Date: Tue, 19 May 2026 17:02:01 +0100
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108559-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qti.qualcomm.com,arndb.de,linuxfoundation.org,outlook.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 55B80581FB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 15 May 2026 17:16:03 +0800, Junrui Luo wrote:
> fastrpc_get_args() uses find_vma() to look up the VMA for a user-provided
> pointer and compute a DMA address offset. When the address falls in a gap
> before the returned VMA, (ptr & PAGE_MASK) - vma->vm_start underflows,
> corrupting the DMA address sent to the DSP.
> 
> Replace find_vma() with vma_lookup(), which returns NULL when the address
> is not contained within any VMA.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: fix DMA address corruption due to find_vma misuse
      commit: 03f669db42e9804f8e6f1e41dbe6dc1f22b7757c

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


