Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF2AA14F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 11:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfH2J3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 05:29:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43806 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbfH2J3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 05:29:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id y8so2636382wrn.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=txsHPtmH/4H2/WnX6EiFrXzeHkL+qrKcHt+2DoU5kzQ=;
        b=xRwJYrUXbrpjGAWB4+R5fH7G0mRDkrSB5nnGWG4+zYs587hY8Cesq2JqG0vUTu0shm
         5pkphlWZMXlMveg2S4oPS4BdCQp2Mnchh4Ih0wV4GdImugyPNv/ZM0MA3she+V9WXGWU
         BIretLX6+0BXSa3pOq9OZv9oxXVx8pLDf9VNglZBXBTOuIjqJQ63fAQnH8yB/WoV8lxJ
         Q7aWiOA/e79K4dnGQJ0uBooFrp4oD2jiMo/YosYL+IqpZRMk9m18+GjoTP70snfB5NND
         zZadvljCyol2fsr5UIoZl+vVT1xk+csmPx3MmyUoosgeuNBmiciKo4MlvIDgOc+ntJ54
         g+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=txsHPtmH/4H2/WnX6EiFrXzeHkL+qrKcHt+2DoU5kzQ=;
        b=nPPqZjk22ZLKxHaOeCRE9/Fz36aLnwJEf7t8sz9ZHSf9v/8eXTsSWy/lMuCmav8PXL
         WLpzr280XE5lnDaibh97AXnwqFd6GIbCCN57Daa1Kil9CV/t52fE9GuNASBdKTiA2UmE
         11u8tXN809Y6aOTvRbBzN0FSQJrlzBupAxy0GQqC/0Vj158UZS5gO22umK5HSt7uloMM
         oP6V3KsLrDtnGLrCPs6NjzvYI7WHBj0U39FrrEw+SyzudsgICcJyYBawdNyumhMgzacl
         j8+I/9rSzri4H0fokB1mHqTbjqlaTU2niGTPgwEoiM1yU49IEagWIOBGoC28aKMYncg8
         YVTQ==
X-Gm-Message-State: APjAAAWtwLJIjStyKNwV/f0ODzafsRyvQigQUaLIkPJcMNe3fTi/9+1r
        tOBZHbwMd4EiuZvIdYuLN+zW2w==
X-Google-Smtp-Source: APXvYqwa7mal8tlwEcN4Id08ifjWX6FoVuVJXnw0+CZOqbxdmTAIG4v5DwpyXEOi1YCHISMEsJCWnw==
X-Received: by 2002:adf:a55d:: with SMTP id j29mr9662074wrb.275.1567070980206;
        Thu, 29 Aug 2019 02:29:40 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f197sm3609512wme.22.2019.08.29.02.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 02:29:39 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>
Subject: [PATCH v2 5/5] misc: fastrpc: free dma buf scatter list
Date:   Thu, 29 Aug 2019 10:29:26 +0100
Message-Id: <20190829092926.12037-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
References: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
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

