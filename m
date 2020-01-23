Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF1D146686
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgAWLTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:19:05 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:56151 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgAWLTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:19:04 -0500
Received: by mail-pj1-f68.google.com with SMTP id d5so1060572pjz.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SLQs4k3WojC3qzz8aoMnojas6ffyTEliChwZo/IscSU=;
        b=lIRn1UKk9sdtJ8riwi8HbeMhBfvX31a15JTAzufZIAd7WMQn2Umg1mC06Hdce1OF3Z
         HnGUcpYt1VGrM0wK0cICIsB69zR2uZPXbuNmoaXxK3zTwnoLbe4xkkcen0Z1NX3Mg/yR
         xTRbmTne6qL+K2CRmXfGm7BmameUSSYs60w1789ZOe9+p4SP5bug3Vg5PhvuyXauMl7n
         qQySGbBhSMsvge67QmbtB6XTa7rPlbwenj/OtlwTbUyHCtfpd6C0y9VVIxGzu6RJqpco
         dxPO6US814/zbslO4n4UOLjSwoVy8lLn8PzEo5my6SMCBeF5WwBN8wuGsqAGEas8PyUt
         WDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SLQs4k3WojC3qzz8aoMnojas6ffyTEliChwZo/IscSU=;
        b=WLpqsQGza0IG7n8YrwzVMO5xr1EiO//r084uGzsapOKHrNzZ/ebQ8ar/FXmFCWnb7X
         7VvxpHT4uq8ZjZWzDR8Oy2juCBG0EQZSkK4jU8F3VoyHWbCekW0pdsyOV32kXbJriKie
         pAnQUrYhWjmk9aA+PEeMPnJC+bWgpqo88QYtCY0tFY0s6nngeLCmPyKVGQxLDBi6EEGw
         fj+7IQKNw1bb0hYOPc53iOh23KxqeHTywGqyN1yWjLf7UrIIakLbaofOacHoeLaVJhSJ
         t70r29jKYPf+4BxMLMb0K8eS7+7v8UQ4ggOyLjSZs9og5UBHVRbFjtn6Tutqqh4Doxqe
         JzaA==
X-Gm-Message-State: APjAAAW4+DsgZ22Fxh2Ay6MYq3+Gpzfa7KuNcNVRjaRWnrTItifuVABD
        Ud2vj6GANn9f9LcTjhcJtvauBlKAlA==
X-Google-Smtp-Source: APXvYqwc2PzWf0an7k82EEQ8dkb1oLnlC7dBKUsYyX8HIg2EZt4Q6kfVHI5u8+bD1y22mwqrxzJCmw==
X-Received: by 2002:a17:90a:3ae5:: with SMTP id b92mr3849738pjc.26.1579778343574;
        Thu, 23 Jan 2020 03:19:03 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:19:02 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/16] bus: mhi: core: Add support for ringing channel/event ring doorbells
