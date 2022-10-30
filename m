Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719976126AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 02:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJ3ATL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 20:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiJ3ATB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 20:19:01 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEDA4F64C
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 17:18:51 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id q142so1320536iod.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 17:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGjf4m+z8VLv96itNVJOvkxO2bjdazwhjFdsDMTWA4k=;
        b=b7X1PDwIHi4vLETogYLVomhE5cORrmJwMBi0/Vo0RRDUfBQPcTKE98mLeyF77BtQQe
         iO6W+BtVVprtLo2jQ8IxgWYkyGPwkfSiM1tpnriJZB9WLPw0SedYvEIHnQrnjNojEImV
         4lKvcE97hdpg+ukZBF0w9voOv/GL5iygsF9iI5gyMPYcfgdneR+ho1f0/tZcC2P3orr0
         KUwg9Y4DG5qE0WXMUV8MxCG8vj9b+Nyny3wFNP11GjcT20DqrhOrwVL0CTZW1+TVm/EA
         XVFrxSucJIyyt8V673dFnd6RgihT970DxPOXOjA+LOQz6WpB8/te/xdEQTMFzWQTH46U
         CzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGjf4m+z8VLv96itNVJOvkxO2bjdazwhjFdsDMTWA4k=;
        b=3Ju2dzHrbjQd1m5jc2PqrkZreUx8kseyjjR682UkHDSmfsSO/kvxOTmKcbmgNtvqLj
         nO6Ycf6VWvy3M8ZKuR6vx+qwxXm8DzvGfmwlj8YmE+B94VeaA4z62bo4Y5y5TK2OSZ0+
         pN9tdQvOljTDRsAAyVVkXLaz1l/85/Z+djX8QzlIGMzVTPTk3EdU50T38OaYGbrALLes
         qJjXxazizOtBC+4Te92Sq7mmrxF1JVGJrjUGoU57c5AGaPvz27+Fy55UGC2ik+S3zZ20
         zKoWhCaoYOQ9mutFnvcZO8CEsHyO+d+etzCeI38+ZuJdtlY13m5TV/scNoTG3L/h6SFL
         Lrkw==
X-Gm-Message-State: ACrzQf2gm6ADQSr1uTO0Cskcz9Pafh7vlEKqDdOoXlOeRw9na6EEaVtW
        KSLhquNm4Ok/mFYioArRyuCL5A==
X-Google-Smtp-Source: AMsMyM56yyPvFyqZsNhNV2J8g841/r/Blf8wTpTTO9wd9UpySOpHUHCihO1KAUiinSTkWjDyXjhbHw==
X-Received: by 2002:a05:6638:35a2:b0:375:21c3:f5cf with SMTP id v34-20020a05663835a200b0037521c3f5cfmr3380037jal.229.1667089130772;
        Sat, 29 Oct 2022 17:18:50 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id co20-20020a0566383e1400b00375126ae55fsm1087519jab.58.2022.10.29.17.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 17:18:50 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 8/9] net: ipa: use a bitmap for set-up endpoints
Date:   Sat, 29 Oct 2022 19:18:27 -0500
Message-Id: <20221030001828.754010-9-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030001828.754010-1-elder@linaro.org>
References: <20221030001828.754010-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace the 32-bit unsigned used to track endpoints that have
completed setup with a Linux bitmap, to allow an arbitrary number
of endpoints to be represented.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa.h          |  4 ++--
 drivers/net/ipa/ipa_endpoint.c | 24 +++++++++++-------------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
index 557101c2d5838..f14d1bd34e7e5 100644
--- a/drivers/net/ipa/ipa.h
+++ b/drivers/net/ipa/ipa.h
@@ -66,7 +66,7 @@ struct ipa_interrupt;
  * @defined:		Bitmap of endpoints defined in config data
  * @available:		Bitmap of endpoints supported by hardware
  * @filtered:		Bitmap of endpoints that support filtering
- * @set_up:		Bit mask indicating endpoints set up
+ * @set_up:		Bitmap of endpoints that are set up for use
  * @enabled:		Bit mask indicating endpoints enabled
  * @modem_tx_count:	Number of defined modem TX endoints
  * @endpoint:		Array of endpoint information
@@ -124,7 +124,7 @@ struct ipa {
 	unsigned long *defined;		/* Defined in configuration data */
 	unsigned long *available;	/* Supported by hardware */
 	u64 filtered;			/* Support filtering (AP and modem) */
-	u32 set_up;
+	unsigned long *set_up;
 	u32 enabled;
 
 	u32 modem_tx_count;
diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 923299cc46fe5..564a209f75a0f 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1802,12 +1802,12 @@ static void ipa_endpoint_setup_one(struct ipa_endpoint *endpoint)
 
 	ipa_endpoint_program(endpoint);
 
-	endpoint->ipa->set_up |= BIT(endpoint->endpoint_id);
+	__set_bit(endpoint->endpoint_id, endpoint->ipa->set_up);
 }
 
 static void ipa_endpoint_teardown_one(struct ipa_endpoint *endpoint)
 {
-	endpoint->ipa->set_up &= ~BIT(endpoint->endpoint_id);
+	__clear_bit(endpoint->endpoint_id, endpoint->ipa->set_up);
 
 	if (!endpoint->toward_ipa)
 		cancel_delayed_work_sync(&endpoint->replenish_work);
@@ -1819,23 +1819,16 @@ void ipa_endpoint_setup(struct ipa *ipa)
 {
 	u32 endpoint_id;
 
-	ipa->set_up = 0;
 	for_each_set_bit(endpoint_id, ipa->defined, ipa->endpoint_count)
 		ipa_endpoint_setup_one(&ipa->endpoint[endpoint_id]);
 }
 
 void ipa_endpoint_teardown(struct ipa *ipa)
 {
-	u32 set_up = ipa->set_up;
-
-	while (set_up) {
-		u32 endpoint_id = __fls(set_up);
-
-		set_up ^= BIT(endpoint_id);
+	u32 endpoint_id;
 
+	for_each_set_bit(endpoint_id, ipa->set_up, ipa->endpoint_count)
 		ipa_endpoint_teardown_one(&ipa->endpoint[endpoint_id]);
-	}
-	ipa->set_up = 0;
 }
 
 int ipa_endpoint_config(struct ipa *ipa)
@@ -1977,7 +1970,9 @@ void ipa_endpoint_exit(struct ipa *ipa)
 	for_each_set_bit(endpoint_id, ipa->defined, ipa->endpoint_count)
 		ipa_endpoint_exit_one(&ipa->endpoint[endpoint_id]);
 
+	bitmap_free(ipa->set_up);
 	bitmap_free(ipa->defined);
+	ipa->set_up = NULL;
 	ipa->defined = NULL;
 
 	memset(ipa->name_map, 0, sizeof(ipa->name_map));
@@ -2001,8 +1996,11 @@ int ipa_endpoint_init(struct ipa *ipa, u32 count,
 
 	/* Set up the defined endpoint bitmap */
 	ipa->defined = bitmap_zalloc(ipa->endpoint_count, GFP_KERNEL);
-	if (!ipa->defined) {
-		dev_err(dev, "unable to allocate defined endpoint bitmap\n");
+	ipa->set_up = bitmap_zalloc(ipa->endpoint_count, GFP_KERNEL);
+	if (!ipa->defined || !ipa->set_up) {
+		dev_err(dev, "unable to allocate endpoint bitmaps\n");
+		bitmap_free(ipa->defined);
+		ipa->defined = NULL;
 		return -ENOMEM;
 	}
 
-- 
2.34.1

