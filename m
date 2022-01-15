Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CEC48F363
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jan 2022 01:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbiAOAOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 19:14:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbiAOAOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 19:14:40 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29DFC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 16:14:39 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id v123so9086098wme.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 16:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AsaR8KE4FUO+yauKKgOOa/fh5VYQZpsKbSDzqiBAFw4=;
        b=Qx4mt6/5dXfu8yGbRswOrD6ZBPYtR/PVlIkiYKF8vkbuYO2QuA5Ks0YFIujpwZHzvQ
         oaB285YfRc6D02OnoB8BlHW54Qreju8g592OC9hnfTmOkdiKiiHNU3RTuZBTX/nQVSyj
         IpN/8qmV400H04HHORePWJK8h1R1yPDw0a418lu5AsN+9ey2a6Am5SZMvARTCY8XIyz3
         FZN4WHF94Blboz6hSEaVLiw1p6kw11m40IWNElo5zkzZjcAh0sEh2lF73pCZAs/H8aa5
         pUUkR/yNRCvdWUaBmVYJ3KwGYTUZCNmNk5jjRfT+n/aApfvXbLsTqKWLgi06rbbpbFWM
         NeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AsaR8KE4FUO+yauKKgOOa/fh5VYQZpsKbSDzqiBAFw4=;
        b=IdL2LKC2eB4CjbOcdI36EwSpI2IoDil8SDbYbn39Yw4ZhUjxYE3Up+FkJtoJH6S6tP
         Axln5TSm2pJg6rOhDxN9W/lp+1P75lFZTPQVcexT3F7Qu0A3YsVTqL3VhA8r5FxlPkmE
         Jql5g3rSytZYYt6gqYeYZDcan/E0vd7DTPpNmOEgRl04SL92Sy99/wKDmqsg5qcNiUGc
         LTw0/zYMRWWZohM+7VwPEbgl2gkL1w13CwD0ScwncB4adbLJAs50MIPqeUjLX2741s0J
         mJPrAaP99wilpUnFHg+oMcl1ZM6TsPosXVh/LjO7i3l12uKgA9P+Adry0KDytY3tEewu
         qjRg==
X-Gm-Message-State: AOAM532T6zPD4FjhUbUrfIZ7NOvrpIJw8bqJAveFdnC58cxZYX7U0QHm
        8mmVzs2xCJLZxyYtUizgoxZf/g==
X-Google-Smtp-Source: ABdhPJxUHFGNFEhc4xRTZ4Ers/xKT32+YcCHeyDYSQ9q+kI+ffIASlPDCdghvWxJqMYiavsvF0lOqA==
X-Received: by 2002:a05:600c:2f90:: with SMTP id t16mr17394567wmn.69.1642205678416;
        Fri, 14 Jan 2022 16:14:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m15sm7379494wmq.6.2022.01.14.16.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 16:14:37 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/4] wcn36xx: Track the band and channel we are tuned to
Date:   Sat, 15 Jan 2022 00:16:44 +0000
Message-Id: <20220115001646.3981501-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220115001646.3981501-1-bryan.odonoghue@linaro.org>
References: <20220115001646.3981501-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Track the band and channel we are currently tuned to by way of pointers to
the standard structures that describe them both embedded within the driver.

Tracking of the pair makes it much easier when implementing
ieee80211_ops->get_survey to return quickly captured metrics for the
currently tuned channel.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/main.c    | 27 ++++++++++++++++++++++
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index ec355807f5817..d2b99f6112f6b 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -392,11 +392,38 @@ static void wcn36xx_change_opchannel(struct wcn36xx *wcn, int ch)
 {
 	struct ieee80211_vif *vif = NULL;
 	struct wcn36xx_vif *tmp;
+	struct ieee80211_supported_band *band;
+	struct ieee80211_channel *channel;
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(wcn->hw->wiphy->bands); i++) {
+		band = wcn->hw->wiphy->bands[i];
+		if (!band)
+			break;
+		for (j = 0; j < band->n_channels; j++) {
+			if (HW_VALUE_CHANNEL(band->channels[j].hw_value) == ch) {
+				channel = &band->channels[j];
+				break;
+			}
+		}
+		if (channel)
+			break;
+	}
+
+	if (!channel) {
+		wcn36xx_err("Cannot tune to channel %d\n", ch);
+		return;
+	}
+
+	wcn->band = band;
+	wcn->channel = channel;
 
 	list_for_each_entry(tmp, &wcn->vif_list, list) {
 		vif = wcn36xx_priv_to_vif(tmp);
 		wcn36xx_smd_switch_channel(wcn, vif, ch);
 	}
+
+	return;
 }
 
 static int wcn36xx_config(struct ieee80211_hw *hw, u32 changed)
diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
index fbd0558c2c196..dd2570e468084 100644
--- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
+++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
@@ -281,6 +281,9 @@ struct wcn36xx {
 	/* Debug file system entry */
 	struct wcn36xx_dfs_entry    dfs;
 #endif /* CONFIG_WCN36XX_DEBUGFS */
+
+	struct ieee80211_supported_band *band;
+	struct ieee80211_channel *channel;
 };
 
 static inline bool wcn36xx_is_fw_version(struct wcn36xx *wcn,
-- 
2.33.0

