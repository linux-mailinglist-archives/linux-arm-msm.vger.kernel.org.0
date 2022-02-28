Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6BA4C6CF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbiB1Mpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236665AbiB1MpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:45:25 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BE749921
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:44:41 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o23so11242295pgk.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mq+2jUyDDojokJ6G5zgU1O7JDo/s8dSzxwe2miaI474=;
        b=lPT690AQPjYaIUgl/dICFrU1p51PiwOLhrZHwO7+apNmxnxEvG701A8oDByBMompGJ
         aapleXc/bCkjtznpabSfklShBzF/FgHMkv6EAp5uGtXFbK+kOAmTXBUmQ2cx5+/GChq7
         b/g4janEZ7wCDsgv7W6D/3S9EIXgkVTYd57ebCmbInNsEAz8d8rEqzC1ajqQ/x7+8yLQ
         SxAhBiuCktIqD7+wbRN6WhzZEe9Vz+uvjlBEFPZ8zeptK0k0n52imFnRYS2HCCnkQkUn
         536w9ifH1nJmuo7o7YnGW807zZCrtevuhO5zewo83hqYwGRUyD77KIt/r8XlWCDwOH9i
         9Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mq+2jUyDDojokJ6G5zgU1O7JDo/s8dSzxwe2miaI474=;
        b=HJqbw8kCUXqE4f1X+iqhIYNYvTUB47qx7kB0GBnzbHM6gScR7cEO8BM71Q+a90UbQ5
         ccH+MIECEgtnxR7bJGfV8wLvzORrVn9gghym6ydJL8BvK60uiJcR2ADAAOaVuKsM6qsA
         yYTlMnbO3jeciR/Zib1ph+kppnzY7xkhiHOGzUpP8DBAoWQQLYaYBfOtmpBI1n2IjOn9
         GBC4l9D0lB/8IXf70okSyprWsi9jZ/VjCaPQ8zTSdeB5P9zNtxZmLiIDOmTZikRbCopN
         6LYoCNdo5NKaEzjnT2gagDioD3PVTwOwfF14vfjC4w7cn0T53Cl/+tuNnBVHvp8kI8L0
         A6RQ==
X-Gm-Message-State: AOAM533MxAuxnAFvDzVKWLuAO1QXf2ndNGlAMyOVa9d/+PsZ2sUTLZdq
        zQrrYJvfI6Vq5FKEeNbRQ7+lkjdgaajE
X-Google-Smtp-Source: ABdhPJxsHyRCwe8dcLVU1taJ/pQX51M0XKnRVRZssMcMTsy0/FWKh4Wh2yWV4P3rVsHFi23cScFZng==
X-Received: by 2002:a63:8549:0:b0:36c:2a9e:d247 with SMTP id u70-20020a638549000000b0036c2a9ed247mr16929760pgd.161.1646052280833;
        Mon, 28 Feb 2022 04:44:40 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:44:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v4 08/27] bus: mhi: Move common MHI definitions out of host directory
