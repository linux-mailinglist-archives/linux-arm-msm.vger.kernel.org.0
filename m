Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF9F53B984
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 15:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235269AbiFBNPk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 09:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbiFBNPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 09:15:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE71F507E
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 06:15:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id be31so7751173lfb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LolDsnGW3SOAD2FkVFrJJhEfXZjmRip7OxOTM4BASTg=;
        b=HluOWAOZ2Qe9d1dOy5co+ZzsLWO+WnAfLDWH1EP1dRlKH20Pmt52sQIQ7Xu4uP7EPQ
         VH5hdHOD7uu20Mv3Tlm00UNafeXaBT7Lf7KmLDU7kDAYd8gl3T8hBLcP+13KkktmmWKH
         5Wr3Fv/2W0EoT6kYItIVVjlx8U4pf6RNhTlu72Qtim5WX6XgarhRiTZh0H6nEPFTGGjq
         T2k5JJxDXUJhADReTRJ03NR7ejgqaZcpxRsuegBq98mFzbIKIiCQsyKeDZrUT+1C2kVk
         ZMDitfStsOyiHtbCI0eUVQY1iW+Epwcl7gUfdp9iO39+k3QyVmMLU51OAPXdxq1FYQ7x
         d+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LolDsnGW3SOAD2FkVFrJJhEfXZjmRip7OxOTM4BASTg=;
        b=1A2T3BlvbDLZFcXc5UNItUez2q/HFD5R3odlTL5HI5s/fxCcioabypBbUanL8FIDrn
         BHVX/k3+unSsGmKe0WjByv1IlSwQaMGwZmJDvMVEfjUjncxWiqc1GVum34XnpoUG6cwf
         8onc61wBj1aQx7LNGE/S5lw9vSbAjOjTIdY+Mz5iwQQBYpJDt3BYPtAUfT6mpUjZfkEJ
         sFG1kRI0HZbVvoi21ZR3W4TFoKPjTbxaSS+L8bJKPHs/bRDcdHDLnCLekQ57nNqpvNBQ
         To+4ttAvgB+fSKDn1CcDurWJsb0PaPNqDYkxJfCRPydn1xAFILoVBE1tb3/T2nKqvNbc
         tlwA==
X-Gm-Message-State: AOAM530rswuwvcO0WHaKwlcDxJr5KE3Q4J/0m2HvWUVHb/D0tNIzcpkk
        IKEy7y0Iizd/u9Gj+5YKq32YYg==
X-Google-Smtp-Source: ABdhPJwUl3solzkyamaoY2KgiqJvNb6IBgAizzaqXx7uraVT9ueURv8yJ2c/xWTl1+MPRWPe+LgZ0A==
X-Received: by 2002:a05:6512:2593:b0:478:6327:3672 with SMTP id bf19-20020a056512259300b0047863273672mr40706999lfb.497.1654175735188;
        Thu, 02 Jun 2022 06:15:35 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id m1-20020a056512014100b0047255d211bbsm1019603lfo.234.2022.06.02.06.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:15:34 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] i2c: qcom-cci: simplify access to bus data structure
Date:   Thu,  2 Jun 2022 16:15:28 +0300
Message-Id: <20220602131528.2246339-1-vladimir.zapolskiy@linaro.org>
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
 drivers/i2c/busses/i2c-qcom-cci.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 8d078bdb5c1b..c4a4a4b54131 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -541,6 +541,7 @@ static int cci_probe(struct platform_device *pdev)
 		return -ENOENT;
 
 	for_each_available_child_of_node(dev->of_node, child) {
+		struct cci_master *master;
 		u32 idx;
 
 		ret = of_property_read_u32(child, "reg", &idx);
@@ -555,27 +556,28 @@ static int cci_probe(struct platform_device *pdev)
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
+		snprintf(master->adap.name, sizeof(master->adap.name),
+			 "Qualcomm-CCI");
 
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

