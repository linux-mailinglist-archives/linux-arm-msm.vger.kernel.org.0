Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B34852F37F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 20:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238381AbiETS55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 14:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353121AbiETSz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 14:55:56 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6BD3BC
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:55:46 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id q203so9675479iod.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gEtlxxZ1RupvbnWDC4YcRwDjh6C8P556iqC2Z5nSepA=;
        b=dC1IcXoD1qLP1XGDvCaTQ9iJGHrIgvxLRY2jDteDlWBFkubYE3lCzSCR3NNjVtz3vU
         Yy8l+ErmezaJV7KsshGorRpfcuVAvcXglz+VIOvXviixnfcuoQxuT88UvGHkDhwp+gPS
         +K9kRHxflz7OEIrUTyhaghHz0T/tLiMNMTqugU7yXCeDZLZZmhY59op4T28Lr4+uFhGj
         iwSahg08LlPSIF001nIPBhf8QjBVBEqSMGBoKgt2DIvOvJ02RMes7Gci90aaZmvaTQVE
         V989vSD9tyYNISn8qpG62LtS4ORVvvC4haCGiNs/kAX0gHk6GV9wACybD3CSfWtq1dOF
         J/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gEtlxxZ1RupvbnWDC4YcRwDjh6C8P556iqC2Z5nSepA=;
        b=E7kpporQkym9Oe048IFES85IDzvmcHyscyHYS3L50LHnw+KNIsd3gjD+yBq/Pgb5rO
         RPF5HsO9/6BYrOLXpnFLumf2/5w3qyZh/MaUfM7MYMWiQAUOzMq0TW7F0WHJWWOD1UPz
         S03vt0OVyL7YgTi6i1gqwyq83fI4stJiS+edfnHIE4XCzii1jSjHz0JejxzDSVI+H+Rd
         IMY6+ocN2cNw60qiaAEsyzZ0CyqpysESjQO2bOQpXwLNzdtoPTc6oiU+xhwwhgxONh5h
         u9bHuaXfOptWd0sUzQ8JPUHj597WOrbLxoBbG65fUH5NEg9uP+Woj7hx0KWiVtP8n0mV
         faBw==
X-Gm-Message-State: AOAM5309IhRIo15YFWWV9KH3/+b2AOmkOfyPiFyfspkExL1ZRLqPQUDw
        rbz84n5gmJ4Zroh0cayDBCXTLA==
X-Google-Smtp-Source: ABdhPJzlYPIGq4yyx+Umrsmc+ij38/S2G9E1t0ThslaLhxYH7Rh+OolF1MllMV3xxO0U0S1bLckMeQ==
X-Received: by 2002:a05:6638:16d6:b0:32e:97e4:ac16 with SMTP id g22-20020a05663816d600b0032e97e4ac16mr2996363jat.199.1653072945901;
        Fri, 20 May 2022 11:55:45 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id a6-20020a056638058600b0032b3a7817acsm871958jar.112.2022.05.20.11.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 11:55:45 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 7/8] net: ipa: remove command info pool
Date:   Fri, 20 May 2022 13:55:32 -0500
Message-Id: <20220520185533.877920-8-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520185533.877920-1-elder@linaro.org>
References: <20220520185533.877920-1-elder@linaro.org>
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

The ipa_cmd_info structure now contains only one field, and it's an
enumerated type whose values all fit in 8 bits.  Currently we'll
never use more than 8 TREs in a command transaction, and we can
represent that number of command opcodes in the same space as a 64
bit pointer to an ipa_cmd_info structure.

Define IPA_COMMAND_TRANS_TRE_MAX as the maximum number of TREs that
can be in a command transaction.  Replace the info pointer in a
transaction with a fixed-size array named cmd_opcode[] of that many
bytes.  Store the opcode in this array when adding a command TRE to
a transaction, as was done previously for the info array.  This
makes the ipa_cmd_info unused, so get rid of it.

When committing an immediate command transaction, use the channel's
Boolean command flag to determine whether to fill in the opcode,
which will be taken (as before) from the array in the transaction.

