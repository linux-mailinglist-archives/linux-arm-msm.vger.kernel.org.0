Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4E14743BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 14:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhLNNob (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 08:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234516AbhLNNoa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 08:44:30 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72643C061751
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 05:44:29 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso16300459wml.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 05:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HH/24Zvsag5iRgFp5ZNMJb2/h4lApJp4KjXAfpB5th0=;
        b=joJuWOHB6QNJc6rGN0UsdXn4NqozFHY5ZCXl3ueSs7JFFV/aj9YMNuZtQnUYW/ylsL
         7QwDNYZiDdH/VlLuWNExhJjDF0yW3soqEHPUEyRcuiI41e7TfZHPRlM+KhHC3ubVZp5j
         MNB24WvbZvLhKxHJte1mBs3ZBsmclHaUKMu2GOR3g++/xKYSh2Xskayj/W5aWM1pe6c3
         cmpie+qNx/of2nxwmrnVuYzbNOyPvKL+UHsIWQ+uBkyZWfmtrDQakuYIueJiTDZwgWPB
         Fx2uKuQprpeJ7oSwfd533FuUhHjAa6b8jkbMgfvGFNY+BtcyGBVs2agbgaMJr+R7CGqK
         ww7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HH/24Zvsag5iRgFp5ZNMJb2/h4lApJp4KjXAfpB5th0=;
        b=OkdJFCNAbDWcUX/LPMQc+kQEqvniYne0Sy4gEf5/8IEWZ+keVIf4vEBAOo/UeMALiF
         jdq3gtCT2JDqox5YV+EK9UPeGli3YL++XDeMwBIpq9x6qL4czEZQrR5eoTUw8w3FMzzw
         fFyWPAXyXqUw9H2h48HbAJMaaBKBuzzURLweRblTLhMqJaq5V9T5WWm1etzxnH5y2G2V
         PmTsXScCisxCikHvqtQvJRvSnLsWYm7cwI466sVSRloI34VRTfgKy7hF7CCDXueY+3IL
         7A85fvNW70lha+fRK7pCF8QNpy9jyBkgb6sjwScJRXJR4wdJuHBLL/XBqCSx45k8xQrw
         8aLg==
X-Gm-Message-State: AOAM530U5X3HfIsTHBLklDt2Nnz6Jje7yzQ0rcY6zgD4m8jhF0sxDzbT
        Yr65SyqQS4ssw4VVPPU19RdIzIq6UBeEiw==
X-Google-Smtp-Source: ABdhPJy+V9VwSbvuYFankFH6EUOfh9xmf4CwOu6MrSb3RDLxwEmhFnnCvj6cD/CN+JJQuxl19APFJA==
X-Received: by 2002:a05:600c:35d3:: with SMTP id r19mr6902162wmq.176.1639489467959;
        Tue, 14 Dec 2021 05:44:27 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g19sm2309592wmg.12.2021.12.14.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:44:27 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/3] wcn36xx: Fix physical location of beacon filter comment
Date:   Tue, 14 Dec 2021 13:46:29 +0000
Message-Id: <20211214134630.2214840-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211214134630.2214840-1-bryan.odonoghue@linaro.org>
References: <20211214134630.2214840-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The comment in the header with respect to beacon filtering makes a
reference to "the structure above" and "the structure below" which would be
informative if the comment appeared in the right place but, it does not.

Fix the comment location so that it a least makes sense w/r/t the physical
location statements.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/hal.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/hal.h b/drivers/net/wireless/ath/wcn36xx/hal.h
index 9bce71592f743..e9fec110721b5 100644
--- a/drivers/net/wireless/ath/wcn36xx/hal.h
+++ b/drivers/net/wireless/ath/wcn36xx/hal.h
@@ -3459,9 +3459,6 @@ struct wcn36xx_hal_missed_beacon_ind_msg {
 
 /* Beacon Filtering data structures */
 
-/* The above structure would be followed by multiple of below mentioned
- * structure
- */
 struct beacon_filter_ie {
 	u8 element_id;
 	u8 check_ie_presence;
@@ -3471,6 +3468,10 @@ struct beacon_filter_ie {
 	u8 ref;
 } __packed;
 
+/* The above structure would be followed by multiple of below mentioned
+ * structure
+ */
+
 struct wcn36xx_hal_add_bcn_filter_req_msg {
 	struct wcn36xx_hal_msg_header header;
 
-- 
2.33.0

