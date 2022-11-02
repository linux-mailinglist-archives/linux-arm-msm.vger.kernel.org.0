Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F702617075
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 23:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbiKBWLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 18:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbiKBWLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 18:11:49 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A235CBC39
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 15:11:46 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id e189so5429509iof.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCQLB8py1X/NJwP3+BLi4r+G0VNoFsbUa3BWr+xCFoQ=;
        b=SNCDbmVKKb+oXB9d2PZfmQ6sGlOAEy3WH57N0KnFlaRTGlopsX4RUr79DscWszmB8b
         PvOTMZ/Zje2FeFenOosF179eV+2gHKT+RhYyJJxeqalnyvaFj/Ko9I0uRe1njB26FVIu
         if4zwr6/CLuEGz7bb0ftItu0VKeJFDYb3ldhClkNqMbeI75zlVEdeD2DrvgaLePddd8C
         xZtLIB83w2j6hsppp8THKQDIx0y26rOZuf4miBG9qpshQKHxl9uAt3StG5ztrUC8RoYp
         S58COHsH9YR141+iYlNzVv3Z8O57oS3p220BASIl8IMnBbddAy2l4VCsEiuLe+OF0x2b
         tG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCQLB8py1X/NJwP3+BLi4r+G0VNoFsbUa3BWr+xCFoQ=;
        b=Q7AGCuTSmbHXOzGNamAPeNz1BflUdzSxe2vydeiqog9Mqb/GC9udJy0Q5DmZWBp0nD
         EIaD1EkOUwpLyj9HgI19r5tFDnMv93u+iwT29U4gMiXEuT6S06qKpm1vxzeVhDqYBy3o
         ecXzc9KV3zlGb1j3SjBkHzlyhcFmy5KYkC2nznNo/zsXFLp9AQhIZXmM9YMhdiPSg4ux
         cQcTSy7/d1pwvocPxxMJCq5WEi2laJ1qhc/RmuPPY5aw8Oze4K68t2f48qC/J+vQg/+/
         X9WE/twH6IMFWzxOcwx+H9fKO0I9gn0q/pa/L8w8gkmyi75kJRghFXyYcH8M4L9MpG8/
         h/pg==
X-Gm-Message-State: ACrzQf07+IHYu2g/8zoUKVd71vOmsDYbOFxZxUH+5XkrDdWzuHBbmOnu
        FwmmcyH26nH96BLNSfEWRs01Hw==
X-Google-Smtp-Source: AMsMyM4CeoNL38zmvm/YKt29nzHl92WZ/9UIh/QsBpe4nGijPLUyY0M8Rmv2eNDf7KQmZ0ebDa4FiA==
X-Received: by 2002:a05:6602:2dc7:b0:6a5:14e5:d709 with SMTP id l7-20020a0566022dc700b006a514e5d709mr16658698iow.54.1667427105992;
        Wed, 02 Nov 2022 15:11:45 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id f8-20020a02a108000000b0037465a1dd3fsm5073974jag.156.2022.11.02.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 15:11:45 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/9] net: ipa: use ipa_table_mem() in ipa_table_reset_add()
Date:   Wed,  2 Nov 2022 17:11:32 -0500
Message-Id: <20221102221139.1091510-3-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102221139.1091510-1-elder@linaro.org>
References: <20221102221139.1091510-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Similar to the previous commit, pass flags rather than a memory
region ID to ipa_table_reset_add(), and there use ipa_table_mem() to
look up the memory region affected based on those flags.

