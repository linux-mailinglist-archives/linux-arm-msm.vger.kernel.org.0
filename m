Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A671A6AF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732478AbgDMRF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732351AbgDMREn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:04:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A825BC008749
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d17so4721250pgo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yQa4rSEyz3ccSDXjPft7iXP/XNiFKyUc3JhnVc0uHhI=;
        b=kOanPAx2WT+vQFl1nrjQWFWMi/weFrWJhnCi7VqXMiJtMtZP16mCRouNhNTRs39mC4
         4KXi7TvuR4B8XqiZ2yKf0Xh1ZyUZLgMIwg7OemA5td/CBdmsmoTimDaHFLvEwp3RibjD
         FheMpsjQ+vA6ho7LybJrD8cl9Ufb3GGjOVRX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yQa4rSEyz3ccSDXjPft7iXP/XNiFKyUc3JhnVc0uHhI=;
        b=R5xqU1oihvJSQQElKYHW38/alqybcMoL4h6VNLSqVlEow2IXtONCU/e4kpR1zhd1KY
         o0nGxeuuLgK8EBQF6uhtBrkz95p540miAGElchYMc7ILCpTBHNpp0H0J8S2YxfEVH+UD
         Kn90N5FxY74FAQp4DGE3ZYDJfm0lharzCTdT7cxbZ2y7PPo0yOIOPCXBY01j61jRFBJR
         WFdPmf60ZxTErfeYauK5MKDCtXuahQ9KBzBrWtUemrqSPvAxpvTwXTDZRdEBbf5AYQ38
         1v7B7ZiMy99khDEdpLKdPOkZ/PGTPXpN3b/mj/ogCPXBiTm7ep7/ffARAsUUoOD6XxPK
         +jxg==
X-Gm-Message-State: AGi0PuaPzPKhvlMb0KuDOLVqmexRBEPzN3uSYefWmsc7XwPlN4qYWx0I
        bFFsDhVqv+2lEU6rhwogP5PQyA==
X-Google-Smtp-Source: APiQypLffysxRK7c+S6N+88TezN7NVI5m12WD316lZEsBbSXW1jfZbneZUmeFqxj7+D1Gl9LArGKvA==
X-Received: by 2002:a62:764b:: with SMTP id r72mr350076pfc.207.1586797483162;
        Mon, 13 Apr 2020 10:04:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p62sm1634414pfb.93.2020.04.13.10.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:04:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>, evgreen@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/10] drivers: qcom: rpmh-rsc: Document the register layout better
Date:   Mon, 13 Apr 2020 10:04:07 -0700
Message-Id: <20200413100321.v4.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200413170415.32463-1-dianders@chromium.org>
References: <20200413170415.32463-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Perhaps it's just me, it took a really long time to understand what
the register layout of rpmh-rsc was just from the #defines.  Let's add
a bunch of comments describing which blocks are part of other blocks.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
---

Changes in v4: None
Changes in v3:
- Extra blank line removed (Maulik).
- IRQ registers aren't in TCS0 (Maulik).
- One space after a period now (Maulik).
- Plural of TCS fixed to TCSes following Maulik's example.
- Rebased atop v16 ('Invoke rpmh_flush...') series.

Changes in v2:
- Now prose in comments instead of struct definitions.
- Pretty ASCII art from Stephen.

 drivers/soc/qcom/rpmh-rsc.c | 79 ++++++++++++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 91fb5a6d68a2..439a0eadabf1 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -43,14 +43,29 @@
 #define DRV_NCPT_MASK			0x1F
 #define DRV_NCPT_SHIFT			27
 
-/* Register offsets */
+/* Offsets for common TCS Registers, one bit per TCS */
 #define RSC_DRV_IRQ_ENABLE		0x00
 #define RSC_DRV_IRQ_STATUS		0x04
-#define RSC_DRV_IRQ_CLEAR		0x08
-#define RSC_DRV_CMD_WAIT_FOR_CMPL	0x10
+#define RSC_DRV_IRQ_CLEAR		0x08	/* w/o; write 1 to clear */
+
+/*
+ * Offsets for per TCS Registers.
+ *
+ * TCSes start at 0x10 from tcs_base and are stored one after another.
+ * Multiply tcs_id by RSC_DRV_TCS_OFFSET to find a given TCS and add one
+ * of the below to find a register.
+ */
+#define RSC_DRV_CMD_WAIT_FOR_CMPL	0x10	/* 1 bit per command */
 #define RSC_DRV_CONTROL			0x14
-#define RSC_DRV_STATUS			0x18
-#define RSC_DRV_CMD_ENABLE		0x1C
+#define RSC_DRV_STATUS			0x18	/* zero if tcs is busy */
+#define RSC_DRV_CMD_ENABLE		0x1C	/* 1 bit per command */
+
+/*
+ * Offsets for per command in a TCS.
+ *
+ * Commands (up to 16) start at 0x30 in a TCS; multiply command index
+ * by RSC_DRV_CMD_OFFSET and add one of the below to find a register.
+ */
 #define RSC_DRV_CMD_MSGID		0x30
 #define RSC_DRV_CMD_ADDR		0x34
 #define RSC_DRV_CMD_DATA		0x38
@@ -67,6 +82,60 @@
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
+/*
+ * Here's a high level overview of how all the registers in RPMH work
+ * together:
+ *
+ * - The main rpmh-rsc address is the base of a register space that can
+ *   be used to find overall configuration of the hardware
+ *   (DRV_PRNT_CHLD_CONFIG). Also found within the rpmh-rsc register
+ *   space are all the TCS blocks. The offset of the TCS blocks is
+ *   specified in the device tree by "qcom,tcs-offset" and used to
+ *   compute tcs_base.
+ * - TCS blocks come one after another. Type, count, and order are
+ *   specified by the device tree as "qcom,tcs-config".
+ * - Each TCS block has some registers, then space for up to 16 commands.
+ *   Note that though address space is reserved for 16 commands, fewer
+ *   might be present. See ncpt (num cmds per TCS).
+ *
+ * Here's a picture:
+ *
+ *  +---------------------------------------------------+
+ *  |RSC                                                |
+ *  | ctrl                                              |
+ *  |                                                   |
+ *  | Drvs:                                             |
+ *  | +-----------------------------------------------+ |
+ *  | |DRV0                                           | |
+ *  | | ctrl/config                                   | |
+ *  | | IRQ                                           | |
+ *  | |                                               | |
+ *  | | TCSes:                                        | |
+ *  | | +------------------------------------------+  | |
+ *  | | |TCS0  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
+ *  | | | ctrl | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
+ *  | | |      |  |  |  |  |  |  |  |  |  |  |  |  |  | |
+ *  | | +------------------------------------------+  | |
+ *  | | +------------------------------------------+  | |
+ *  | | |TCS1  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
+ *  | | | ctrl | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
+ *  | | |      |  |  |  |  |  |  |  |  |  |  |  |  |  | |
+ *  | | +------------------------------------------+  | |
+ *  | | +------------------------------------------+  | |
+ *  | | |TCS2  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
+ *  | | | ctrl | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
+ *  | | |      |  |  |  |  |  |  |  |  |  |  |  |  |  | |
+ *  | | +------------------------------------------+  | |
+ *  | |                    ......                     | |
+ *  | +-----------------------------------------------+ |
+ *  | +-----------------------------------------------+ |
+ *  | |DRV1                                           | |
+ *  | | (same as DRV0)                                | |
+ *  | +-----------------------------------------------+ |
+ *  |                      ......                       |
+ *  +---------------------------------------------------+
+ */
+
 static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
 {
 	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
-- 
2.26.0.110.g2183baf09c-goog

