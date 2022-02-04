Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44134AA07D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 20:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbiBDTvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 14:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbiBDTvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 14:51:00 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B70C06174E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 11:50:53 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id q204so8702738iod.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 11:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5LJv5iPo5cfeDn7N9X9RNaWuiPsLPljE4VKtBlutQww=;
        b=EIiV10YUOa0iymNyqqOQm9wimg/uokoVQ8nT6jny2j+KxImXvD8GNpCFnT0VGUGHcM
         5yQ0bBj8XCV8YXz4HMf42uUrL+k3FOFll1rXFZ4YdGikX2Y8W1g4tlocwjWu6jicXu3z
         TuXgW0AhLwRYV3XVJxjunk18tywwyRvw0BcRN6KGnXqbIssyOLU2BGp1iGM2SOz1OTQP
         zRTSEKsNcFBpwTwEQ6h1dTjfmAHPe3BjZhW5RQWDDDMjYekVq1fE/0CR8oxDIUbNh0ZN
         vi+VA9nptc5uk5hxU3c+4Hwyy3C/o1eDE0Hkoe3GoVf2Up/tqHjx75KV+GubAAcOcxYT
         fn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5LJv5iPo5cfeDn7N9X9RNaWuiPsLPljE4VKtBlutQww=;
        b=b6GoNuGCOM2E+zswz5VSa2M5DExQHoK3wnVU83mM1KKTgXnX3pt7JDrtsc00t0lvdl
         gj1SzSf/sxBehaWufzdyFbaewRn1dAnbb7xGGhNBDUhLozxqkNd7pTstmXs/ep0Oqw29
         YUTuYlUGdWqu7JeW5wMw/RV++db67KtUQuuBt1s66tJCHsgKyWXP+QvCsLZIearAJRAT
         I0KNKOQA6lNz8U1TzQZ9nkREh/4d3jwB02D3EhpKQ4oyrn6dI7twHnzootEFhz8On91r
         VWOMhBinWC/zZXVxKz0ZEYCuTlSa2XjSiX2Pg8JZEbCrACA9C1Kz6fdt/M+G20+FjUMU
         AAeg==
X-Gm-Message-State: AOAM531T/y9Ee6kAGYVLimzpZ1NYLZnrvSy5BgGPK1Q3uckMXa7sjwjd
        bodCqtRcjHXdESfn1u5/28oFOA==
X-Google-Smtp-Source: ABdhPJxrBfbDH5oX3YphnJkdAxIm9RlX5nAnVNUMssOtRR5pjt51YC9wTVHO3xlCUZuEfVfyxbt+pw==
X-Received: by 2002:a6b:ef06:: with SMTP id k6mr332289ioh.70.1644004253239;
        Fri, 04 Feb 2022 11:50:53 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id k13sm1417564ili.22.2022.02.04.11.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 11:50:52 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     djakov@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/7] net: ipa: use interconnect bulk enable/disable operations
Date:   Fri,  4 Feb 2022 13:50:40 -0600
Message-Id: <20220204195044.1082026-4-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220204195044.1082026-1-elder@linaro.org>
References: <20220204195044.1082026-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The power interconnect array is now an array of icc_bulk_data
structures, which is what the interconnect bulk enable and disable
functions require.

Get rid of ipa_interconnect_enable() and ipa_interconnect_disable(),
and just call icc_bulk_enable() and icc_bulk_disable() instead.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 76 +++++++------------------------------
 1 file changed, 13 insertions(+), 63 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index ec2ebc74edb8b..67f76e6a6ae59 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -156,86 +156,34 @@ static void ipa_interconnect_exit(struct ipa_power *power)
 	power->interconnect = NULL;
 }
 
-/* Currently we only use one bandwidth level, so just "enable" interconnects */
-static int ipa_interconnect_enable(struct ipa *ipa)
-{
-	struct icc_bulk_data *interconnect;
-	struct ipa_power *power = ipa->power;
-	int ret;
-	u32 i;
-
-	interconnect = power->interconnect;
-	for (i = 0; i < power->interconnect_count; i++) {
-		ret = icc_enable(interconnect->path);
-		if (ret) {
-			dev_err(&ipa->pdev->dev,
-				"error %d enabling %s interconnect\n",
-				ret, interconnect->name);
-			goto out_unwind;
-		}
-		interconnect++;
-	}
-
-	return 0;
-
-out_unwind:
-	while (interconnect-- > power->interconnect)
-		(void)icc_disable(interconnect->path);
-
-	return ret;
-}
-
-/* To disable an interconnect, we just its bandwidth to 0 */
-static int ipa_interconnect_disable(struct ipa *ipa)
-{
-	struct ipa_power *power = ipa->power;
-	struct device *dev = &ipa->pdev->dev;
-	struct icc_bulk_data *interconnect;
-	int result = 0;
-	u32 count;
-	int ret;
-
-	count = power->interconnect_count;
-	interconnect = power->interconnect + count;
-	while (count--) {
-		interconnect--;
-		ret = icc_disable(interconnect->path);
-		if (ret) {
-			dev_err(dev, "error %d disabling %s interconnect\n",
-				ret, interconnect->name);
-			/* Try to disable all; record only the first error */
-			if (!result)
-				result = ret;
-		}
-	}
-
-	return result;
-}
-
 /* Enable IPA power, enabling interconnects and the core clock */
 static int ipa_power_enable(struct ipa *ipa)
 {
+	struct ipa_power *power = ipa->power;
 	int ret;
 
-	ret = ipa_interconnect_enable(ipa);
+	ret = icc_bulk_enable(power->interconnect_count, power->interconnect);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(ipa->power->core);
+	ret = clk_prepare_enable(power->core);
 	if (ret) {
 		dev_err(&ipa->pdev->dev, "error %d enabling core clock\n", ret);
-		(void)ipa_interconnect_disable(ipa);
+		icc_bulk_disable(power->interconnect_count,
+				 power->interconnect);
 	}
 
 	return ret;
 }
 
 /* Inverse of ipa_power_enable() */
-static int ipa_power_disable(struct ipa *ipa)
+static void ipa_power_disable(struct ipa *ipa)
 {
-	clk_disable_unprepare(ipa->power->core);
+	struct ipa_power *power = ipa->power;
 
-	return ipa_interconnect_disable(ipa);
+	clk_disable_unprepare(power->core);
+
+	icc_bulk_disable(power->interconnect_count, power->interconnect);
 }
 
 static int ipa_runtime_suspend(struct device *dev)
@@ -249,7 +197,9 @@ static int ipa_runtime_suspend(struct device *dev)
 		gsi_suspend(&ipa->gsi);
 	}
 
-	return ipa_power_disable(ipa);
+	ipa_power_disable(ipa);
+
+	return 0;
 }
 
 static int ipa_runtime_resume(struct device *dev)
-- 
2.32.0