Currently all eight of these table memory regions are assumed to
exist, because they all have canaries within them.  Stop assuming
that will always be the case, and in ipa_table_reset_add() allow
these memory regions to be non-existent.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_table.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ipa/ipa_table.c b/drivers/net/ipa/ipa_table.c
index 94bb7611e574b..3a14465bf8a64 100644
--- a/drivers/net/ipa/ipa_table.c
+++ b/drivers/net/ipa/ipa_table.c
@@ -200,16 +200,17 @@ static dma_addr_t ipa_table_addr(struct ipa *ipa, bool filter_mask, u16 count)
 }
 
 static void ipa_table_reset_add(struct gsi_trans *trans, bool filter,
-				u16 first, u16 count, enum ipa_mem_id mem_id)
+				bool hashed, bool ipv6, u16 first, u16 count)
 {
 	struct ipa *ipa = container_of(trans->gsi, struct ipa, gsi);
-	const struct ipa_mem *mem = ipa_mem_find(ipa, mem_id);
+	const struct ipa_mem *mem;
 	dma_addr_t addr;
 	u32 offset;
 	u16 size;
 
-	/* Nothing to do if the table memory region is empty */
-	if (!mem->size)
+	/* Nothing to do if the memory region is doesn't exist or is empty */
+	mem = ipa_table_mem(ipa, filter, hashed, ipv6);
+	if (!mem || !mem->size)
 		return;
 
 	if (filter)
@@ -227,7 +228,7 @@ static void ipa_table_reset_add(struct gsi_trans *trans, bool filter,
  * for the IPv4 and IPv6 non-hashed and hashed filter tables.
  */
 static int
-ipa_filter_reset_table(struct ipa *ipa, enum ipa_mem_id mem_id, bool modem)
+ipa_filter_reset_table(struct ipa *ipa, bool hashed, bool ipv6, bool modem)
 {
 	u32 ep_mask = ipa->filter_map;
 	u32 count = hweight32(ep_mask);
@@ -253,7 +254,7 @@ ipa_filter_reset_table(struct ipa *ipa, enum ipa_mem_id mem_id, bool modem)
 		if (endpoint->ee_id != ee_id)
 			continue;
 
-		ipa_table_reset_add(trans, true, endpoint_id, 1, mem_id);
+		ipa_table_reset_add(trans, true, hashed, ipv6, endpoint_id, 1);
 	}
 
 	gsi_trans_commit_wait(trans);
@@ -269,18 +270,18 @@ static int ipa_filter_reset(struct ipa *ipa, bool modem)
 {
 	int ret;
 
-	ret = ipa_filter_reset_table(ipa, IPA_MEM_V4_FILTER, modem);
+	ret = ipa_filter_reset_table(ipa, false, false, modem);
 	if (ret)
 		return ret;
 
-	ret = ipa_filter_reset_table(ipa, IPA_MEM_V4_FILTER_HASHED, modem);
+	ret = ipa_filter_reset_table(ipa, true, false, modem);
 	if (ret)
 		return ret;
 
-	ret = ipa_filter_reset_table(ipa, IPA_MEM_V6_FILTER, modem);
+	ret = ipa_filter_reset_table(ipa, false, true, modem);
 	if (ret)
 		return ret;
-	ret = ipa_filter_reset_table(ipa, IPA_MEM_V6_FILTER_HASHED, modem);
+	ret = ipa_filter_reset_table(ipa, true, true, modem);
 
 	return ret;
 }
@@ -312,13 +313,11 @@ static int ipa_route_reset(struct ipa *ipa, bool modem)
 		count = ipa->route_count - modem_route_count;
 	}
 
-	ipa_table_reset_add(trans, false, first, count, IPA_MEM_V4_ROUTE);
-	ipa_table_reset_add(trans, false, first, count,
-			    IPA_MEM_V4_ROUTE_HASHED);
+	ipa_table_reset_add(trans, false, false, false, first, count);
+	ipa_table_reset_add(trans, false, true, false, first, count);
 
-	ipa_table_reset_add(trans, false, first, count, IPA_MEM_V6_ROUTE);
-	ipa_table_reset_add(trans, false, first, count,
-			    IPA_MEM_V6_ROUTE_HASHED);
+	ipa_table_reset_add(trans, false, false, true, first, count);
+	ipa_table_reset_add(trans, false, true, true, first, count);
 
 	gsi_trans_commit_wait(trans);
 
-- 
2.34.1

