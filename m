Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F51E17C94C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 01:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgCGAAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 19:00:24 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44088 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgCGAAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 19:00:24 -0500
Received: by mail-pl1-f196.google.com with SMTP id d9so1502167plo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 16:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=okkWoStPCoREc6CT6fTxqPB3zLUhxqIH9Q5oYUBHFGw=;
        b=Wpk4Y5jos+hfNa1ZezOCHQWHKQMkEuwiyxIbVQDWYQs1C2S9cRQ/PtDt6KFudcLb+s
         nu6PJ09r/vNErDb1wlGo0q3Uf816feS7qUqHRkWdpo+WilGGstJ0j33TPs42to5gGiFv
         AZdrA3t3PJq1/MAhXvYZIf81vdcpve5zO5H4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=okkWoStPCoREc6CT6fTxqPB3zLUhxqIH9Q5oYUBHFGw=;
        b=qQ38jV98aAJNMvetIqe5yUCr8aepn6Db71rBFyDCkJrTgmnOyLB3/K/L566LeaGjDw
         OZ3/qWLBBSburjgEJ7dH4eXmNkCefFnrV8XZ5oPZUG69uWsN5HUBEwBHMy3hAK4sJmru
         u3Kqo+hDPoxcejW0fd7hMJ24UvMC4/ziEPto3bYevaKao24lz1HRThs9OVmumrSR8X2p
         URsJuAb6vLb+x4jAqrHI/Glr6KctgcovLN4YvXyibwWg7rKQBiBOMSlY2+q60Hbpz7Hh
         QarviMFL9zlZ8MRTGfuLNXGILNIIZ0vSGqOtKMgbchrNjIKzdQb4mBpvv3DFAt7l2/Ui
         /A7w==
X-Gm-Message-State: ANhLgQ1KEgNQYQLdExfiY48o/bUmEiGCg6DchF+k9X2bxnwUs1YPqMV3
        ZpmXUcZCyfvddpeZXOMWEJoa7g==
X-Google-Smtp-Source: ADFU+vvT45NByWO86LURS5yuNiOZ5ziBBfRIi27YMwz90b021rOJOUZmZO+yIG1aNVbNmUnicWMhRQ==
X-Received: by 2002:a17:90a:a616:: with SMTP id c22mr6374449pjq.47.1583539223151;
        Fri, 06 Mar 2020 16:00:23 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 9sm32302246pge.65.2020.03.06.16.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:00:22 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH 2/9] drivers: qcom: rpmh-rsc: Document the register layout better
Date:   Fri,  6 Mar 2020 15:59:44 -0800
Message-Id: <20200306155707.RFT.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306235951.214678-1-dianders@chromium.org>
References: <20200306235951.214678-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Perhaps it's just me, it took a really long time to understand what
the register layout of rpmh-rsc was just from the #defines.  It's much
easier to understand this if we define some structures.  At the moment
these structures aren't used at all (so think of them as
documentation), but to me they really help in understanding.

These structures were all figured out from the #defines and
reading/writing functions.  Anything that wasn't used in the driver is
marked as "opaque".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/rpmh-rsc.c | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 5c88b8cd5bf8..0a409988d103 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -61,6 +61,73 @@
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
+/*
+ * The following structures aren't used in the code anywhere (right now), but
+ * help to document how the register space is laid out.  In other words it's
+ * another way to visualize the "Register offsets".
+ *
+ * Couch this in a bogus #ifdef instead of comments to allow the embedded
+ * comments to work.
+ */
+#ifdef STRUCTS_TO_DOCUMENT_HW_REGISTER_MAP
+
+/* 0x14 = 20 bytes big (see RSC_DRV_CMD_OFFSET) */
+struct tcs_cmd_hw {
+	u32 msgid;
+	u32 addr;
+	u32 data;
+	u32 status;
+	u32 resp_data;
+};
+
+/* 0x2a0 = 672 bytes big (see RSC_DRV_TCS_OFFSET) */
+struct tcs_hw {
+	/*
+	 * These are only valid on TCS 0 but are present everywhere.
+	 * Contains 1 bit per TCS.
+	 */
+	u32 irq_enable;
+	u32 irq_status;
+	u32 irq_clear;			/* Write only; write 1 to clear */
+
+	char opaque_00c[0x4];
+
+	u32 cmd_wait_for_cmpl;		/* Bit field, 1 bit per command */
+	u32 control;
+	u32 status;			/* status is 0 if tcs is busy */
+	u32 cmd_enable;			/* Bit field, 1 bit per command */
+
+	char opaque_01c[0x10];
+
+	struct tcs_cmd_hw tcs_cmd_hw[MAX_CMDS_PER_TCS];
+
+	char opaque_170[0x130];
+};
+
+/* Example for sc7180 based on current dts */
+struct rpmh_rsc_hw_sc7180 {
+	char opaque_000[0xc];
+
+	u32 prnt_chld_config;
+
+	char opaque_010[0xcf0];
+
+	/*
+	 * Offset 0xd00 aka qcom,tcs-offset from device tree.  Presumably
+	 * could be different for different SoCs?  Currently driver stores
+	 * a pointer to the first tcs in tcs_base.
+	 *
+	 * Count of various TCS entries also comes from dts.
+	 */
+	struct tcs_hw active[2];
+	struct tcs_hw sleep[3];
+	struct tcs_hw wake[3];
+	struct tcs_hw control[1];
+};
+
+#endif /* STRUCTS_TO_DOCUMENT_HW_REGISTER_MAP */
+
+
 static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
 {
 	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
-- 
2.25.1.481.gfbce0eb801-goog

