Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD766F6F8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 18:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbjEDQEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 12:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjEDQEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 12:04:34 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC66525C
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 09:04:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac80ed7f26so7275641fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683216271; x=1685808271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUrHKVDX5msA0+ZSoUiJisbFI5PV9IHCkeYy1I4vbUE=;
        b=dcEfCGWZ78S4KLbx2t+LfYLbl16CyrjzfZ2DKdSP3bsme1Txoa370NAXETeAKMXi0F
         vST4RAutiKwXnZz1YSnUxl5sW2bGupAFk1DH9BVDmqGKyhtAzZBURFJsFJ+SUNLtwW8j
         +2t/PExUXhw2wYg67YE+raK3OeAWvBpb3WsrchNf4Wmd11bx4uD8t1rXbXZrJQarIGDN
         2KHJp1LjUIVkW9NCXmbCrF3382yVjBvq4jRoIOPulqyC1tOsUAg8uFkLNDKbQYdhIh2b
         6nOtezg4qd8EM+YZN398RUebehhxhnQTh4B1AVtASZ0emdJ8S8/2WdcRmBMA4qdksWBI
         +y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683216271; x=1685808271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUrHKVDX5msA0+ZSoUiJisbFI5PV9IHCkeYy1I4vbUE=;
        b=C8GyUjWornv0n8L7NnsCdGqlO+wT86tMWioG52zFewDtJdYDU6V/R0dp2HkTSi6gZL
         jlBNQZnGVT8NQq4VeqDk/7MHXObjidDGpiDDZZLa5Gv1FnrJJyk8oUaPyuksxA4jDGBK
         bYkoRNHxgB0j9GgHceszD7/CbtbXvw1gIPolC6W5SOkBlIjjD9ov300kfABuU9XwU81k
         gjGZe07lCyrJZIbI3ovbn9+7dDxA1z4xywxMCwpXHSSKnebhndwvkzdm6+y81UoneG+J
         zL1TzgrlN6Inf7alrhwxsy9kwvfJTGb85jMs1+hBm3dLXdo6pmfolNuJi1GgL0myTg7i
         p0ew==
X-Gm-Message-State: AC+VfDx4tqb3I3WZGRuzB8fHEVGB5T6dO26EiKWml0irJutxae8V8Zb1
        v+McYXovEjUmGFwM06E6jYxbCfcRy3NZ2oToaBs=
X-Google-Smtp-Source: ACHHUZ4YVyJizo+z8okjSZYqFXP/T+RhY33v3Hmx+pmDhMMwP2W1e98wCI6+uArYkNwAnaeYzRYRow==
X-Received: by 2002:ac2:44ab:0:b0:4f0:219f:7833 with SMTP id c11-20020ac244ab000000b004f0219f7833mr1960192lfm.55.1683216271332;
        Thu, 04 May 2023 09:04:31 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p16-20020a05651211f000b004edc5a39121sm6551583lfs.242.2023.05.04.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 09:04:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH] arm64: dts: qcom: enable dual ("bonded") DSI mode for DB845c
Date:   Thu,  4 May 2023 19:04:30 +0300
Message-Id: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as both lt9611 and drm/msm drivers were updated to handle the 4k
modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
utilizes both DSI links and thus can support 4k on the HDMI output.

Cc: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index e14fe9bbb386..4dea2c04b22f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -419,6 +419,9 @@ &dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l26a_1p2>;
 
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
 	ports {
 		port@1 {
 			endpoint {
@@ -434,6 +437,31 @@ &dsi0_phy {
 	vdds-supply = <&vreg_l1a_0p875>;
 };
 
+&dsi1 {
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_b>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi1_phy {
+	vdds-supply = <&vreg_l1a_0p875>;
+	status = "okay";
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -493,6 +521,14 @@ lt9611_a: endpoint {
 				};
 			};
 
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
 			port@2 {
 				reg = <2>;
 
-- 
2.39.2

