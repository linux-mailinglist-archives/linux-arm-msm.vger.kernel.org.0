Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A006DE563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 22:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjDKUG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 16:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjDKUGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 16:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DFD5598
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681243509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r1PPzTAJ/jJJJDdzEYgsG/ydCd/6AJF167jFf5Gh9p8=;
        b=ibPveJx6RVRMg2sZi8m6uM4HNP16aUrs9g8nLAyNVhOo33s70dBX684TezHICX2Y4UWYZU
        ABBsjlQxhejjLXMZeQHrpT/9nCnZxXwmdv+C2vogKezJD0YH1VrZ2kFFkGmWhhM1b7BJUX
        2+ZWa0QN1HHNhUZ00mE/3sXGwS5HCjs=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-0XY68MbXPkmpberdOzL42w-1; Tue, 11 Apr 2023 16:05:08 -0400
X-MC-Unique: 0XY68MbXPkmpberdOzL42w-1
Received: by mail-ot1-f71.google.com with SMTP id x5-20020a9d6d85000000b0069f94fdab6fso2546219otp.21
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1PPzTAJ/jJJJDdzEYgsG/ydCd/6AJF167jFf5Gh9p8=;
        b=08nQm7cAY3ooO+KdttiUZ9sAFP0Jp8m8LMX9y7bwjM4cx/3Z6KmwUs1IhVApqISOZy
         qxM1n5Ea+0TZlGNi/klo6cBJax++eeexaNvkgzA7E+n8B4Agw1jVKNathaO0LLu2Ld1Q
         N+VMmjKA1N5jaAT7fUZWdrXAHfl/SBT9NyLJS1a9alfKsUGk1jdNbKVa8SaVoTkYccav
         UR6k8j5a2lIHY0EV3IQd6PZ+WqKD9iUmlq43c/0iDQxEP1MSFWx+J3L7FSFvaIx+SYUA
         VDspk4yIqzqeS7rSwl5y3CTfwyod+lpbdvk3cG694bPDsbkYsyz+l8JxglQdE9RrwCzg
         ua9Q==
X-Gm-Message-State: AAQBX9dioDEKqyjdyCaJr58bQrnfOsOINOnNDMaBoGg53CyWauBaYjZd
        6Nk2ATf9Ur/UiEmU2MR8NOSBLQn3kbz/VryHq3bckFSgxYFL//ngv2edLfbujMta011T08V1cHm
        4FgNUQQOQI+mK+fecbhjEn3C7hA==
X-Received: by 2002:a05:6808:438b:b0:389:464f:aa69 with SMTP id dz11-20020a056808438b00b00389464faa69mr6034556oib.0.1681243507247;
        Tue, 11 Apr 2023 13:05:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350YrWXns1gsSqBUz9ow7QwM9KmBz8PReqobSU7nh7DMiBtUb+y+EA0cnZdJdoLRYgDEVnOwv/g==
X-Received: by 2002:a05:6808:438b:b0:389:464f:aa69 with SMTP id dz11-20020a056808438b00b00389464faa69mr6034515oib.0.1681243506929;
        Tue, 11 Apr 2023 13:05:06 -0700 (PDT)
Received: from halaney-x13s.attlocal.net (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 13:05:06 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, mturquette@baylibre.com,
        peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        richardcochran@gmail.com, linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com,
        Andrew Halaney <ahalaney@redhat.com>,
        Simon Horman <simon.horman@corigine.com>
Subject: [PATCH net-next v4 07/12] net: stmmac: Remove some unnecessary void pointers
Date:   Tue, 11 Apr 2023 15:04:04 -0500
Message-Id: <20230411200409.455355-8-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
References: <20230411200409.455355-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's a few spots in the hardware interface where a void pointer is
used, but what's passed in and later cast out is always the same type.

Just use the proper type directly.

Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v3:
    * Add Reviewed-by (Simon)

Changes since v2:
    * New patch. In later patches refactoring hwif.h I touched these in
      their first form (which was later dropped) and changed this as
      part of that. But I thought the change was still good overall,
      so I left this improvement in the series.

 .../net/ethernet/stmicro/stmmac/chain_mode.c  | 10 +++----
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |  4 +--
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  8 ++---
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |  6 ++--
 .../net/ethernet/stmicro/stmmac/enh_desc.c    | 11 +++----
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 30 ++++++++++++-------
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |  8 ++---
 .../net/ethernet/stmicro/stmmac/ring_mode.c   | 10 +++----
 8 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index 2e8744ac6b91..fb55efd52240 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -14,9 +14,9 @@
 
 #include "stmmac.h"
 
-static int jumbo_frm(void *p, struct sk_buff *skb, int csum)
+static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
+		     int csum)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)p;
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
@@ -125,9 +125,8 @@ static void init_dma_chain(void *des, dma_addr_t phy_addr,
 	}
 }
 