Date:   Mon, 28 Feb 2022 18:13:25 +0530
Message-Id: <20220228124344.77359-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the common MHI definitions in host "internal.h" to "common.h" so
that the endpoint code can make use of them. This also avoids
duplicating the definitions in the endpoint stack.

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/common.h        | 283 ++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/internal.h | 264 +----------------------------
 2 files changed, 284 insertions(+), 263 deletions(-)
 create mode 100644 drivers/bus/mhi/common.h

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
new file mode 100644
index 000000000000..f2690bf11c99
--- /dev/null
+++ b/drivers/bus/mhi/common.h
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022, Linaro Ltd.
+ *
+ */
+
+#ifndef _MHI_COMMON_H
+#define _MHI_COMMON_H
+
+#include <linux/bitfield.h>
+#include <linux/mhi.h>
+
+/* MHI registers */
+#define MHIREGLEN			0x00
+#define MHIVER				0x08
+#define MHICFG				0x10
+#define CHDBOFF				0x18
+#define ERDBOFF				0x20
+#define BHIOFF				0x28
+#define BHIEOFF				0x2c
+#define DEBUGOFF			0x30
+#define MHICTRL				0x38
+#define MHISTATUS			0x48
+#define CCABAP_LOWER			0x58
+#define CCABAP_HIGHER			0x5c
+#define ECABAP_LOWER			0x60
+#define ECABAP_HIGHER			0x64
+#define CRCBAP_LOWER			0x68
+#define CRCBAP_HIGHER			0x6c
+#define CRDB_LOWER			0x70
+#define CRDB_HIGHER			0x74
+#define MHICTRLBASE_LOWER		0x80
+#define MHICTRLBASE_HIGHER		0x84
+#define MHICTRLLIMIT_LOWER		0x88
+#define MHICTRLLIMIT_HIGHER		0x8c
+#define MHIDATABASE_LOWER		0x98
+#define MHIDATABASE_HIGHER		0x9c
+#define MHIDATALIMIT_LOWER		0xa0
+#define MHIDATALIMIT_HIGHER		0xa4
+
+/* MHI BHI registers */
+#define BHI_BHIVERSION_MINOR		0x00
+#define BHI_BHIVERSION_MAJOR		0x04
+#define BHI_IMGADDR_LOW			0x08
+#define BHI_IMGADDR_HIGH		0x0c
+#define BHI_IMGSIZE			0x10
+#define BHI_RSVD1			0x14
+#define BHI_IMGTXDB			0x18
+#define BHI_RSVD2			0x1c
+#define BHI_INTVEC			0x20
+#define BHI_RSVD3			0x24
+#define BHI_EXECENV			0x28
+#define BHI_STATUS			0x2c
+#define BHI_ERRCODE			0x30
+#define BHI_ERRDBG1			0x34
+#define BHI_ERRDBG2			0x38
+#define BHI_ERRDBG3			0x3c
+#define BHI_SERIALNU			0x40
+#define BHI_SBLANTIROLLVER		0x44
+#define BHI_NUMSEG			0x48
+#define BHI_MSMHWID(n)			(0x4c + (0x4 * (n)))
+#define BHI_OEMPKHASH(n)		(0x64 + (0x4 * (n)))
+#define BHI_RSVD5			0xc4
+
+/* BHI register bits */
+#define BHI_TXDB_SEQNUM_BMSK		GENMASK(29, 0)
+#define BHI_TXDB_SEQNUM_SHFT		0
+#define BHI_STATUS_MASK			GENMASK(31, 30)
+#define BHI_STATUS_ERROR		0x03
+#define BHI_STATUS_SUCCESS		0x02
+#define BHI_STATUS_RESET		0x00
+
+/* MHI BHIE registers */
+#define BHIE_MSMSOCID_OFFS		0x00
+#define BHIE_TXVECADDR_LOW_OFFS		0x2c
+#define BHIE_TXVECADDR_HIGH_OFFS	0x30
+#define BHIE_TXVECSIZE_OFFS		0x34
+#define BHIE_TXVECDB_OFFS		0x3c
+#define BHIE_TXVECSTATUS_OFFS		0x44
+#define BHIE_RXVECADDR_LOW_OFFS		0x60
+#define BHIE_RXVECADDR_HIGH_OFFS	0x64
+#define BHIE_RXVECSIZE_OFFS		0x68
+#define BHIE_RXVECDB_OFFS		0x70
+#define BHIE_RXVECSTATUS_OFFS		0x78
+
+/* BHIE register bits */
+#define BHIE_TXVECDB_SEQNUM_BMSK	GENMASK(29, 0)
+#define BHIE_TXVECDB_SEQNUM_SHFT	0
+#define BHIE_TXVECSTATUS_SEQNUM_BMSK	GENMASK(29, 0)
+#define BHIE_TXVECSTATUS_SEQNUM_SHFT	0
+#define BHIE_TXVECSTATUS_STATUS_BMSK	GENMASK(31, 30)
+#define BHIE_TXVECSTATUS_STATUS_SHFT	30
+#define BHIE_TXVECSTATUS_STATUS_RESET	0x00
+#define BHIE_TXVECSTATUS_STATUS_XFER_COMPL	0x02
+#define BHIE_TXVECSTATUS_STATUS_ERROR	0x03
+#define BHIE_RXVECDB_SEQNUM_BMSK	GENMASK(29, 0)
+#define BHIE_RXVECDB_SEQNUM_SHFT	0
+#define BHIE_RXVECSTATUS_SEQNUM_BMSK	GENMASK(29, 0)
+#define BHIE_RXVECSTATUS_SEQNUM_SHFT	0
+#define BHIE_RXVECSTATUS_STATUS_BMSK	GENMASK(31, 30)
+#define BHIE_RXVECSTATUS_STATUS_SHFT	30
+#define BHIE_RXVECSTATUS_STATUS_RESET	0x00
+#define BHIE_RXVECSTATUS_STATUS_XFER_COMPL	0x02
+#define BHIE_RXVECSTATUS_STATUS_ERROR	0x03
+
+/* MHI register bits */
+#define MHICFG_NHWER_MASK		GENMASK(31, 24)
+#define MHICFG_NER_MASK			GENMASK(23, 16)
+#define MHICFG_NHWCH_MASK		GENMASK(15, 8)
+#define MHICFG_NCH_MASK			GENMASK(7, 0)
+#define MHICTRL_MHISTATE_MASK		GENMASK(15, 8)
+#define MHICTRL_RESET_MASK		BIT(1)
+#define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
+#define MHISTATUS_SYSERR_MASK		BIT(2)
+#define MHISTATUS_READY_MASK		BIT(0)
+
+/* Command Ring Element macros */
+/* No operation command */
+#define MHI_TRE_CMD_NOOP_PTR		0
+#define MHI_TRE_CMD_NOOP_DWORD0		0
+#define MHI_TRE_CMD_NOOP_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), MHI_CMD_NOP))
+
+/* Channel reset command */
+#define MHI_TRE_CMD_RESET_PTR		0
+#define MHI_TRE_CMD_RESET_DWORD0	0
+#define MHI_TRE_CMD_RESET_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						    FIELD_PREP(GENMASK(23, 16),         \
+							       MHI_CMD_RESET_CHAN))
+
+/* Channel stop command */
+#define MHI_TRE_CMD_STOP_PTR		0
+#define MHI_TRE_CMD_STOP_DWORD0		0
+#define MHI_TRE_CMD_STOP_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						    FIELD_PREP(GENMASK(23, 16),         \
+							       MHI_CMD_STOP_CHAN))
+
+/* Channel start command */
+#define MHI_TRE_CMD_START_PTR		0
+#define MHI_TRE_CMD_START_DWORD0	0
+#define MHI_TRE_CMD_START_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						    FIELD_PREP(GENMASK(23, 16),         \
+							       MHI_CMD_START_CHAN))
+
+#define MHI_TRE_GET_DWORD(tre, word)	le32_to_cpu((tre)->dword[(word)])
+#define MHI_TRE_GET_CMD_CHID(tre)	FIELD_GET(GENMASK(31, 24), MHI_TRE_GET_DWORD(tre, 1))
+#define MHI_TRE_GET_CMD_TYPE(tre)	FIELD_GET(GENMASK(23, 16), MHI_TRE_GET_DWORD(tre, 1))
+
+/* Event descriptor macros */
+#define MHI_TRE_EV_PTR(ptr)		cpu_to_le64(ptr)
+#define MHI_TRE_EV_DWORD0(code, len)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), code) | \
+						    FIELD_PREP(GENMASK(15, 0), len))
+#define MHI_TRE_EV_DWORD1(chid, type)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						    FIELD_PREP(GENMASK(23, 16), type))
+#define MHI_TRE_GET_EV_PTR(tre)		le64_to_cpu((tre)->ptr)
+#define MHI_TRE_GET_EV_CODE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_LEN(tre)		FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_CHID(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
+#define MHI_TRE_GET_EV_TYPE(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1)))
+#define MHI_TRE_GET_EV_STATE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_EXECENV(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_SEQ(tre)		MHI_TRE_GET_DWORD(tre, 0)
+#define MHI_TRE_GET_EV_TIME(tre)	MHI_TRE_GET_EV_PTR(tre)
+#define MHI_TRE_GET_EV_COOKIE(tre)	lower_32_bits(MHI_TRE_GET_EV_PTR(tre))
+#define MHI_TRE_GET_EV_VEID(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_LINKSPEED(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
+#define MHI_TRE_GET_EV_LINKWIDTH(tre)	FIELD_GET(GENMASK(7, 0), (MHI_TRE_GET_DWORD(tre, 0)))
+
+/* Transfer descriptor macros */
+#define MHI_TRE_DATA_PTR(ptr)		cpu_to_le64(ptr)
+#define MHI_TRE_DATA_DWORD0(len)	cpu_to_le32(FIELD_PREP(GENMASK(15, 0), len))
+#define MHI_TRE_TYPE_TRANSFER		2
+#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
+								MHI_TRE_TYPE_TRANSFER) |    \
+								FIELD_PREP(BIT(10), bei) |  \
+								FIELD_PREP(BIT(9), ieot) |  \
+								FIELD_PREP(BIT(8), ieob) |  \
+								FIELD_PREP(BIT(0), chain))
+
+/* RSC transfer descriptor macros */
+#define MHI_RSCTRE_DATA_PTR(ptr, len)	cpu_to_le64(FIELD_PREP(GENMASK(64, 48), len) | ptr)
+#define MHI_RSCTRE_DATA_DWORD0(cookie)	cpu_to_le32(cookie)
+#define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
+							       MHI_PKT_TYPE_COALESCING))
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
+/* MHI transfer completion events */
+enum mhi_ev_ccs {
+	MHI_EV_CC_INVALID = 0x0,
+	MHI_EV_CC_SUCCESS = 0x1,
+	MHI_EV_CC_EOT = 0x2, /* End of transfer event */
+	MHI_EV_CC_OVERFLOW = 0x3,
+	MHI_EV_CC_EOB = 0x4, /* End of block event */
+	MHI_EV_CC_OOB = 0x5, /* Out of block event */
+	MHI_EV_CC_DB_MODE = 0x6,
+	MHI_EV_CC_UNDEFINED_ERR = 0x10,
+	MHI_EV_CC_BAD_TRE = 0x11,
+};
+
+/* Channel state */
+enum mhi_ch_state {
+	MHI_CH_STATE_DISABLED,
+	MHI_CH_STATE_ENABLED,
+	MHI_CH_STATE_RUNNING,
+	MHI_CH_STATE_SUSPENDED,
+	MHI_CH_STATE_STOP,
+	MHI_CH_STATE_ERROR,
+};
+
+enum mhi_cmd_type {
+	MHI_CMD_NOP = 1,
+	MHI_CMD_RESET_CHAN = 16,
+	MHI_CMD_STOP_CHAN = 17,
+	MHI_CMD_START_CHAN = 18,
+};
+
+#define EV_CTX_RESERVED_MASK		GENMASK(7, 0)
+#define EV_CTX_INTMODC_MASK		GENMASK(15, 8)
+#define EV_CTX_INTMODT_MASK		GENMASK(31, 16)
+struct mhi_event_ctxt {
+	__le32 intmod;
+	__le32 ertype;
+	__le32 msivec;
+
+	__le64 rbase __packed __aligned(4);
+	__le64 rlen __packed __aligned(4);
+	__le64 rp __packed __aligned(4);
+	__le64 wp __packed __aligned(4);
+};
+
+#define CHAN_CTX_CHSTATE_MASK		GENMASK(7, 0)
+#define CHAN_CTX_BRSTMODE_MASK		GENMASK(9, 8)
+#define CHAN_CTX_POLLCFG_MASK		GENMASK(15, 10)
+#define CHAN_CTX_RESERVED_MASK		GENMASK(31, 16)
+struct mhi_chan_ctxt {
+	__le32 chcfg;
+	__le32 chtype;
+	__le32 erindex;
+
+	__le64 rbase __packed __aligned(4);
+	__le64 rlen __packed __aligned(4);
+	__le64 rp __packed __aligned(4);
+	__le64 wp __packed __aligned(4);
+};
+
+struct mhi_cmd_ctxt {
+	__le32 reserved0;
+	__le32 reserved1;
+	__le32 reserved2;
+
+	__le64 rbase __packed __aligned(4);
+	__le64 rlen __packed __aligned(4);
+	__le64 rp __packed __aligned(4);
+	__le64 wp __packed __aligned(4);
+};
+
+struct mhi_ring_element {
+	__le64 ptr;
+	__le32 dword[2];
+};
+
+extern const char * const mhi_state_str[MHI_STATE_MAX];
+#define TO_MHI_STATE_STR(state) ((state >= MHI_STATE_MAX || \
+				  !mhi_state_str[state]) ? \
+				"INVALID_STATE" : mhi_state_str[state])
+
+#endif /* _MHI_COMMON_H */
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 5860cd326db6..b47d8ef2624a 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,158 +7,20 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
-#include <linux/bitfield.h>
-#include <linux/mhi.h>
+#include "../common.h"
 
 extern struct bus_type mhi_bus_type;
 
