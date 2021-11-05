Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0392E446348
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 13:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbhKEMWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 08:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbhKEMWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 08:22:36 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E981C061205
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 05:19:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n29so1709387wra.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 05:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KOl3+26PWtF7eprVNspEgh37KJEfd0Cl1bhXRCaoQk=;
        b=Fk5P9qJblVgmJkEKkG4i0/n0/K/bPWb7XEOdVWaMfIKh7fx7l/ZvhRYdZ87OBwJ5ks
         PUlzG22yXhv6L85FMduSDu85Ucz9jZq+SMmE3YOgxLdHADzVsLpP7hiZH7JMd4P4IpZT
         NeYzUVAd3RT71k+O8V+VxlNAaGyfaCR46rJ9RR7JeUrCB1/wJPvUdowNP7wXQNR0YQiw
         B2YngbiaRtjSJC0LYAYfHSeYaNtTCwMRcza8Wyj/ZHrheWIK3azFUAcpkFhPqCFK1HsF
         SrPmUXi8NI2Dy1qdBzXRbdrMakbcK+uXB/Um6oxVtDa6VtmlMESljUqkMjJhJD1Y8I4v
         XksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KOl3+26PWtF7eprVNspEgh37KJEfd0Cl1bhXRCaoQk=;
        b=xUsNrB5vZLejEJRwf6N9gerClSt3S+i7+5H9mCeBoiITPbNcCF/HuC0VMhxcdZPWWy
         PocnA+lCmBYBbyA+SVeYGMxwysb2gxupbcPBWEMUcKQmLCt63l1skZUi1+T+S0qdvOkR
         PB2RZSKwdkSNTvq7+9JTi0xi5JuNTFqCOWRpfWqtJv9U8yViF/kMaE004e3gXhmZq5Xg
         HjYsc3tsTPoNRkq9lF+7f+HN03zt9ORgbRCMJTGpTwwnhOZBZkRFcHUouhquwEsuqqtZ
         FVZdGMNlSxGKRuVopgtFXRGFLaXYSvMaLkpkrE5iVtZvRJM8seBm7HH5CBcyLCV4HfS7
         XzFg==
X-Gm-Message-State: AOAM530R+bAjP9qEpgvuRe43go7PKC6nDBHabyjW3QU/3AJZAODaaOyA
        y8QDG2ArkwFPzK2AUya8c0fqMQ==
X-Google-Smtp-Source: ABdhPJxQIueW7+eNhymd3zC/U5z2N6SeCbakz/ePf+jfk1cZEF1Jig0M9bUzoBCDDXrvPp9uZW01Ig==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr32019922wrl.24.1636114795242;
        Fri, 05 Nov 2021 05:19:55 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q84sm13961796wme.3.2021.11.05.05.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 05:19:54 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        johannes@sipsolutions.net, bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/3] wcn36xx: Release DMA channel descriptor allocations
Date:   Fri,  5 Nov 2021 12:21:51 +0000
Message-Id: <20211105122152.1580542-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105122152.1580542-1-bryan.odonoghue@linaro.org>
References: <20211105122152.1580542-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When unloading the driver we are not releasing the DMA descriptors which we
previously allocated.

Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN3680 hardware")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/dxe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireless/ath/wcn36xx/dxe.c
index d6c621518c7b8..d6c951f7dec3b 100644
--- a/drivers/net/wireless/ath/wcn36xx/dxe.c
+++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
@@ -1061,4 +1061,9 @@ void wcn36xx_dxe_deinit(struct wcn36xx *wcn)
 
 	wcn36xx_dxe_ch_free_skbs(wcn, &wcn->dxe_rx_l_ch);
 	wcn36xx_dxe_ch_free_skbs(wcn, &wcn->dxe_rx_h_ch);
+
+	wcn36xx_dxe_deinit_descs(wcn->dev, &wcn->dxe_tx_l_ch);
+	wcn36xx_dxe_deinit_descs(wcn->dev, &wcn->dxe_tx_h_ch);
+	wcn36xx_dxe_deinit_descs(wcn->dev, &wcn->dxe_rx_l_ch);
+	wcn36xx_dxe_deinit_descs(wcn->dev, &wcn->dxe_rx_h_ch);
 }
-- 
2.33.0

