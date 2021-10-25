Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BE2439DF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 19:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhJYR4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 13:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbhJYR4d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 13:56:33 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74371C061243
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:54:11 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id n11so8470918plf.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1gPoNo92iESFlBxWkikvbPoKmmzVPIkRedYKKP1zdBg=;
        b=c/w6uGKLxK0fHWgqwW03VkNNLB+5X2tI9LfAEGp3yrep3P7kUWdWrXbelId6QlnOjW
         D3bjyFCvZHvv/1i61dgLL3uICvR2AUfKNLoZIJgaBZKAhvr0wK+ASM/YLxrKSMaEnY6t
         GqcXy6v3OXhWLhpMZr/wPpLdvQBY6GUD4Pyf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1gPoNo92iESFlBxWkikvbPoKmmzVPIkRedYKKP1zdBg=;
        b=N/QtKnngTddUPMoxD3LgkijEG6uFpuhdpy7mEbk9GfsSQ4SPE/M1axYqdYKjdqk2ap
         ynLW8aGizDgpjErXGb//whuCsW4Z1bsgOPLPTR7da1jthBXvj7u5UD4jSgksCgvHIg2Q
         voSu4vqu2hjyqlvV7tEtvrUv6cMB0EPD7AjWHq0N4cpLXUFTYO3q5alMILGQErgilAFj
         dTmieB/fVPwR7cqea8g8uewl0KNcc4skjG20cIEKYV2f/YNABkBj6d6Ku34zQ2SM9Fwq
         TabtMN6/g2aNy3vhjCzdm3mxW9gU5MYzzWSFdmKGwVNc0E/ZaSddR23RGHNQcmGiCHRF
         2lSg==
X-Gm-Message-State: AOAM533blLxorsTDTnRUF/M/EhfXFek4MQQQvdj62oMzL7j3LXLgnV6C
        Z8AsG2VSxUC/FLevNHY8xHvI0g==
X-Google-Smtp-Source: ABdhPJw4DjI/4mA/YrILoYKVG0T9mBiDsZBAxrKs6I1r0g0nuM4QiC9BILDitCgYrC4dYvU/fbSXig==
X-Received: by 2002:a17:902:ea04:b0:140:5023:f475 with SMTP id s4-20020a170902ea0400b001405023f475mr8038051plg.29.1635184450986;
        Mon, 25 Oct 2021 10:54:10 -0700 (PDT)
Received: from localhost ([2600:6c50:4d00:cd01::382])
        by smtp.gmail.com with ESMTPSA id d14sm20930669pfu.124.2021.10.25.10.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:54:10 -0700 (PDT)
From:   Benjamin Li <benl@squareup.com>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, Benjamin Li <benl@squareup.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] wcn36xx: switch on antenna diversity feature bit
Date:   Mon, 25 Oct 2021 10:53:57 -0700
Message-Id: <20211025175359.3591048-2-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025175359.3591048-1-benl@squareup.com>
References: <20211025175359.3591048-1-benl@squareup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The official feature-complete WCN3680B driver (known as prima, open source
but not upstream) sends this feature bit.

As we wish to support the antenna diversity feature in upstream, we need
to set this bit as well.

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 drivers/net/wireless/ath/wcn36xx/smd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index 3979171c92dd2..be6442b3c80b1 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -2394,8 +2394,10 @@ int wcn36xx_smd_feature_caps_exchange(struct wcn36xx *wcn)
 	INIT_HAL_MSG(msg_body, WCN36XX_HAL_FEATURE_CAPS_EXCHANGE_REQ);
 
 	set_feat_caps(msg_body.feat_caps, STA_POWERSAVE);
-	if (wcn->rf_id == RF_IRIS_WCN3680)
+	if (wcn->rf_id == RF_IRIS_WCN3680) {
 		set_feat_caps(msg_body.feat_caps, DOT11AC);
+		set_feat_caps(msg_body.feat_caps, ANTENNA_DIVERSITY_SELECTION);
+	}
 
 	PREPARE_HAL_BUF(wcn->hal_buf, msg_body);
 
-- 
2.25.1

