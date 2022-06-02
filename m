Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09F7053BCD9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 18:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbiFBQxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 12:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235749AbiFBQxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 12:53:03 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81CC27D0CD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 09:53:01 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id y15so449789ljc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H5M3DwZTLKLSZXO8NuHUkCEvD3RYtHgGRJTA5pJ1vgU=;
        b=yXImtY6yRPJDFdV6gzkI211512OZhIS+0L4IA9k0lvZRMAUt83OjUOd6Ff2jMRQ9k0
         wAMknlQhMSwoyl0yd7Pn5C+zvLq5MgWerjG4w2EK4vNPVDnPHMpjxbI0C0+aqnKXhiQ9
         uA60SoDvpXgPGoy4XNYIg8mXnRCb8dopstJqIVdsFrRIsgGzZvykJw6cNVC42yuA2Dwn
         KKbcDmoMXHWJ96uxVOX8NnmPdi5pHE5+tygnEmnaOkkHp6jEu2griVcJsUHwgl3tSFBj
         +oE+fngFRY5V/FBN8IKSDybxseq1FJ8q1Olbxz7DEFcCfdgbJovNbItVDtfUdHul6SlP
         t5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H5M3DwZTLKLSZXO8NuHUkCEvD3RYtHgGRJTA5pJ1vgU=;
        b=Y/h+OQEmi2JywAgeHKDHNBF0b6WqKzLGWCaZPrXdaDYotbUFI1lf0xNGi1izapQbEG
         pi/CgwHcMPis6A1QpT5fH21fWeBD/u8bxLSNobPkpZ3kCV1QjCk0lvWWqcwgKFnip3OW
         EpVzb815d/GuRVnqxT5zEsOjirmHdtM74Tl5TlxEWTP17ROgqp4/6HtnxFn1+0ii7b5K
         lZ6zu9JFY+mrsMfaRulD9ZXm8oy/GGjBgXgDp+D8Mheus7jEFxdJHmDdSojJnq8PY1LZ
         6PAXwsDfWA814nsXeVVRcegaRr/vuGbYH67tXhVzOY1Po3l9f18x/huhmgml2ikK7gBJ
         kBMQ==
X-Gm-Message-State: AOAM5332EQsA1pz8sUrufNErt9gM+Q9wN1pYvBrTERmoww5xpL3r/qya
        23m6lgFfrKGeSFMdeJ5TDiTlzg==
X-Google-Smtp-Source: ABdhPJwFxYZTCO1IN+ARldN5Xmyr8X1tlySMel7pxfd2YH5fA5cyjjTx7b9zjOzorotN1aS1cuf7XQ==
X-Received: by 2002:a2e:bd13:0:b0:244:da2f:ff4d with SMTP id n19-20020a2ebd13000000b00244da2fff4dmr43283091ljq.213.1654188780173;
        Thu, 02 Jun 2022 09:53:00 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id t20-20020a19dc14000000b0047255d211d4sm1106868lfg.259.2022.06.02.09.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:59 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] i2c: qcom-cci: simplify access to bus data structure
Date:   Thu,  2 Jun 2022 19:52:58 +0300
Message-Id: <20220602165258.2247056-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

Trivial non-functional change, which adds an alias to an extensively
used data location.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* removed a wrapped line, thanks to review by Loic.

 drivers/i2c/busses/i2c-qcom-cci.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 8d078bdb5c1b..f6a1de575c5a 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -541,6 +541,7 @@ static int cci_probe(struct platform_device *pdev)
 		return -ENOENT;
 
 	for_each_available_child_of_node(dev->of_node, child) {
+		struct cci_master *master;
 		u32 idx;
 
 		ret = of_property_read_u32(child, "reg", &idx);
@@ -555,27 +556,27 @@ static int cci_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		cci->master[idx].adap.quirks = &cci->data->quirks;
-		cci->master[idx].adap.algo = &cci_algo;
-		cci->master[idx].adap.dev.parent = dev;
-		cci->master[idx].adap.dev.of_node = of_node_get(child);
-		cci->master[idx].master = idx;
-		cci->master[idx].cci = cci;
+		master = &cci->master[idx];
+		master->adap.quirks = &cci->data->quirks;
+		master->adap.algo = &cci_algo;
+		master->adap.dev.parent = dev;
+		master->adap.dev.of_node = of_node_get(child);
+		master->master = idx;
+		master->cci = cci;
 
-		i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
-		snprintf(cci->master[idx].adap.name,
-			 sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
+		i2c_set_adapdata(&master->adap, master);
+		snprintf(master->adap.name, sizeof(master->adap.name), "Qualcomm-CCI");
 
-		cci->master[idx].mode = I2C_MODE_STANDARD;
+		master->mode = I2C_MODE_STANDARD;
 		ret = of_property_read_u32(child, "clock-frequency", &val);
 		if (!ret) {
 			if (val == I2C_MAX_FAST_MODE_FREQ)
-				cci->master[idx].mode = I2C_MODE_FAST;
+				master->mode = I2C_MODE_FAST;
 			else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
-				cci->master[idx].mode = I2C_MODE_FAST_PLUS;
+				master->mode = I2C_MODE_FAST_PLUS;
 		}
 
-		init_completion(&cci->master[idx].irq_complete);
+		init_completion(&master->irq_complete);
 	}
 
 	/* Memory */
-- 
2.33.0