Date:   Thu, 23 Jan 2020 16:48:25 +0530
Message-Id: <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for ringing channel and event ring doorbells
by MHI host. The MHI host can use the channel and event ring doorbells
for notifying the client device about processing transfer and event
rings which it has queued using MMIO registers.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/989

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[mani: splitted from pm patch and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     | 140 ++++++++++++++++
 drivers/bus/mhi/core/internal.h | 275 ++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/main.c     | 118 ++++++++++++++
 include/linux/mhi.h             |   5 +
 4 files changed, 538 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 60dcf2ad3a5f..588166b588b4 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -19,6 +19,136 @@
 #include <linux/wait.h>
 #include "internal.h"
 
+int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
+{
+	u32 val;
+	int i, ret;
+	struct mhi_chan *mhi_chan;
+	struct mhi_event *mhi_event;
+	void __iomem *base = mhi_cntrl->regs;
+	struct {
+		u32 offset;
+		u32 mask;
+		u32 shift;
+		u32 val;
+	} reg_info[] = {
+		{
+			CCABAP_HIGHER, U32_MAX, 0,
+			upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
+		},
+		{
+			CCABAP_LOWER, U32_MAX, 0,
+			lower_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
+		},
+		{
+			ECABAP_HIGHER, U32_MAX, 0,
+			upper_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
+		},
+		{
+			ECABAP_LOWER, U32_MAX, 0,
+			lower_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
+		},
+		{
+			CRCBAP_HIGHER, U32_MAX, 0,
+			upper_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
+		},
+		{
+			CRCBAP_LOWER, U32_MAX, 0,
+			lower_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
+		},
+		{
+			MHICFG, MHICFG_NER_MASK, MHICFG_NER_SHIFT,
+			mhi_cntrl->total_ev_rings,
+		},
+		{
+			MHICFG, MHICFG_NHWER_MASK, MHICFG_NHWER_SHIFT,
+			mhi_cntrl->hw_ev_rings,
+		},
+		{
+			MHICTRLBASE_HIGHER, U32_MAX, 0,
+			upper_32_bits(mhi_cntrl->iova_start),
+		},
+		{
+			MHICTRLBASE_LOWER, U32_MAX, 0,
+			lower_32_bits(mhi_cntrl->iova_start),
+		},
+		{
+			MHIDATABASE_HIGHER, U32_MAX, 0,
+			upper_32_bits(mhi_cntrl->iova_start),
+		},
+		{
+			MHIDATABASE_LOWER, U32_MAX, 0,
+			lower_32_bits(mhi_cntrl->iova_start),
+		},
+		{
+			MHICTRLLIMIT_HIGHER, U32_MAX, 0,
+			upper_32_bits(mhi_cntrl->iova_stop),
+		},
+		{
+			MHICTRLLIMIT_LOWER, U32_MAX, 0,
+			lower_32_bits(mhi_cntrl->iova_stop),
+		},
+		{
+			MHIDATALIMIT_HIGHER, U32_MAX, 0,
+			upper_32_bits(mhi_cntrl->iova_stop),
+		},
+		{
+			MHIDATALIMIT_LOWER, U32_MAX, 0,
+			lower_32_bits(mhi_cntrl->iova_stop),
+		},
+		{ 0, 0, 0 }
+	};
+
+	dev_dbg(mhi_cntrl->dev, "Initializing MHI registers\n");
+
+	/* Read channel db offset */
+	ret = mhi_read_reg_field(mhi_cntrl, base, CHDBOFF, CHDBOFF_CHDBOFF_MASK,
+				 CHDBOFF_CHDBOFF_SHIFT, &val);
+	if (ret) {
+		dev_err(mhi_cntrl->dev, "Unable to read CHDBOFF register\n");
+		return -EIO;
+	}
+
+	/* Setup wake db */
+	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
+	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 4, 0);
+	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 0, 0);
+	mhi_cntrl->wake_set = false;
+
+	/* Setup channel db address for each channel in tre_ring */
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, val += 8, mhi_chan++)
+		mhi_chan->tre_ring.db_addr = base + val;
+
+	/* Read event ring db offset */
+	ret = mhi_read_reg_field(mhi_cntrl, base, ERDBOFF, ERDBOFF_ERDBOFF_MASK,
+				 ERDBOFF_ERDBOFF_SHIFT, &val);
+	if (ret) {
+		dev_err(mhi_cntrl->dev, "Unable to read ERDBOFF register\n");
+		return -EIO;
+	}
+
+	/* Setup event db address for each ev_ring */
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, val += 8, mhi_event++) {
+		if (mhi_event->offload_ev)
+			continue;
+
+		mhi_event->ring.db_addr = base + val;
+	}
+
+	/* Setup DB register for primary CMD rings */
+	mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING].ring.db_addr = base + CRDB_LOWER;
+
+	/* Write to MMIO registers */
+	for (i = 0; reg_info[i].offset; i++)
+		mhi_write_reg_field(mhi_cntrl, base, reg_info[i].offset,
+				    reg_info[i].mask, reg_info[i].shift,
+				    reg_info[i].val);
+
+	return 0;
+}
+
 static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 			struct mhi_controller_config *config)
 {
@@ -63,6 +193,11 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 		if (MHI_INVALID_BRSTMODE(mhi_event->db_cfg.brstmode))
 			goto error_ev_cfg;
 
+		if (mhi_event->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
+			mhi_event->db_cfg.process_db = mhi_db_brstmode;
+		else
+			mhi_event->db_cfg.process_db = mhi_db_brstmode_disable;
+
 		mhi_event->data_type = event_cfg->data_type;
 
 		mhi_event->hw_ring = event_cfg->hardware_event;
@@ -194,6 +329,11 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 			}
 		}
 
