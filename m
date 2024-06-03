Return-Path: <linux-arm-msm+bounces-21494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1489E8D8769
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 18:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 349081C215A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 16:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B33136995;
	Mon,  3 Jun 2024 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rJhXjDmZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE88060D
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717433047; cv=none; b=u/mYPEwKmi/9C2rnLpSkYns8Fw3bHkHwDpYCJOKyvCWluECXM3054eRMxMa56JI+fIZQPElshiI5pSfm6rrQX2PrANherObzEgsM3T/NcCfQix1JMamUq92VAPmR/pHGGdGOUDN1oMtFFeKnTAXepRuaiKL7ym4z4oto9Y+B9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717433047; c=relaxed/simple;
	bh=j9efUysIbU+0fDZp59JmxjJMpgDLHkYjIzf8rBgtCHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A5iE4CR0rlabidOnNFdFqyZ84WMWyNU4i2bQwokCyNeuQ1fqX3ejQ3QK7Ph5Fufs93brU4ni0kWvcKkgdANHXT6HKmL8InOexhY5bUFy81uKPb44QJnGB7sbxJCGMr6huTgqOP/iMN2cPu0G1uEJx1nAACy3jb54PrvasVvYCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rJhXjDmZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f62a628b4cso28822075ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717433045; x=1718037845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQJCX2mLLjVwtGvAcK2JVSlXXTTlVczYVL9TcQ37x9I=;
        b=rJhXjDmZ9qsdMDC3KEeOWHBB/U6XvzuwFHaGSdsPm0HTLjLDItRq4Q5dq1m8P+VxbI
         J0I+GmHfbtMIl/vDqrVt/KP0VJKH8qK1cozyTuDYusIbzoXjL5Mr8Y/S6ohewV7SSOBP
         jt41vgl3P50jOkRr7VHfQ7EXTbHYRh759nIRqgJEbMCmABjBf8acO2kObAMr28RZBjfr
         9bIguu1tdQfEBOHS9L6BOhwxXajnRzXm2ADXtqVSQJnAwkbsYuXQ1sXAzkCDSnR5gwkz
         OYHs6jivPj7RQ0Dt7FlP6RGLtxmB3hLzcQDyGcCmZESAvK9MhaCsZe0FGLYnAUvoX01/
         o99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717433045; x=1718037845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQJCX2mLLjVwtGvAcK2JVSlXXTTlVczYVL9TcQ37x9I=;
        b=kizj8+1YBZd2mPmoe+4BX+YVmUPWTS7YKwFLFQg0jfldgHQLUilF27kFOHYp+8XDtP
         2E3F1QLF6i5HFIcfbb22yRft0indyXqPzMnCr1KN5tNaQNu8NPqrWuAfMaawsXx9KK7+
         qbMoP0TSd4cF9yypn1O/83hkP955zccIJl4voonjUhEU250WwUX/XGYU6ubXshWgTdkL
         hhBSEtmxsjmJICLwn9sEFN+b6WBL0bvy18f4wW/Le36TDIiOOD6hQyeK0wSKZzo7m6ia
         TuuoVMPa63NK5wj10gpGXlRwYJ6vYSeXECFU8C5eqpEWBTLkp26Y9yWC8urGPi74X+i2
         nq6Q==
X-Gm-Message-State: AOJu0Yykl3c/eUUWkOJ+MIwDHI/vvGaNxQgqDAeB5WMR0ShdgwItuMzJ
	CQRsBIefT/onx0Ljh+86xlpLNNn9kVul5b59FPim8XvHAKUSPQClU+d3D5qUgA==
X-Google-Smtp-Source: AGHT+IGYx+sx85xzgEc86M80PuqE2ZoS4273PGYCLxOQNlGQ9YXpPTVaa2w3bk5t3yHX6kqLl4+hdA==
X-Received: by 2002:a17:902:e546:b0:1f6:5bba:f134 with SMTP id d9443c01a7336-1f65bbaf520mr68933315ad.46.1717433045079;
        Mon, 03 Jun 2024 09:44:05 -0700 (PDT)
Received: from localhost.localdomain ([120.60.128.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632401919sm67523825ad.248.2024.06.03.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 09:44:04 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Do not allocate memory for MHI objects from DMA zone
Date: Mon,  3 Jun 2024 22:13:54 +0530
Message-Id: <20240603164354.79035-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MHI endpoint stack accidentally started allocating memory for objects from
DMA zone since commit 62210a26cd4f ("bus: mhi: ep: Use slab allocator
where applicable"). But there is no real need to allocate memory from this
naturally limited DMA zone. This also causes the MHI endpoint stack to run
out of memory while doing high bandwidth transfers.

So let's switch over to normal memory.

Cc: stable@vger.kernel.org # 6.8
Fixes: 62210a26cd4f ("bus: mhi: ep: Use slab allocator where applicable")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index f8f674adf1d4..4acfac73ca9a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -90,7 +90,7 @@ static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct m
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -109,7 +109,7 @@ int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_stat
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -127,7 +127,7 @@ int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_e
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -146,7 +146,7 @@ static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_e
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -438,7 +438,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
 		write_offset = len - buf_left;
 
-		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL | GFP_DMA);
+		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL);
 		if (!buf_addr)
 			return -ENOMEM;
 
@@ -1481,14 +1481,14 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mhi_cntrl->ev_ring_el_cache = kmem_cache_create("mhi_ep_event_ring_el",
 							sizeof(struct mhi_ring_element), 0,
-							SLAB_CACHE_DMA, NULL);
+							0, NULL);
 	if (!mhi_cntrl->ev_ring_el_cache) {
 		ret = -ENOMEM;
 		goto err_free_cmd;
 	}
 
 	mhi_cntrl->tre_buf_cache = kmem_cache_create("mhi_ep_tre_buf", MHI_EP_DEFAULT_MTU, 0,
-						      SLAB_CACHE_DMA, NULL);
+						      0, NULL);
 	if (!mhi_cntrl->tre_buf_cache) {
 		ret = -ENOMEM;
 		goto err_destroy_ev_ring_el_cache;
-- 
2.25.1


