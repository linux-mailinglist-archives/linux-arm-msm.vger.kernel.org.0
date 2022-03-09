Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BF54D3A0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 20:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237792AbiCITWI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 14:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237675AbiCITVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 14:21:54 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E88111DD9
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 11:20:52 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id b9so823213ila.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 11:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d9+lLIbQQk6sLGoYu7PiXuh09aVQl9bHmfYbzTffMYE=;
        b=PvH1Bm5Xg0H+iKcrMwGJUZMAkJfxRho0JZTML7WN3T+a2B+o/72NlVLBihDe9xI5lM
         PEym/ogiP8/EtoEZ+vGL1hpu7TSeuosAVt//S3IuVqzRmKaZH7GVYZTGaaLBFhUVp35E
         umymw4vjP6x/jytdKBRqo7WPwzOPWElbVE8zAfmSel6g9CnnlRwjhkPDbhYfUNlsGwtA
         JRRPGWGUqUXIwr3xclWoTFLqbPt5sZG6D9HAkRSD0oZgacgI3f6Q6uygiH+wbKeRocxk
         TPEI2TMyjW6Ki/VVN3YJ+evLbrlVPFyx/5UXKN2RNCkvilILxXRLG3+S+OtNOvDK9mIC
         mEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d9+lLIbQQk6sLGoYu7PiXuh09aVQl9bHmfYbzTffMYE=;
        b=B47CXguo1fQyT1wMptrp+zMfaWJKFuiHcM/j9VDS8JbvuTVk9MI0k/hgnDgjHr/uD0
         RkCEHbXeJ2XLrbwmiG4eMgfE46jDBIGqTG/X3nfPJRSqpIn5Qfr06bG6xBj5f49fnVIJ
         sSIPrztRoCa24wbotGdmIbOT1+1SpJq7zQ3GUkEwXatkJm8ppwxkmf/JoI/G7iTHvqBr
         CpbruG6P4oB5r8Cut/rpVFRHP+8EJtUvoCdv7tqxCll48OG3lQTWznvXJ0Pscy455jni
         kfv7pHZmgS1uA+yPtbksbNPn4pdXXyd6EEuzF3V/jRzs44xVPVlUbabOQ2yQjrAabuAx
         KG8w==
X-Gm-Message-State: AOAM531wOA1X8xFEK9oDw1cgBx7CEq8P38r/QFrIyx47CUCIPiJmidIs
        mUfe7F0S6czB1wh9QDpVJd+Swg==
X-Google-Smtp-Source: ABdhPJzdL7SZPWLaq005IBf9yCl5EX1HmSFnptZNEyVENvy0K2jaawXqNCrSqY/vTdKBBZ7aJCAcxw==
X-Received: by 2002:a92:2907:0:b0:2c6:16f:79da with SMTP id l7-20020a922907000000b002c6016f79damr754853ilg.160.1646853651644;
        Wed, 09 Mar 2022 11:20:51 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id g8-20020a056602248800b006409fb2cbccsm1389182ioe.32.2022.03.09.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 11:20:51 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     djakov@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 6/7] net: ipa: embed interconnect array in the power structure
Date:   Wed,  9 Mar 2022 13:20:36 -0600
Message-Id: <20220309192037.667879-7-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220309192037.667879-1-elder@linaro.org>
References: <20220309192037.667879-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than allocating the interconnect array dynamically, represent
the interconnects with a variable-length array at the end of the
ipa_power structure.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index b1f6978dddadb..8a564d72799da 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -67,7 +67,7 @@ struct ipa_power {
 	spinlock_t spinlock;	/* used with STOPPED/STARTED power flags */
 	DECLARE_BITMAP(flags, IPA_POWER_FLAG_COUNT);
 	u32 interconnect_count;
-	struct icc_bulk_data *interconnect;
+	struct icc_bulk_data interconnect[];
 };
 
 /* Initialize interconnects required for IPA operation */
@@ -75,17 +75,12 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 				 const struct ipa_interconnect_data *data)
 {
 	struct icc_bulk_data *interconnect;
-	u32 count;
 	int ret;
-
-	count = power->interconnect_count;
-	interconnect = kcalloc(count, sizeof(*interconnect), GFP_KERNEL);
-	if (!interconnect)
-		return -ENOMEM;
-	power->interconnect = interconnect;
+	u32 i;
 
 	/* Initialize our interconnect data array for bulk operations */
-	while (count--) {
+	interconnect = &power->interconnect[0];
+	for (i = 0; i < power->interconnect_count; i++) {
 		/* interconnect->path is filled in by of_icc_bulk_get() */
 		interconnect->name = data->name;
 		interconnect->avg_bw = data->average_bandwidth;
@@ -97,7 +92,7 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 	ret = of_icc_bulk_get(dev, power->interconnect_count,
 			      power->interconnect);
 	if (ret)
-		goto err_free;
+		return ret;
 
 	/* All interconnects are initially disabled */
 	icc_bulk_disable(power->interconnect_count, power->interconnect);
@@ -105,15 +100,7 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 	/* Set the bandwidth values to be used when enabled */
 	ret = icc_bulk_set_bw(power->interconnect_count, power->interconnect);
 	if (ret)
-		goto err_bulk_put;
-
-	return 0;
-
-err_bulk_put:
-	icc_bulk_put(power->interconnect_count, power->interconnect);
-err_free:
-	kfree(power->interconnect);
-	power->interconnect = NULL;
+		icc_bulk_put(power->interconnect_count, power->interconnect);
 
 	return ret;
 }
@@ -122,8 +109,6 @@ static int ipa_interconnect_init(struct ipa_power *power, struct device *dev,
 static void ipa_interconnect_exit(struct ipa_power *power)
 {
 	icc_bulk_put(power->interconnect_count, power->interconnect);
-	kfree(power->interconnect);
-	power->interconnect = NULL;
 }
 
 /* Enable IPA power, enabling interconnects and the core clock */
@@ -372,6 +357,7 @@ ipa_power_init(struct device *dev, const struct ipa_power_data *data)
 {
 	struct ipa_power *power;
 	struct clk *clk;
+	size_t size;
 	int ret;
 
 	clk = clk_get(dev, "core");
@@ -388,7 +374,8 @@ ipa_power_init(struct device *dev, const struct ipa_power_data *data)
 		goto err_clk_put;
 	}
 
-	power = kzalloc(sizeof(*power), GFP_KERNEL);
+	size = data->interconnect_count * sizeof(power->interconnect[0]);
+	power = kzalloc(sizeof(*power) + size, GFP_KERNEL);
 	if (!power) {
 		ret = -ENOMEM;
 		goto err_clk_put;
-- 
2.32.0

