Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B22A49AB80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 06:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352775AbiAYFGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 00:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1326752AbiAYECc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 23:02:32 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93203C0617BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 16:40:51 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id u15so16751386wrt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 16:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yaTvwS4/6MDKumF6j26FEM+C3MJi6OQIGg+81nGS/Y4=;
        b=q6rEdrCpPsyas46bpfBf3wKDbN1TTehfOA2t81hnZkEm10OT8pQT3Fvs/sAV/uv6O+
         RPSXQUeq6WT0L0CiKmnJfljUf5lwte/eEiZorQ++M1ELx9PWA4i9lJgDqAw1e2V2nOvm
         K+6FClExzDfzrYPECEdUup7iJ7lTZtVBUY9hJUui2w+yuP8FlOSC1IJEBHwYihVuDBW8
         N16RI+F9oU5SW6/JbwYW0JyAxkEI2edVHWSC/puHmXIQChmMBqhgi8r2AcxwFtkxh4Ri
         y2Vfatljj/r7e9+ZyckF3otMHziIneEASqr9gohCfN0FcmsU1IF4jWaVk1E0Ya56GEa9
         w2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yaTvwS4/6MDKumF6j26FEM+C3MJi6OQIGg+81nGS/Y4=;
        b=7HqIci2yHNTSmO5uPootDJv/tjF3CB8fX8Sa9zIUqCQlgD3F3lC9q0ibo7/7rcj3aj
         /sxlvLK05YRzfJt1bOjv2gFQ3OHRhQQBqWrP1xAUc91D8k/I5F9d7fOkW9bIucQwvWdN
         KqI0P5XbwkmuL9r7GMN+/EPQwQEC+Pq90FHWY+wT8Ug0IKXaV0Ag9PQTekmzfy5lCgcJ
         Kp04xskilI819HtsmJdCTXwAoEyzojkIWUtayq7L9nEeIOLjLklZCayyovlJqjkaAdZv
         fohHF6KCykHphEhRy+HoOF2xqn4pyytyQP3nUnCUwlHNgERoYem+5b4kJMKqRBgdz40j
         qANQ==
X-Gm-Message-State: AOAM531RzJsnhQzVGyJ7B81r7jLjkGultCNSdc8ElcCuJSg84axLRxn7
        Da16Z/HBLa3HdXVp3wVm8HGguQ==
X-Google-Smtp-Source: ABdhPJzmdxdDuOGxRu6YgNjJI0JTdTY9ShLkZFHrXUFiM7nsFNsWNFs+BrB3LfghX8YDBfCEmwV9hA==
X-Received: by 2002:a5d:64e7:: with SMTP id g7mr3771269wri.72.1643071250137;
        Mon, 24 Jan 2022 16:40:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x4sm16364104wrp.13.2022.01.24.16.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 16:40:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org, stable@vger.kernel.org
Subject: [PATCH] wcn36xx: Differentiate wcn3660 from wcn3620
Date:   Tue, 25 Jan 2022 00:40:46 +0000
Message-Id: <20220125004046.4058284-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The spread of capability between the three WiFi silicon parts wcn36xx
supports is:

wcn3620 - 802.11 a/b/g
wcn3660 - 802.11 a/b/g/n
wcn3680 - 802.11 a/b/g/n/ac

We currently treat wcn3660 as wcn3620 thus limiting it to 2GHz channels.
Fix this regression by ensuring we differentiate between all three parts.

Fixes: 8490987bdb9a ("wcn36xx: Hook and identify RF_IRIS_WCN3680")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/main.c    | 3 +++
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 9575d7373bf27..ac2813ed851c4 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1513,6 +1513,9 @@ static int wcn36xx_platform_get_resources(struct wcn36xx *wcn,
 	if (iris_node) {
 		if (of_device_is_compatible(iris_node, "qcom,wcn3620"))
 			wcn->rf_id = RF_IRIS_WCN3620;
+		if (of_device_is_compatible(iris_node, "qcom,wcn3660") ||
+		    of_device_is_compatible(iris_node, "qcom,wcn3660b"))
+			wcn->rf_id = RF_IRIS_WCN3660;
 		if (of_device_is_compatible(iris_node, "qcom,wcn3680"))
 			wcn->rf_id = RF_IRIS_WCN3680;
 		of_node_put(iris_node);
diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
index fbd0558c2c196..5d3f8f56e5681 100644
--- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
+++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
@@ -97,6 +97,7 @@ enum wcn36xx_ampdu_state {
 
 #define RF_UNKNOWN	0x0000
 #define RF_IRIS_WCN3620	0x3620
+#define RF_IRIS_WCN3660	0x3660
 #define RF_IRIS_WCN3680	0x3680
 
 static inline void buff_to_be(u32 *buf, size_t len)
-- 
2.33.0

