Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668C34C582C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 21:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiBZUvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 15:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiBZUvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 15:51:17 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9892668E5
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:42 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j15so15056157lfe.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gQA4GH1Z+azqMfPO7LkvbFbqC2W7I0+yeJzjbt7tPBg=;
        b=hwUD4Oh5QslDM8dDOaIBQdxGBjhz0qmYBmvVqSWeB+XYKVHeyXdqLbapAKQ/6svlAz
         zD8n61ojhKwIRemvHDg3o/G4mTtw9iVHt1zsU/w8BFqfLKG5/povIzfrJsafXtThZI2Q
         c2sW576aYSgM9LCS2QkOkscONy/88s5zVO8Yr42OW96ERKoGjNK5iQ6O4AWUd/k+muuZ
         FfMcf3DFwFphE4YUsrazUCKIny9mmv81waVTdc5CngIosF6F+guIOAAuwe4eVlozpBLb
         5iuLnIA+DXgmcjMR672tFjHnzUhAO1H+Smupyp3IlSsHUJusWYms/tvIf7Y5uMy6bzIv
         0WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gQA4GH1Z+azqMfPO7LkvbFbqC2W7I0+yeJzjbt7tPBg=;
        b=Ksij3Vx+kqi5832gJZ1ZluBqH3YLyTHS5g7IUtwOUOB3PlAq05f5rBYjfL0oxaAF4L
         keGDwTrTr5t89Q7np+yG2SavZ9BfbEkMaehXaPu7h37Orh4nLlsYPKf1VovdGqFmqmx4
         9IO7p7+tWTS02v+S7V9TJpa2V24Wd4kVoTxlHV2g5eyNDOsA6LUig14yBio4NYlabB5N
         zS5bhOIOnI5y1i3YuURzev8G7ZO0QjRQNWqFzN1BSvrpXtDciaeg9BHXtAH7BR6eH7Rt
         ruz/L6j0zPjTRLIX7zJ0r1/G0GUZFIwjruGP3mcxAxHmBbVnlEwC5hZF2b+vTlkz+x3Q
         MCGQ==
X-Gm-Message-State: AOAM532VaIWHp+nTjrCVbA/1qTmRD99Vk4fPrCPXpNt9zT5GAOyBd3XA
        hq+YNuqeI0CsB20YFmKizdWmEA==
X-Google-Smtp-Source: ABdhPJyon5+KMKU+Y2OMUMkIoy6AYTU+bsbGu9xNOWIO6WHWa5ER+9SAZ5hEQEZUtGP8ZYG91NfeOw==
X-Received: by 2002:ac2:4c56:0:b0:443:efbe:4349 with SMTP id o22-20020ac24c56000000b00443efbe4349mr8517738lfk.77.1645908640501;
        Sat, 26 Feb 2022 12:50:40 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004433bbaa3fdsm527162lfp.174.2022.02.26.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:50:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: pmr735a: stop depending on thermal_zones label
Date:   Sat, 26 Feb 2022 23:50:33 +0300
Message-Id: <20220226205035.1826360-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
References: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
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

Most of SoC device trees do not provide the thermal_zones label. Thus
stop depending on it and use the full path to the thermal zones nodes.

Fixes: 7a3544e5d4e8 ("arm64: dts: qcom: pmr735a: Add temp-alarm support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmr735a.dtsi | 32 ++++++++++++++-------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
index b4b6ba24f845..febda50779f9 100644
--- a/arch/arm64/boot/dts/qcom/pmr735a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
@@ -32,23 +32,25 @@ pmr735a_gpios: gpio@8800 {
 	};
 };
 
-&thermal_zones {
-	pmr735a_thermal: pmr735a-thermal {
-		polling-delay-passive = <100>;
-		polling-delay = <0>;
-		thermal-sensors = <&pmr735a_temp_alarm>;
+/ {
+	thermal-zones {
+		pmr735a_thermal: pmr735a-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmr735a_temp_alarm>;
 
-		trips {
-			pmr735a_trip0: trip0 {
-				temperature = <95000>;
-				hysteresis = <0>;
-				type = "passive";
-			};
+			trips {
+				pmr735a_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
 
-			pmr735a_crit: pmr735a-crit {
-				temperature = <115000>;
-				hysteresis = <0>;
-				type = "critical";
+				pmr735a_crit: pmr735a-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
 			};
 		};
 	};
-- 
2.30.2

