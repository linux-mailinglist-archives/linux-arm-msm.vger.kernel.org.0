Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84A4472FDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 15:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbhLMO6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 09:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbhLMO63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 09:58:29 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DD7C061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 06:58:28 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so11745478wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uTYixfrhf6bWN82g0Fi5qU9LAYUUaPAtaNL6sw+Jd4U=;
        b=BwgGHf/a3sgf+58Cy0bbtoeudPI8sMhx6nOqMqjkKkc4w8EFzteQelbbR50X3izWOK
         I1hxnFCA4TzztzjJcTw7rtiLpfmaa/HS1dWRwdpricIV/eONZrGpEE+b1k5UxkQfv/4q
         qMstzYPG9mGrTstflGtiZKDrlNRIYQEQEdQKxNKuqaqiw/3SsS5GlYXrCABaBTb1w/UW
         CwizmLGmsdshF6J8N5vB/KdIug2xxWc3ilFBXZ8javp62C17k5aYchxXg40/NXuRUG5E
         SkwkJ4hR+jcyGi4WsQ+AAxosAc7f8C86SAsb8+1M1Ur/6D4v6Bat878RMvOb8flSNT9K
         A5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uTYixfrhf6bWN82g0Fi5qU9LAYUUaPAtaNL6sw+Jd4U=;
        b=kLo1E/7cBJrvKbyW4ewlYeIhjkWq7+Ka04hvamTWAna917mpXHYlxho+2HueOJ4dNA
         8J7JM+8dxSU5pa53goHQJp6yWgq6ucS8EnikPhFWw9ENPUZASbp7j/7MEYrab9TgURWU
         2xWN2+Qc55REsEvGLIEVL/kA9d5+3levv2ijRLD8etnJV4V29oArF+iD1q9XybKRPRye
         g6qFOGzGwAuQTLNWZTsllwL8+LzwCP+F9Z2zflTXiNXhxPatb1VBBp9SXA2kkqBmgU09
         6OUCJlg7cqduSlMNZLWDgZ5cNwDNtsgmk46UYJnluviwyAnmfmqiLf4GzZBtlWQ+2w4j
         Q4lg==
X-Gm-Message-State: AOAM531RQt856v+Hcx+SOfL31wOCCEhDbWZbunD3t2QhXbdx/I3WiGwP
        3nO5yfqHnIw97JQSlDNUJt9uiQ==
X-Google-Smtp-Source: ABdhPJw/96B3Ift85NKuNZGxjnSUJpD5xNkWxu7JuHeoinuAWV3d3eLRThGTLYs8D3bd5IhvqB6fcQ==
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr37974093wme.130.1639407507252;
        Mon, 13 Dec 2021 06:58:27 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o63sm7570112wme.2.2021.12.13.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:58:26 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/3] wcn36xx: Fix beacon filter structure definitions
Date:   Mon, 13 Dec 2021 15:00:29 +0000
Message-Id: <20211213150031.1707955-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213150031.1707955-1-bryan.odonoghue@linaro.org>
References: <20211213150031.1707955-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The beacon filter structures need to be packed. Right now its fine because
we don't yet use these structures so just pack them without marking it for
backporting.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/hal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/hal.h b/drivers/net/wireless/ath/wcn36xx/hal.h
index 9bea2b01f9aab..9bce71592f743 100644
--- a/drivers/net/wireless/ath/wcn36xx/hal.h
+++ b/drivers/net/wireless/ath/wcn36xx/hal.h
@@ -3469,7 +3469,7 @@ struct beacon_filter_ie {
 	u8 value;
 	u8 bitmask;
 	u8 ref;
-};
+} __packed;
 
 struct wcn36xx_hal_add_bcn_filter_req_msg {
 	struct wcn36xx_hal_msg_header header;
@@ -3480,14 +3480,14 @@ struct wcn36xx_hal_add_bcn_filter_req_msg {
 	u16 ie_num;
 	u8 bss_index;
 	u8 reserved;
-};
+} __packed;
 
 struct wcn36xx_hal_rem_bcn_filter_req {
 	struct wcn36xx_hal_msg_header header;
 
 	u8 ie_Count;
 	u8 rem_ie_id[1];
-};
+} __packed;
 
 #define WCN36XX_HAL_IPV4_ARP_REPLY_OFFLOAD                  0
 #define WCN36XX_HAL_IPV6_NEIGHBOR_DISCOVERY_OFFLOAD         1
-- 
2.33.0

