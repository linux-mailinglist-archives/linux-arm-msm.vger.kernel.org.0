Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E28699AC7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 12:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392080AbfHWKHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 06:07:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51656 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391899AbfHWKHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 06:07:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id k1so8392473wmi.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 03:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=txsHPtmH/4H2/WnX6EiFrXzeHkL+qrKcHt+2DoU5kzQ=;
        b=zsLTQ6OcR9Dk0Qa39F2DDnmWFcluUGtQg+KpRb+bwLN1VIK3mhupCJbjkodp3dI4Fe
         iqWh9+beI2fEZPtXQqBILn5x5It/sxsv7zun4Zt7NVFJsPhAfH/gGhkWLaF7nzV25Hc0
         Y6hQwhCfGnfnrHTNZljsbuzWLq9L02poSqq/DJOxzCk4+RvvBqiV2Z/5YZzof/Ut4PgM
         rSlB1fo+5JK7gqGVKFIa3UWXy2A+xNE3hLhLeLjzdhmTLmP4MXsdi7osPx/D/EFFnDwM
         ztznERXTlzizlp25hDlJ4CRX4E7X4+QrQsYOYPrtn6xK68tfMik0P0I788C2hxA69/YK
         MX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=txsHPtmH/4H2/WnX6EiFrXzeHkL+qrKcHt+2DoU5kzQ=;
        b=GiV+ot+qhkvZtHhXskKlMqRoyO3MzNPZ+o9Y67kDytVOLfBYGi/CpCgBITQMf7TXW4
         0OzvbBXAk8XfY0KUW55k7p+3fzMGp0IMmyOe+GJfrBVDrAfr30HLx3yhimDCd2Y7CnAL
         uT2Qmav/7s8ZXI9bkG4+z42Y6FK/ApFjZCjddRLBI93ms0kbRQitDf89hhZMtDJY5YgY
         29wsNoi0lPAdNfAoRBMKLUenRpbfF0U0BCyVSxF/komWrlqktp44YmyjkqrO9vv9fT/o
         a68I3j2hm4uL5ZCyqa5ntrTRnWY56X5hTgH/Ik41H85ZZKUnndrKpsDvwLY/BP8R477u
         b6ng==
X-Gm-Message-State: APjAAAXSP4J8Ubi/+diW3DFPKX2yQ5XrAB24x1oNVsFx9ovLAL9zweTk
        gf0LrK8jYZi+zT2lXqzOLhm2jA==
X-Google-Smtp-Source: APXvYqwl1Fa7hd6dx3UhLaTaNR2R/23JKahB21Ecq5hVeBT4VSAziAuQCdksN46+5xAra8IOI9h+wA==
X-Received: by 2002:a1c:a80a:: with SMTP id r10mr4148894wme.103.1566554821626;
        Fri, 23 Aug 2019 03:07:01 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id q124sm2058048wma.33.2019.08.23.03.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 03:07:00 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>
Subject: [PATCH 5/5] misc: fastrpc: free dma buf scatter list
Date:   Fri, 23 Aug 2019 11:06:22 +0100
Message-Id: <20190823100622.3892-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
References: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dma buf scatter list is never freed, free it!

Orignally detected by kmemleak:
  backtrace:
    [<ffffff80088b7658>] kmemleak_alloc+0x50/0x84
    [<ffffff8008373284>] sg_kmalloc+0x38/0x60
    [<ffffff8008373144>] __sg_alloc_table+0x60/0x110
    [<ffffff800837321c>] sg_alloc_table+0x28/0x58
    [<ffffff800837336c>] __sg_alloc_table_from_pages+0xc0/0x1ac
    [<ffffff800837346c>] sg_alloc_table_from_pages+0x14/0x1c
    [<ffffff8008097a3c>] __iommu_get_sgtable+0x5c/0x8c
    [<ffffff800850a1d0>] fastrpc_dma_buf_attach+0x84/0xf8
    [<ffffff80085114bc>] dma_buf_attach+0x70/0xc8
    [<ffffff8008509efc>] fastrpc_map_create+0xf8/0x1e8
    [<ffffff80085086f4>] fastrpc_device_ioctl+0x508/0x900
    [<ffffff80082428c8>] compat_SyS_ioctl+0x128/0x200
    [<ffffff80080832c4>] el0_svc_naked+0x34/0x38
    [<ffffffffffffffff>] 0xffffffffffffffff

Reported-by: Mayank Chopra <mak.chopra@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index eee2bb398947..47ae84afac2e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -550,6 +550,7 @@ static void fastrpc_dma_buf_detatch(struct dma_buf *dmabuf,
 	mutex_lock(&buffer->lock);
 	list_del(&a->node);
 	mutex_unlock(&buffer->lock);
+	sg_free_table(&a->sgt);
 	kfree(a);
 }
 
-- 
2.21.0

