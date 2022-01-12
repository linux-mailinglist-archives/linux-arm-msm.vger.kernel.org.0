Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B509348C4DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 14:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353608AbiALNaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 08:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353591AbiALNaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 08:30:20 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3D3C06175B
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:30:19 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id i14so2302359ila.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7nJvQDE0jDxGDxeei4VJv6Q1PIcH5ZUYlsdN+ie8U8=;
        b=leH9ZlTPzKB11RA0SyPNSrGwoi1wvbFg4Xnl1lV7GibDWANtAfFLmwg/U3Xj85LZq7
         lEQ3z9FMFDNmV6MQ5wkxa208ekwsDamYIFrade60scMy/1e2IehrnftwUMetowHWE4Mf
         huYMR8cGUx59R93a72fgw4PBRGhIfcDBMBpq29v80yOI9MWtPmT0vJHzpSNv4fFwC9Yp
         iQiUwiiaM/DtLhL5shEtMCqDv69pHa2cyGpH7cE8qS3gW7WDzwrxUpMJgyIGtfFMeub7
         bW55wWWwX6AdAS6Z1U/9IxY0R5iRNu5M8teUZSeuaxJyJfYjajiyE+siEh+wt9x9Hrpp
         R1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7nJvQDE0jDxGDxeei4VJv6Q1PIcH5ZUYlsdN+ie8U8=;
        b=Yo97Q1jgEShL/Y3BUwXzVIph6mBadGV4GXnntJq07KTLDjH6NmKFt/KQhTGXWocmpF
         Juimb8n6B9sIOx8vDOLMMMkTEz5XGhRp+CiBigSDTZJx35d8ghSAktI6Omo9f+Jyl02i
         Q7gEtVGF6FiBCUwni4/mk9eoQuGVFmPVKTwM+0Ycj8Nx++Um1lfTpzC7GDdco4axYFws
         oXpGTHdw+jFHW5TySYgpzL4i3lF7Zj3JSk1kv7BPFyMK8ZLQLAOPtDmKofI0GIJtVJPB
         7xYVhUQfvWZ721LuL8sS2M3kPH4+LnjIzP6J9ZB0EeXXcVO76SBWSfxQ4QHpQaQ52Fkk
         A29g==
X-Gm-Message-State: AOAM530hphBRAOBLNu7x7TOb0+1HqMp39AfJvrGlR5pf+KXNbHcrFFMN
        X0SiQ2WLSLzGfnRE2WZFR3miTNSuaJzTWQ==
X-Google-Smtp-Source: ABdhPJwfRZVF6PjlIDTGVfIIqaqYw71CGldS8twn4w25S2FaDqlw9Q7FPqetKNyCoqNzaoHDQ4gLfQ==
X-Received: by 2002:a05:6e02:1707:: with SMTP id u7mr5119923ill.92.1641994218998;
        Wed, 12 Jan 2022 05:30:18 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id e17sm7476742iow.30.2022.01.12.05.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 05:30:18 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org, mka@chromium.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/3] net: ipa: use a bitmap for endpoint replenish_enabled
Date:   Wed, 12 Jan 2022 07:30:11 -0600
Message-Id: <20220112133012.778148-3-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220112133012.778148-1-elder@linaro.org>
References: <20220112133012.778148-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define a new replenish_flags bitmap to contain Boolean flags
associated with an endpoint's replenishing state.  Replace the
replenish_enabled field with a flag in that bitmap.  This is to
prepare for the next patch, which adds another flag.

Signed-off-by: Alex Elder <elder@linaro.org>
---
v2: This change was not present in version 1

 drivers/net/ipa/ipa_endpoint.c |  8 ++++----
 drivers/net/ipa/ipa_endpoint.h | 15 +++++++++++++--
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 8b055885cf3cf..cddddcedaf72b 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1082,7 +1082,7 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
 	u32 backlog;
 	int delta;
 