+		if (mhi_chan->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
+			mhi_chan->db_cfg.process_db = mhi_db_brstmode;
+		else
+			mhi_chan->db_cfg.process_db = mhi_db_brstmode_disable;
+
 		mhi_chan->configured = true;
 
 		if (mhi_chan->lpm_notify)
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index ea7f1d7b0129..a4d10916984a 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -9,6 +9,255 @@
 
 extern struct bus_type mhi_bus_type;
 
+/* MHI MMIO register mapping */
+#define PCI_INVALID_READ(val) (val == U32_MAX)
+
+#define MHIREGLEN (0x0)
+#define MHIREGLEN_MHIREGLEN_MASK (0xFFFFFFFF)
+#define MHIREGLEN_MHIREGLEN_SHIFT (0)
+
+#define MHIVER (0x8)
+#define MHIVER_MHIVER_MASK (0xFFFFFFFF)
+#define MHIVER_MHIVER_SHIFT (0)
+
+#define MHICFG (0x10)
+#define MHICFG_NHWER_MASK (0xFF000000)
+#define MHICFG_NHWER_SHIFT (24)
+#define MHICFG_NER_MASK (0xFF0000)
+#define MHICFG_NER_SHIFT (16)
+#define MHICFG_NHWCH_MASK (0xFF00)
+#define MHICFG_NHWCH_SHIFT (8)
+#define MHICFG_NCH_MASK (0xFF)
+#define MHICFG_NCH_SHIFT (0)
+
+#define CHDBOFF (0x18)
+#define CHDBOFF_CHDBOFF_MASK (0xFFFFFFFF)
+#define CHDBOFF_CHDBOFF_SHIFT (0)
+
+#define ERDBOFF (0x20)
+#define ERDBOFF_ERDBOFF_MASK (0xFFFFFFFF)
+#define ERDBOFF_ERDBOFF_SHIFT (0)
+
+#define BHIOFF (0x28)
+#define BHIOFF_BHIOFF_MASK (0xFFFFFFFF)
+#define BHIOFF_BHIOFF_SHIFT (0)
+
+#define BHIEOFF (0x2C)
+#define BHIEOFF_BHIEOFF_MASK (0xFFFFFFFF)
+#define BHIEOFF_BHIEOFF_SHIFT (0)
+
+#define DEBUGOFF (0x30)
+#define DEBUGOFF_DEBUGOFF_MASK (0xFFFFFFFF)
+#define DEBUGOFF_DEBUGOFF_SHIFT (0)
+
+#define MHICTRL (0x38)
+#define MHICTRL_MHISTATE_MASK (0x0000FF00)
+#define MHICTRL_MHISTATE_SHIFT (8)
+#define MHICTRL_RESET_MASK (0x2)
+#define MHICTRL_RESET_SHIFT (1)
+
+#define MHISTATUS (0x48)
+#define MHISTATUS_MHISTATE_MASK (0x0000FF00)
+#define MHISTATUS_MHISTATE_SHIFT (8)
+#define MHISTATUS_SYSERR_MASK (0x4)
+#define MHISTATUS_SYSERR_SHIFT (2)
+#define MHISTATUS_READY_MASK (0x1)
+#define MHISTATUS_READY_SHIFT (0)
+
+#define CCABAP_LOWER (0x58)
+#define CCABAP_LOWER_CCABAP_LOWER_MASK (0xFFFFFFFF)
+#define CCABAP_LOWER_CCABAP_LOWER_SHIFT (0)
+
+#define CCABAP_HIGHER (0x5C)
+#define CCABAP_HIGHER_CCABAP_HIGHER_MASK (0xFFFFFFFF)
+#define CCABAP_HIGHER_CCABAP_HIGHER_SHIFT (0)
+
+#define ECABAP_LOWER (0x60)
+#define ECABAP_LOWER_ECABAP_LOWER_MASK (0xFFFFFFFF)
+#define ECABAP_LOWER_ECABAP_LOWER_SHIFT (0)
+
+#define ECABAP_HIGHER (0x64)
+#define ECABAP_HIGHER_ECABAP_HIGHER_MASK (0xFFFFFFFF)
+#define ECABAP_HIGHER_ECABAP_HIGHER_SHIFT (0)
+
+#define CRCBAP_LOWER (0x68)
+#define CRCBAP_LOWER_CRCBAP_LOWER_MASK (0xFFFFFFFF)
+#define CRCBAP_LOWER_CRCBAP_LOWER_SHIFT (0)
+
+#define CRCBAP_HIGHER (0x6C)
+#define CRCBAP_HIGHER_CRCBAP_HIGHER_MASK (0xFFFFFFFF)
+#define CRCBAP_HIGHER_CRCBAP_HIGHER_SHIFT (0)
+
+#define CRDB_LOWER (0x70)
+#define CRDB_LOWER_CRDB_LOWER_MASK (0xFFFFFFFF)
+#define CRDB_LOWER_CRDB_LOWER_SHIFT (0)
+
+#define CRDB_HIGHER (0x74)
+#define CRDB_HIGHER_CRDB_HIGHER_MASK (0xFFFFFFFF)
+#define CRDB_HIGHER_CRDB_HIGHER_SHIFT (0)
+
+#define MHICTRLBASE_LOWER (0x80)
+#define MHICTRLBASE_LOWER_MHICTRLBASE_LOWER_MASK (0xFFFFFFFF)
+#define MHICTRLBASE_LOWER_MHICTRLBASE_LOWER_SHIFT (0)
+
+#define MHICTRLBASE_HIGHER (0x84)
+#define MHICTRLBASE_HIGHER_MHICTRLBASE_HIGHER_MASK (0xFFFFFFFF)
+#define MHICTRLBASE_HIGHER_MHICTRLBASE_HIGHER_SHIFT (0)
+
+#define MHICTRLLIMIT_LOWER (0x88)
+#define MHICTRLLIMIT_LOWER_MHICTRLLIMIT_LOWER_MASK (0xFFFFFFFF)
+#define MHICTRLLIMIT_LOWER_MHICTRLLIMIT_LOWER_SHIFT (0)
+
+#define MHICTRLLIMIT_HIGHER (0x8C)
+#define MHICTRLLIMIT_HIGHER_MHICTRLLIMIT_HIGHER_MASK (0xFFFFFFFF)
+#define MHICTRLLIMIT_HIGHER_MHICTRLLIMIT_HIGHER_SHIFT (0)
+
+#define MHIDATABASE_LOWER (0x98)
+#define MHIDATABASE_LOWER_MHIDATABASE_LOWER_MASK (0xFFFFFFFF)
+#define MHIDATABASE_LOWER_MHIDATABASE_LOWER_SHIFT (0)
+
+#define MHIDATABASE_HIGHER (0x9C)
+#define MHIDATABASE_HIGHER_MHIDATABASE_HIGHER_MASK (0xFFFFFFFF)
+#define MHIDATABASE_HIGHER_MHIDATABASE_HIGHER_SHIFT (0)
+
+#define MHIDATALIMIT_LOWER (0xA0)
+#define MHIDATALIMIT_LOWER_MHIDATALIMIT_LOWER_MASK (0xFFFFFFFF)
+#define MHIDATALIMIT_LOWER_MHIDATALIMIT_LOWER_SHIFT (0)
+
+#define MHIDATALIMIT_HIGHER (0xA4)
+#define MHIDATALIMIT_HIGHER_MHIDATALIMIT_HIGHER_MASK (0xFFFFFFFF)
+#define MHIDATALIMIT_HIGHER_MHIDATALIMIT_HIGHER_SHIFT (0)
+
+/* Host request register */
+#define MHI_SOC_RESET_REQ_OFFSET (0xB0)
+#define MHI_SOC_RESET_REQ BIT(0)
+
+/* MHI BHI offfsets */
+#define BHI_BHIVERSION_MINOR (0x00)
+#define BHI_BHIVERSION_MAJOR (0x04)
+#define BHI_IMGADDR_LOW (0x08)
+#define BHI_IMGADDR_HIGH (0x0C)
+#define BHI_IMGSIZE (0x10)
+#define BHI_RSVD1 (0x14)
+#define BHI_IMGTXDB (0x18)
+#define BHI_TXDB_SEQNUM_BMSK (0x3FFFFFFF)
+#define BHI_TXDB_SEQNUM_SHFT (0)
+#define BHI_RSVD2 (0x1C)
+#define BHI_INTVEC (0x20)
+#define BHI_RSVD3 (0x24)
+#define BHI_EXECENV (0x28)
+#define BHI_STATUS (0x2C)
+#define BHI_ERRCODE (0x30)
+#define BHI_ERRDBG1 (0x34)
+#define BHI_ERRDBG2 (0x38)
+#define BHI_ERRDBG3 (0x3C)
+#define BHI_SERIALNU (0x40)
+#define BHI_SBLANTIROLLVER (0x44)
+#define BHI_NUMSEG (0x48)
+#define BHI_MSMHWID(n) (0x4C + (0x4 * n))
+#define BHI_OEMPKHASH(n) (0x64 + (0x4 * n))
+#define BHI_RSVD5 (0xC4)
+#define BHI_STATUS_MASK (0xC0000000)
+#define BHI_STATUS_SHIFT (30)
+#define BHI_STATUS_ERROR (3)
+#define BHI_STATUS_SUCCESS (2)
+#define BHI_STATUS_RESET (0)
+
+/* MHI BHIE offsets */
+#define BHIE_MSMSOCID_OFFS (0x0000)
+#define BHIE_TXVECADDR_LOW_OFFS (0x002C)
+#define BHIE_TXVECADDR_HIGH_OFFS (0x0030)
+#define BHIE_TXVECSIZE_OFFS (0x0034)
+#define BHIE_TXVECDB_OFFS (0x003C)
+#define BHIE_TXVECDB_SEQNUM_BMSK (0x3FFFFFFF)
+#define BHIE_TXVECDB_SEQNUM_SHFT (0)
+#define BHIE_TXVECSTATUS_OFFS (0x0044)
+#define BHIE_TXVECSTATUS_SEQNUM_BMSK (0x3FFFFFFF)
+#define BHIE_TXVECSTATUS_SEQNUM_SHFT (0)
+#define BHIE_TXVECSTATUS_STATUS_BMSK (0xC0000000)
+#define BHIE_TXVECSTATUS_STATUS_SHFT (30)
+#define BHIE_TXVECSTATUS_STATUS_RESET (0x00)
+#define BHIE_TXVECSTATUS_STATUS_XFER_COMPL (0x02)
+#define BHIE_TXVECSTATUS_STATUS_ERROR (0x03)
+#define BHIE_RXVECADDR_LOW_OFFS (0x0060)
+#define BHIE_RXVECADDR_HIGH_OFFS (0x0064)
+#define BHIE_RXVECSIZE_OFFS (0x0068)
+#define BHIE_RXVECDB_OFFS (0x0070)
+#define BHIE_RXVECDB_SEQNUM_BMSK (0x3FFFFFFF)
+#define BHIE_RXVECDB_SEQNUM_SHFT (0)
+#define BHIE_RXVECSTATUS_OFFS (0x0078)
+#define BHIE_RXVECSTATUS_SEQNUM_BMSK (0x3FFFFFFF)
+#define BHIE_RXVECSTATUS_SEQNUM_SHFT (0)
+#define BHIE_RXVECSTATUS_STATUS_BMSK (0xC0000000)
+#define BHIE_RXVECSTATUS_STATUS_SHFT (30)
+#define BHIE_RXVECSTATUS_STATUS_RESET (0x00)
+#define BHIE_RXVECSTATUS_STATUS_XFER_COMPL (0x02)
+#define BHIE_RXVECSTATUS_STATUS_ERROR (0x03)
+
+struct mhi_event_ctxt {
+	u32 reserved : 8;
+	u32 intmodc : 8;
+	u32 intmodt : 16;
+	u32 ertype;
+	u32 msivec;
+
+	u64 rbase __packed __aligned(4);
+	u64 rlen __packed __aligned(4);
+	u64 rp __packed __aligned(4);
+	u64 wp __packed __aligned(4);
+};
+
+struct mhi_chan_ctxt {
+	u32 chstate : 8;
+	u32 brstmode : 2;
+	u32 pollcfg : 6;
+	u32 reserved : 16;
+	u32 chtype;
+	u32 erindex;
+
+	u64 rbase __packed __aligned(4);
+	u64 rlen __packed __aligned(4);
+	u64 rp __packed __aligned(4);
+	u64 wp __packed __aligned(4);
+};
+
+struct mhi_cmd_ctxt {
+	u32 reserved0;
+	u32 reserved1;
+	u32 reserved2;
+
+	u64 rbase __packed __aligned(4);
+	u64 rlen __packed __aligned(4);
+	u64 rp __packed __aligned(4);
+	u64 wp __packed __aligned(4);
+};
+
+struct mhi_ctxt {
+	struct mhi_event_ctxt *er_ctxt;
+	struct mhi_chan_ctxt *chan_ctxt;
+	struct mhi_cmd_ctxt *cmd_ctxt;
+	dma_addr_t er_ctxt_addr;
+	dma_addr_t chan_ctxt_addr;
+	dma_addr_t cmd_ctxt_addr;
+};
+
+struct mhi_tre {
+	u64 ptr;
+	u32 dword[2];
+};
+
+struct bhi_vec_entry {
+	u64 dma_addr;
+	u64 size;
+};
+
+enum mhi_cmd_type {
+	MHI_CMD_NOP = 1,
+	MHI_CMD_RESET_CHAN = 16,
+	MHI_CMD_STOP_CHAN = 17,
+	MHI_CMD_START_CHAN = 18,
+};
+
 /* MHI transfer completion events */
 enum mhi_ev_ccs {
 	MHI_EV_CC_INVALID = 0x0,
@@ -37,6 +286,7 @@ enum mhi_ch_state {
 #define NR_OF_CMD_RINGS			1
 #define CMD_EL_PER_RING			128
 #define PRIMARY_CMD_RING		0
+#define MHI_DEV_WAKE_DB			127
 #define MHI_MAX_MTU			0xffff
 
 enum mhi_er_type {
@@ -167,4 +417,29 @@ static inline void mhi_dealloc_device(struct mhi_controller *mhi_cntrl,
 int mhi_destroy_device(struct device *dev, void *data);
 void mhi_create_devices(struct mhi_controller *mhi_cntrl);
 
+/* Register access methods */
+void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
+		     void __iomem *db_addr, dma_addr_t db_val);
+void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
+			     struct db_cfg *db_mode, void __iomem *db_addr,
+			     dma_addr_t db_val);
+int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
+			      void __iomem *base, u32 offset, u32 *out);
+int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
+				    void __iomem *base, u32 offset, u32 mask,
+				    u32 shift, u32 *out);
+void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
+		   u32 offset, u32 val);
+void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
+			 u32 offset, u32 mask, u32 shift, u32 val);
+void mhi_ring_er_db(struct mhi_event *mhi_event);
+void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
+		  dma_addr_t db_val);
+void mhi_ring_cmd_db(struct mhi_controller *mhi_cntrl, struct mhi_cmd *mhi_cmd);
+void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
+		      struct mhi_chan *mhi_chan);
+
+/* Initialization methods */
+int mhi_init_mmio(struct mhi_controller *mhi_cntrl);
+
 #endif /* _MHI_INT_H */
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 216fd8691140..134ef9b2cc78 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -17,6 +17,124 @@
 #include <linux/slab.h>
 #include "internal.h"
 
