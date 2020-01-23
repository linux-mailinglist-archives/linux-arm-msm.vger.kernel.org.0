Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEC5146688
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgAWLTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:19:10 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34726 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgAWLTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:19:08 -0500
Received: by mail-pg1-f195.google.com with SMTP id r11so1239423pgf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bck4FEIZwLJxEgJfodppN6GjeHSlm20yQGpAdfjcv24=;
        b=CgcYWLHaWfUJBdPNciAIoWQMZbTR7GeUl2i74VKnTP8ilxuwUV7qgjHZQHKiFNjpf1
         HN+50lN/cGnQ6TxDgigJkb4ZfSUo8id0rsMk+l79J64pKrdwAR0si2WPx+sb9tnJJUjr
         Bw/lHdWp4Z7UlIu6KheJ1SWQzL27LFRGjzgWQbszBavMqN/BVrDBiLhb87IicXzfOAYH
         1d1IFwMEaMb2Cyfe2HACUFzDv6d9ec6o1Jh0HBt/nBuOdr8ZbMIYRLj4YxjpvGjZAily
         EzPDuYFbwMrtv/KwJ1sNVs+6CfNwY1ZQ8DSPjZtVxqT20EFi/Nje61/JjsP4zwG2DCk2
         ksZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bck4FEIZwLJxEgJfodppN6GjeHSlm20yQGpAdfjcv24=;
        b=t3axTrf5ue4cFm9fU8sGi0aurSn8r2dONQB218PLHiWtbnD21yztxNdAn8BY0SrQII
         Ics2s7JuN1PDIZEmaLc/KDVFSd1xf7TTZcJEnzgq2m8OCimXREyp0UzjKV+cxMlQGMUz
         qg2EuIjmRr7Wqb4X2VozD2vK+m8RBqUmIjY706OItvLmnBv45/uBQjbjOdCn08tu6ZCi
         8cIqZuyeUTRfwmQ4ffKJcQrTOxn+SAWxvr6rg3bOP8NDgUwpTuoeNuCIqcwHB2SJgtgi
         4jTphvWOra8p43mdkDdi1B34vKYS8bAprTCtgTp9qqVUvthcEZC4YOjRXf3BlbMI7p2Z
         BenQ==
X-Gm-Message-State: APjAAAVsmJUTlLPCxguHMlqzeP649Q5cSigfS4GVkmmp0vJFbKy9Myo1
        MFQoIDW0rEikdTkZ8hFz6FkC
X-Google-Smtp-Source: APXvYqxT5O9JwdZi+JeXKrtNDG1huoK20WtYmF/fV9NOAVkEM8H9jed1HLomSjJcpd5+BqavmBrpEA==
X-Received: by 2002:a63:1853:: with SMTP id 19mr3322193pgy.170.1579778347013;
        Thu, 23 Jan 2020 03:19:07 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:19:06 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/16] bus: mhi: core: Add support for PM state transitions
Date:   Thu, 23 Jan 2020 16:48:26 +0530
Message-Id: <20200123111836.7414-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for transitioning the MHI states as a
part of the power management operations. Helpers functions are
provided for the state transitions, which will be consumed by the
actual power management routines.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/989

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[jhugo: removed dma_zalloc_coherent() and fixed several bugs]
Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
[mani: splitted the pm patch and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/Makefile   |   2 +-
 drivers/bus/mhi/core/init.c     |  65 +++
 drivers/bus/mhi/core/internal.h | 175 ++++++++
 drivers/bus/mhi/core/main.c     |   9 +
 drivers/bus/mhi/core/pm.c       | 685 ++++++++++++++++++++++++++++++++
 include/linux/mhi.h             |  51 +++
 6 files changed, 986 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bus/mhi/core/pm.c

diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index 77f7730da4bf..a0070f9cdfcd 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_MHI_BUS) := mhi.o
 
-mhi-y := init.o main.o
+mhi-y := init.o main.o pm.o
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 588166b588b4..83a03493c757 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -19,6 +19,62 @@
 #include <linux/wait.h>
 #include "internal.h"
 
