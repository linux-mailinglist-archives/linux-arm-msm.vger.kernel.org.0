Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A6252D720
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 17:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240598AbiESPMk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 11:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240545AbiESPM2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 11:12:28 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30299DFF65
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 08:12:27 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id z18so6084588iob.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbIZD+eoLSn0L8X0zyj/qmXa/fzoJP3zSwgdy7KECVg=;
        b=q54BrRgQWioyhoc8iuz7fHMH3hMXaFg7jG4TGl0HUtFCoSKT+KoOUKYBoDVLdKhxvu
         0JBxRqnupyCtfw5gER3200BzDZv9rkq4gx+1vywa+R1Mg4ozDV1eA2345KiDsA7M8vJq
         RvRMxd1ftl+DSe9Uk3Pj2qlAV4dScrl5ggoin17P3+4ad8JuGzfPNbEPaO0MiD22FqjG
         /PswocZ5eWNZnayUX/tn7kkZtNEuul0OWzohWPeXRvP0p1c8KMNdfoifvMNB/v5Gx/EJ
         3fFmIQ38QrE+SDEXrwUQf5lSdTxDVXTCgpiMcUzIReJlX8j5DAlFy3p+yDB2EcNHuIW8
         ch8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbIZD+eoLSn0L8X0zyj/qmXa/fzoJP3zSwgdy7KECVg=;
        b=ccsuaLvQSREQul5VI8vXvvh/LNwqpbpFcsZ890D7B2wOLI+Y7FFcPrbm6wN03RqiLq
         uvH5IsUEaXcvDqK94tuUtYlBd5a33DmS8dA95mJQzcNlHNZ0yZAsaovB2nimuXIrfZ0N
         glm3QR87Ys4gBlV0iIs8o41qDoJV09Ux0PQCCJejlxhZSaBPYRwUVjqjj369SR4lNT1H
         OWEWomlRZNcvkKp0Q1nJwFXY/7etvUtYPxRoo//SSHj3eeu9Yx7xME9ZgrAj6iXqVOxV
         iWeNyHeNrC9in/fFgs2pgReEV3plZ4R35Maf5Ks4XQvq7VDWkIbCb6FO6+WkEehCtwWb
         NLvQ==
X-Gm-Message-State: AOAM530YRKaSRk2PNXe/nS9/PFa9kYcjqQ2gnOgnlJPCwx501v+jPUFq
        /Y2l2WCgW6KDjkOXcJNJRiXq5A==
X-Google-Smtp-Source: ABdhPJydnFT1mIcYtH7F0ehbjr+Ud6VSXTfoT1EiMYSzyYxkKJRw+Kz8DRD7GB/HsbeX9C0B7mPD4A==
X-Received: by 2002:a5d:96d0:0:b0:654:91d3:97b7 with SMTP id r16-20020a5d96d0000000b0065491d397b7mr2743476iol.164.1652973146816;
        Thu, 19 May 2022 08:12:26 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id g6-20020a025b06000000b0032e271a558csm683887jab.168.2022.05.19.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:12:26 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/7] net: ipa: move endpoint configuration data definitions
Date:   Thu, 19 May 2022 10:12:15 -0500
Message-Id: <20220519151217.654890-6-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519151217.654890-1-elder@linaro.org>
References: <20220519151217.654890-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the definitions of the structures defining endpoint-specific
configuration data out of "ipa_data.h" and into "ipa_endpoint.h".
This is a trivial movement of code without any other change, to
prepare for the next few patches.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_data.h     | 62 ----------------------------------
 drivers/net/ipa/ipa_endpoint.h | 62 ++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index dbbeecf6df298..d611b5e96497c 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -95,68 +95,6 @@ struct gsi_channel_data {
 	u8 tlv_count;
 };
 