-static void refill_desc3(void *priv_ptr, struct dma_desc *p)
+static void refill_desc3(struct stmmac_rx_queue *rx_q, struct dma_desc *p)
 {
-	struct stmmac_rx_queue *rx_q = (struct stmmac_rx_queue *)priv_ptr;
 	struct stmmac_priv *priv = rx_q->priv_data;
 
 	if (priv->hwts_rx_en && !priv->extend_desc)
@@ -141,9 +140,8 @@ static void refill_desc3(void *priv_ptr, struct dma_desc *p)
 				      sizeof(struct dma_desc)));
 }
 
-static void clean_desc3(void *priv_ptr, struct dma_desc *p)
+static void clean_desc3(struct stmmac_tx_queue *tx_q, struct dma_desc *p)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)priv_ptr;
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->dirty_tx;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
index 8f0d9bc7cab5..f6abc7bfd29d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
@@ -80,10 +80,10 @@ static void dwmac100_dump_dma_regs(void __iomem *ioaddr, u32 *reg_space)
 }
 
 /* DMA controller has two counters to track the number of the missed frames. */
-static void dwmac100_dma_diagnostic_fr(void *data, struct stmmac_extra_stats *x,
+static void dwmac100_dma_diagnostic_fr(struct net_device_stats *stats,
+				       struct stmmac_extra_stats *x,
 				       void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	u32 csr8 = readl(ioaddr + DMA_MISSED_FRAME_CTR);
 
 	if (unlikely(csr8)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 8cc80b1db4cb..6a011d8633e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -13,11 +13,11 @@
 #include "dwmac4.h"
 #include "dwmac4_descs.h"
 
-static int dwmac4_wrback_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int dwmac4_wrback_get_tx_status(struct net_device_stats *stats,
+				       struct stmmac_extra_stats *x,
 				       struct dma_desc *p,
 				       void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int tdes3;
 	int ret = tx_done;
 
@@ -73,10 +73,10 @@ static int dwmac4_wrback_get_tx_status(void *data, struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static int dwmac4_wrback_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int dwmac4_wrback_get_rx_status(struct net_device_stats *stats,
+				       struct stmmac_extra_stats *x,
 				       struct dma_desc *p)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int rdes1 = le32_to_cpu(p->des1);
 	unsigned int rdes2 = le32_to_cpu(p->des2);
 	unsigned int rdes3 = le32_to_cpu(p->des3);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index b1f0c3984a09..13c347ee8be9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -8,7 +8,8 @@
 #include "common.h"
 #include "dwxgmac2.h"
 
-static int dwxgmac2_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int dwxgmac2_get_tx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p, void __iomem *ioaddr)
 {
 	unsigned int tdes3 = le32_to_cpu(p->des3);
@@ -22,7 +23,8 @@ static int dwxgmac2_get_tx_status(void *data, struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static int dwxgmac2_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int dwxgmac2_get_rx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
 	unsigned int rdes3 = le32_to_cpu(p->des3);
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 1bcbbd724fb5..a91d8f13a931 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -12,10 +12,10 @@
 #include "common.h"
 #include "descs_com.h"
 
-static int enh_desc_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int enh_desc_get_tx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p, void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int tdes0 = le32_to_cpu(p->des0);
 	int ret = tx_done;
 
@@ -117,7 +117,8 @@ static int enh_desc_coe_rdes0(int ipc_err, int type, int payload_err)
 	return ret;
 }
 
-static void enh_desc_get_ext_status(void *data, struct stmmac_extra_stats *x,
+static void enh_desc_get_ext_status(struct net_device_stats *stats,
+				    struct stmmac_extra_stats *x,
 				    struct dma_extended_desc *p)
 {
 	unsigned int rdes0 = le32_to_cpu(p->basic.des0);
@@ -181,10 +182,10 @@ static void enh_desc_get_ext_status(void *data, struct stmmac_extra_stats *x,
 	}
 }
 
-static int enh_desc_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int enh_desc_get_rx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int rdes0 = le32_to_cpu(p->des0);
 	int ret = good_frame;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 1cc286b000b6..7f906ef3ea4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -56,8 +56,9 @@ struct stmmac_desc_ops {
 	/* Last tx segment reports the transmit status */
 	int (*get_tx_ls)(struct dma_desc *p);
 	/* Return the transmit status looking at the TDES1 */
-	int (*tx_status)(void *data, struct stmmac_extra_stats *x,
-			struct dma_desc *p, void __iomem *ioaddr);
+	int (*tx_status)(struct net_device_stats *stats,
+			 struct stmmac_extra_stats *x,
+			 struct dma_desc *p, void __iomem *ioaddr);
 	/* Get the buffer size from the descriptor */
 	int (*get_tx_len)(struct dma_desc *p);
 	/* Handle extra events on specific interrupts hw dependent */
@@ -65,10 +66,12 @@ struct stmmac_desc_ops {
 	/* Get the receive frame size */
 	int (*get_rx_frame_len)(struct dma_desc *p, int rx_coe_type);
 	/* Return the reception status looking at the RDES1 */
-	int (*rx_status)(void *data, struct stmmac_extra_stats *x,
-			struct dma_desc *p);
-	void (*rx_extended_status)(void *data, struct stmmac_extra_stats *x,
-			struct dma_extended_desc *p);
+	int (*rx_status)(struct net_device_stats *stats,
+			 struct stmmac_extra_stats *x,
+			 struct dma_desc *p);
+	void (*rx_extended_status)(struct net_device_stats *stats,
+				   struct stmmac_extra_stats *x,
+				   struct dma_extended_desc *p);
 	/* Set tx timestamp enable bit */
 	void (*enable_tx_timestamp) (struct dma_desc *p);
 	/* get tx timestamp status */
@@ -185,8 +188,9 @@ struct stmmac_dma_ops {
 	void (*dma_tx_mode)(void __iomem *ioaddr, int mode, u32 channel,
 			    int fifosz, u8 qmode);
 	/* To track extra statistic (if supported) */
-	void (*dma_diagnostic_fr) (void *data, struct stmmac_extra_stats *x,
-				   void __iomem *ioaddr);
+	void (*dma_diagnostic_fr)(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
+				  void __iomem *ioaddr);
 	void (*enable_dma_transmission) (void __iomem *ioaddr);
 	void (*enable_dma_irq)(void __iomem *ioaddr, u32 chan,
 			       bool rx, bool tx);
@@ -533,16 +537,20 @@ struct stmmac_hwtimestamp {
 #define stmmac_timestamp_interrupt(__priv, __args...) \
 	stmmac_do_void_callback(__priv, ptp, timestamp_interrupt, __args)
 
+struct stmmac_tx_queue;
+struct stmmac_rx_queue;
+
 /* Helpers to manage the descriptors for chain and ring modes */
 struct stmmac_mode_ops {
 	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
 		      unsigned int extend_desc);
 	unsigned int (*is_jumbo_frm) (int len, int ehn_desc);
-	int (*jumbo_frm)(void *priv, struct sk_buff *skb, int csum);
+	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
+			 int csum);
 	int (*set_16kib_bfsize)(int mtu);
 	void (*init_desc3)(struct dma_desc *p);
-	void (*refill_desc3) (void *priv, struct dma_desc *p);
-	void (*clean_desc3) (void *priv, struct dma_desc *p);
+	void (*refill_desc3)(struct stmmac_rx_queue *rx_q, struct dma_desc *p);
+	void (*clean_desc3)(struct stmmac_tx_queue *tx_q, struct dma_desc *p);
 };
 
 #define stmmac_mode_init(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index e3da4da242ee..350e6670a576 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -12,10 +12,10 @@
 #include "common.h"
 #include "descs_com.h"
 
-static int ndesc_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int ndesc_get_tx_status(struct net_device_stats *stats,
+			       struct stmmac_extra_stats *x,
 			       struct dma_desc *p, void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int tdes0 = le32_to_cpu(p->des0);
 	unsigned int tdes1 = le32_to_cpu(p->des1);
 	int ret = tx_done;
@@ -70,12 +70,12 @@ static int ndesc_get_tx_len(struct dma_desc *p)
  * and, if required, updates the multicast statistics.
  * In case of success, it returns good_frame because the GMAC device
  * is supposed to be able to compute the csum in HW. */
-static int ndesc_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int ndesc_get_rx_status(struct net_device_stats *stats,
+			       struct stmmac_extra_stats *x,
 			       struct dma_desc *p)
 {
 	int ret = good_frame;
 	unsigned int rdes0 = le32_to_cpu(p->des0);
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 
 	if (unlikely(rdes0 & RDES0_OWN))
 		return dma_own;
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 2b5b17d8b8a0..d218412ca832 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -14,9 +14,9 @@
 
 #include "stmmac.h"
 
-static int jumbo_frm(void *p, struct sk_buff *skb, int csum)
+static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
+		     int csum)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)p;
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
@@ -101,9 +101,8 @@ static unsigned int is_jumbo_frm(int len, int enh_desc)
 	return ret;
 }
 
-static void refill_desc3(void *priv_ptr, struct dma_desc *p)
+static void refill_desc3(struct stmmac_rx_queue *rx_q, struct dma_desc *p)
 {
-	struct stmmac_rx_queue *rx_q = priv_ptr;
 	struct stmmac_priv *priv = rx_q->priv_data;
 
 	/* Fill DES3 in case of RING mode */
@@ -117,9 +116,8 @@ static void init_desc3(struct dma_desc *p)
 	p->des3 = cpu_to_le32(le32_to_cpu(p->des2) + BUF_SIZE_8KiB);
 }
 
-static void clean_desc3(void *priv_ptr, struct dma_desc *p)
+static void clean_desc3(struct stmmac_tx_queue *tx_q, struct dma_desc *p)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)priv_ptr;
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->dirty_tx;
 
-- 
2.39.2

