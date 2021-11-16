Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AA8452F7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 11:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbhKPKx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 05:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234424AbhKPKxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 05:53:19 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38113C061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 02:50:22 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u18so36672017wrg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLjmal7Qhx8zErQnGRhLc7RANFy4u7WCe+8FEMhJTbs=;
        b=dacm7WhqtNBedETvp0LAUUsEyRWrxMZM+SRcyVDnJVZl1AMKFUTH72uWlBByUYPng5
         n1q0cxOE1CDXrGZJQNhGM5wpneARTd3DysnVTsBRzNQ0vG00om+VrE0L6YWsIahvpU3V
         zvD/hw11mbRV0BKntrJ2wuMkiayPuwSSr9QvPma80SYsQ+vUMgYmhVFND6VfUqlh1wHU
         lR31ZqQ9NwDT8mtDsHu/8fva5ydx42rC5+detqmPVB8uPH8Q9lgN3tnVaJMyJh2tg1qY
         JXcdMlYYIA9KaWcyiRbdmXuGOdZ7IbSoCbpFyR89XVFhlZ45vwL1fjaYvBBEtLJ1dgZH
         uLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLjmal7Qhx8zErQnGRhLc7RANFy4u7WCe+8FEMhJTbs=;
        b=BwXrn9Kh3UK1HRZpLRGnlJ6UHaI2HvKAH8nbqEtIn4OCnUGzSykkuCuutR6bXLphw0
         VG8x7m6VtxfNRpEc1iRlrzvOzX7wmJ/GTpiW9c/ap9PXIb0GMIOjdl2dk1x+YiBGoe+z
         rCt7ximOpZe2bGVyMmlLnOmaqAfaGC25Ea5998pqtl3AE/VpiPSef62XzYN6LxdqtHr7
         yJOp19wjE3fGLrz7cJLwlJjrgKDC8zN1ZllID4VkkLGF/F3aEdlStYkyrY6j+N7pPNbG
         BgQVKB/ZwABFYmI6yir5n2uLr//FXdLkk5eMdnt+wfRmNJBMxL2NZKHE6yNdZVXX6Kwl
         nSpw==
X-Gm-Message-State: AOAM532GzruBTyeKx3CI4OpJfckRusCec3q9WSuIxbsDWlwl8VWdEoKY
        zsJ+NLKJTfAapLvfztn/bNHLdQ==
X-Google-Smtp-Source: ABdhPJy+0eTYhJpxKeuQFu6opCFTs1aBuZF6B/EVcetH7tvQySS8Mg/YUeKxHvLw9FUpnF/1RLNzag==
X-Received: by 2002:adf:f947:: with SMTP id q7mr7970820wrr.260.1637059820814;
        Tue, 16 Nov 2021 02:50:20 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id c6sm2579684wmq.46.2021.11.16.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 02:50:20 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org
Cc:     yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] soundwire: qcom: remove redundant version number read
Date:   Tue, 16 Nov 2021 10:50:17 +0000
Message-Id: <20211116105017.12010-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Controller version is already available in struct qcom_swrm_ctrl, Just make use
of it instead of reading this again.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a317bea2d42d..46995bb382eb 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1156,11 +1156,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
 					bp_mode, nports);
 	if (ret) {
-		u32 version;
-
-		ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &version);
-
-		if (version <= 0x01030000)
+		if (ctrl->version <= 0x01030000)
 			memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
 		else
 			return ret;
-- 
2.21.0