-/* MHI registers */
-#define MHIREGLEN					0x00
-#define MHIVER						0x08
-#define MHICFG						0x10
-#define CHDBOFF						0x18
-#define ERDBOFF						0x20
-#define BHIOFF						0x28
-#define BHIEOFF						0x2c
-#define DEBUGOFF					0x30
-#define MHICTRL						0x38
-#define MHISTATUS					0x48
-#define CCABAP_LOWER					0x58
-#define CCABAP_HIGHER					0x5c
-#define ECABAP_LOWER					0x60
-#define ECABAP_HIGHER					0x64
-#define CRCBAP_LOWER					0x68
-#define CRCBAP_HIGHER					0x6c
-#define CRDB_LOWER					0x70
-#define CRDB_HIGHER					0x74
-#define MHICTRLBASE_LOWER				0x80
-#define MHICTRLBASE_HIGHER				0x84
-#define MHICTRLLIMIT_LOWER				0x88
-#define MHICTRLLIMIT_HIGHER				0x8c
-#define MHIDATABASE_LOWER				0x98
-#define MHIDATABASE_HIGHER				0x9c
-#define MHIDATALIMIT_LOWER				0xa0
-#define MHIDATALIMIT_HIGHER				0xa4
-
 /* Host request register */
 #define MHI_SOC_RESET_REQ_OFFSET			0xb0
 #define MHI_SOC_RESET_REQ				BIT(0)
 
