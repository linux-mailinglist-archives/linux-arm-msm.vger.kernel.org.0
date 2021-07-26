Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8FC3D54C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 10:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbhGZHVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 03:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhGZHVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 03:21:05 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABD4C061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 01:01:34 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id e2so9940624wrq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 01:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lnQL+vD1s8HHey3hE2dBo++FOKUFUU+N4j10t+DrCDk=;
        b=XWI4GT5p6EHHk2ueiJJfqoggE7kTlio8iWxYnh27Gc21fem4ygVKAR7aHOo2XvBbId
         mv9s8pYQu1ZFH+6ZRAyFyF7LK2nlRMtcm75IJbRYoOnGm7G7o4y3lMnctWLBcnyHVK33
         WU8AJrf6SfcmWlRO+sS0KJ1v3T/GNNUVa5yBfphAzOHgw+APsGblzSOCCcpxjuiv7Sfc
         RWQNxh4xDaomUje0A/DXZKqM8JPY6L544Hs9LNiG3GmN+md+JFSnaDf5DGs6NhxsxRpb
         dADwamktrC4St17GYr4a4rzOqvvlDvSfgp4srX/W8rvH2V+VPfm5sxbMWDfV7DTToE4J
         Ptfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lnQL+vD1s8HHey3hE2dBo++FOKUFUU+N4j10t+DrCDk=;
        b=G27aE1OnDRYo0QjLDmrHCHxJA7USuvLtFSlqQyuccOcNVQDL6JpeWDHlkJsb9bJKTD
         H545+VnlbDSybpWqOKoqFLMwZfCNmdGgyuBUxFJdPKbTwbWZPEvgsa9unYIj1gtUEIrR
         JRkO6rqvE0IcdpOs1rDrpZmlrE3bdWLBfNxYw9uuAv+Ttqjf1JzfFQ+f/1ND0WtXd72T
         t2RPXJ7aXYB4RO7sJIWc+oxZzddaOgwgFeyIp+/7PLX+WCZ5AUojMYhoA8SNt/wLeQl7
         wscq5eZE2QjteuVcLtNlMGKnAPjgdq82P6B7Mw/ABVQcOPRwpINGW6u+QS+0z8Wo2+jx
         8vGA==
X-Gm-Message-State: AOAM530CysihhaeBQV0vJMU+TNwBN7L23uzg+8WQiXiGLk4S5pDKfFVw
        9LHj//x3eoVkAhgV7YL1qZAbEA==
X-Google-Smtp-Source: ABdhPJxpnJtDx3oXnLtsf8Ix8hioS0TwBjkk7kkJKWsrScsm74bRFkv3bWLunPHDEpr5Y1wuFy/mQQ==
X-Received: by 2002:adf:e610:: with SMTP id p16mr18414406wrm.98.1627286493440;
        Mon, 26 Jul 2021 01:01:33 -0700 (PDT)
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id n8sm460600wrx.46.2021.07.26.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 01:01:32 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v1 2/4] media: camss: vfe: Decrease priority of of VFE HW version to 'dbg'
Date:   Mon, 26 Jul 2021 10:01:11 +0200
Message-Id: <20210726080113.8378-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210726080113.8378-1-robert.foss@linaro.org>
References: <20210726080113.8378-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HW Version can in no case represent an error, so change the print
priority to 'dbg'.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 8594d275b41d..1ad502a1c276 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -185,7 +185,7 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 	u32 rev = (hw_version >> 16) & 0xFFF;
 	u32 step = hw_version & 0xFFFF;
 
-	dev_err(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
+	dev_dbg(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
 }
 
 static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index a59635217758..13f0fa6a7d60 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -258,7 +258,7 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
-	dev_err(dev, "VFE HW Version = 0x%08x\n", hw_version);
+	dev_dbg(dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
 static u16 vfe_get_ub_size(u8 vfe_id)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 998429dbb65c..03f92a6737b0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -251,7 +251,7 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
-	dev_err(dev, "VFE HW Version = 0x%08x\n", hw_version);
+	dev_dbg(dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
 static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
-- 
2.29.2

