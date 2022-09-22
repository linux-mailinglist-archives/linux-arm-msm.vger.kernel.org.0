Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F46E5E6F9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 00:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiIVWVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 18:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiIVWVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 18:21:22 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7FE10F718
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:13 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id a2so1921246iln.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=NCabapcdQgwE6CLB04s1D40oIHNART3RkqR4ORWuTYM=;
        b=C8QtmTTq1lEIw3FbtAgMnhpXm0pRbKb7lcax9DgywqyyxX0nASCiYorzNfHgQJUiuZ
         2dMSNnCwtHkqwujNlTLUp3LEvbv2qySgOn6Sm26jzUtyVV11sP3oVAMoDVqb9hT9j8yX
         aD8v6Q4UoF6NGf2xF6a1df1xts7UDIC5nSRFaFZhjLWhtKMGFT4A51GaxVn7/G16HbWu
         ASDNAUNcBVvPXtnuaD6Q7ZGNWzTZ/O1ggBI+Au0IEAd07ChikhUC+Qyx3dHzXTklV9AR
         zngBVtJrcPFIW8MmSdvq821KRVE8qK84RxtZ4yA+zgd8qgHF5i14Z74SExSdPN+soECk
         y/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NCabapcdQgwE6CLB04s1D40oIHNART3RkqR4ORWuTYM=;
        b=E5EcnhaWBYeGrDmVnFBn5BZiuw0TL+KJALqPA61AAJcKGYpGYOHpcPt4boPhnkfFej
         KismjA3aukyssfKOZNe6zTFPjBf6tYRwifl8nFwwK1e9m5x1d/a/UUTE/bSrYcvTfc67
         KKaf163vm2U1H0ZjVnI0ucBWfcPdiOsIyDXI2pGK9b2Y6F3diXPfjYnjhtIZEHfWvs8T
         ZZuZCQq4JTU+rbXlR6eMVOZGJmNy4BG7BsClLBxlLWN4jtqcnoLmNGAiE09+5lvVAmAo
         7CdILQtfJaiocH3BzB3ngeu4Lc5vrwIepNycn7UspQ1BfB2ws9qBiCBZuPBrkBdYS+Yx
         izSA==
X-Gm-Message-State: ACrzQf1P6LUIpBI1CsQQlWGVvmXRGSn3abXdRBEdcZ263TsdCkeZdE0X
        A+h2A0eRf9BvhwSTzhPjlMWqGg==
X-Google-Smtp-Source: AMsMyM6kwM8gczzmLCpPGAjI0qa1oHtSBDZwPWfpvUUaIIduK03l3xrAUgbsx6huiePa3/M5JtzykA==
X-Received: by 2002:a05:6e02:78a:b0:2f6:9f8b:e70c with SMTP id q10-20020a056e02078a00b002f69f8be70cmr2728962ils.111.1663885272288;
        Thu, 22 Sep 2022 15:21:12 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id g12-20020a92d7cc000000b002f592936fbfsm2483332ilq.41.2022.09.22.15.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 15:21:11 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 7/8] net: ipa: encapsulate updating the COUNTER_CFG register
Date:   Thu, 22 Sep 2022 17:20:59 -0500
Message-Id: <20220922222100.2543621-8-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922222100.2543621-1-elder@linaro.org>
References: <20220922222100.2543621-1-elder@linaro.org>
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

Create a new function that encapsulates setting the counter
configuration register value for versions prior to IPA v4.5.
Create another small function to represent configuring hardware
timing regardless of version.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index cca270d2d9a68..8bb4b036df2b4 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -306,6 +306,27 @@ static void ipa_qtime_config(struct ipa *ipa)
 	iowrite32(val, ipa->reg_virt + IPA_REG_TIMERS_XO_CLK_DIV_CFG_OFFSET);
 }
 
+/* Before IPA v4.5 timing is controlled by a counter register */
+static void ipa_hardware_config_counter(struct ipa *ipa)
+{
+	u32 granularity;
+	u32 val;
+
+	granularity = ipa_aggr_granularity_val(IPA_AGGR_GRANULARITY);
+
+	val = u32_encode_bits(granularity, AGGR_GRANULARITY_FMASK);
+
+	iowrite32(val, ipa->reg_virt + IPA_REG_COUNTER_CFG_OFFSET);
+}
+
+static void ipa_hardware_config_timing(struct ipa *ipa)
+{
+	if (ipa->version < IPA_VERSION_4_5)
+		ipa_hardware_config_counter(ipa);
+	else
+		ipa_qtime_config(ipa);
+}
+
 static void ipa_hardware_config_hashing(struct ipa *ipa)
 {
 	u32 offset;
@@ -362,7 +383,6 @@ static void ipa_hardware_dcd_deconfig(struct ipa *ipa)
 static void ipa_hardware_config(struct ipa *ipa, const struct ipa_data *data)
 {
 	enum ipa_version version = ipa->version;
-	u32 granularity;
 	u32 val;
 
 	/* IPA v4.5+ has no backward compatibility register */
@@ -389,19 +409,8 @@ static void ipa_hardware_config(struct ipa *ipa, const struct ipa_data *data)
 		iowrite32(val, ipa->reg_virt + IPA_REG_CLKON_CFG_OFFSET);
 
 	ipa_hardware_config_comp(ipa);
-
-	/* Configure system bus limits */
 	ipa_hardware_config_qsb(ipa, data);
-
-	if (version < IPA_VERSION_4_5) {
-		/* Configure aggregation timer granularity */
-		granularity = ipa_aggr_granularity_val(IPA_AGGR_GRANULARITY);
-		val = u32_encode_bits(granularity, AGGR_GRANULARITY_FMASK);
-		iowrite32(val, ipa->reg_virt + IPA_REG_COUNTER_CFG_OFFSET);
-	} else {
-		ipa_qtime_config(ipa);
-	}
-
+	ipa_hardware_config_timing(ipa);
 	ipa_hardware_config_hashing(ipa);
 	ipa_hardware_dcd_config(ipa);
 }
-- 
2.34.1