+int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
+			      void __iomem *base, u32 offset, u32 *out)
+{
+	u32 tmp = readl_relaxed(base + offset);
+
+	/* If there is any unexpected value, query the link status */
+	if (PCI_INVALID_READ(tmp) &&
+	    mhi_cntrl->link_status(mhi_cntrl, mhi_cntrl->priv_data))
+		return -EIO;
+
+	*out = tmp;
+
+	return 0;
+}
+
+int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
+				    void __iomem *base, u32 offset,
+				    u32 mask, u32 shift, u32 *out)
+{
+	u32 tmp;
+	int ret;
+
+	ret = mhi_read_reg(mhi_cntrl, base, offset, &tmp);
+	if (ret)
+		return ret;
+
+	*out = (tmp & mask) >> shift;
+
+	return 0;
+}
+
+void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
+		   u32 offset, u32 val)
+{
+	writel_relaxed(val, base + offset);
+}
+
+void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
+			 u32 offset, u32 mask, u32 shift, u32 val)
+{
+	int ret;
+	u32 tmp;
+
+	ret = mhi_read_reg(mhi_cntrl, base, offset, &tmp);
+	if (ret)
+		return;
+
+	tmp &= ~mask;
+	tmp |= (val << shift);
+	mhi_write_reg(mhi_cntrl, base, offset, tmp);
+}
+
+void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
+		  dma_addr_t db_val)
+{
+	mhi_write_reg(mhi_cntrl, db_addr, 4, upper_32_bits(db_val));
+	mhi_write_reg(mhi_cntrl, db_addr, 0, lower_32_bits(db_val));
+}
+
+void mhi_db_brstmode(struct mhi_controller *mhi_cntrl,
+		     struct db_cfg *db_cfg,
+		     void __iomem *db_addr,
+		     dma_addr_t db_val)
+{
+	if (db_cfg->db_mode) {
+		db_cfg->db_val = db_val;
+		mhi_write_db(mhi_cntrl, db_addr, db_val);
+		db_cfg->db_mode = 0;
+	}
+}
+
+void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
+			     struct db_cfg *db_cfg,
+			     void __iomem *db_addr,
+			     dma_addr_t db_val)
+{
+	db_cfg->db_val = db_val;
+	mhi_write_db(mhi_cntrl, db_addr, db_val);
+}
+
+void mhi_ring_er_db(struct mhi_event *mhi_event)
+{
+	struct mhi_ring *ring = &mhi_event->ring;
+
+	mhi_event->db_cfg.process_db(mhi_event->mhi_cntrl, &mhi_event->db_cfg,
+				     ring->db_addr, *ring->ctxt_wp);
+}
+
+void mhi_ring_cmd_db(struct mhi_controller *mhi_cntrl, struct mhi_cmd *mhi_cmd)
+{
+	dma_addr_t db;
+	struct mhi_ring *ring = &mhi_cmd->ring;
+
+	db = ring->iommu_base + (ring->wp - ring->base);
+	*ring->ctxt_wp = db;
+	mhi_write_db(mhi_cntrl, ring->db_addr, db);
+}
+
+void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
+		      struct mhi_chan *mhi_chan)
+{
+	struct mhi_ring *ring = &mhi_chan->tre_ring;
+	dma_addr_t db;
+
+	db = ring->iommu_base + (ring->wp - ring->base);
+	*ring->ctxt_wp = db;
+	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
+				    ring->db_addr, db);
+}
+
+enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl)
+{
+	u32 exec;
+	int ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_EXECENV, &exec);
+
+	return (ret) ? MHI_EE_MAX : exec;
+}
+
 int mhi_destroy_device(struct device *dev, void *data)
 {
 	struct mhi_device *mhi_dev;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index cb6ddd23463c..d08f212cdfd0 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -246,6 +246,8 @@ struct mhi_controller_config {
  * @dev_id: Device ID of the controller
  * @bus_id: Physical bus instance used by the controller
  * @regs: Base address of MHI MMIO register space
+ * @bhi: Points to base of MHI BHI register space
+ * @wake_db: MHI WAKE doorbell register address
  * @iova_start: IOMMU starting address for data
  * @iova_stop: IOMMU stop address for data
  * @fw_image: Firmware image name for normal booting
@@ -306,6 +308,9 @@ struct mhi_controller {
 	u32 dev_id;
 	u32 bus_id;
 	void __iomem *regs;
+	void __iomem *bhi;
+	void __iomem *wake_db;
+
 	dma_addr_t iova_start;
 	dma_addr_t iova_stop;
 	const char *fw_image;
-- 
2.17.1

