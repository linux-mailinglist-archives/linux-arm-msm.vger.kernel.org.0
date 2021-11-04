Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBE5444CDA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 02:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhKDBIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 21:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbhKDBIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 21:08:41 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DC6C061208
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 18:06:04 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f8so4442349plo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 18:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l0NodXMiXOc4ZwZnRHBZa9k+oUne0ZC0/wZzXhkZmZI=;
        b=LnBaFBJxFiio4rB+3EcY9+ZKc8yrYBVGpc+8LUEODOn6EkbjC9Rd1SS0DAZO4C8/kz
         roZT/aniOYMHrJwMTfF3MH53guYKahKXW0cs4dFF7Kaimzde79Kl19xAmaO5Tt48kQoh
         LxWHEb1fQOkRdPpnevfIX9bo+wT2Be7rWIKP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l0NodXMiXOc4ZwZnRHBZa9k+oUne0ZC0/wZzXhkZmZI=;
        b=D5bDMsWF52PiWN0N/6Q1THo62acmtpiieyU3DXWke28saalTaV8QUQBZMYNu2JCRE4
         k9zGESA/1iSzWWMHxHr6No5xEQiXaxZwJf1xnXMlfsSOja846sJwKKhDlZjTVb+3Oj1x
         vuY8enN5iQdlLtFtspPOPJlk56qostyOfMgIHWnsCKweeyaSUVYXpmF5wCE1aTVZ9ZVd
         A+gwsnl2DzwL50BFwFKcHd+45r+jgylrwrEYDDEsU501Him1M7Xbx0bc9/0JH5mAfLHa
         11RYs2akASc5dSMsO0rR5VrtBb2WNsRCnlw0Ml941IHQAWooVoi6lHD2f9ma0sYTrD8A
         Z3wQ==
X-Gm-Message-State: AOAM530hDtO6I3YoOa7MBCn+Yjz5QWX+G+1m5dkbW2YpAGpgINtzkRpl
        CO3cEBcxgeu13IuitP7mbRCKgg==
X-Google-Smtp-Source: ABdhPJw0acps+6sDCj/mXAWZyD90NnhnpiPfxAq1ztrvINgsCTh1aK2pVCUnS8RD2wT02f5+3ngXkg==
X-Received: by 2002:a17:90a:e506:: with SMTP id t6mr16698467pjy.9.1635987963550;
        Wed, 03 Nov 2021 18:06:03 -0700 (PDT)
Received: from localhost ([2600:6c50:4d00:d401:aa7a:1484:c7d0:ae82])
        by smtp.gmail.com with ESMTPSA id e8sm3667882pfn.45.2021.11.03.18.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 18:06:03 -0700 (PDT)
From:   Benjamin Li <benl@squareup.com>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, Benjamin Li <benl@squareup.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] wcn36xx: fix RX BD rate mapping for 5GHz legacy rates
Date:   Wed,  3 Nov 2021 18:05:48 -0700
Message-Id: <20211104010548.1107405-3-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104010548.1107405-1-benl@squareup.com>
References: <20211104010548.1107405-1-benl@squareup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The linear mapping between the BD rate field and the driver's 5GHz
legacy rates table (wcn_5ghz_rates) does not only apply for the latter
four rates -- it applies to all eight rates.

Fixes: 6ea131acea98 ("wcn36xx: Fix warning due to bad rate_idx")
Signed-off-by: Benjamin Li <benl@squareup.com>
---
 drivers/net/wireless/ath/wcn36xx/txrx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/txrx.c b/drivers/net/wireless/ath/wcn36xx/txrx.c
index f0a9f069a92a9..dd58dde8c8363 100644
--- a/drivers/net/wireless/ath/wcn36xx/txrx.c
+++ b/drivers/net/wireless/ath/wcn36xx/txrx.c
@@ -272,7 +272,6 @@ int wcn36xx_rx_skb(struct wcn36xx *wcn, struct sk_buff *skb)
 	const struct wcn36xx_rate *rate;
 	struct ieee80211_hdr *hdr;
 	struct wcn36xx_rx_bd *bd;
-	struct ieee80211_supported_band *sband;
 	u16 fc, sn;
 
 	/*
@@ -350,12 +349,11 @@ int wcn36xx_rx_skb(struct wcn36xx *wcn, struct sk_buff *skb)
 		status.enc_flags = rate->encoding_flags;
 		status.bw = rate->bw;
 		status.rate_idx = rate->mcs_or_legacy_index;
-		sband = wcn->hw->wiphy->bands[status.band];
 		status.nss = 1;
 
 		if (status.band == NL80211_BAND_5GHZ &&
 		    status.encoding == RX_ENC_LEGACY &&
-		    status.rate_idx >= sband->n_bitrates) {
+		    status.rate_idx >= 4) {
 			/* no dsss rates in 5Ghz rates table */
 			status.rate_idx -= 4;
 		}
-- 
2.25.1