+const char * const mhi_ee_str[MHI_EE_MAX] = {
+	[MHI_EE_PBL] = "PBL",
+	[MHI_EE_SBL] = "SBL",
+	[MHI_EE_AMSS] = "AMSS",
+	[MHI_EE_RDDM] = "RDDM",
+	[MHI_EE_WFW] = "WFW",
+	[MHI_EE_PTHRU] = "PASS THRU",
+	[MHI_EE_EDL] = "EDL",
+	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
+	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
+};
+
+const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
+	[DEV_ST_TRANSITION_PBL] = "PBL",
+	[DEV_ST_TRANSITION_READY] = "READY",
+	[DEV_ST_TRANSITION_SBL] = "SBL",
+	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
+};
+
+const char * const mhi_state_str[MHI_STATE_MAX] = {
+	[MHI_STATE_RESET] = "RESET",
+	[MHI_STATE_READY] = "READY",
+	[MHI_STATE_M0] = "M0",
+	[MHI_STATE_M1] = "M1",
+	[MHI_STATE_M2] = "M2",
+	[MHI_STATE_M3] = "M3",
+	[MHI_STATE_M3_FAST] = "M3_FAST",
+	[MHI_STATE_BHI] = "BHI",
+	[MHI_STATE_SYS_ERR] = "SYS_ERR",
+};
+
+static const char * const mhi_pm_state_str[] = {
+	[MHI_PM_STATE_DISABLE] = "DISABLE",
+	[MHI_PM_STATE_POR] = "POR",
+	[MHI_PM_STATE_M0] = "M0",
+	[MHI_PM_STATE_M2] = "M2",
+	[MHI_PM_STATE_M3_ENTER] = "M?->M3",
+	[MHI_PM_STATE_M3] = "M3",
+	[MHI_PM_STATE_M3_EXIT] = "M3->M0",
+	[MHI_PM_STATE_FW_DL_ERR] = "FW DL Error",
+	[MHI_PM_STATE_SYS_ERR_DETECT] = "SYS_ERR Detect",
+	[MHI_PM_STATE_SYS_ERR_PROCESS] = "SYS_ERR Process",
+	[MHI_PM_STATE_SHUTDOWN_PROCESS] = "SHUTDOWN Process",
+	[MHI_PM_STATE_LD_ERR_FATAL_DETECT] = "LD or Error Fatal Detect",
+};
+
+const char *to_mhi_pm_state_str(enum mhi_pm_state state)
+{
+	int index = find_last_bit((unsigned long *)&state, 32);
+
+	if (index >= ARRAY_SIZE(mhi_pm_state_str))
+		return "Invalid State";
+
+	return mhi_pm_state_str[index];
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;
@@ -372,6 +428,11 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
 	if (!mhi_cntrl->buffer_len)
 		mhi_cntrl->buffer_len = MHI_MAX_MTU;
 
+	/* By default, host is allowed to ring DB in both M0 and M2 states */
+	mhi_cntrl->db_access = MHI_PM_M0 | MHI_PM_M2;
+	if (config->m2_no_db)
+		mhi_cntrl->db_access &= ~MHI_PM_M2;
+
 	return 0;
 
 error_ev_cfg:
@@ -408,8 +469,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	}
 
 	INIT_LIST_HEAD(&mhi_cntrl->transition_list);
+	mutex_init(&mhi_cntrl->pm_mutex);
+	rwlock_init(&mhi_cntrl->pm_lock);
 	spin_lock_init(&mhi_cntrl->transition_lock);
 	spin_lock_init(&mhi_cntrl->wlock);
+	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
+	INIT_WORK(&mhi_cntrl->syserr_worker, mhi_pm_sys_err_worker);
 	init_waitqueue_head(&mhi_cntrl->state_event);
 
 	mhi_cmd = mhi_cntrl->mhi_cmd;
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index a4d10916984a..2dba4923482a 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -258,6 +258,79 @@ enum mhi_cmd_type {
 	MHI_CMD_START_CHAN = 18,
 };
 
