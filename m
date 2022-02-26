Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79384C582A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 21:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiBZUvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 15:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiBZUvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 15:51:16 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642EC261D3D
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:41 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j15so15056138lfe.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lfQnvVbFnRT7eimkarqJQ8hVcsrxx9J9cGgDkN62cmM=;
        b=uWUtYRWsgMgb+yVtou0c5UVgl7UqX02e68cNKPHvWSqieX3hDlJ9lz1oZzF52myq3Y
         JQABLzXNjfb9PoYlUWfTCi7sNGrf6Qi4I5YZ2THQJhb1dFV/gi2uksxsa22n0B4yokcB
         LntOaip20nPqPrZAmyaf25fd4BIYM/etR8poXfvPVVnPupYMFPmK3TH7e6Nuk6wSJAZe
         Q/LJ5W6oueUVMRPvu2f2ksvS2hPdWnNHm5XYhWkuOToiYGVUoIxwEjjM/E8pVkZFWNHZ
         RqmWotlORqEgXLmBLBKQiCOikx7zT0ZFimxwKLSZmjeS3id4Z9/y45kAVGctbHCsCtjV
         Nsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lfQnvVbFnRT7eimkarqJQ8hVcsrxx9J9cGgDkN62cmM=;
        b=lKQT95LZMmJrFJoNBRRF5aCdqol2D/rFJY1BG3QtCAfrF++4DxbZJ8J1qTX6EzCHVF
         Y/9y0hSvsdQUjwugTPs42oGODAY2bLOwG3i7hVXqjjAC2g9qC7ZpMlmWVTftHg30x7JI
         GXdOCmHOjR3OnChaz1NQx1TEkAWpDx6gA0dK3Gqgjfw1CaqGHgUH9YnuyWAh4RAOTaAe
         lLpBKloO8Hg9uPokK5KsOuPmVtaLzy5yTPmCgi7QoVO/8r2yiEYLg+szWJ1LfRA9LPWw
         9ejPDRTKZedaNb2waahaRc6sWKsilQkTlUwpidOZnVkiD+PxzrfVppOY/DxUuD50MzE3
         k3DQ==
X-Gm-Message-State: AOAM533g1gi9PEgpmjzfVL0r7ygdIoj4pBVmqbtnA/9V1NO/tJo0ZlKV
        57enXyW9t+cmji6Tnp3EFu9Euw==
X-Google-Smtp-Source: ABdhPJwJ5Qr0WdSPVKETLgcEfs9PsPYSxeYxNOqRSFkHfyd0S54W2xy3SEIL8w0bmEpN6bSKMPKJEw==
X-Received: by 2002:a05:6512:1194:b0:43e:8e84:4eca with SMTP id g20-20020a056512119400b0043e8e844ecamr8445765lfr.611.1645908639779;
        Sat, 26 Feb 2022 12:50:39 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004433bbaa3fdsm527162lfp.174.2022.02.26.12.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:50:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: qcom: pm8350c: stop depending on thermal_zones label
Date:   Sat, 26 Feb 2022 23:50:32 +0300
Message-Id: <20220226205035.1826360-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
References: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most of SoC device trees do not provide the thermal_zones label. Thus
stop depending on it and use the full path to the thermal zones nodes.

Fixes: 3795fe7d497b ("arm64: dts: qcom: pm8350c: Add temp-alarm support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 32 ++++++++++++++-------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index e1b75ae0a823..9bc6464477bd 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -32,23 +32,25 @@ pm8350c_gpios: gpio@8800 {
 	};
 };
 
-&thermal_zones {
-	pm8350c_thermal: pm8350c-thermal {
-		polling-delay-passive = <100>;
-		polling-delay = <0>;
-		thermal-sensors = <&pm8350c_temp_alarm>;
+/ {
+	thermal-zones {
+		pm8350c_thermal: pm8350c-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8350c_temp_alarm>;
 
-		trips {
-			pm8350c_trip0: trip0 {
-				temperature = <95000>;
-				hysteresis = <0>;
-				type = "passive";
-			};
+			trips {
+				pm8350c_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
 
-			pm8350c_crit: pm8350c-crit {
-				temperature = <115000>;
-				hysteresis = <0>;
-				type = "critical";
+				pm8350c_crit: pm8350c-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
 			};
 		};
 	};
-- 
2.30.2

