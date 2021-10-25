Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1223439DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 19:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbhJYR4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 13:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbhJYR4j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 13:56:39 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4DDC061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:54:16 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso19382pjm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0b8Cy/SzLmseGiIUYAIo0JyRYpLjWYFrcuaB9VtxPw8=;
        b=SeU/8I56LhZgKHilc3Q8ccwtCrLudOwC5mMeNK26Xksa1sq/E8vQYC/O7Gslx9zC5r
         8bg1vCjJKBICr5F+PzmXdeduyawzKD33vctaViIm3AqU9xvQ6DTMjfgUPw7mkKzY5Yvo
         YChPE5hbbRWc8l5Ouec7/EAwUGD/9dUEkYd7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0b8Cy/SzLmseGiIUYAIo0JyRYpLjWYFrcuaB9VtxPw8=;
        b=Jo/8aHn0FaMditw+usTk7RRH0DoWSqv1HVhYVvoUwY5LzPrqtIghdx5W0Zy5/qr8uO
         jBNFPUi/sa1/QGJAYPTmskE2Xt/EMsO7ppIiJvN+fXh50N5bUycigPA0r13vec0yB2qd
         3rYJk4W4pwsbYgsqgwsPxhhj17Gj2LQLuWpilQToEv6dmPWu2VW06i+M5YKcfDR8cy5s
         jHJ1w5/63L/gVME2UHgacFlfDLeu4hFmBlc3Px1RxX+Pv4ycIc7zE5BVv2RGsFLm4wr4
         pY+pxmBJA3aNVNAt/WdGggygIzBYFQr28zw+6riu0PObiFTFOk4lKWs7/oz/tS+8e2hA
         Vl5A==
X-Gm-Message-State: AOAM5323TwGwioECfzMJ+UK1aHHx5eOYOPquRTsEdJSwXy/hACrFUp6L
        AIoFmW/fnqGn8rmHrPR7dScEjQ==
X-Google-Smtp-Source: ABdhPJwhSGpFuYwaM8jcys6JcXxW/N+o+8GBOK/mD7NCQWgVxJEYUv3D04jpODXTAFetFTb4oTMSog==
X-Received: by 2002:a17:902:be0c:b0:13e:2b53:d3 with SMTP id r12-20020a170902be0c00b0013e2b5300d3mr17977669pls.86.1635184456224;
        Mon, 25 Oct 2021 10:54:16 -0700 (PDT)
Received: from localhost ([2600:6c50:4d00:cd01::382])
        by smtp.gmail.com with ESMTPSA id c6sm581421pfd.114.2021.10.25.10.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:54:15 -0700 (PDT)
From:   Benjamin Li <benl@squareup.com>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, Benjamin Li <benl@squareup.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] wcn36xx: add missing 5GHz channels 136 and 144
Date:   Mon, 25 Oct 2021 10:53:58 -0700
Message-Id: <20211025175359.3591048-3-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025175359.3591048-1-benl@squareup.com>
References: <20211025175359.3591048-1-benl@squareup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The official feature-complete WCN3680B driver (known as prima, open source
but not upstream) supports channels 136 and 144.

However, these channels are missing in upstream. Add them here to get
closer to feature parity with prima.

Signed-off-by: Benjamin Li <benl@squareup.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/main.c | 2 ++
 drivers/net/wireless/ath/wcn36xx/smd.c  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 263af65a889ab..13d09c66ae921 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -85,7 +85,9 @@ static struct ieee80211_channel wcn_5ghz_channels[] = {
 	CHAN5G(5620, 124, PHY_QUADRUPLE_CHANNEL_20MHZ_LOW_40MHZ_HIGH),
 	CHAN5G(5640, 128, PHY_QUADRUPLE_CHANNEL_20MHZ_HIGH_40MHZ_HIGH),
 	CHAN5G(5660, 132, PHY_QUADRUPLE_CHANNEL_20MHZ_LOW_40MHZ_LOW),
+	CHAN5G(5680, 136, PHY_QUADRUPLE_CHANNEL_20MHZ_HIGH_40MHZ_LOW),
 	CHAN5G(5700, 140, PHY_QUADRUPLE_CHANNEL_20MHZ_LOW_40MHZ_HIGH),
+	CHAN5G(5720, 144, PHY_QUADRUPLE_CHANNEL_20MHZ_HIGH_40MHZ_HIGH),
 	CHAN5G(5745, 149, PHY_QUADRUPLE_CHANNEL_20MHZ_LOW_40MHZ_LOW),
 	CHAN5G(5765, 153, PHY_QUADRUPLE_CHANNEL_20MHZ_HIGH_40MHZ_LOW),
 	CHAN5G(5785, 157, PHY_QUADRUPLE_CHANNEL_20MHZ_LOW_40MHZ_HIGH),
diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index be6442b3c80b1..9785327593d26 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -2396,6 +2396,7 @@ int wcn36xx_smd_feature_caps_exchange(struct wcn36xx *wcn)
 	set_feat_caps(msg_body.feat_caps, STA_POWERSAVE);
 	if (wcn->rf_id == RF_IRIS_WCN3680) {
 		set_feat_caps(msg_body.feat_caps, DOT11AC);
+		set_feat_caps(msg_body.feat_caps, WLAN_CH144);
 		set_feat_caps(msg_body.feat_caps, ANTENNA_DIVERSITY_SELECTION);
 	}
 
-- 
2.25.1