-/* MHI register bits */
-#define MHICFG_NHWER_MASK				GENMASK(31, 24)
-#define MHICFG_NER_MASK					GENMASK(23, 16)
-#define MHICFG_NHWCH_MASK				GENMASK(15, 8)
-#define MHICFG_NCH_MASK					GENMASK(7, 0)
-#define MHICTRL_MHISTATE_MASK				GENMASK(15, 8)
-#define MHICTRL_RESET_MASK				BIT(1)
-#define MHISTATUS_MHISTATE_MASK				GENMASK(15, 8)
-#define MHISTATUS_SYSERR_MASK				BIT(2)
-#define MHISTATUS_READY_MASK				BIT(0)
-
-/* MHI BHI registers */
-#define BHI_BHIVERSION_MINOR				0x00
-#define BHI_BHIVERSION_MAJOR				0x04
-#define BHI_IMGADDR_LOW					0x08
-#define BHI_IMGADDR_HIGH				0x0c
-#define BHI_IMGSIZE					0x10
-#define BHI_RSVD1					0x14
-#define BHI_IMGTXDB					0x18
-#define BHI_RSVD2					0x1c
-#define BHI_INTVEC					0x20
-#define BHI_RSVD3					0x24
-#define BHI_EXECENV					0x28
-#define BHI_STATUS					0x2c
-#define BHI_ERRCODE					0x30
-#define BHI_ERRDBG1					0x34
-#define BHI_ERRDBG2					0x38
-#define BHI_ERRDBG3					0x3c
-#define BHI_SERIALNU					0x40
-#define BHI_SBLANTIROLLVER				0x44
-#define BHI_NUMSEG					0x48
-#define BHI_MSMHWID(n)					(0x4c + (0x4 * (n)))
-#define BHI_OEMPKHASH(n)				(0x64 + (0x4 * (n)))
-#define BHI_RSVD5					0xc4
-
-/* BHI register bits */
-#define BHI_TXDB_SEQNUM_BMSK				GENMASK(29, 0)
-#define BHI_STATUS_MASK					GENMASK(31, 30)
-#define BHI_STATUS_ERROR				0x03
-#define BHI_STATUS_SUCCESS				0x02
-#define BHI_STATUS_RESET				0x00
-
-/* MHI BHIE registers */
-#define BHIE_MSMSOCID_OFFS				0x00
-#define BHIE_TXVECADDR_LOW_OFFS				0x2c
-#define BHIE_TXVECADDR_HIGH_OFFS			0x30
-#define BHIE_TXVECSIZE_OFFS				0x34
-#define BHIE_TXVECDB_OFFS				0x3c
-#define BHIE_TXVECSTATUS_OFFS				0x44
-#define BHIE_RXVECADDR_LOW_OFFS				0x60
-#define BHIE_RXVECADDR_HIGH_OFFS			0x64
-#define BHIE_RXVECSIZE_OFFS				0x68
-#define BHIE_RXVECDB_OFFS				0x70
-#define BHIE_RXVECSTATUS_OFFS				0x78
-
-/* BHIE register bits */
-#define BHIE_TXVECDB_SEQNUM_BMSK			GENMASK(29, 0)
-#define BHIE_TXVECSTATUS_SEQNUM_BMSK			GENMASK(29, 0)
-#define BHIE_TXVECSTATUS_STATUS_BMSK			GENMASK(31, 30)
-#define BHIE_TXVECSTATUS_STATUS_RESET			0x00
-#define BHIE_TXVECSTATUS_STATUS_XFER_COMPL		0x02
-#define BHIE_TXVECSTATUS_STATUS_ERROR			0x03
-#define BHIE_RXVECDB_SEQNUM_BMSK			GENMASK(29, 0)
-#define BHIE_RXVECSTATUS_SEQNUM_BMSK			GENMASK(29, 0)
-#define BHIE_RXVECSTATUS_STATUS_BMSK			GENMASK(31, 30)
-#define BHIE_RXVECSTATUS_STATUS_RESET			0x00
-#define BHIE_RXVECSTATUS_STATUS_XFER_COMPL		0x02
-#define BHIE_RXVECSTATUS_STATUS_ERROR			0x03
-
 #define SOC_HW_VERSION_OFFS				0x224
 #define SOC_HW_VERSION_FAM_NUM_BMSK			GENMASK(31, 28)
 #define SOC_HW_VERSION_DEV_NUM_BMSK			GENMASK(27, 16)
 #define SOC_HW_VERSION_MAJOR_VER_BMSK			GENMASK(15, 8)
 #define SOC_HW_VERSION_MINOR_VER_BMSK			GENMASK(7, 0)
 
