Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943034A896C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352567AbiBCRJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352515AbiBCRJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:09:46 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05ABC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:09:46 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id w5so2666566ilo.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVeOmvrDZv3hJhW6Jsr2R6/Y4bCLC3bv8VO35vQkvl0=;
        b=Sb4qc8l3d6fQWal2+nYncDQdeid9w3iJdshg8xNvNmQ4F//S3vBoRXD26En58ipbPo
         flL859XADrQx9pKN8Fb/GpOOZUfnf9NU5/iRRCma9rMXw994X/c3opxOJd3evH47XII3
         T3iBsCsTcP3WZeKrU87xqe+D4lxJgFmfL2TTABvTsj+RpgSbxKEcmRZhb+zuneWMluLw
         Xv2MXEL2Gp6uAsjYiZFmegoeXMHlura4ysUAl5wpYogmlxq0SWOf0pw0c5CxCrq7rb9j
         w0hbl3o3FJU+/NPDtukSpF/nXxZf3ACDksHVonvoJnjhuCdXjwVlkYo2Pdapl2FJZECj
         FORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVeOmvrDZv3hJhW6Jsr2R6/Y4bCLC3bv8VO35vQkvl0=;
        b=omavOo90ZaV+9AB3GMVIqbgSq6bnDH+qoNIgpJw3yndiSooAjLkmqLW8378xz+JvGK
         JajnjdREhPquYt30vamN/g7ty3y8SX15Pjk9VaqL4IV2jmqRtDb84qF5CvTrLnRF7vpu
         kn35PNqqajF6CLgZro3c+qonlcezakj9CbsheKNjhSpigsa8CdVDenyV/fwbMYygzSOS
         szBZPE9wW4l9N8GY6u6tB4Q8MmVIxXaDZGSZJvfeR+IO5+LFpOTo+zk7kzNOr2rDs3C2
         exjs51SwPHoXj4OYks0B4qrccyTaGEk+AAHmm99Qt3uownWlqbzwMtqF81wCizMgwext
         CQDQ==
X-Gm-Message-State: AOAM531p8LAO3Rwguzmjpn83C7AsTnIrdwfmzh0rLc4sOdTpOfpYMZvo
        6QXT42tC6OhGM7pF+aE3r0kzwA==
X-Google-Smtp-Source: ABdhPJzhqZlmD4YUH2TSGjEPaJJqyZwSZV111h2PXgaPokJLksR9esJgPnzvFD5Bx9/RrLdLwBGoeQ==
X-Received: by 2002:a05:6e02:15c8:: with SMTP id q8mr21128743ilu.19.1643908186272;
        Thu, 03 Feb 2022 09:09:46 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m12sm21869671iow.54.2022.02.03.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:09:45 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 10/10] net: ipa: determine replenish doorbell differently
Date:   Thu,  3 Feb 2022 11:09:27 -0600
Message-Id: <20220203170927.770572-11-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203170927.770572-1-elder@linaro.org>
References: <20220203170927.770572-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than tracking the number of receive buffer transactions that
have been submitted without a doorbell, just track the total number
of transactions that have been issued.  Then ring the doorbell when
that number modulo the replenish batch size is 0.

The effect is roughly the same, but the new count is slightly more
interesting, and this approach will someday allow the replenish
batch size to be tuned at runtime.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 12 ++++++++----
 drivers/net/ipa/ipa_endpoint.h |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index a236edf5bf068..888e94278a84f 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -25,7 +25,8 @@
 
 #define atomic_dec_not_zero(v)	atomic_add_unless((v), -1, 0)
 
-#define IPA_REPLENISH_BATCH	16
+/* Hardware is told about receive buffers once a "batch" has been queued */
+#define IPA_REPLENISH_BATCH	16		/* Must be non-zero */
 
 /* The amount of RX buffer space consumed by standard skb overhead */
 #define IPA_RX_BUFFER_OVERHEAD	(PAGE_SIZE - SKB_MAX_ORDER(NET_SKB_PAD, 0))
@@ -1086,14 +1087,15 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint)
 		return;
 
 	while ((trans = ipa_endpoint_trans_alloc(endpoint, 1))) {
+		bool doorbell;
+
 		if (ipa_endpoint_replenish_one(endpoint, trans))
 			goto try_again_later;
 
-		if (++endpoint->replenish_ready == IPA_REPLENISH_BATCH)
-			endpoint->replenish_ready = 0;
 
 		/* Ring the doorbell if we've got a full batch */
-		gsi_trans_commit(trans, !endpoint->replenish_ready);
+		doorbell = !(++endpoint->replenish_count % IPA_REPLENISH_BATCH);
+		gsi_trans_commit(trans, doorbell);
 	}
 
 	clear_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags);
@@ -1863,6 +1865,8 @@ u32 ipa_endpoint_init(struct ipa *ipa, u32 count,
 	enum ipa_endpoint_name name;
 	u32 filter_map;
 
+	BUILD_BUG_ON(!IPA_REPLENISH_BATCH);
+
 	if (!ipa_endpoint_data_valid(ipa, count, data))
 		return 0;	/* Error */
 
diff --git a/drivers/net/ipa/ipa_endpoint.h b/drivers/net/ipa/ipa_endpoint.h
index 9a37f9387f011..12fd5b16c18eb 100644
--- a/drivers/net/ipa/ipa_endpoint.h
+++ b/drivers/net/ipa/ipa_endpoint.h
@@ -65,7 +65,7 @@ enum ipa_replenish_flag {
  * @evt_ring_id:	GSI event ring used by the endpoint
  * @netdev:		Network device pointer, if endpoint uses one
  * @replenish_flags:	Replenishing state flags
- * @replenish_ready:	Number of replenish transactions without doorbell
+ * @replenish_count:	Total number of replenish transactions committed
  * @replenish_work:	Work item used for repeated replenish failures
  */
 struct ipa_endpoint {
@@ -84,7 +84,7 @@ struct ipa_endpoint {
 
 	/* Receive buffer replenishing for RX endpoints */
 	DECLARE_BITMAP(replenish_flags, IPA_REPLENISH_COUNT);
-	u32 replenish_ready;
+	u64 replenish_count;
 	struct delayed_work replenish_work;		/* global wq */
 };
 
-- 
2.32.0

