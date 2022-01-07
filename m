Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4842E4879B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 16:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348096AbiAGPbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 10:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239528AbiAGPbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 10:31:17 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D26C06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jan 2022 07:31:16 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id o3so11693244wrh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jan 2022 07:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/VlTdEJulPdJ5lhYnLqtXNudnIvNcxVXcQYjID5flM=;
        b=EKG5l10rxbPvg6Ykkp+ZdKXd6qTy2EEYHb5i/PdW7pwLvAbv1wrLEZjhM9XeqPdYez
         GeL4V0E9Qxkhx1jOKImMNJBSCKzhTzqIweZQnWs6xtwdOG+q1FVYVlx64QcotCzbe7rD
         WSUREX+cVyZ6BrDc9lqUMqSA7wOsBltizEjnBGi9K05rXPXVtQEX170u3FptFdJnByhd
         BjKT/1CZjNCIZYuez1x64EbmIrXSKHaO0inJtRXKJsE91yGBVuASOU/dGzRbTHDd871b
         CAD10QGQ4oxBwgK6Qh7YkEYWNsUkDv4dDG3lWB5q9WxYbJ1t82sKKLg1K5+/cw+zpu9p
         8s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/VlTdEJulPdJ5lhYnLqtXNudnIvNcxVXcQYjID5flM=;
        b=Pv3jzPoFJ0utAHd9S47o0txTCD4W8jHgOUWT4L5w7LKDuB5SQLaOQCAYf7Ma8tTKHH
         +LvhTJxEnngOxARC2QcY223RjTK/uEzddcmsN4hHZ3RmO/6tlVf9JLV/G0JfSG0ptWy5
         d6wSbcrgVybe1LnU+p1gZFxx+9JHOc8qQKl0Zf/EG8muvfT0bMOLL4VyfgaYJ77j1Xw6
         l6JV3650DDsaBmh1gWJzZTpmicuuN/1kjliTG5mF+PeDsb2o0YAYL49ySnwQQ4Yby1gS
         xKGCDuZK4bjN5z5xy5k69jkV1njIr6j1a9Lmmr+b4ygYIn7gOSpYGoGINzE7WgzXCLDV
         73JA==
X-Gm-Message-State: AOAM532V8V5PQgdTY5IeUGJWGWO4FQNbAMpovOYJ+7/G4ytx+7Rx4J0w
        H7frYfivXbk2xic7+m2QwGDlHw==
X-Google-Smtp-Source: ABdhPJwKvqyms7weki5XSBOBdzeLHWXzQG9ut5otgerkQy1skxC0PVJbX6wQyeaWJ+DJDYEEcwfZww==
X-Received: by 2002:a05:6000:1687:: with SMTP id y7mr55633491wrd.234.1641569475321;
        Fri, 07 Jan 2022 07:31:15 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m6sm997242wrx.36.2022.01.07.07.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 07:31:14 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 1/4] wcn36xx: Implement get_snr()
Date:   Fri,  7 Jan 2022 15:33:20 +0000
Message-Id: <20220107153323.1807905-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220107153323.1807905-1-bryan.odonoghue@linaro.org>
References: <20220107153323.1807905-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wcn36xx BD phy descriptor returns both Received Signal Strength
Information (RSSI) and Signal To Noise Ratio (SNR) with each delivered BD.

The macro to extract this data is a simple-one liner, easily imported from
downstream. This data will be useful to us when implementing
mac80211-ops->get_survey().

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/txrx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/txrx.c b/drivers/net/wireless/ath/wcn36xx/txrx.c
index ed4e8f201f510..a3eb476c2cbc4 100644
--- a/drivers/net/wireless/ath/wcn36xx/txrx.c
+++ b/drivers/net/wireless/ath/wcn36xx/txrx.c
@@ -23,6 +23,11 @@ static inline int get_rssi0(struct wcn36xx_rx_bd *bd)
 	return 100 - ((bd->phy_stat0 >> 24) & 0xff);
 }
 
+static inline int get_snr(struct wcn36xx_rx_bd *bd)
+{
+	return ((bd->phy_stat1 >> 24) & 0xff);
+}
+
 struct wcn36xx_rate {
 	u16 bitrate;
 	u16 mcs_or_legacy_index;
-- 
2.33.0

