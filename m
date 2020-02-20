Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4A01665BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 19:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbgBTSCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 13:02:31 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37892 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgBTSCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 13:02:31 -0500
Received: by mail-pj1-f66.google.com with SMTP id j17so1211627pjz.3;
        Thu, 20 Feb 2020 10:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ftBWuGNfX8JZVFhSKwA+KUVSKGZwfK/v4xpQCMt5JjU=;
        b=Z7GTb5OmY58dJNwVcxhr2Zj89JXbSLjrDt4/98xY5f4eLOjssVN04Amn+cXaYaGh5l
         DqGzKkLXy6FQdjPU5cvEewJ6TExOsg4coQmE8aLyUVNiZJeKgREQ+EioOVrzQafZWyNX
         wNvlAJ5Fb9NdNKVQ2I3U1JQne5b6IWABjyuRdWxbKtJQ4G74F9KFxf5vOCsvr/b0qplb
         +hwhkPo4ggypZi/5u5PXoEK2bsl6sK5/+2swDHR2TOMLOfl4pp+W/C1jTXyYfH5WCyBb
         NIlAzn4HpQm5ASJ6q5OHtRY32pO3LRQSAlUXhWyTEECClcAPOwqaIqQ4Ktfhudf/VTO2
         S/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ftBWuGNfX8JZVFhSKwA+KUVSKGZwfK/v4xpQCMt5JjU=;
        b=lbZt/Ur2OtRchwzBV2hR6OLCI6hiOX3HleaJHcx/0nGzi0adNP+tH2WRhdr6IRmNPO
         rrv/+l7B11lz3eQTD8tAJaO+AH/KfGLldcUKqNCALxfQRPEXTX4s7/3uhRkFKGUC/Q+C
         V1AFRVNx/5EEZMv47hdIOHHO9niMW0EZ5DaU/vBrfgzM0/wI4Kqp3fsp1EKK1eUE83GW
         CHPN5XD5wC1rFdcFS9PlB6R6wTUoHcUnIbR4aV8UmjZkOH2+jwfRTpi83Zes2A7K8xs7
         oKSjRwvNSdRGNH3BchThJnGGF/MpekGhjxqRGGE3ZIh1coXH2EzUs1ufIE3MtIYy7HDG
         pfIQ==
X-Gm-Message-State: APjAAAWXErVVNMOMoc5ppaVLJ0/kWdWjimTCcDqbwuWUPMRi+Qf6ZlSA
        kMKV8frESunk+2Iq9R7LXI8=
X-Google-Smtp-Source: APXvYqyP5wnC/UIA6uYZG1iIuCpdhd4BbS2S2UPeJf7Xo5CCRsLnOqSay/+AmWkBoDqxi6cI3omECg==
X-Received: by 2002:a17:90a:8001:: with SMTP id b1mr4948972pjn.39.1582221749423;
        Thu, 20 Feb 2020 10:02:29 -0800 (PST)
Received: from localhost ([100.118.89.211])
        by smtp.gmail.com with ESMTPSA id l69sm2019pgd.1.2020.02.20.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 10:02:28 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Fix CP_MEMPOOL state name
Date:   Thu, 20 Feb 2020 10:00:09 -0800
Message-Id: <20200220180013.1120750-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 68cccfa2870a..bbbec8d26870 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -370,7 +370,7 @@ static const struct a6xx_indexed_registers {
 };
 
 static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
-	"CP_MEMPOOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060,
 };
 
-- 
2.24.1