+/* No operation command */
+#define MHI_TRE_CMD_NOOP_PTR (0)
+#define MHI_TRE_CMD_NOOP_DWORD0 (0)
+#define MHI_TRE_CMD_NOOP_DWORD1 (MHI_CMD_NOP << 16)
+
+/* Channel reset command */
+#define MHI_TRE_CMD_RESET_PTR (0)
+#define MHI_TRE_CMD_RESET_DWORD0 (0)
+#define MHI_TRE_CMD_RESET_DWORD1(chid) ((chid << 24) | \
+					(MHI_CMD_RESET_CHAN << 16))
+
+/* Channel stop command */
+#define MHI_TRE_CMD_STOP_PTR (0)
+#define MHI_TRE_CMD_STOP_DWORD0 (0)
+#define MHI_TRE_CMD_STOP_DWORD1(chid) ((chid << 24) | \
+				       (MHI_CMD_STOP_CHAN << 16))
+
+/* Channel start command */
+#define MHI_TRE_CMD_START_PTR (0)
+#define MHI_TRE_CMD_START_DWORD0 (0)
+#define MHI_TRE_CMD_START_DWORD1(chid) ((chid << 24) | \
+					(MHI_CMD_START_CHAN << 16))
+
+#define MHI_TRE_GET_CMD_CHID(tre) (((tre)->dword[1] >> 24) & 0xFF)
+#define MHI_TRE_GET_CMD_TYPE(tre) (((tre)->dword[1] >> 16) & 0xFF)
+
+/* Event descriptor macros */
+#define MHI_TRE_EV_PTR(ptr) (ptr)
+#define MHI_TRE_EV_DWORD0(code, len) ((code << 24) | len)
+#define MHI_TRE_EV_DWORD1(chid, type) ((chid << 24) | (type << 16))
+#define MHI_TRE_GET_EV_PTR(tre) ((tre)->ptr)
+#define MHI_TRE_GET_EV_CODE(tre) (((tre)->dword[0] >> 24) & 0xFF)
+#define MHI_TRE_GET_EV_LEN(tre) ((tre)->dword[0] & 0xFFFF)
+#define MHI_TRE_GET_EV_CHID(tre) (((tre)->dword[1] >> 24) & 0xFF)
+#define MHI_TRE_GET_EV_TYPE(tre) (((tre)->dword[1] >> 16) & 0xFF)
+#define MHI_TRE_GET_EV_STATE(tre) (((tre)->dword[0] >> 24) & 0xFF)
+#define MHI_TRE_GET_EV_EXECENV(tre) (((tre)->dword[0] >> 24) & 0xFF)
+#define MHI_TRE_GET_EV_SEQ(tre) ((tre)->dword[0])
+#define MHI_TRE_GET_EV_TIME(tre) ((tre)->ptr)
+#define MHI_TRE_GET_EV_COOKIE(tre) lower_32_bits((tre)->ptr)
+#define MHI_TRE_GET_EV_VEID(tre) (((tre)->dword[0] >> 16) & 0xFF)
+#define MHI_TRE_GET_EV_LINKSPEED(tre) (((tre)->dword[1] >> 24) & 0xFF)
+#define MHI_TRE_GET_EV_LINKWIDTH(tre) ((tre)->dword[0] & 0xFF)
+
+/* Transfer descriptor macros */
+#define MHI_TRE_DATA_PTR(ptr) (ptr)
+#define MHI_TRE_DATA_DWORD0(len) (len & MHI_MAX_MTU)
+#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) ((2 << 16) | (bei << 10) \
+	| (ieot << 9) | (ieob << 8) | chain)
+
+/* RSC transfer descriptor macros */
+#define MHI_RSCTRE_DATA_PTR(ptr, len) (((u64)len << 48) | ptr)
+#define MHI_RSCTRE_DATA_DWORD0(cookie) (cookie)
+#define MHI_RSCTRE_DATA_DWORD1 (MHI_PKT_TYPE_COALESCING << 16)
+
+enum mhi_pkt_type {
+	MHI_PKT_TYPE_INVALID = 0x0,
+	MHI_PKT_TYPE_NOOP_CMD = 0x1,
+	MHI_PKT_TYPE_TRANSFER = 0x2,
+	MHI_PKT_TYPE_COALESCING = 0x8,
+	MHI_PKT_TYPE_RESET_CHAN_CMD = 0x10,
+	MHI_PKT_TYPE_STOP_CHAN_CMD = 0x11,
+	MHI_PKT_TYPE_START_CHAN_CMD = 0x12,
+	MHI_PKT_TYPE_STATE_CHANGE_EVENT = 0x20,
+	MHI_PKT_TYPE_CMD_COMPLETION_EVENT = 0x21,
+	MHI_PKT_TYPE_TX_EVENT = 0x22,
+	MHI_PKT_TYPE_RSC_TX_EVENT = 0x28,
+	MHI_PKT_TYPE_EE_EVENT = 0x40,
+	MHI_PKT_TYPE_TSYNC_EVENT = 0x48,
+	MHI_PKT_TYPE_BW_REQ_EVENT = 0x50,
+	MHI_PKT_TYPE_STALE_EVENT, /* internal event */
+};
+
 /* MHI transfer completion events */
 enum mhi_ev_ccs {
 	MHI_EV_CC_INVALID = 0x0,
@@ -283,6 +356,81 @@ enum mhi_ch_state {
 #define MHI_INVALID_BRSTMODE(mode) (mode != MHI_DB_BRST_DISABLE && \
 				    mode != MHI_DB_BRST_ENABLE)
 
+extern const char * const mhi_ee_str[MHI_EE_MAX];
+#define TO_MHI_EXEC_STR(ee) (((ee) >= MHI_EE_MAX) ? \
+			     "INVALID_EE" : mhi_ee_str[ee])
+
+#define MHI_IN_PBL(ee) (ee == MHI_EE_PBL || ee == MHI_EE_PTHRU || \
+			ee == MHI_EE_EDL)
+
+#define MHI_IN_MISSION_MODE(ee) (ee == MHI_EE_AMSS || ee == MHI_EE_WFW)
+
+enum dev_st_transition {
+	DEV_ST_TRANSITION_PBL,
+	DEV_ST_TRANSITION_READY,
+	DEV_ST_TRANSITION_SBL,
+	DEV_ST_TRANSITION_MISSION_MODE,
+	DEV_ST_TRANSITION_MAX,
+};
+
+extern const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX];
+#define TO_DEV_STATE_TRANS_STR(state) (((state) >= DEV_ST_TRANSITION_MAX) ? \
+				"INVALID_STATE" : dev_state_tran_str[state])
+
+extern const char * const mhi_state_str[MHI_STATE_MAX];
+#define TO_MHI_STATE_STR(state) ((state >= MHI_STATE_MAX || \
+				  !mhi_state_str[state]) ? \
+				"INVALID_STATE" : mhi_state_str[state])
+
+/* internal power states */
+enum mhi_pm_state {
+	MHI_PM_STATE_DISABLE,
+	MHI_PM_STATE_POR,
+	MHI_PM_STATE_M0,
+	MHI_PM_STATE_M2,
+	MHI_PM_STATE_M3_ENTER,
+	MHI_PM_STATE_M3,
+	MHI_PM_STATE_M3_EXIT,
+	MHI_PM_STATE_FW_DL_ERR,
+	MHI_PM_STATE_SYS_ERR_DETECT,
+	MHI_PM_STATE_SYS_ERR_PROCESS,
+	MHI_PM_STATE_SHUTDOWN_PROCESS,
+	MHI_PM_STATE_LD_ERR_FATAL_DETECT,
+	MHI_PM_STATE_MAX
+};
+
+#define MHI_PM_DISABLE			BIT(0)
+#define MHI_PM_POR			BIT(1)
+#define MHI_PM_M0			BIT(2)
+#define MHI_PM_M2			BIT(3)
+#define MHI_PM_M3_ENTER			BIT(4)
+#define MHI_PM_M3			BIT(5)
+#define MHI_PM_M3_EXIT			BIT(6)
+/* firmware download failure state */
+#define MHI_PM_FW_DL_ERR		BIT(7)
+#define MHI_PM_SYS_ERR_DETECT		BIT(8)
+#define MHI_PM_SYS_ERR_PROCESS		BIT(9)
+#define MHI_PM_SHUTDOWN_PROCESS		BIT(10)
+/* link not accessible */
+#define MHI_PM_LD_ERR_FATAL_DETECT	BIT(11)
+
+#define MHI_REG_ACCESS_VALID(pm_state) ((pm_state & (MHI_PM_POR | MHI_PM_M0 | \
+		MHI_PM_M2 | MHI_PM_M3_ENTER | MHI_PM_M3_EXIT | \
+		MHI_PM_SYS_ERR_DETECT | MHI_PM_SYS_ERR_PROCESS | \
+		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_FW_DL_ERR)))
+#define MHI_PM_IN_ERROR_STATE(pm_state) (pm_state >= MHI_PM_FW_DL_ERR)
+#define MHI_PM_IN_FATAL_STATE(pm_state) (pm_state == MHI_PM_LD_ERR_FATAL_DETECT)
+#define MHI_DB_ACCESS_VALID(mhi_cntrl) (mhi_cntrl->pm_state & \
+					mhi_cntrl->db_access)
+#define MHI_WAKE_DB_CLEAR_VALID(pm_state) (pm_state & (MHI_PM_M0 | \
+						MHI_PM_M2 | MHI_PM_M3_EXIT))
+#define MHI_WAKE_DB_SET_VALID(pm_state) (pm_state & MHI_PM_M2)
+#define MHI_WAKE_DB_FORCE_SET_VALID(pm_state) MHI_WAKE_DB_CLEAR_VALID(pm_state)
+#define MHI_EVENT_ACCESS_INVALID(pm_state) (pm_state == MHI_PM_DISABLE || \
+					    MHI_PM_IN_ERROR_STATE(pm_state))
+#define MHI_PM_IN_SUSPEND_STATE(pm_state) (pm_state & \
+					   (MHI_PM_M3_ENTER | MHI_PM_M3))
+
 #define NR_OF_CMD_RINGS			1
 #define CMD_EL_PER_RING			128
 #define PRIMARY_CMD_RING		0