-#define EV_CTX_RESERVED_MASK				GENMASK(7, 0)
-#define EV_CTX_INTMODC_MASK				GENMASK(15, 8)
-#define EV_CTX_INTMODT_MASK				GENMASK(31, 16)
-struct mhi_event_ctxt {
-	__le32 intmod;
-	__le32 ertype;
-	__le32 msivec;
-
-	__le64 rbase __packed __aligned(4);
-	__le64 rlen __packed __aligned(4);
-	__le64 rp __packed __aligned(4);
-	__le64 wp __packed __aligned(4);
-};
-
-#define CHAN_CTX_CHSTATE_MASK				GENMASK(7, 0)
-#define CHAN_CTX_BRSTMODE_MASK				GENMASK(9, 8)
-#define CHAN_CTX_POLLCFG_MASK				GENMASK(15, 10)
-#define CHAN_CTX_RESERVED_MASK				GENMASK(31, 16)
-struct mhi_chan_ctxt {
-	__le32 chcfg;
-	__le32 chtype;
-	__le32 erindex;
-
-	__le64 rbase __packed __aligned(4);
-	__le64 rlen __packed __aligned(4);
-	__le64 rp __packed __aligned(4);
-	__le64 wp __packed __aligned(4);
-};
-
-struct mhi_cmd_ctxt {
-	__le32 reserved0;
-	__le32 reserved1;
-	__le32 reserved2;
-
-	__le64 rbase __packed __aligned(4);
-	__le64 rlen __packed __aligned(4);
-	__le64 rp __packed __aligned(4);
-	__le64 wp __packed __aligned(4);
-};
-
 struct mhi_ctxt {
 	struct mhi_event_ctxt *er_ctxt;
 	struct mhi_chan_ctxt *chan_ctxt;
@@ -168,130 +30,11 @@ struct mhi_ctxt {
 	dma_addr_t cmd_ctxt_addr;
 };
 
-struct mhi_ring_element {
-	__le64 ptr;
-	__le32 dword[2];
-};
-
 struct bhi_vec_entry {
 	u64 dma_addr;
 	u64 size;
 };
 
-enum mhi_cmd_type {
-	MHI_CMD_NOP = 1,
-	MHI_CMD_RESET_CHAN = 16,
-	MHI_CMD_STOP_CHAN = 17,
-	MHI_CMD_START_CHAN = 18,
-};
-
-/* No operation command */
-#define MHI_TRE_CMD_NOOP_PTR		0
-#define MHI_TRE_CMD_NOOP_DWORD0		0
-#define MHI_TRE_CMD_NOOP_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), MHI_CMD_NOP))
-
-/* Channel reset command */
-#define MHI_TRE_CMD_RESET_PTR		0
-#define MHI_TRE_CMD_RESET_DWORD0	0
-#define MHI_TRE_CMD_RESET_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
-						    FIELD_PREP(GENMASK(23, 16),         \
-							       MHI_CMD_RESET_CHAN))
-
-/* Channel stop command */
-#define MHI_TRE_CMD_STOP_PTR		0
-#define MHI_TRE_CMD_STOP_DWORD0		0
-#define MHI_TRE_CMD_STOP_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
-						    FIELD_PREP(GENMASK(23, 16),         \
-							       MHI_CMD_STOP_CHAN))
-
-/* Channel start command */
-#define MHI_TRE_CMD_START_PTR		0
-#define MHI_TRE_CMD_START_DWORD0	0
-#define MHI_TRE_CMD_START_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
-						    FIELD_PREP(GENMASK(23, 16),         \
-							       MHI_CMD_START_CHAN))
-
-#define MHI_TRE_GET_DWORD(tre, word)	le32_to_cpu((tre)->dword[(word)])
-#define MHI_TRE_GET_CMD_CHID(tre)	FIELD_GET(GENMASK(31, 24), MHI_TRE_GET_DWORD(tre, 1))
-#define MHI_TRE_GET_CMD_TYPE(tre)	FIELD_GET(GENMASK(23, 16), MHI_TRE_GET_DWORD(tre, 1))
-
-/* Event descriptor macros */
-#define MHI_TRE_EV_PTR(ptr)		cpu_to_le64(ptr)
-#define MHI_TRE_EV_DWORD0(code, len)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), code | \
-						    FIELD_PREP(GENMASK(15, 0), len)))
-#define MHI_TRE_EV_DWORD1(chid, type)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid | \
-						    FIELD_PREP(GENMASK(23, 16), type)))
-#define MHI_TRE_GET_EV_PTR(tre)		le64_to_cpu((tre)->ptr)
-#define MHI_TRE_GET_EV_CODE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
-#define MHI_TRE_GET_EV_LEN(tre)		FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_DWORD(tre, 0)))
-#define MHI_TRE_GET_EV_CHID(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
-#define MHI_TRE_GET_EV_TYPE(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1)))
-#define MHI_TRE_GET_EV_STATE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
-#define MHI_TRE_GET_EV_EXECENV(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
-#define MHI_TRE_GET_EV_SEQ(tre)		MHI_TRE_GET_DWORD(tre, 0)
-#define MHI_TRE_GET_EV_TIME(tre)	MHI_TRE_GET_EV_PTR(tre)
-#define MHI_TRE_GET_EV_COOKIE(tre)	lower_32_bits(MHI_TRE_GET_EV_PTR(tre))
-#define MHI_TRE_GET_EV_VEID(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 0)))
-#define MHI_TRE_GET_EV_LINKSPEED(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
-#define MHI_TRE_GET_EV_LINKWIDTH(tre)	FIELD_GET(GENMASK(7, 0), (MHI_TRE_GET_DWORD(tre, 0)))
-
-/* Transfer descriptor macros */
-#define MHI_TRE_DATA_PTR(ptr)		cpu_to_le64(ptr)
-#define MHI_TRE_DATA_DWORD0(len)	cpu_to_le32(FIELD_PREP(GENMASK(15, 0), len))
-#define MHI_TRE_TYPE_TRANSFER		2
-#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
-								MHI_TRE_TYPE_TRANSFER) |    \
-								FIELD_PREP(BIT(10), bei) |  \
-								FIELD_PREP(BIT(9), ieot) |  \
-								FIELD_PREP(BIT(8), ieob) |  \
-								FIELD_PREP(BIT(0), chain))
-
-/* RSC transfer descriptor macros */
-#define MHI_RSCTRE_DATA_PTR(ptr, len)	cpu_to_le64(FIELD_PREP(GENMASK(64, 48), len) | ptr)
-#define MHI_RSCTRE_DATA_DWORD0(cookie)	cpu_to_le32(cookie)
-#define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
-							       MHI_PKT_TYPE_COALESCING))
-
-enum mhi_pkt_type {
-	MHI_PKT_TYPE_INVALID = 0x0,
-	MHI_PKT_TYPE_NOOP_CMD = 0x1,
-	MHI_PKT_TYPE_TRANSFER = 0x2,
-	MHI_PKT_TYPE_COALESCING = 0x8,
-	MHI_PKT_TYPE_RESET_CHAN_CMD = 0x10,
-	MHI_PKT_TYPE_STOP_CHAN_CMD = 0x11,
-	MHI_PKT_TYPE_START_CHAN_CMD = 0x12,
-	MHI_PKT_TYPE_STATE_CHANGE_EVENT = 0x20,
-	MHI_PKT_TYPE_CMD_COMPLETION_EVENT = 0x21,
-	MHI_PKT_TYPE_TX_EVENT = 0x22,
-	MHI_PKT_TYPE_RSC_TX_EVENT = 0x28,
-	MHI_PKT_TYPE_EE_EVENT = 0x40,
-	MHI_PKT_TYPE_TSYNC_EVENT = 0x48,
-	MHI_PKT_TYPE_BW_REQ_EVENT = 0x50,
-	MHI_PKT_TYPE_STALE_EVENT, /* internal event */
-};
-
-/* MHI transfer completion events */
-enum mhi_ev_ccs {
-	MHI_EV_CC_INVALID = 0x0,
-	MHI_EV_CC_SUCCESS = 0x1,
-	MHI_EV_CC_EOT = 0x2, /* End of transfer event */
-	MHI_EV_CC_OVERFLOW = 0x3,
-	MHI_EV_CC_EOB = 0x4, /* End of block event */
-	MHI_EV_CC_OOB = 0x5, /* Out of block event */
-	MHI_EV_CC_DB_MODE = 0x6,
-	MHI_EV_CC_UNDEFINED_ERR = 0x10,
-	MHI_EV_CC_BAD_TRE = 0x11,
-};
-
-enum mhi_ch_state {
-	MHI_CH_STATE_DISABLED = 0x0,
-	MHI_CH_STATE_ENABLED = 0x1,
-	MHI_CH_STATE_RUNNING = 0x2,
-	MHI_CH_STATE_SUSPENDED = 0x3,
-	MHI_CH_STATE_STOP = 0x4,
-	MHI_CH_STATE_ERROR = 0x5,
-};
-
 enum mhi_ch_state_type {
 	MHI_CH_STATE_TYPE_RESET,
 	MHI_CH_STATE_TYPE_STOP,
@@ -333,11 +76,6 @@ extern const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX];
 #define TO_DEV_STATE_TRANS_STR(state) (((state) >= DEV_ST_TRANSITION_MAX) ? \
 				"INVALID_STATE" : dev_state_tran_str[state])
 
-extern const char * const mhi_state_str[MHI_STATE_MAX];
-#define TO_MHI_STATE_STR(state) ((state >= MHI_STATE_MAX || \
-				  !mhi_state_str[state]) ? \
-				"INVALID_STATE" : mhi_state_str[state])
-
 /* internal power states */
 enum mhi_pm_state {
 	MHI_PM_STATE_DISABLE,
-- 
2.25.1