-/**
- * struct ipa_endpoint_tx_data - configuration data for TX endpoints
- * @seq_type:		primary packet processing sequencer type
- * @seq_rep_type:	sequencer type for replication processing
- * @status_endpoint:	endpoint to which status elements are sent
- *
- * The @status_endpoint is only valid if the endpoint's @status_enable
- * flag is set.
- */
-struct ipa_endpoint_tx_data {
-	enum ipa_seq_type seq_type;
-	enum ipa_seq_rep_type seq_rep_type;
-	enum ipa_endpoint_name status_endpoint;
-};
-
-/**
- * struct ipa_endpoint_rx_data - configuration data for RX endpoints
- * @buffer_size: requested receive buffer size (bytes)
- * @pad_align:	power-of-2 boundary to which packet payload is aligned
- * @aggr_close_eof: whether aggregation closes on end-of-frame
- *
- * With each packet it transfers, the IPA hardware can perform certain
- * transformations of its packet data.  One of these is adding pad bytes
- * to the end of the packet data so the result ends on a power-of-2 boundary.
- *
- * It is also able to aggregate multiple packets into a single receive buffer.
- * Aggregation is "open" while a buffer is being filled, and "closes" when
- * certain criteria are met.  One of those criteria is the sender indicating
- * a "frame" consisting of several transfers has ended.
- */
-struct ipa_endpoint_rx_data {
-	u32 buffer_size;
-	u32 pad_align;
-	bool aggr_close_eof;
-};
-
-/**
- * struct ipa_endpoint_config_data - IPA endpoint hardware configuration
- * @resource_group:	resource group to assign endpoint to
- * @checksum:		whether checksum offload is enabled
- * @qmap:		whether endpoint uses QMAP protocol
- * @aggregation:	whether endpoint supports aggregation
- * @status_enable:	whether endpoint uses status elements
- * @dma_mode:		whether endpoint operates in DMA mode
- * @dma_endpoint:	peer endpoint, if operating in DMA mode
- * @tx:			TX-specific endpoint information (see above)
- * @rx:			RX-specific endpoint information (see above)
- */
-struct ipa_endpoint_config_data {
-	u32 resource_group;
-	bool checksum;
-	bool qmap;
-	bool aggregation;
-	bool status_enable;
-	bool dma_mode;
-	enum ipa_endpoint_name dma_endpoint;
-	union {
-		struct ipa_endpoint_tx_data tx;
-		struct ipa_endpoint_rx_data rx;
-	};
-};
-
 /**
  * struct ipa_endpoint_data - IPA endpoint configuration data
  * @filter_support:	whether endpoint supports filtering
diff --git a/drivers/net/ipa/ipa_endpoint.h b/drivers/net/ipa/ipa_endpoint.h
index 12fd5b16c18eb..85fe15b5d983e 100644
--- a/drivers/net/ipa/ipa_endpoint.h
+++ b/drivers/net/ipa/ipa_endpoint.h
@@ -40,6 +40,68 @@ enum ipa_endpoint_name {
 
 #define IPA_ENDPOINT_MAX		32	/* Max supported by driver */
 
+/**
+ * struct ipa_endpoint_tx_data - configuration data for TX endpoints
+ * @seq_type:		primary packet processing sequencer type
+ * @seq_rep_type:	sequencer type for replication processing
+ * @status_endpoint:	endpoint to which status elements are sent
+ *
+ * The @status_endpoint is only valid if the endpoint's @status_enable
+ * flag is set.
+ */
+struct ipa_endpoint_tx_data {
+	enum ipa_seq_type seq_type;
+	enum ipa_seq_rep_type seq_rep_type;
+	enum ipa_endpoint_name status_endpoint;
+};
+
+/**
+ * struct ipa_endpoint_rx_data - configuration data for RX endpoints
+ * @buffer_size: requested receive buffer size (bytes)
+ * @pad_align:	power-of-2 boundary to which packet payload is aligned
+ * @aggr_close_eof: whether aggregation closes on end-of-frame
+ *
+ * With each packet it transfers, the IPA hardware can perform certain
+ * transformations of its packet data.  One of these is adding pad bytes
+ * to the end of the packet data so the result ends on a power-of-2 boundary.
+ *
+ * It is also able to aggregate multiple packets into a single receive buffer.
+ * Aggregation is "open" while a buffer is being filled, and "closes" when
+ * certain criteria are met.  One of those criteria is the sender indicating
+ * a "frame" consisting of several transfers has ended.
+ */
+struct ipa_endpoint_rx_data {
+	u32 buffer_size;
+	u32 pad_align;
+	bool aggr_close_eof;
+};
+
+/**
+ * struct ipa_endpoint_config_data - IPA endpoint hardware configuration
+ * @resource_group:	resource group to assign endpoint to
+ * @checksum:		whether checksum offload is enabled
+ * @qmap:		whether endpoint uses QMAP protocol
+ * @aggregation:	whether endpoint supports aggregation
+ * @status_enable:	whether endpoint uses status elements
+ * @dma_mode:		whether endpoint operates in DMA mode
+ * @dma_endpoint:	peer endpoint, if operating in DMA mode
+ * @tx:			TX-specific endpoint information (see above)
+ * @rx:			RX-specific endpoint information (see above)
+ */
+struct ipa_endpoint_config_data {
+	u32 resource_group;
+	bool checksum;
+	bool qmap;
+	bool aggregation;
+	bool status_enable;
+	bool dma_mode;
+	enum ipa_endpoint_name dma_endpoint;
+	union {
+		struct ipa_endpoint_tx_data tx;
+		struct ipa_endpoint_rx_data rx;
+	};
+};
+
 /**
  * enum ipa_replenish_flag:	RX buffer replenish flags
  *
-- 
2.32.0

