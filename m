Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9018C4879BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 16:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348105AbiAGPbV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 10:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348101AbiAGPbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 10:31:20 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CCDC06173F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jan 2022 07:31:19 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id l10so11724737wrh.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jan 2022 07:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3caE7ZiFVRPsfUz1cJ9WrcYjXkULY6fiCjhjWppgLEs=;
        b=osq/ESNMmBdyZ3Ij8ISDCG5B99rgcMHSPcv8FqvNjy0q9TjoXobh8cYbuaar2pjDti
         IYpkJs8aCAaBGK42XIFDJB4O9JL6ocwSqH1Qpl+SFZnYsXmSJKj3lebODEGF0sdwN3g+
         Bvu4JuSRPBSUHUIxCKn+aG04syONMaLJ9bnxPCUqGo3/vODwDQ4h8IFe90MpMG1oH2hw
         kYKcpGzBZwtAbBcQJIWAmFBU9fJxMg9KxtR31uz3QUg93Bu03UWRVQoKy3VIfkq0/ttV
         JTyRci8ignpmOT1b3qhjc52lBVn3MxYGk2LYGPfWVNU8fWMobL1R/eYzkqDsa7Em+YSe
         9HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3caE7ZiFVRPsfUz1cJ9WrcYjXkULY6fiCjhjWppgLEs=;
        b=M0HZmM6a5H9sHd9vRkWBWyogNARVsq0G5dLiANnrY2IZurIUYk7h+nMDjRTusJXFYv
         OSoCGYzFHezpEH7EysbsyDNJN6uhqN+gGdzifAqhYPd9tBn0CO650IO0t4hjgOM9pU0U
         sV62BpKfZbhBhvWgQfUHspI5GmfMMdAdaNcy+3y5TgC5N4X3y2HHd5BQqHpGZoMNHlDE
         WIwWauft2AbuKBDzvK9cUf9V3FHn1zpkhDfbfg3bzuF43Aed/Nm93aDpjVmxj7YOwg3t
         Nj8Q50utKilmssWrEV9SNVapnIMVVY2KgYyABCHiJjE8JyatYg4m7FcRT74HYuVSIo4M
         VAzQ==
X-Gm-Message-State: AOAM530agA5x+8qGvwTcIP10Ojqcg2WqeRbuGVKiedPs+Hi95+5xyD2l
        W3CAwoNYmpzuwhTmpjbUdZs1EcZrmkTmyg==
X-Google-Smtp-Source: ABdhPJxP/LtECTOcLF1eTcgsMe+Mm9jzmNY1cAbNE7xAawb3DcVWlasFk4TfQ/ICCR24z/+0jjD+ww==
X-Received: by 2002:a05:6000:1845:: with SMTP id c5mr54191134wri.499.1641569478109;
        Fri, 07 Jan 2022 07:31:18 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m6sm997242wrx.36.2022.01.07.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 07:31:17 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 4/4] wcn36xx: Add SNR reporting via get_survey()
Date:   Fri,  7 Jan 2022 15:33:23 +0000
Message-Id: <20220107153323.1807905-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220107153323.1807905-1-bryan.odonoghue@linaro.org>
References: <20220107153323.1807905-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for get_survey() reporting. Current channel and noise-floor are
reported, other parameters such as scan, busy, TX and RX time are not
immediately available.

Noise is a useful metric to report, so bring it out now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/main.c | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index d130ebb965146..bcef590be60dc 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1357,6 +1357,47 @@ static void wcn36xx_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	}
 }
 
+int wcn36xx_get_survey(struct ieee80211_hw *hw, int idx,
+		       struct survey_info *survey)
+{
+	struct wcn36xx *wcn = hw->priv;
+	struct ieee80211_supported_band *sband;
+	struct wcn36xx_chan_survey *chan_survey;
+	unsigned long flags;
+
+	sband = wcn->hw->wiphy->bands[NL80211_BAND_2GHZ];
+	if (idx >= sband->n_channels) {
+		idx -= sband->n_channels;
+		sband = wcn->hw->wiphy->bands[NL80211_BAND_5GHZ];
+	}
+
+	if (!sband || idx >= sband->n_channels)
+		return -ENOENT;
+
+	spin_lock_irqsave(&wcn->survey_lock, flags);
+
+	chan_survey = &wcn->chan_survey[idx];
+	survey->channel = &sband->channels[idx];
+	survey->noise = chan_survey->rssi - chan_survey->snr;
+	survey->filled = 0;
+
+	if (chan_survey->rssi > -100 && chan_survey->rssi < 0)
+		survey->filled |= SURVEY_INFO_NOISE_DBM;
+
+	if (survey->channel == wcn->channel)
+		survey->filled |= SURVEY_INFO_IN_USE;
+
+	spin_unlock_irqrestore(&wcn->survey_lock, flags);
+
+	 wcn36xx_dbg(WCN36XX_DBG_MAC,
+		     "ch %d rssi %d snr %d noise %d filled %x freq %d\n",
+		     HW_VALUE_CHANNEL(survey->channel->hw_value),
+		     chan_survey->rssi, chan_survey->snr, survey->noise,
+		     survey->filled, survey->channel->center_freq);
+
+	return 0;
+}
+
 static const struct ieee80211_ops wcn36xx_ops = {
 	.start			= wcn36xx_start,
 	.stop			= wcn36xx_stop,
@@ -1385,6 +1426,7 @@ static const struct ieee80211_ops wcn36xx_ops = {
 	.ipv6_addr_change	= wcn36xx_ipv6_addr_change,
 #endif
 	.flush			= wcn36xx_flush,
+	.get_survey		= wcn36xx_get_survey,
 
 	CFG80211_TESTMODE_CMD(wcn36xx_tm_cmd)
 };
-- 
2.33.0

