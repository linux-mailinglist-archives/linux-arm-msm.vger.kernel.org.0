Return-Path: <linux-arm-msm+bounces-82482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA0C6E18C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 7B6032DB79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDDF34DCDB;
	Wed, 19 Nov 2025 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cc1aib0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546433EAE0;
	Wed, 19 Nov 2025 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549895; cv=none; b=FqyYKlHHTvP2VeBY+cVW5jfuBTZnEzHXNfW/HTSktqn+eCpfttQCBGzA1PtGHN86mtib8k/8rNYALD0GatC77D3vqDajgclPHapwrWQll3LJsS2H9wpBq5hwMJyl7ow2z1Pz28Fy+4qgr9fC2uDmY/WDVcLhsObSwp7QLogPfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549895; c=relaxed/simple;
	bh=MJQBOKJ3pxgT8oIVxgVJmQ+WNwmk4OfiApPi1ehyYS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fqRqIgQnhDwwsjGwSyygkEGd+RvMOrmgURUQ7AV803hNZg9KVT0qTCPTA83ib4BoUaq2q761tS+LjacefSiJq8tK9uZRH7RNY/cDGH/ydOrgMW9Mmk2SMhsuo3A3r6znsSS8gRG9cNu+NZnDHiljgI0BofjhOSFHbEbXv6wySPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cc1aib0G; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cJ
	9jFXLxUPnhgca2a4mZ5MJ01cmyWTa2yYdIRpn2s98=; b=cc1aib0GewLB9gxtTh
	8eE/N5nwuAKgmys51HXKhH/9ZYxnBZ0MNKAZQbAO7k4af0A730EV5t3iWcNfAKPQ
	gMnfXYF/fockNyqK0Ccx8XxZBsBwQKsQxgVvUI9c7gU805gW1b8PHxpzwF0NTISG
	csFmizgpmdf7qeTIMRv3tbtco=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHOlVooh1pwNIrEg--.51100S4;
	Wed, 19 Nov 2025 18:56:52 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
Date: Wed, 19 Nov 2025 18:56:15 +0800
Message-Id: <20251119105615.48295-3-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251119105615.48295-1-slark_xiao@163.com>
References: <20251119105615.48295-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCHOlVooh1pwNIrEg--.51100S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr45tF47Jr45XFyDGw1DGFg_yoWDArgE9r
	1kXF9rJr4jgFyjkr1kKF43ZryfGwn7XF1vvFsYv398JrykX3WrWFWrZFySq3429wnrJFsr
	urnrZF1Yv3yxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_iF4PUUUUU==
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCwBRny2kdonSHzgAA3T

T99W760 is designed based on Qualcomm SDX35 chip. It use similar
architechture with SDX72/SDX75 chip. So we need to assign initial
link id for this device to make sure network available.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index c814fbd756a1..a142af59a91f 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
 static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
 {
 	if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
-	    strcmp(cntrl->name, "foxconn-t99w515") == 0)
+	    strcmp(cntrl->name, "foxconn-t99w515") == 0 ||
+	    strcmp(cntrl->name, "foxconn-t99w760") == 0)
 		return WDS_BIND_MUX_DATA_PORT_MUX_ID;
 
 	return 0;
-- 
2.25.1


