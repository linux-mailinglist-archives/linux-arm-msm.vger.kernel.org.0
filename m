Return-Path: <linux-arm-msm+bounces-100648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANZXMcDkyWlC3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:49:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A460354E0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A3DA305BFC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 02:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D33C3624AD;
	Mon, 30 Mar 2026 02:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JfEwIaS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5026B2AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774838736; cv=none; b=d3iTZAeTAGqdYI7aH1szeRgwxbrG2UhT0erpUAOU2J9Pwg9FdgwIN6qyErcyMWg5U5qSX6iWb0PynwCO58VBTvJmlFh0ijsST7n7JXRgd9/2Z4itWN/WHuJzcmngqtISgJByMseaMKqn44IxRBvFDKxcvd1KXjgmI9q5dJKkY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774838736; c=relaxed/simple;
	bh=hzSBYit9qZnPD7feHFTIOYziKX/RZuYt9j5wE1aHdyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttfXptQsxoFSwzmh02XrP9kjEjx2VFUG2qc88tkraxCvJ/OSPnHhw/WG7YIP+vq6vyQI2d1Id1slBZvKvhp+AJccdVTdZ+WOa7jizLy+9fbe2Zdnz7pIcY7GwsgsdO5RzCDQ/VBkN1CrVjOB6nJQ/B0Zp8DUYhAKmmHMrAb2NZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JfEwIaS4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so1952657a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 19:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774838734; x=1775443534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTRJOtJ1gG9zCwdZmXKBoohjNlbRVVuD9cptQY2hS7A=;
        b=JfEwIaS4R6rj5ozG7ll1D9DxjTc/TBOyUOn8NX1oIH9e6twZHG3FT5CizAioLRxc1r
         H1+Y8Ff/Oz3WeIk+vn5qhKqtniAVOyliYWnZSUMJ2d6n+Ce4OTdAMoyE7GVHC6Hdg1OM
         dQj8qIfsaoTNmtrNXSrtkbngrTNu7EYazbH1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774838734; x=1775443534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTRJOtJ1gG9zCwdZmXKBoohjNlbRVVuD9cptQY2hS7A=;
        b=e8dVAwqp8ieuKlhpgDxzd/k3S5shXdi+fMC1d3b4WNBsVKcrGKqao/ixwBjaLu+xrs
         1AHfVyvHofTw866wkqgDNFm6yuhH6k0H+5zT94XNSNXDSAonFSQg5L0cOeGblt5m2WXO
         YTAUT6aijtuZ+hTgNTbmQYEz0OU0vxcGptr3Bfh8+6v5yjmkLaiWAibEMdvk+L171yNn
         Vbg/wTZgRF28QJCjC/4arNAGurQCe8sGQLcdNFfklOp5Pr2FSzvHgzhqaBtFkpPs/Rin
         D4CmMq9RskNvirsinn0trB2XSGQzkU8JiOXX4uiaL9pWDugCh5eXxNVud1j1ojqWNLjz
         fPww==
X-Forwarded-Encrypted: i=1; AJvYcCX3dUrpELpz1NhuiOC9bnguauPsHPfmVLbflUvuwbfWUbVgb8IFujFHYeTicBVnwk1W7dV5msdIOl+o3npg@vger.kernel.org
X-Gm-Message-State: AOJu0YzzQr8yaSI6FL8w/2EV3EpCZHy53wQqQ8AfS9j2ElFjui65T1hF
	gh0CxGF+lGxH1U0SCPJBPp9eWC0YmrN8vvSGLk+VPBrJHOh5ywvlhwNtFqxtUHBgrA==
X-Gm-Gg: ATEYQzzN0IGm58kNDHyiAE8nQXYAFyYXf5OiBtqwJpoKQg6t0HUli0Xo+xI8LKe8MSw
	2OAtSJ9AiLxi9evwaMLrrvI2/+0DSIUMWCaXKk3JtolYWWWgPj56MMCq9CbcfvFUf6ETHttumpk
	v4xAT3ugzrMVfcbCnxqqUvQmI8kHBA4KNYiyx/0nEnsCVnj3RF2dfDK3mOrZVMDKY7a4sQvqA5V
	Zxivojbfn3TfJWBpPt3kpyroKYjCj5uuZPiBO6GpQPuKlNsHrkENih6zy05IZEoKTicPlGe7pbX
	c3hMHHLsBRyfwwZDAVu5y5Cf5Xa+7h7bOdJOagGAFnZZR3cxe+Z5UBUFJkgw/sahzX6OJud//Tv
	jYsO5pIOZFbgd9lFrImLUrVM0fRKPtNAI0ATbjIyMOx+gFOQ7t9IlFJIgOZPZuXeYtupQPNx4pC
	S2vGsL+EpCyT8N5LAdKlNNfi9vFlagVIvJqRNI1fsjnFYXiDoyHGZur0Xo0nTVLE0=
X-Received: by 2002:a17:903:8c5:b0:2b2:5070:8b with SMTP id d9443c01a7336-2b250700333mr22961915ad.1.1774838734076;
        Sun, 29 Mar 2026 19:45:34 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:2f8f:d84f:5e73:9f26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642b43sm77400775ad.9.2026.03.29.19.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:45:33 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:45:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Message-ID: <acnjoXzAOZrU72Zq@google.com>
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
 <acSRDNA8fCP7qAFJ@google.com>
 <fe3177bd-a3d2-4c0a-ab6f-9752eaf32fc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe3177bd-a3d2-4c0a-ab6f-9752eaf32fc4@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100648-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[chromium.org,poorly.run,kernel.org,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: 2A460354E0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On (26/03/27 05:47), Akhil P Oommen wrote:
> On 3/26/2026 7:24 AM, Sergey Senozhatsky wrote:
> > On (26/01/27 16:33), Sergey Senozhatsky wrote:
> >> We sometimes get into a situtation where GPU hangcheck fails to
> >> recover GPU:
> >>
> >> [..]
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
> >> [..]
> >>
> >> The problem is that msm_job worker is blocked on gpu->lock
> >>
> >> INFO: task ring0:155 blocked for more than 122 seconds.
> >> Not tainted 6.6.99-08727-gaac38b365d2c #1
> >> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
> >> Call trace:
> >> __switch_to+0x108/0x208
> >> schedule+0x544/0x11f0
> >> schedule_preempt_disabled+0x30/0x50
> >> __mutex_lock_common+0x410/0x850
> >> __mutex_lock_slowpath+0x28/0x40
> >> mutex_lock+0x5c/0x90
> >> msm_job_run+0x9c/0x140
> >> drm_sched_main+0x514/0x938
> >> kthread+0x114/0x138
> >> ret_from_fork+0x10/0x20
> >>
> >> which is owned by recover worker, which is waiting for DMA fences
> >> from a memory reclaim path, under the very same gpu->lock
> 
> I am still thinking if there is a better way to handle this. Btw, Rob
> had a few fixes related to this area recently. Do you think those would
> help in this scenario?

If you can point me to those fixes then I can take a look.