This makes the command info pool unnecessary, so get rid of it.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.h       |  1 -
 drivers/net/ipa/gsi_trans.c | 10 ++++-----
 drivers/net/ipa/gsi_trans.h |  7 +++++--
 drivers/net/ipa/ipa_cmd.c   | 41 ++++++++-----------------------------
 drivers/net/ipa/ipa_cmd.h   |  9 --------
 5 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index 9cc6576588116..5d66116b46b03 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -84,7 +84,6 @@ struct gsi_trans_info {
 	struct gsi_trans_pool pool;	/* transaction pool */
 	struct gsi_trans_pool sg_pool;	/* scatterlist pool */
 	struct gsi_trans_pool cmd_pool;	/* command payload DMA pool */
-	struct gsi_trans_pool info_pool;/* command information pool */
 	struct gsi_trans **map;		/* TRE -> transaction map */
 
 	spinlock_t spinlock;		/* protects updates to the lists */
diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index 472792992f866..55f8fe7d2668e 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -436,7 +436,7 @@ void gsi_trans_cmd_add(struct gsi_trans *trans, void *buf, u32 size,
 	sg_dma_address(sg) = addr;
 	sg_dma_len(sg) = size;
 
-	trans->info[which].opcode = opcode;
+	trans->cmd_opcode[which] = opcode;
 }
 
 /* Add a page transfer to a transaction.  It will fill the only TRE. */
@@ -552,10 +552,10 @@ static void __gsi_trans_commit(struct gsi_trans *trans, bool ring_db)
 	struct gsi_ring *ring = &channel->tre_ring;
 	enum ipa_cmd_opcode opcode = IPA_CMD_NONE;
 	bool bei = channel->toward_ipa;
-	struct ipa_cmd_info *info;
 	struct gsi_tre *dest_tre;
 	struct scatterlist *sg;
 	u32 byte_count = 0;
+	u8 *cmd_opcode;
 	u32 avail;
 	u32 i;
 
@@ -566,7 +566,7 @@ static void __gsi_trans_commit(struct gsi_trans *trans, bool ring_db)
 	 * If there is no info array we're doing a simple data
 	 * transfer request, whose opcode is IPA_CMD_NONE.
 	 */
-	info = trans->info ? &trans->info[0] : NULL;
+	cmd_opcode = channel->command ? &trans->cmd_opcode[0] : NULL;
 	avail = ring->count - ring->index % ring->count;
 	dest_tre = gsi_ring_virt(ring, ring->index);
 	for_each_sg(trans->sgl, sg, trans->used, i) {
@@ -577,8 +577,8 @@ static void __gsi_trans_commit(struct gsi_trans *trans, bool ring_db)
 		byte_count += len;
 		if (!avail--)
 			dest_tre = gsi_ring_virt(ring, 0);
-		if (info)
-			opcode = info++->opcode;
+		if (cmd_opcode)
+			opcode = *cmd_opcode++;
 
 		gsi_trans_tre_fill(dest_tre, addr, len, last_tre, bei, opcode);
 		dest_tre++;
diff --git a/drivers/net/ipa/gsi_trans.h b/drivers/net/ipa/gsi_trans.h
index 9a39909915ef5..99ce2cba0dc3c 100644
--- a/drivers/net/ipa/gsi_trans.h
+++ b/drivers/net/ipa/gsi_trans.h
@@ -22,6 +22,9 @@ struct gsi;
 struct gsi_trans;
 struct gsi_trans_pool;
 
+/* Maximum number of TREs in an IPA immediate command transaction */
+#define IPA_COMMAND_TRANS_TRE_MAX	8
+
 /**
  * struct gsi_trans - a GSI transaction
  *
@@ -34,8 +37,8 @@ struct gsi_trans_pool;
  * @used:	Number of TREs *used* (could be less than tre_count)
  * @len:	Total # of transfer bytes represented in sgl[] (set by core)
  * @data:	Preserved but not touched by the core transaction code
+ * @cmd_opcode:	Array of command opcodes (command channel only)
  * @sgl:	An array of scatter/gather entries managed by core code
- * @info:	Array of command information structures (command channel)
  * @direction:	DMA transfer direction (DMA_NONE for commands)
  * @refcount:	Reference count used for destruction
  * @completion:	Completed when the transaction completes
@@ -58,8 +61,8 @@ struct gsi_trans {
 	u32 len;			/* total # bytes across sgl[] */
 
 	void *data;
+	u8 cmd_opcode[IPA_COMMAND_TRANS_TRE_MAX];
 	struct scatterlist *sgl;
-	struct ipa_cmd_info *info;	/* array of entries, or null */
 	enum dma_data_direction direction;
 
 	refcount_t refcount;
diff --git a/drivers/net/ipa/ipa_cmd.c b/drivers/net/ipa/ipa_cmd.c
index 5fd74d7007044..e58cd4478fd3d 100644
--- a/drivers/net/ipa/ipa_cmd.c
+++ b/drivers/net/ipa/ipa_cmd.c
@@ -349,7 +349,6 @@ int ipa_cmd_pool_init(struct gsi_channel *channel, u32 tre_max)
 {
 	struct gsi_trans_info *trans_info = &channel->trans_info;
 	struct device *dev = channel->gsi->dev;
-	int ret;
 
 	/* This is as good a place as any to validate build constants */
 	ipa_cmd_validate_build();
@@ -358,20 +357,9 @@ int ipa_cmd_pool_init(struct gsi_channel *channel, u32 tre_max)
 	 * a single transaction can require up to tlv_count of them,
 	 * so we treat them as if that many can be allocated at once.
 	 */
-	ret = gsi_trans_pool_init_dma(dev, &trans_info->cmd_pool,
-				      sizeof(union ipa_cmd_payload),
-				      tre_max, channel->tlv_count);
-	if (ret)
-		return ret;
-
-	/* Each TRE needs a command info structure */
-	ret = gsi_trans_pool_init(&trans_info->info_pool,
-				   sizeof(struct ipa_cmd_info),
-				   tre_max, channel->tlv_count);
-	if (ret)
-		gsi_trans_pool_exit_dma(dev, &trans_info->cmd_pool);
-
-	return ret;
+	return gsi_trans_pool_init_dma(dev, &trans_info->cmd_pool,
+				       sizeof(union ipa_cmd_payload),
+				       tre_max, channel->tlv_count);
 }
 
 void ipa_cmd_pool_exit(struct gsi_channel *channel)
@@ -379,7 +367,6 @@ void ipa_cmd_pool_exit(struct gsi_channel *channel)
 	struct gsi_trans_info *trans_info = &channel->trans_info;
 	struct device *dev = channel->gsi->dev;
 
-	gsi_trans_pool_exit(&trans_info->info_pool);
 	gsi_trans_pool_exit_dma(dev, &trans_info->cmd_pool);
 }
 
@@ -652,28 +639,16 @@ void ipa_cmd_pipeline_clear_wait(struct ipa *ipa)
 	wait_for_completion(&ipa->completion);
 }
 
