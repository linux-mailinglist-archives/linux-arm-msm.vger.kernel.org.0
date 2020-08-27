Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C138425423B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgH0J0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728471AbgH0JY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:24:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9FDC06121A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:24:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c18so119683wrm.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bfBeQ4kM5n/MF/SlgmWbcjE9LKSSGdHsds6HtvQPGhA=;
        b=kOw7fZigfkMlLvB1riABVgy9giPWYpxboJojvB4AmOW4Micbt6hEYBFFJZpfR7gLRE
         1gRiezEEB8xnUoTXX8oUb74fJ8soYuJ7ErXFN0zv6+hnoH5c+ab91IsxUd6Kddx5tRik
         dbi/Z79jE++oX4NELth0VhWBQVLzFG/ubGkLN+m+3SMtmzHz7HTTWPLl8+rwzrLAH/5U
         CP0nc2K51vGDuuq+Vf2X4rjizYtJdaFKrKgA3bubeQMmxzxD1OPt/a1+HDWz0g7kEFCp
         6fr5dV2+ui6/28s+ve2sGXmDnY5CV+wpS7/dpegLMJFfIYx5B4NUFeAn8RVaRyu83noR
         HguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bfBeQ4kM5n/MF/SlgmWbcjE9LKSSGdHsds6HtvQPGhA=;
        b=su1HWrfotaX9CsnVdjVRAXHd10c400cK1dfTrI9jiT9wbazwFuIwX3ToeUO66ama/8
         1mskNTM3mFI/CzjUAkAF+FXNBmzrWjcELPIuZxXR0eUGy8YhiF6lXA+UofsWRnc9n6za
         LLLjBppgxigPYHEVo44V9KShU1by105bHdgQLPb0jr6uHp8I8Wubl0naTexsns7pV7g9
         vK6AgFrsc3th9NRJuend2wjkNByfHHVkBg/LwiqQmI5dazco3JcETTxUFdNyr7ZAAzji
         n45I3CJzVKXnZNZrlC1sKcyqEuLUPJmP2N8wDCDdDAuPknOw0Xowkuhju0xYwWJ3SWfV
         2mlg==
X-Gm-Message-State: AOAM533oR0JZtNRYi1U89ej2Zv/U7oyQD7HvZt0dXQK7iiDCqUSOMUjG
        gbWdY+oq00kRP/tv8X4uc3kVKQ==
X-Google-Smtp-Source: ABdhPJzW4ytFVHfCBuuC0anffd4LOG9yZr/kSDy+zQc8Ew4g0WFJ2NYKCSy9reIVtwiyS7+AGvfxUg==
X-Received: by 2002:adf:d849:: with SMTP id k9mr20505253wrl.115.1598520295424;
        Thu, 27 Aug 2020 02:24:55 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:24:54 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 02/13] venus: Add more capabilities and VP9 profile/levels
Date:   Thu, 27 Aug 2020 12:24:06 +0300
Message-Id: <20200827092417.16040-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add more caps and VP9 definitions for newer Venus versions.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/platform/qcom/venus/hfi_helper.h    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 758c70ac26fd..116346fc64fe 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -364,6 +364,29 @@
 #define HFI_HEVC_TIER_MAIN			0x1
 #define HFI_HEVC_TIER_HIGH0			0x2
 
+#define HFI_VPX_PROFILE_MAIN			0x00000001
+
+#define HFI_VPX_LEVEL_VERSION_0			0x00000001
+#define HFI_VPX_LEVEL_VERSION_1			0x00000002
+#define HFI_VPX_LEVEL_VERSION_2			0x00000004
+#define HFI_VPX_LEVEL_VERSION_3			0x00000008
+
+/* VP9 Profile 0, 8-bit */
+#define HFI_VP9_PROFILE_P0			0x00000001
+/* VP9 Profile 2, 10-bit */
+#define HFI_VP9_PROFILE_P2_10B			0x00000004
+
+#define HFI_VP9_LEVEL_1				0x00000001
+#define HFI_VP9_LEVEL_11			0x00000002
+#define HFI_VP9_LEVEL_2				0x00000004
+#define HFI_VP9_LEVEL_21			0x00000008
+#define HFI_VP9_LEVEL_3				0x00000010
+#define HFI_VP9_LEVEL_31			0x00000020
+#define HFI_VP9_LEVEL_4				0x00000040
+#define HFI_VP9_LEVEL_41			0x00000080
+#define HFI_VP9_LEVEL_5				0x00000100
+#define HFI_VP9_LEVEL_51			0x00000200
+
 #define HFI_BUFFER_INPUT			0x1
 #define HFI_BUFFER_OUTPUT			0x2
 #define HFI_BUFFER_OUTPUT2			0x3
@@ -553,7 +576,18 @@ struct hfi_bitrate {
 #define HFI_CAPABILITY_LCU_SIZE				0x14
 #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
 #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
+#define HFI_CAPABILITY_I_FRAME_QP			0x20
+#define HFI_CAPABILITY_P_FRAME_QP			0x21
+#define HFI_CAPABILITY_B_FRAME_QP			0x22
+#define HFI_CAPABILITY_RATE_CONTROL_MODES		0x23
+#define HFI_CAPABILITY_BLUR_WIDTH			0x24
+#define HFI_CAPABILITY_BLUR_HEIGHT			0x25
+#define HFI_CAPABILITY_SLICE_BYTE			0x27
+#define HFI_CAPABILITY_SLICE_MB				0x28
 #define HFI_CAPABILITY_MAX_VIDEOCORES			0x2b
+#define HFI_CAPABILITY_MAX_WORKMODES			0x2c
+#define HFI_CAPABILITY_ROTATION				0x2f
+#define HFI_CAPABILITY_COLOR_SPACE_CONVERSION		0x30
 
 struct hfi_capability {
 	u32 capability_type;
-- 
2.17.1

