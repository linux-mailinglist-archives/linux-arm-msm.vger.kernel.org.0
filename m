Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1714B6219
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 05:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiBOEbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 23:31:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiBOEbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 23:31:52 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC161C134
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 20:31:43 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id u47-20020a4a9732000000b00316d0257de0so21842529ooi.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 20:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D7WsWCRqMLz25vENb3RcLmuP7khzK1rVK0lqIZnKd40=;
        b=qErQvLRHn4lNi32tmw38jEAFNYywB5rAnIRozMJp3Wu3QmiUz3kavqhSmwRx+OyGdY
         LtFC0T6uamzGnphHeZAlx2E1u/X08Qdv0rSQVmPBMCw/bxC7HPu1UmcuD1XhaM4JDvYX
         I4bDSc2FY1CS/fmpYAxzwSHegdZOpTn3+JHe4HYhGhAAJvYYWrMeR1jB2KswbOlvhXRY
         vcBCpFE2SKQZI0N3AJjoxA/7iO58Xne2M4Qub/qxrwYEplfa7J2L9DwvSjOrBF9h5Knq
         N7E5+9wOTrS8FWn7D59QuP6De+aGmzBjM7fKCSdus9AG6+5zH9nefOBQushQwXNqnQi9
         6HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D7WsWCRqMLz25vENb3RcLmuP7khzK1rVK0lqIZnKd40=;
        b=lfAiClLDgxgeCOK2xFX18qiTCU3X9U1bPSysvXc7yLAh6VnUoPzNlutJrxAow6EQxH
         JxgSrPp+KHfnu9NOHQynhLdHroH/0Kit0klx3X5TZo2MIIEZuETjVd1Y1AlZ7nV7upRd
         Iy5c2oidewmul8yaFVmv2QWfpqfILyyfLQGW+4eY1cHJwe0U5EJ8O+bCN5J6crIM/G7W
         tQA0vyG7LFDhsuIICM+5YYi5LV/dzXcdnQxHERZtqHLT4dcqTIi3vrKhhbIborMh6HMZ
         /EI2xUZ31bbvf4at/ujN6syDozKQJf2CMOLsB1aHmaQ3opiHKtaFdnmr3QUFHZdwJZH6
         4ovg==
X-Gm-Message-State: AOAM533nXrxbmxC+A8UmToIV7qUeMPn4KSum1n8cEM68nYQzHbGtYNQV
        N4WOHzII+FfWSniopBSEtB9j4HGbzuGAtQ==
X-Google-Smtp-Source: ABdhPJxYZ98hSXj39qS4Lid82RoCU1bJQMN1rQR1NrXEQZ6QwcOrw3ie1V58t9SRMlck6xKqEZOWcw==
X-Received: by 2002:a05:6870:6296:: with SMTP id s22mr800654oan.338.1644899502683;
        Mon, 14 Feb 2022 20:31:42 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id z4sm12926964otu.24.2022.02.14.20.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 20:31:42 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/msm/dpu: Add INTF_5 interrupts
Date:   Mon, 14 Feb 2022 20:33:52 -0800
Message-Id: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC8180x has the eDP controller wired up to INTF_5, so add the interrupt
register block for this interface to the list.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a77a5eaa78ad..dd2161e7bdb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -23,6 +23,7 @@
 #define MDP_INTF_2_OFF			0x6B000
 #define MDP_INTF_3_OFF			0x6B800
 #define MDP_INTF_4_OFF			0x6C000
+#define MDP_INTF_5_OFF			0x6C800
 #define MDP_AD4_0_OFF			0x7C000
 #define MDP_AD4_1_OFF			0x7D000
 #define MDP_AD4_INTR_EN_OFF		0x41c
@@ -93,6 +94,11 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_4_OFF+INTF_INTR_EN,
 		MDP_INTF_4_OFF+INTF_INTR_STATUS
 	},
+	{
+		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
+		MDP_INTF_5_OFF+INTF_INTR_EN,
+		MDP_INTF_5_OFF+INTF_INTR_STATUS
+	},
 	{
 		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1ab75cccd145..37379966d8ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -22,6 +22,7 @@ enum dpu_hw_intr_reg {
 	MDP_INTF2_INTR,
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
+	MDP_INTF5_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
 	MDP_INTF0_7xxx_INTR,
-- 
2.33.1

