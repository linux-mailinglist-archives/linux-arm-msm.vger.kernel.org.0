Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3761A18E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgDGXu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:50:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40344 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgDGXu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:50:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id c20so1540745pfi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKuFZtIVAaoTUp6zjeWWya0JiaoLnKXJuM17HCZ8dJk=;
        b=M5pTY7aojgtX6+VWwhtgGGTYPvYVdRS7o88skoxAdy5owgcafnAb5V+W5RCg8PUC/1
         6tE8wI6uOAzEqm0lU/QoXLdIhb45H8GltOdhvATslZEbyanrtcPZGpME/tpvbaBd8CcS
         kJ2SKLguRYLsxWtyVq1GF8DIhowvqKy82uvkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKuFZtIVAaoTUp6zjeWWya0JiaoLnKXJuM17HCZ8dJk=;
        b=QFT0KU4q9KvtVrnr9MGwcLaKLZb3sh2xBVfltX2BlliOOK2h87+GsyJaV9bts10OB6
         /FT5/xnsZSKiHLbIPc6HvdFjH9me7+ZR8UHIN1F7b2/iHGA6V86N69txTgnXc5S96e+a
         nZdihCJEst+xxXTeG5V0g60pm0iLUMbtCyCZgodqH5tKKgxoYq0RSrQ3dZEo89TTcXoQ
         TlfAgt9p8Ea0RX7jyeUnVcyUh5Ymj8EMMdv466kFv7MetdEnAwuBALBKCw7YvKto/ymo
         hBzg42hWp2GHLiuvVvd2UNvnD+TYd0VrWOaF59iCuF3XVeY9RN0/O9EGe7gaLx5Zo6i4
         /rRg==
X-Gm-Message-State: AGi0PuYcIg/V+qCA3njmOOiLXQKI17XhHYjtTCRWXKMLPVg6CyosK4hg
        10Ph5hBI/7JYmTmHR/U3Ti8yAg==
X-Google-Smtp-Source: APiQypJU+hJHpLvbm4lN8v4HiUF4yrapGknIxLf3afhVeWR7FhNmLP2sB97twUIiVcLdp85DHllyJQ==
X-Received: by 2002:aa7:93cd:: with SMTP id y13mr4738524pff.213.1586303458124;
        Tue, 07 Apr 2020 16:50:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s27sm14467165pgn.90.2020.04.07.16.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:50:57 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/10] drivers: qcom: rpmh-rsc: Document the register layout better
Date:   Tue,  7 Apr 2020 16:50:16 -0700
Message-Id: <20200407164915.v3.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200407235024.260460-1-dianders@chromium.org>
References: <20200407235024.260460-1-dianders@chromium.org>
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
---

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
index 7d9e2c2f0e27..46455b1d93f1 100644
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
2.26.0.292.g33ef6b2f38-goog

