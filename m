Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2BF4743BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 14:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbhLNNoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 08:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbhLNNo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 08:44:28 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42819C061748
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 05:44:28 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so13795958wms.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 05:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iH31IPcSjhrHBMlbPkShOp+GZgBxks+YGO36i19sp8s=;
        b=oTFQvwJcXHMQj5RirhlFbzNf6Dxs1er3O+vMZmGwr9KSJ/vS3JgWSX7GhPr2CJBCzn
         5nlF1Kwuf8A6AUbi2sse6ATGdPlL1n3ufaEFtTruDZ19aKXxsY3APiJ+mIQXRCD3bCw9
         45/VNpzMrygI/1i88P9AbwDdqphtv+N8b1TmL5V4uZFpBrn8erITKuWHjlLQe8qWVtaz
         QnkIs+0IVInJpJmVZmvx/Jy3Kj98Jfs85EXognRpQ5gn8PmnPdylyEEvKmhTVvk/dLee
         5/aXWLIbZrE/ov/Fpv6y5kLablLVdXWB1OR3jNYcODp/7tB/DJ0PiFs0e9DLy1SmWINc
         5Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iH31IPcSjhrHBMlbPkShOp+GZgBxks+YGO36i19sp8s=;
        b=PIqR3BBy6KOtfcDpcdos5a+nFuVYm3n9BW75JQDa2bf3gx7Z6zQgJHQ5Z+tYvB6Ek3
         xFzZArLgBe3q1HU+UJ9oqTP01jMq/9znmkvceoSXajOYB4XPycY/boiIrkVKIDv7Es4/
         cTfMkUPXuVu+G2k0xcua3e4plmmflhI4GxUiqd4Cp3e6HsFMZaPa3crmEOgwPxHJ1SVt
         e94dYh+L2QITegunF+QRWXTHOVGSiNj8aAJmdr8O7iVaUDVOiXbgXhbPLO4VT/00DBVB
         4rbH19jlApSpKdXcf53RimSsUU8hAJcUgsDO412EH5jD56a3xFwO6Jhsl+npOdYaVxKq
         ASbA==
X-Gm-Message-State: AOAM533ONTlBxEGPoOV2foI5ueccdAtzOwSh5kDhHWORsbUUP+FNVrqZ
        k8elHv1wdrjTtUhpQ/IWRe+7wQ==
X-Google-Smtp-Source: ABdhPJyg0oekeYgXitdty2AZ5tLSUQRaZ8CoO68o52OvnhAi/kQ1VbtRwCogwdaiHIGakldnTk8WLA==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id g18mr7216822wmq.25.1639489466870;
        Tue, 14 Dec 2021 05:44:26 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g19sm2309592wmg.12.2021.12.14.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:44:26 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/3] wcn36xx: Fix beacon filter structure definitions
Date:   Tue, 14 Dec 2021 13:46:28 +0000
Message-Id: <20211214134630.2214840-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211214134630.2214840-1-bryan.odonoghue@linaro.org>
References: <20211214134630.2214840-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The beacon filter structures need to be packed. Right now its fine because
we don't yet use these structures so just pack them without marking it for
backporting.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
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