@@ -315,6 +463,16 @@ struct db_cfg {
 			   dma_addr_t db_val);
 };
 
+struct mhi_pm_transitions {
+	enum mhi_pm_state from_state;
+	u32 to_states;
+};
+
+struct state_transition {
+	struct list_head node;
+	enum dev_st_transition state;
+};
+
 struct mhi_ring {
 	dma_addr_t dma_handle;
 	dma_addr_t iommu_base;
@@ -417,6 +575,23 @@ static inline void mhi_dealloc_device(struct mhi_controller *mhi_cntrl,
 int mhi_destroy_device(struct device *dev, void *data);
 void mhi_create_devices(struct mhi_controller *mhi_cntrl);
 
+/* Power management APIs */
+enum mhi_pm_state __must_check mhi_tryset_pm_state(
+					struct mhi_controller *mhi_cntrl,
+					enum mhi_pm_state state);
+const char *to_mhi_pm_state_str(enum mhi_pm_state state);
+enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
+int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
+			       enum dev_st_transition state);
+void mhi_pm_st_worker(struct work_struct *work);
+void mhi_pm_sys_err_worker(struct work_struct *work);
+int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl);
+void mhi_ctrl_ev_task(unsigned long data);
+int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl);
+void mhi_pm_m1_transition(struct mhi_controller *mhi_cntrl);
+int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl);
+int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
+
 /* Register access methods */
 void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
 		     void __iomem *db_addr, dma_addr_t db_val);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 134ef9b2cc78..df980fb3b6db 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -135,6 +135,15 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl)
 	return (ret) ? MHI_EE_MAX : exec;
 }
 
+enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
+{
+	u32 state;
+	int ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MHISTATUS,
+				     MHISTATUS_MHISTATE_MASK,
+				     MHISTATUS_MHISTATE_SHIFT, &state);
+	return ret ? MHI_STATE_MAX : state;
+}
+
 int mhi_destroy_device(struct device *dev, void *data)
 {
 	struct mhi_device *mhi_dev;
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
new file mode 100644
index 000000000000..75d43b1039ea
--- /dev/null
+++ b/drivers/bus/mhi/core/pm.c
@@ -0,0 +1,685 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#define dev_fmt(fmt) "MHI: " fmt
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+#include "internal.h"
+
+/*
+ * Not all MHI state transitions are synchronous. Transitions like Linkdown,
+ * SYS_ERR, and shutdown can happen anytime asynchronously. This function will
+ * transition to a new state only if we're allowed to.
+ *
+ * Priority increases as we go down. For instance, from any state in L0, the
+ * transition can be made to states in L1, L2 and L3. A notable exception to
+ * this rule is state DISABLE.  From DISABLE state we can only transition to
+ * POR state. Also, while in L2 state, user cannot jump back to previous
+ * L1 or L0 states.
+ *
+ * Valid transitions:
+ * L0: DISABLE <--> POR
+ *     POR <--> POR
+ *     POR -> M0 -> M2 --> M0
+ *     POR -> FW_DL_ERR
+ *     FW_DL_ERR <--> FW_DL_ERR
+ *     M0 <--> M0
+ *     M0 -> FW_DL_ERR
+ *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
+ * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
+ * L2: SHUTDOWN_PROCESS -> DISABLE
+ * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
+ *     LD_ERR_FATAL_DETECT -> SHUTDOWN_PROCESS
+ */
+static struct mhi_pm_transitions const dev_state_transitions[] = {
+	/* L0 States */
+	{
+		MHI_PM_DISABLE,
+		MHI_PM_POR
+	},
+	{
+		MHI_PM_POR,
+		MHI_PM_POR | MHI_PM_DISABLE | MHI_PM_M0 |
+		MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
+	},
+	{
+		MHI_PM_M0,
+		MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
+		MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
+	},
+	{
+		MHI_PM_M2,
+		MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	{
+		MHI_PM_M3_ENTER,
+		MHI_PM_M3 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	{
+		MHI_PM_M3,
+		MHI_PM_M3_EXIT | MHI_PM_SYS_ERR_DETECT |
+		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	{
+		MHI_PM_M3_EXIT,
+		MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	{
+		MHI_PM_FW_DL_ERR,
+		MHI_PM_FW_DL_ERR | MHI_PM_SYS_ERR_DETECT |
+		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	/* L1 States */
+	{
+		MHI_PM_SYS_ERR_DETECT,
+		MHI_PM_SYS_ERR_PROCESS | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	{
+		MHI_PM_SYS_ERR_PROCESS,
+		MHI_PM_POR | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	/* L2 States */
+	{
+		MHI_PM_SHUTDOWN_PROCESS,
+		MHI_PM_DISABLE | MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	/* L3 States */
+	{
+		MHI_PM_LD_ERR_FATAL_DETECT,
+		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_SHUTDOWN_PROCESS
+	},
+};
+
+enum mhi_pm_state __must_check mhi_tryset_pm_state(struct mhi_controller *mhi_cntrl,
+						   enum mhi_pm_state state)
+{
+	unsigned long cur_state = mhi_cntrl->pm_state;
+	int index = find_last_bit(&cur_state, 32);
+
+	if (unlikely(index >= ARRAY_SIZE(dev_state_transitions)))
+		return cur_state;
+
+	if (unlikely(dev_state_transitions[index].from_state != cur_state))
+		return cur_state;
+
+	if (unlikely(!(dev_state_transitions[index].to_states & state)))
+		return cur_state;
+
+	mhi_cntrl->pm_state = state;
+	return mhi_cntrl->pm_state;
+}
+
+void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl, enum mhi_state state)
+{
+	if (state == MHI_STATE_RESET) {
+		mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				    MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 1);
+	} else {
+		mhi_write_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				    MHICTRL_MHISTATE_MASK,
+				    MHICTRL_MHISTATE_SHIFT, state);
+	}
+}
+
+/* Handle device ready state transition */
+int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
+{
+	void __iomem *base = mhi_cntrl->regs;
+	u32 reset = 1, ready = 0;
+	struct mhi_event *mhi_event;
+	enum mhi_pm_state cur_state;
+	int ret, i;
+
+	/* Wait for RESET to be cleared and READY bit to be set by the device */
+	wait_event_timeout(mhi_cntrl->state_event,
+			   MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
+			   mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
+					      MHICTRL_RESET_MASK,
+					      MHICTRL_RESET_SHIFT, &reset) ||
+			   mhi_read_reg_field(mhi_cntrl, base, MHISTATUS,
+					      MHISTATUS_READY_MASK,
+					      MHISTATUS_READY_SHIFT, &ready) ||
+			   (!reset && ready),
+			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
+
+	/* Check if device entered error state */
+	if (MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
+		dev_err(mhi_cntrl->dev, "Device link is not accessible\n");
+		return -EIO;
+	}
+
+	/* Timeout if device did not transition to ready state */
+	if (reset || !ready) {
+		dev_err(mhi_cntrl->dev, "Device Ready timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	dev_dbg(mhi_cntrl->dev, "Device in READY State\n");
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_POR);
+	mhi_cntrl->dev_state = MHI_STATE_READY;
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	if (cur_state != MHI_PM_POR) {
+		dev_err(mhi_cntrl->dev, "Error moving to state %s from %s\n",
+			to_mhi_pm_state_str(MHI_PM_POR),
+			to_mhi_pm_state_str(cur_state));
+		return -EIO;
+	}
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
+		dev_err(mhi_cntrl->dev, "Device registers not accessible\n");
+		goto error_mmio;
+	}
+
+	/* Configure MMIO registers */
+	ret = mhi_init_mmio(mhi_cntrl);
+	if (ret) {
+		dev_err(mhi_cntrl->dev, "Error configuring MMIO registers\n");
+		goto error_mmio;
+	}
+
+	/* Add elements to all SW event rings */
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		struct mhi_ring *ring = &mhi_event->ring;
+
+		/* Skip if this is an offload or HW event */
+		if (mhi_event->offload_ev || mhi_event->hw_ring)
+			continue;
+
+		ring->wp = ring->base + ring->len - ring->el_size;
+		*ring->ctxt_wp = ring->iommu_base + ring->len - ring->el_size;
+		/* Update all cores */
+		smp_wmb();
+
+		/* Ring the event ring db */
+		spin_lock_irq(&mhi_event->lock);
+		mhi_ring_er_db(mhi_event);
+		spin_unlock_irq(&mhi_event->lock);
+	}
+
+	/* Set MHI to M0 state */
+	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return 0;
+
+error_mmio:
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return -EIO;
+}
+
+int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl)
+{
+	enum mhi_pm_state cur_state;
+	struct mhi_chan *mhi_chan;
+	int i;
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	mhi_cntrl->dev_state = MHI_STATE_M0;
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M0);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+	if (unlikely(cur_state != MHI_PM_M0)) {
+		dev_err(mhi_cntrl->dev, "Unable to transition to M0 state\n");
+		return -EIO;
+	}
+
+	mhi_cntrl->M0++;
+
+	/* Wake up the device */
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	mhi_cntrl->wake_get(mhi_cntrl, true);
+
+	/* Ring all event rings and CMD ring only if we're in mission mode */
+	if (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) {
+		struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
+		struct mhi_cmd *mhi_cmd =
+			&mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
+
+		for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+			if (mhi_event->offload_ev)
+				continue;
+
+			spin_lock_irq(&mhi_event->lock);
+			mhi_ring_er_db(mhi_event);
+			spin_unlock_irq(&mhi_event->lock);
+		}
+
+		/* Only ring primary cmd ring if ring is not empty */
+		spin_lock_irq(&mhi_cmd->lock);
+		if (mhi_cmd->ring.rp != mhi_cmd->ring.wp)
+			mhi_ring_cmd_db(mhi_cntrl, mhi_cmd);
+		spin_unlock_irq(&mhi_cmd->lock);
+	}
+
+	/* Ring channel DB registers */
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+
+		write_lock_irq(&mhi_chan->lock);
+		if (mhi_chan->db_cfg.reset_req)
+			mhi_chan->db_cfg.db_mode = true;
+
+		/* Only ring DB if ring is not empty */
+		if (tre_ring->base && tre_ring->wp  != tre_ring->rp)
+			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+		write_unlock_irq(&mhi_chan->lock);
+	}
+
+	mhi_cntrl->wake_put(mhi_cntrl, false);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+	wake_up_all(&mhi_cntrl->state_event);
+
+	return 0;
+}
+
+/*
+ * After receiving the MHI state change event from the device indicating the
+ * transition to M1 state, the host can transition the device to M2 state
+ * for keeping it in low power state.
+ */
+void mhi_pm_m1_transition(struct mhi_controller *mhi_cntrl)
+{
+	enum mhi_pm_state state;
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M2);
+	if (state == MHI_PM_M2) {
+		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_M2);
+		mhi_cntrl->dev_state = MHI_STATE_M2;
+		mhi_cntrl->M2++;
+
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		wake_up_all(&mhi_cntrl->state_event);
+
+		/* If there are any pending resources, exit M2 immediately */
+		if (unlikely(atomic_read(&mhi_cntrl->pending_pkts) ||
+			     atomic_read(&mhi_cntrl->dev_wake))) {
+			dev_dbg(mhi_cntrl->dev,
+				 "Exiting M2, pending_pkts: %d dev_wake: %d\n",
+				 atomic_read(&mhi_cntrl->pending_pkts),
+				 atomic_read(&mhi_cntrl->dev_wake));
+			read_lock_bh(&mhi_cntrl->pm_lock);
+			mhi_cntrl->wake_get(mhi_cntrl, true);
+			mhi_cntrl->wake_put(mhi_cntrl, true);
+			read_unlock_bh(&mhi_cntrl->pm_lock);
+		} else {
+			mhi_cntrl->status_cb(mhi_cntrl, mhi_cntrl->priv_data,
+					     MHI_CB_IDLE);
+		}
+	} else {
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+	}
+}
+
+/* MHI M3 completion handler */
+int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl)
+{
+	enum mhi_pm_state state;
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	mhi_cntrl->dev_state = MHI_STATE_M3;
+	state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M3);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+	if (state != MHI_PM_M3) {
+		dev_err(mhi_cntrl->dev, "Unable to transition to M3 state\n");
+		return -EIO;
+	}
+
+	wake_up_all(&mhi_cntrl->state_event);
+	mhi_cntrl->M3++;
+
+	return 0;
+}
+
+/* Handle device Mission Mode transition */
+static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
+{
+	int i, ret;
+	struct mhi_event *mhi_event;
+
+	dev_dbg(mhi_cntrl->dev, "Processing Mission Mode transition\n");
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
+		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee))
+		return -EIO;
+
+	wake_up_all(&mhi_cntrl->state_event);
+
+	mhi_cntrl->status_cb(mhi_cntrl, mhi_cntrl->priv_data,
+			     MHI_CB_EE_MISSION_MODE);
+
+	/* Force MHI to be in M0 state before continuing */
+	ret = __mhi_device_get_sync(mhi_cntrl);
+	if (ret)
+		return ret;
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		ret = -EIO;
+		goto error_mission_mode;
+	}
+
+	/* Add elements to all HW event rings */
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		struct mhi_ring *ring = &mhi_event->ring;
+
+		if (mhi_event->offload_ev || !mhi_event->hw_ring)
+			continue;
+
+		ring->wp = ring->base + ring->len - ring->el_size;
+		*ring->ctxt_wp = ring->iommu_base + ring->len - ring->el_size;
+		/* Update to all cores */
+		smp_wmb();
+
+		spin_lock_irq(&mhi_event->lock);
+		if (MHI_DB_ACCESS_VALID(mhi_cntrl))
+			mhi_ring_er_db(mhi_event);
+		spin_unlock_irq(&mhi_event->lock);
+	}
+
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	/*
+	 * The MHI devices are only created when the client device switches its
+	 * Execution Environment (EE) to either SBL or AMSS states
+	 */
+	mhi_create_devices(mhi_cntrl);
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+
+error_mission_mode:
+	mhi_cntrl->wake_put(mhi_cntrl, false);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return ret;
+}
+
+/* Handle SYS_ERR and Shutdown transitions */
+static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
+				      enum mhi_pm_state transition_state)
+{
+	enum mhi_pm_state cur_state, prev_state;
+	struct mhi_event *mhi_event;
+	struct mhi_cmd_ctxt *cmd_ctxt;
+	struct mhi_cmd *mhi_cmd;
+	struct mhi_event_ctxt *er_ctxt;
+	int ret, i;
+
+	dev_dbg(mhi_cntrl->dev,
+		 "Transitioning from PM state: %s to: %s\n",
+		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		 to_mhi_pm_state_str(transition_state));
+
+	/* We must notify MHI control driver so it can clean up first */
+	if (transition_state == MHI_PM_SYS_ERR_PROCESS) {
+		mhi_cntrl->status_cb(mhi_cntrl, mhi_cntrl->priv_data,
+				     MHI_CB_SYS_ERROR);
+	}
+
+	mutex_lock(&mhi_cntrl->pm_mutex);
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	prev_state = mhi_cntrl->pm_state;
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
+	if (cur_state == transition_state) {
+		mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
+		mhi_cntrl->dev_state = MHI_STATE_RESET;
+	}
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	/* Wake up threads waiting for state transition */
+	wake_up_all(&mhi_cntrl->state_event);
+
+	if (cur_state != transition_state) {
+		dev_err(mhi_cntrl->dev,
+			 "Failed to transition to state: %s from: %s\n",
+			 to_mhi_pm_state_str(transition_state),
+			 to_mhi_pm_state_str(cur_state));
+		mutex_unlock(&mhi_cntrl->pm_mutex);
+		return;
+	}
+
+	/* Trigger MHI RESET so that the device will not access host memory */
+	if (MHI_REG_ACCESS_VALID(prev_state)) {
+		u32 in_reset = -1;
+		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
+
+		dev_dbg(mhi_cntrl->dev, "Triggering MHI Reset in device\n");
+		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
+
+		/* Wait for the reset bit to be cleared by the device */
+		ret = wait_event_timeout(mhi_cntrl->state_event,
+					 mhi_read_reg_field(mhi_cntrl,
+							    mhi_cntrl->regs,
+							    MHICTRL,
+							    MHICTRL_RESET_MASK,
+							    MHICTRL_RESET_SHIFT,
+							    &in_reset) ||
+					!in_reset, timeout);
+		if ((!ret || in_reset) && cur_state == MHI_PM_SYS_ERR_PROCESS) {
+			dev_err(mhi_cntrl->dev,
+				"Device failed to exit MHI Reset state\n");
+			mutex_unlock(&mhi_cntrl->pm_mutex);
+			return;
+		}
+
+		/*
+		 * Device will clear BHI_INTVEC as a part of RESET processing,
+		 * hence re-program it
+		 */
+		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
+	}
+
+	dev_dbg(mhi_cntrl->dev,
+		 "Waiting for all pending event ring processing to complete\n");
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->offload_ev)
+			continue;
+		tasklet_kill(&mhi_event->task);
+	}
+
+	/* Release lock and wait for all pending threads to complete */
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+	dev_dbg(mhi_cntrl->dev,
+		 "Waiting for all pending threads to complete\n");
+	wake_up_all(&mhi_cntrl->state_event);
+	flush_work(&mhi_cntrl->st_worker);
+	flush_work(&mhi_cntrl->fw_worker);
+
+	dev_dbg(mhi_cntrl->dev,
+		 "Reset all active channels and remove MHI devices\n");
+	device_for_each_child(mhi_cntrl->dev, NULL, mhi_destroy_device);
+
+	mutex_lock(&mhi_cntrl->pm_mutex);
+
+	WARN_ON(atomic_read(&mhi_cntrl->dev_wake));
+	WARN_ON(atomic_read(&mhi_cntrl->pending_pkts));
+
+	/* Reset the ev rings and cmd rings */
+	dev_dbg(mhi_cntrl->dev, "Resetting EV CTXT and CMD CTXT\n");
+	mhi_cmd = mhi_cntrl->mhi_cmd;
+	cmd_ctxt = mhi_cntrl->mhi_ctxt->cmd_ctxt;
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
+		struct mhi_ring *ring = &mhi_cmd->ring;
+
+		ring->rp = ring->base;
+		ring->wp = ring->base;
+		cmd_ctxt->rp = cmd_ctxt->rbase;
+		cmd_ctxt->wp = cmd_ctxt->rbase;
+	}
+
+	mhi_event = mhi_cntrl->mhi_event;
+	er_ctxt = mhi_cntrl->mhi_ctxt->er_ctxt;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
+		     mhi_event++) {
+		struct mhi_ring *ring = &mhi_event->ring;
+
+		/* Skip offload events */
+		if (mhi_event->offload_ev)
+			continue;
+
+		ring->rp = ring->base;
+		ring->wp = ring->base;
+		er_ctxt->rp = er_ctxt->rbase;
+		er_ctxt->wp = er_ctxt->rbase;
+	}
+
+	if (cur_state == MHI_PM_SYS_ERR_PROCESS) {
+		mhi_ready_state_transition(mhi_cntrl);
+	} else {
+		/* Move to disable state */
+		write_lock_irq(&mhi_cntrl->pm_lock);
+		cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		if (unlikely(cur_state != MHI_PM_DISABLE))
+			dev_err(mhi_cntrl->dev,
+				"Error moving from PM state: %s to: %s\n",
+				to_mhi_pm_state_str(cur_state),
+				to_mhi_pm_state_str(MHI_PM_DISABLE));
+	}
+
+	dev_dbg(mhi_cntrl->dev, "Exiting with PM state: %s, MHI state: %s\n",
+		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		 TO_MHI_STATE_STR(mhi_cntrl->dev_state));
+
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+}
+
+/* Queue a new work item and schedule work */
+int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
+			       enum dev_st_transition state)
+{
+	struct state_transition *item = kmalloc(sizeof(*item), GFP_ATOMIC);
+	unsigned long flags;
+
+	if (!item)
+		return -ENOMEM;
+
+	item->state = state;
+	spin_lock_irqsave(&mhi_cntrl->transition_lock, flags);
+	list_add_tail(&item->node, &mhi_cntrl->transition_list);
+	spin_unlock_irqrestore(&mhi_cntrl->transition_lock, flags);
+
+	schedule_work(&mhi_cntrl->st_worker);
+
+	return 0;
+}
+
+/* SYS_ERR worker */
+void mhi_pm_sys_err_worker(struct work_struct *work)
+{
+	struct mhi_controller *mhi_cntrl = container_of(work,
+							struct mhi_controller,
+							syserr_worker);
+
+	mhi_pm_disable_transition(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
+}
+
+/* Device State Transition worker */
+void mhi_pm_st_worker(struct work_struct *work)
+{
+	struct state_transition *itr, *tmp;
+	LIST_HEAD(head);
+	struct mhi_controller *mhi_cntrl = container_of(work,
+							struct mhi_controller,
+							st_worker);
+	spin_lock_irq(&mhi_cntrl->transition_lock);
+	list_splice_tail_init(&mhi_cntrl->transition_list, &head);
+	spin_unlock_irq(&mhi_cntrl->transition_lock);
+
+	list_for_each_entry_safe(itr, tmp, &head, node) {
+		list_del(&itr->node);
+		dev_dbg(mhi_cntrl->dev, "Handling state transition: %s\n",
+			TO_DEV_STATE_TRANS_STR(itr->state));
+
+		switch (itr->state) {
+		case DEV_ST_TRANSITION_PBL:
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
+				mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			if (MHI_IN_PBL(mhi_cntrl->ee))
+				wake_up_all(&mhi_cntrl->state_event);
+			break;
+		case DEV_ST_TRANSITION_SBL:
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			mhi_cntrl->ee = MHI_EE_SBL;
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			/*
+			 * The MHI devices are only created when the client
+			 * device switches its Execution Environment (EE) to
+			 * either SBL or AMSS states
+			 */
+			mhi_create_devices(mhi_cntrl);
+			break;
+		case DEV_ST_TRANSITION_MISSION_MODE:
+			mhi_pm_mission_mode_transition(mhi_cntrl);
+			break;
+		case DEV_ST_TRANSITION_READY:
+			mhi_ready_state_transition(mhi_cntrl);
+			break;
+		default:
+			break;
+		}
+		kfree(itr);
+	}
+}
+
+int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
+{
+	int ret;
+
+	/* Wake up the device */
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	mhi_cntrl->wake_get(mhi_cntrl, true);
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
+		pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
+		mhi_cntrl->runtime_get(mhi_cntrl, mhi_cntrl->priv_data);
+		mhi_cntrl->runtime_put(mhi_cntrl, mhi_cntrl->priv_data);
+	}
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	ret = wait_event_timeout(mhi_cntrl->state_event,
+				 mhi_cntrl->pm_state == MHI_PM_M0 ||
+				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+
+	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		read_lock_bh(&mhi_cntrl->pm_lock);
+		mhi_cntrl->wake_put(mhi_cntrl, false);
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+		return -EIO;
+	}
+
+	return 0;
+}
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d08f212cdfd0..80633099b90d 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -107,6 +107,31 @@ enum mhi_ee_type {
 	MHI_EE_MAX,
 };
 
