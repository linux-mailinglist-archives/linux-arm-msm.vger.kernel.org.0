Return-Path: <linux-arm-msm+bounces-91572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIELLqNugWkrGQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 04:42:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20928D431B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 04:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB07302BE28
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 03:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B229B2C17B6;
	Tue,  3 Feb 2026 03:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B/iVhpB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453892AD10
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 03:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770090144; cv=none; b=Jg2IYwTF6NZw6WzrUe9hRZfe/tBuZZH+P1n1uWoUbOr2N9SZvayvZAbKhQ5BHm5M1OQTjlxBJTDq/r127SPePDS91EXEAN3ytpPHNzlVbWmVSkSCgXekeHlAnFOUq94PL9f+2Fk71R8Mx43+SA0MTu7DxP0lHTu79+FwHCKEDNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770090144; c=relaxed/simple;
	bh=T4cAPVKw6gvlUdTL2zRYEKv+vfVpSUYHPsEeSSPkaFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyDQnCuNfZ9Z2hNCSeIysb48mpREqXA3Tn4sFFNV6iDtxRgASSnOaJiiD3wwwJBu8XYpO1jpHs2FQMqSq9GHqiKSKiDkhrvfgQxStssQzwkBA8iIp/J3D95DXrxTYOyW5hI68oA0IbSQF+bQgIwbFrMbDNPtLkOFpUi2uw+KvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B/iVhpB1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so4370004a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 19:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770090143; x=1770694943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQQ9Yn0qN8mFWXLqjsawjzfjPTO4eluX+BjJlD5wAq0=;
        b=B/iVhpB1ZXMB6SrD+pGiHiKDHjP3CWn9r11OW2L3hMgRXMzdOSGYDnaihTPCqyCkEs
         Ek9MCdrSfRaN11ZOyZp/sldQhyzEuDh0iAJE38lsESzArLFFL02azHvRIxHLYfdYtuP+
         w9DwpM4IFHtQ9aOu+3BcdBcIQPsP/3gkQCZhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770090143; x=1770694943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQQ9Yn0qN8mFWXLqjsawjzfjPTO4eluX+BjJlD5wAq0=;
        b=AiOax84EMstqDNCqhB/6bKax2QMFGlzHpe/Q1CP+OqM4mFfjwQ0C6gGaWozMFxM4wW
         Ie+fAzfxMcQyI/iUPt1LmZlB89aw8Txv0IT5B5w61Z0B+r05gaayVcETJJdfkdXAbaiX
         wzaTgfSjZqWEQk0U4LgJA0/vzi8saxVNJV6nswb6fIeyYw01+Pbh1Me/zh49xNn3dYNT
         aQk7Ti/p+h+S8saRsv5TqBU5Z/mLHMNxiHkOODwlwnKj5mW6cARQ8vbM1Uw6HdGCXyEj
         EpdSqIiwOh//4Cot3FL9NjByjM6MOL5voHkiCks5Cvwtv/+vZHdDbzi7VV+Jy8CYmkLm
         a2mg==
X-Forwarded-Encrypted: i=1; AJvYcCUNTFCjItQoRwbaTRWocoCvrCwI7bijY5paA8p9ajRZNEUcPeTyzAp64SuV64PPnKCfKloMJKB3ZM3RiULK@vger.kernel.org
X-Gm-Message-State: AOJu0YyL5YNNkFYvqh4LNhi2RkH+bnw2wLiPbbz1RZ07QzjvIgp4r7k/
	Nu9lyjFiEZ3vLvlIQBduzBmpcvW+8qpFSxjN8w2zQFGoFNULc6qM1qJkn5Hsu2qbFw==
X-Gm-Gg: AZuq6aLB+5hOZoRHDPUitntBNWXvXgB9PUZz8obb5vXEQT6mifLCqdzR15ESGF+Ax3L
	hyL6dhBj9toqhaBm6TID5aJT4jJaQpk0cQigRyLv26qGik/b+GedFV3tGu6Rmql4z/iX2ZkeDbu
	W9Ub5U/6R6I/nxv36dCvvrih6a3eziBqF+53qRDrT09gJoS6vm5HCjKIro448B7hlIkCPCRtM1o
	DCoSmlTeaxhXYasU5SPOY3TVbGYH4c/Z9IDRGOLRoeK2/5wOew8mgCqOkb6YOUSfR4Gfv+CoPwC
	gFsXcoeqbgLuvpsYEigjjOxJTpN7jXSOgoZPi5ipcYdoKmHrKxxwF0vNThm2xCebtI6wmk0ZnrV
	vFAh7OBa0rYVT1HhgxDitP4icJm9jyz6mwGAC7KdLhwLhCY5ysBAA7AdxNZuvof6NRs48fcEl3O
	6xS7bVIn/4jaFTiwwSsqhnvnt2Y+7lXu0QnqcTPDtwsp02l4mU9w==
X-Received: by 2002:a17:90b:4a4e:b0:340:d578:f299 with SMTP id 98e67ed59e1d1-3543b2dcba2mr12892974a91.3.1770090142638;
        Mon, 02 Feb 2026 19:42:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad8e:5863:2270:6d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b10364csm342726a91.10.2026.02.02.19.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 19:42:22 -0800 (PST)
Date: Tue, 3 Feb 2026 12:42:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Message-ID: <nbk32ecg6wgdghnsr4amj5wufk4t7pavbsuqjvc6ulychjr6jh@zyyrzqbjes4i>
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127073341.2862078-1-senozhatsky@chromium.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91572-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20928D431B
X-Rspamd-Action: no action

On (26/01/27 16:33), Sergey Senozhatsky wrote:
> We sometimes get into a situtation where GPU hangcheck fails to
> recover GPU:
> 
> [..]
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
> [..]
> 
> The problem is that msm_job worker is blocked on gpu->lock
> 
> INFO: task ring0:155 blocked for more than 122 seconds.
> Not tainted 6.6.99-08727-gaac38b365d2c #1
> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_preempt_disabled+0x30/0x50
> __mutex_lock_common+0x410/0x850
> __mutex_lock_slowpath+0x28/0x40
> mutex_lock+0x5c/0x90
> msm_job_run+0x9c/0x140
> drm_sched_main+0x514/0x938
> kthread+0x114/0x138
> ret_from_fork+0x10/0x20
> 
> which is owned by recover worker, which is waiting for DMA fences
> from a memory reclaim path, under the very same gpu->lock
> 
> INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
> task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_timeout+0x1f8/0x770
> dma_fence_default_wait+0x108/0x218
> dma_fence_wait_timeout+0x6c/0x1c0
> dma_resv_wait_timeout+0xe4/0x118
> active_purge+0x34/0x98
> drm_gem_lru_scan+0x1d0/0x388
> msm_gem_shrinker_scan+0x1cc/0x2e8
> shrink_slab+0x228/0x478
> shrink_node+0x380/0x730
> try_to_free_pages+0x204/0x510
> __alloc_pages_direct_reclaim+0x90/0x158
> __alloc_pages_slowpath+0x1d4/0x4a0
> __alloc_pages+0x9f0/0xc88
> vm_area_alloc_pages+0x17c/0x260
> __vmalloc_node_range+0x1c0/0x420
> kvmalloc_node+0xe8/0x108
> msm_gpu_crashstate_capture+0x1e4/0x280
> recover_worker+0x1c0/0x638
> kthread_worker_fn+0x150/0x2d8
> kthread+0x114/0x138
> 
> So no one can make any further progress.
> 
> Forbid recover/fault worker to enter memory reclaim (under
> gpu->lock) to address this deadlock scenario.

Gentle ping.

