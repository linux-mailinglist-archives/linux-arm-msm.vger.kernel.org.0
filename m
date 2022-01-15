Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD98848F367
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jan 2022 01:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbiAOAOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 19:14:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiAOAOm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 19:14:42 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AB1C06161C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 16:14:42 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id c126-20020a1c9a84000000b00346f9ebee43so8501045wme.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 16:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QWRDz/lP4WgZx8JJJpg4MqwFtRS3EB5U3oteh/VulME=;
        b=v+nJ28Yg+iPDrdBXGPmKWDvhmWn12OVOTBzgSLCV0/upVkLO5N/52iygNTRK+ZOkk4
         /X+jRD77N2IHmFkANfrPIDSlThJaFIOvttLJZDlTG5hGp5mbc39uGBLgCWQ88sQ2TUHT
         183NwjtdTlg+RDC9UXuv7rv/yvt25Sb/JDuNMQLvvMz27FykOvjBNAnCTh5aCIguSkMl
         DevXDzz17TBsmpfCGtj5hkJMAy3hVjHcDk60nKZkzXrwneFTT0+47zCfPWBsqZNRxitG
         4nl7h9Fvm5vid+DyRZ7qctvufD9W6DTbn8PjP8CrwOX5GhjKJ+xfZJvvcTOpp6O2JxOu
         xKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QWRDz/lP4WgZx8JJJpg4MqwFtRS3EB5U3oteh/VulME=;
        b=nq0Hkzy1cQUpN3T/d0shSaZ44pkSwoRpkG/HZqbcv4SMeCwaw+RRgHNCh6ONmiNWBB
         45Dk21fv86FM5QEZJMsFNP+LkB+hqEpZkuEWGLguc3LckdmDEHCrqqnD1s48Bw0G9Ens
         KQbi2Ur92OBPC9urUbXhYwvt0MvdXbPIY+WqSh6OTeAf3KiiZdTbdCZgb++LrzHVY80q
         /nA0tPLHq+ZLBix4G9Jk8D5QA64AAmlESZUWbg0KbpNymAOvEUwHDVBQslVRUJ746Ybe
         ljufZ6GjN6VsKShP/2JspGGG9FnbRZlMWEo0Ps3aN+agtB83vVqNgx+0wuAyQMUZaI1l
         z3Ng==
X-Gm-Message-State: AOAM532oT5GO2GkY3DJiOhqF4RKgASip2i61jxpCKvYz5uxuS/+Wg8iR
        K5PyOIsUhEozk3zhqr5zu/4hOw==
X-Google-Smtp-Source: ABdhPJxZYo+En/nVsAlGlTIXk56jQu1vWDY1YeRNjnd1fCYmgbAmx084WDOyNKrjmlftg5VPNFKvhg==
X-Received: by 2002:a05:600c:4153:: with SMTP id h19mr2725816wmm.50.1642205680661;
        Fri, 14 Jan 2022 16:14:40 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m15sm7379494wmq.6.2022.01.14.16.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 16:14:40 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v3 4/4] wcn36xx: Add SNR reporting via get_survey()
Date:   Sat, 15 Jan 2022 00:16:46 +0000
Message-Id: <20220115001646.3981501-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220115001646.3981501-1-bryan.odonoghue@linaro.org>
References: <20220115001646.3981501-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for get_survey() reporting. Current channel and noise-floor are
reported, other parameters such as scan, busy, TX and RX time are not
immediately available.

Noise is a useful metric to report, so bring it out now.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/main.c | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 0e1f3dc4f69d4..af2b6f7c34137 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1357,6 +1357,49 @@ static void wcn36xx_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	}
 }
 
+static int wcn36xx_get_survey(struct ieee80211_hw *hw, int idx,
+			      struct survey_info *survey)
+{
+	struct wcn36xx *wcn = hw->priv;
+	struct ieee80211_supported_band *sband;
+	struct wcn36xx_chan_survey *chan_survey;
+	int band_idx;
+	unsigned long flags;
+
+	sband = wcn->hw->wiphy->bands[NL80211_BAND_2GHZ];
+	band_idx = idx;
+	if (band_idx >= sband->n_channels) {
+		band_idx -= sband->n_channels;
+		sband = wcn->hw->wiphy->bands[NL80211_BAND_5GHZ];
+	}
+
+	if (!sband || band_idx >= sband->n_channels)
+		return -ENOENT;
+
+	spin_lock_irqsave(&wcn->survey_lock, flags);
+
+	chan_survey = &wcn->chan_survey[idx];
+	survey->channel = &sband->channels[band_idx];
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
@@ -1385,6 +1428,7 @@ static const struct ieee80211_ops wcn36xx_ops = {
 	.ipv6_addr_change	= wcn36xx_ipv6_addr_change,
 #endif
 	.flush			= wcn36xx_flush,
+	.get_survey		= wcn36xx_get_survey,
 
 	CFG80211_TESTMODE_CMD(wcn36xx_tm_cmd)
 };
-- 
2.33.0