+/**
+ * enum mhi_state - MHI states
+ * @MHI_STATE_RESET: Reset state
+ * @MHI_STATE_READY: Ready state
+ * @MHI_STATE_M0: M0 state
+ * @MHI_STATE_M1: M1 state
+ * @MHI_STATE_M2: M2 state
+ * @MHI_STATE_M3: M3 state
+ * @MHI_STATE_M3_FAST: M3 Fast state
+ * @MHI_STATE_BHI: BHI state
+ * @MHI_STATE_SYS_ERR: System Error state
+ */
+enum mhi_state {
+	MHI_STATE_RESET = 0x0,
+	MHI_STATE_READY = 0x1,
+	MHI_STATE_M0 = 0x2,
+	MHI_STATE_M1 = 0x3,
+	MHI_STATE_M2 = 0x4,
+	MHI_STATE_M3 = 0x5,
+	MHI_STATE_M3_FAST = 0x6,
+	MHI_STATE_BHI = 0x7,
+	MHI_STATE_SYS_ERR = 0xFF,
+	MHI_STATE_MAX,
+};
+
 /**
  * enum mhi_buf_type - Accepted buffer type for the channel
  * @MHI_BUF_RAW: Raw buffer
@@ -274,6 +299,7 @@ struct mhi_controller_config {
  * @pm_state: MHI power management state
  * @db_access: DB access states
  * @ee: MHI device execution environment
+ * @dev_state: MHI device state
  * @wake_set: Device wakeup set flag
  * @dev_wake: Device wakeup count
  * @alloc_size: Total memory allocations size of the controller
@@ -339,6 +365,7 @@ struct mhi_controller {
 	u32 pm_state;
 	u32 db_access;
 	enum mhi_ee_type ee;
+	enum mhi_state dev_state;
 	bool wake_set;
 	atomic_t dev_wake;
 	atomic_t alloc_size;
@@ -411,6 +438,22 @@ struct mhi_result {
 	int transaction_status;
 };
 
+/**
+ * struct mhi_buf - MHI Buffer description
+ * @buf: Virtual address of the buffer
+ * @dma_addr: IOMMU address of the buffer
+ * @len: # of bytes
+ * @name: Buffer label. For offload channel, configurations name must be:
+ *        ECA - Event context array data
+ *        CCA - Channel context array data
+ */
+struct mhi_buf {
+	void *buf;
+	dma_addr_t dma_addr;
+	size_t len;
+	const char *name;
+};
+
 /**
  * struct mhi_driver - Structure representing a MHI client driver
  * @probe: CB function for client driver probe function
@@ -481,4 +524,12 @@ int mhi_driver_register(struct mhi_driver *mhi_drv);
  */
 void mhi_driver_unregister(struct mhi_driver *mhi_drv);
 
+/**
+ * mhi_set_mhi_state - Set MHI device state
+ * @mhi_cntrl: MHI controller
+ * @state: State to set
+ */
+void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
+		       enum mhi_state state);
+
 #endif /* _MHI_H_ */
-- 
2.17.1

