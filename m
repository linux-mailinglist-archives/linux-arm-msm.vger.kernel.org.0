Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856232F1BD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 18:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389182AbhAKRHT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 12:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389181AbhAKRHS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 12:07:18 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF61C0617A2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 09:06:38 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id i9so534148wrc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Hzqb7q+hCD/lNO+yAqM3iVZkO0rtWj2v+FJjuf+pTrs=;
        b=SC3B5EkHlLEmR6il3eQiRW6k8K2+HExqspyouE4pNfeCHqvIkh/kboRCjti7DbJqOr
         gHdmRwjXL6ignsaOqSM5L9098cg9ykY00uFOECGo3+yItxBY6dy/TO3Yx6vUulRlwEGT
         08QXLH+CBQJKOuQoVG+2eNzaLS+OtMVYouQU3N0QdzfZgfL7I8GWJXFFd52WqxOGYqWK
         nz6bxmgY6DlI8krhj3J28GRws7+IAlGV5MP4RTEb/uVtIpgISBCXRpCjJo20JNEt9E0l
         ZENLIYWHEKsaX3pVZWncUbbHrNKVvz78q1yOGURMuV6FuE8PHfy9uRj+Kq3r59XQHHOt
         29Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Hzqb7q+hCD/lNO+yAqM3iVZkO0rtWj2v+FJjuf+pTrs=;
        b=C4jSS8j9isUhtvAG//BBkSWM7YoUgobfx8wvQldUvleuQWJY19X4SfPah2ml+BxhN+
         zMFCtnPBeB/2Un542TOgtq2pu/sfy3J3pgcz0A8AhJaKQhaRHXs+4wU5+AanqA6QjN50
         g0vVaCgEJ3atg3pqB/lS+myCCNFccyFbvETAhGvYACtnHk7jLhmGvOI116pf4B2FsOEl
         J16vGjVRczekkuLP5jaQkQp8w3Ue8zNU/YvpcuKgSQbpquZGaq0j3AjvsWbGYsDTRYKP
         I+c1a90HUIKSDp2kEktnpZn/VXJoDwF22rsvkXEXle10zXaaUepPNSS74pgnh/o2DtJx
         1ZGA==
X-Gm-Message-State: AOAM533zhMcrWgMtvrt77UB+9zQ3VjkSUcEgjZEVl2Fcuh7B4IyLW4AV
        l8WfXPcquMqPs8DVX/VSZFx4cA==
X-Google-Smtp-Source: ABdhPJwR/BpMWpRjDKSvk6sbqwRX3odJyWM84Fr1hzdpe6wDMtK02H9zAQERCRPTCsg/AT7VuorKsg==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr143401wrs.82.1610384796791;
        Mon, 11 Jan 2021 09:06:36 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id j59sm336806wrj.13.2021.01.11.09.06.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 09:06:36 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        manivannan.sadhasivam@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/3] net: mhi: Get RX queue size from MHI core
Date:   Mon, 11 Jan 2021 18:14:10 +0100
Message-Id: <1610385251-14947-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610385251-14947-1-git-send-email-loic.poulain@linaro.org>
References: <1610385251-14947-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RX queue size can be determined at runtime by retrieving the
number of available transfer descriptors.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/net/mhi_net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index b7f7f2e..3da820b 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -257,9 +257,6 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	mhi_netdev->mdev = mhi_dev;
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
-	/* All MHI net channels have 128 ring elements (at least for now) */
-	mhi_netdev->rx_queue_sz = 128;
-
 	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
 	u64_stats_init(&mhi_netdev->stats.rx_syncp);
 	u64_stats_init(&mhi_netdev->stats.tx_syncp);
@@ -269,6 +266,9 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	if (err)
 		goto out_err;
 
+	/* Number of transfer descriptors determines size of the queue */
+	mhi_netdev->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
+
 	err = register_netdev(ndev);
 	if (err)
 		goto out_err;
-- 
2.7.4