-	if (!endpoint->replenish_enabled) {
+	if (!test_bit(IPA_REPLENISH_ENABLED, endpoint->replenish_flags)) {
 		if (add_one)
 			atomic_inc(&endpoint->replenish_saved);
 		return;
@@ -1119,7 +1119,7 @@ static void ipa_endpoint_replenish_enable(struct ipa_endpoint *endpoint)
 	u32 max_backlog;
 	u32 saved;
 
-	endpoint->replenish_enabled = true;
+	set_bit(IPA_REPLENISH_ENABLED, endpoint->replenish_flags);
 	while ((saved = atomic_xchg(&endpoint->replenish_saved, 0)))
 		atomic_add(saved, &endpoint->replenish_backlog);
 
@@ -1133,7 +1133,7 @@ static void ipa_endpoint_replenish_disable(struct ipa_endpoint *endpoint)
 {
 	u32 backlog;
 
-	endpoint->replenish_enabled = false;
+	clear_bit(IPA_REPLENISH_ENABLED, endpoint->replenish_flags);
 	while ((backlog = atomic_xchg(&endpoint->replenish_backlog, 0)))
 		atomic_add(backlog, &endpoint->replenish_saved);
 }
@@ -1690,7 +1690,7 @@ static void ipa_endpoint_setup_one(struct ipa_endpoint *endpoint)
 		/* RX transactions require a single TRE, so the maximum
 		 * backlog is the same as the maximum outstanding TREs.
 		 */
-		endpoint->replenish_enabled = false;
+		clear_bit(IPA_REPLENISH_ENABLED, endpoint->replenish_flags);
 		atomic_set(&endpoint->replenish_saved,
 			   gsi_channel_tre_max(gsi, endpoint->channel_id));
 		atomic_set(&endpoint->replenish_backlog, 0);
diff --git a/drivers/net/ipa/ipa_endpoint.h b/drivers/net/ipa/ipa_endpoint.h
index 0a859d10312dc..07d5c20e5f000 100644
--- a/drivers/net/ipa/ipa_endpoint.h
+++ b/drivers/net/ipa/ipa_endpoint.h
@@ -40,6 +40,17 @@ enum ipa_endpoint_name {
 
 #define IPA_ENDPOINT_MAX		32	/* Max supported by driver */
 
+/**
+ * enum ipa_replenish_flag:	RX buffer replenish flags
+ *
+ * @IPA_REPLENISH_ENABLED:	Whether receive buffer replenishing is enabled
+ * @IPA_REPLENISH_COUNT:	Number of defined replenish flags
+ */
+enum ipa_replenish_flag {
+	IPA_REPLENISH_ENABLED,
+	IPA_REPLENISH_COUNT,	/* Number of flags (must be last) */
+};
+
 /**
  * struct ipa_endpoint - IPA endpoint information
  * @ipa:		IPA pointer
@@ -51,7 +62,7 @@ enum ipa_endpoint_name {
  * @trans_tre_max:	Maximum number of TRE descriptors per transaction
  * @evt_ring_id:	GSI event ring used by the endpoint
  * @netdev:		Network device pointer, if endpoint uses one
- * @replenish_enabled:	Whether receive buffer replenishing is enabled
+ * @replenish_flags:	Replenishing state flags
  * @replenish_ready:	Number of replenish transactions without doorbell
  * @replenish_saved:	Replenish requests held while disabled
  * @replenish_backlog:	Number of buffers needed to fill hardware queue
@@ -72,7 +83,7 @@ struct ipa_endpoint {
 	struct net_device *netdev;
 
 	/* Receive buffer replenishing for RX endpoints */
-	bool replenish_enabled;
+	DECLARE_BITMAP(replenish_flags, IPA_REPLENISH_COUNT);
 	u32 replenish_ready;
 	atomic_t replenish_saved;
 	atomic_t replenish_backlog;
-- 
2.32.0