-static struct ipa_cmd_info *
-ipa_cmd_info_alloc(struct ipa_endpoint *endpoint, u32 tre_count)
-{
-	struct gsi_channel *channel;
-
-	channel = &endpoint->ipa->gsi.channel[endpoint->channel_id];
-
-	return gsi_trans_pool_alloc(&channel->trans_info.info_pool, tre_count);
-}
-
 /* Allocate a transaction for the command TX endpoint */
 struct gsi_trans *ipa_cmd_trans_alloc(struct ipa *ipa, u32 tre_count)
 {
 	struct ipa_endpoint *endpoint;
-	struct gsi_trans *trans;
+
+	if (WARN_ON(tre_count > IPA_COMMAND_TRANS_TRE_MAX))
+		return NULL;
 
 	endpoint = ipa->name_map[IPA_ENDPOINT_AP_COMMAND_TX];
 
-	trans = gsi_channel_trans_alloc(&ipa->gsi, endpoint->channel_id,
-					tre_count, DMA_NONE);
-	if (trans)
-		trans->info = ipa_cmd_info_alloc(endpoint, tre_count);
-
-	return trans;
+	return gsi_channel_trans_alloc(&ipa->gsi, endpoint->channel_id,
+				       tre_count, DMA_NONE);
 }
diff --git a/drivers/net/ipa/ipa_cmd.h b/drivers/net/ipa/ipa_cmd.h
index d4dbe2ce96dcd..9215ddad10107 100644
--- a/drivers/net/ipa/ipa_cmd.h
+++ b/drivers/net/ipa/ipa_cmd.h
@@ -46,15 +46,6 @@ enum ipa_cmd_opcode {
 	IPA_CMD_IP_PACKET_TAG_STATUS	= 0x14,
 };
 
-/**
- * struct ipa_cmd_info - information needed for an IPA immediate command
- *
- * @opcode:	The command opcode.
- */
-struct ipa_cmd_info {
-	enum ipa_cmd_opcode opcode;
-};
-
 /**
  * ipa_cmd_table_valid() - Validate a memory region holding a table
  * @ipa:	- IPA pointer
-- 
2.32.0

