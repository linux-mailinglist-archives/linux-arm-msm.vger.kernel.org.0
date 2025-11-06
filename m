Return-Path: <linux-arm-msm+bounces-80639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CBC3C76A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 17:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E0AC3B5633
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 16:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D1134FF47;
	Thu,  6 Nov 2025 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mzt4NnbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BE734F47D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446282; cv=none; b=qivGBF0aGstKkOiGlAb8hC3uSn1F5+2IbgKaV3DMNdTNEmO0YUZwqEir68SPJ4mXZzwc1Wu9G/tV/egi3JmXZOUyzdGCm2bacyaJL4TkSh5YUf34zv2BdvrFObDDr/BIzkSdXu2sl+rbUuPxcS59gZgEGlBYMwZEGb0b4FZJSDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446282; c=relaxed/simple;
	bh=xADnaFf2inaVuBhL68l73ZAxXKGsKVM/VjEgoo9Ej7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LZ1VlXJSKGPrgrh4APlocP5bdcX6a6ttUaOt9jFgT6PiINR8MoMIH68E7zZcWGcoPu/L1Ux2yW7ePmIp7fkQx89x9Y7NsOHvUDyZThvzZNUH5LSmDLgRZ7HY1WzOiTeHsYJNTKWm1200F3GBT7E3MADSt+BEzsbWeRyDZbkGGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mzt4NnbL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47112a73785so7822675e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762446279; x=1763051079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v4fzZKX6HwGk5jmCYacn5w6aEzndQSk37nIk3p7Gbek=;
        b=Mzt4NnbL/jX/hKyuG13nYIvgAvGn0PxHLmvhTX1RAhnPz+4/f4X98mvR2ORy+xC2Kc
         VD762Plgv+XMgKuHxSkBvOrRk11bKPWu1M/KcSi3PY6uujnqrNA8cACJrEmcMTxyCkWU
         5LxNvMYyz1YRldElX12kvF1Z4D33REUT2c36wsTLU0Uhw0xCpk00HrXmF1XygkViYFWU
         wfTIRPrGdDvVOwLBsHy6ExaGo9WJe1SIAJjmETSJBqJcWMtOnqLvKhobRTi/coImsvKH
         +qPvOx/vd75sj2G9TLP+lDKnj0ciaABjgTUyeAEnaftL7ZKo/xtlbdo/IyH9m4n8KHHL
         fYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446279; x=1763051079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4fzZKX6HwGk5jmCYacn5w6aEzndQSk37nIk3p7Gbek=;
        b=B9crmZR4nDjFLxIWVtSs0+P1xhZsWpCT8XGXivnIjsGS7KomMtY6m4afTk5l+Lhj19
         nBeg2IrALdv9g1CCD7yfLDRayPfGil6Ro4ZLf4qel8lGudhHsRjKhbDUJeB47qUhTYwY
         +MDnMFFqMmcW2dwmf4ElPF7sha4wNderSXv+Ms1x0RFZQrfV2FwUjI75NSomBxcMSa9W
         h9NPfROFb9LZHBzc8wyWUeYGGE5BCXcZe1Vn7UBXqduWfec3FAdLGu4lsFX9ByrEJ9TS
         D6evuFCSBuYiPEu0IOc65bd5RvlexdNDbPPgrYJdR+Gsm57rQO11PxLhMNciRRuBrTwR
         jq7g==
X-Forwarded-Encrypted: i=1; AJvYcCUOZdi1QY316r8vxoNuwtSS+Bzf4abQF+to2mK6VbP9gGo0H2vsFKNxAQuouzYBbaOWRoj1qo6LJBW6jzzu@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuNeAP/75pDQuTMWHv/23mMT1q20GZQosGKMeQtWVV7xa7+KW
	kRs0LJknx/0WvG+XKZ/IY1BddyyEiH2t22ia7KA3RWnMLRE173CZ+TQh8OMBgneyaBMjnUKZfgj
	w06UW
X-Gm-Gg: ASbGncshgqPG93BL0SmDKg1k18/iCnCNLbtcU4XgbmZmQZnJRyPI9rzr5bnR3uisMSn
	bmismihfuFxJO8RRzX4v4YLzvJ3Ly+xAeNoL2TPAyXkaXF4rI8iqmbef4idaKnp/3Luzee0z1uD
	0BQGRxbbBvBTmUPSW3nb/fmHtit+bRQKDyDPZ/sKkvcPYTHb0aXG6ASr1PpcSomSdq104LSdzk7
	zdGF9ZOKHtGTUbuuQ9I9cVG0zSWKwqrzusPm6sD+tsjGZRquRxxiBRYtf3WJVrm9/eRMDaFvdA6
	45uOYRvA87TyqDYOtlRmF6mJDhOZVhdfXWskz/hMsisU9ox/Gvrk0q8iyLFWB5uUfqIkf8I0xWY
	gIkX4V3IMsnkiRug2KhTFvetoHt//sI8E2Yg8Fes7mX4b2Gk6ivNFMaJr9O5uj7IqMArfAH5R00
	Qz8mLM42+zq6CCeQYXlfX71CE=
X-Google-Smtp-Source: AGHT+IGtFn/HCR7L59DoJ3wukB4PCiJ3rzUEs+p33H3lMvfaNMCUEYWulil42PY5+vCfIaYpcI6mgQ==
X-Received: by 2002:a05:600c:1f85:b0:46e:3709:d88a with SMTP id 5b1f17b1804b1-4775ce15bebmr58402885e9.33.1762446279074;
        Thu, 06 Nov 2025 08:24:39 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477640fb723sm19305615e9.10.2025.11.06.08.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:24:38 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
Date: Thu,  6 Nov 2025 17:24:30 +0100
Message-ID: <20251106162430.328701-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdea24e92919..25dc5eec7dc4 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1494,7 +1494,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	INIT_WORK(&mhi_cntrl->cmd_ring_work, mhi_ep_cmd_ring_worker);
 	INIT_WORK(&mhi_cntrl->ch_ring_work, mhi_ep_ch_ring_worker);
 
-	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", 0, 0);
+	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", WQ_PERCPU, 0);
 	if (!mhi_cntrl->wq) {
 		ret = -ENOMEM;
 		goto err_destroy_ring_item_cache;
-- 
2.51.1


