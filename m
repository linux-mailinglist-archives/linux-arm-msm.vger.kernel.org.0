Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD455A213D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 08:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243685AbiHZG4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 02:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239054AbiHZG4e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 02:56:34 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C0FD21C4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 23:56:32 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 145so378236pfw.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 23:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=UnLcczHHvwGYAXvgM/40CcIoX6vGDJJQPGBGsmiKVWg=;
        b=CVBEV9H+l5dg4mJq+PF9bB7HmM69WekRsNI7sTjerDHLtdc49qoctvx3IeJGjwGzw2
         Pjg6S9sPMIQUB58XfjpNlf8hP4nNklwPHvRdBA3jm4Qkis0ImpfSfEGbPYsTYFDRx9js
         iFotn7YSPTevT6CJ72ejrnAjyAaFeynOx5RIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=UnLcczHHvwGYAXvgM/40CcIoX6vGDJJQPGBGsmiKVWg=;
        b=qAJY+cnb1evgOIP1NMo97mI4ppQPgktuYTUydjHPKh1J2xyLkUCfz4Pv/DuFsZxbUP
         XHm02OG39n7trncQh3WFAsBJBwtksoVTjHOrPg3wGtAGF50B1K+2Rzih9MHfGQU2vxOX
         0lFPa9e9k6IoJ49rF4JDtYKrzAtmyqAx572tZK852+bulUzuCBB9nPakVCw30oe7poVa
         GzImN+EE8h6fYHZM2I1AeSRpKfPkSHrK3aMxqHNpn4s4omvoKwPP3cAZxzztT/649dR/
         2a/OAMvsQ6Qwn4iMaKgc44ty39CPDa3PZXQyTQUSNirHAUUKYcMLm7wQ76Nzucie+sTS
         Ju1g==
X-Gm-Message-State: ACgBeo3r2ogHHj/yYOptUtr/8rz/ODta7fZZwWChYGsrnGSTwBoxNhQn
        QVN1pRs0Lyhqk91EZtuDLkbD3g==
X-Google-Smtp-Source: AA6agR7s9JoNJYMNtSlhqZL4v1UgLd6seI0FVQAjQpS3GdgSNoTFS9i/iseMH+t8FZCnmJfnT7Cq2Q==
X-Received: by 2002:a63:68c2:0:b0:421:9e8f:35c4 with SMTP id d185-20020a6368c2000000b004219e8f35c4mr2153619pgc.363.1661496992364;
        Thu, 25 Aug 2022 23:56:32 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902db0800b0016f1319d2aasm747329plx.171.2022.08.25.23.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:56:31 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v4] arm64: dts: qcom: sc7280: Fix Dmic no sound on villager-r1
Date:   Fri, 26 Aug 2022 06:56:21 +0000
Message-Id: <20220826065621.2255795-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the DMIC no sound issue of villager-r1 by using "PP1800_L2C" as the
DMIC power source to match the hardware schematic.

This patch:
   1. set vdd-micb-supply to PP1800_L2C as the MIC Bias voltage regulator.
   2. In audio-routing, set VA DMIC01~VA DMIC03 to use the vdd-micb-supply
      setting.

Co-developed-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
Changes since V3:
  -- Update the commit message and fix extra blank line.
Changes since V2:
  -- Update the commit message.
Changes since V1:
  -- Update the commit message.

This patch depends on:
arm64: dts: qcom: sc7280: Add herobrine-villager-r1. [1]

[1] https://patchwork.kernel.org/patch/12929106

.../dts/qcom/sc7280-herobrine-villager-r1.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
index c03b3ae4de50..fd202a8f6a33 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
@@ -12,3 +12,30 @@ / {
 	model = "Google Villager (rev1+)";
 	compatible = "google,villager", "qcom,sc7280";
 };
+
+&lpass_va_macro {
+	vdd-micb-supply = <&pp1800_l2c>;
+};
+
+&sound {
+	audio-routing =
+			"IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC1", "MIC BIAS1",
+			"AMIC2", "MIC BIAS2",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb",
+			"TX SWR_ADC0", "ADC1_OUTPUT",
+			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_ADC2", "ADC3_OUTPUT",
+			"TX SWR_DMIC0", "DMIC1_OUTPUT",
+			"TX SWR_DMIC1", "DMIC2_OUTPUT",
+			"TX SWR_DMIC2", "DMIC3_OUTPUT",
+			"TX SWR_DMIC3", "DMIC4_OUTPUT",
+			"TX SWR_DMIC4", "DMIC5_OUTPUT",
+			"TX SWR_DMIC5", "DMIC6_OUTPUT",
+			"TX SWR_DMIC6", "DMIC7_OUTPUT",
+			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+};
-- 
2.37.2.672.g94769d06f0-goog

