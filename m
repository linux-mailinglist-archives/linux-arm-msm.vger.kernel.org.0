Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5D97B2D08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 09:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbjI2Hbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 03:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjI2Hbt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 03:31:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93EA1AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 00:31:45 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53636f98538so2177805a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 00:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695972704; x=1696577504; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rV15ONO1jUP4uYwgWL2R1qvHOr8y3WbaAo1W8izGcdQ=;
        b=laGBfAL7WcgPorwVnTglqRU0w/mRB9oS2KN7F3zEx79TaDhf8XViEOMHYeANrsxIlp
         tq8N2zuql5jIfCNxtp2uIYaakbV6MsFuajZkRkHz8whhtSHQIDjuxKBf+z657fw1Xp8W
         ZRTdiLDAAM3afa4nMdDIIoK2FTYFmEx3TwkiHNZ8Z9dEmXizof/bIyu+V/DXlcpeC3Zv
         pk15R78kZJBS6uMFTKMqKJ0uh8NZI0z4rKPRi+sS3DGYq3Efotd6n0P/ZBd4cjOfWEcX
         jDXcoF3p5kbHZXoIJsPHta9mDIhodZza2iBG0YinNTFEBL9mPOZhHwvqAq7ysXMoRNKs
         D1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695972704; x=1696577504;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV15ONO1jUP4uYwgWL2R1qvHOr8y3WbaAo1W8izGcdQ=;
        b=gM8ZpF02K06suyo2AP03xFFUrsYsSabBbjeyZq9hIyVA/de2GWBv6cirESJ5dTCD6U
         zmX6q94Z7EBLFJpeKFBleq+Q3l2jO2V527cUk527/aNd9Z3XxTEKMPT68YMUcSQ5MdJ0
         Z6JQLFc8/9yDpgrdASzzYoTRI4HO2XuX3NDaAxZkYPpPTlQTh/xTqkniW+MapL+7K4GR
         6Dq+V/46EOIGpVjTfiHrTdrM10ioJbY7DJOmCCEDjp2rYfq3aY/y1gc2XpTJY20uFdd9
         AfX4w5eny1cf6hxEdbD18HAXEWpgAouDgd+C6TRI8N7mmt6uhvERkjUKZOKr+ocegp0r
         y6Ag==
X-Gm-Message-State: AOJu0YzCuQ7uRogGcuygiRiNN8jVne+G4hV+fn+EoPSfkSol4uFWZTQJ
        Y11qcanO+4501Myg04a55lYTUQ==
X-Google-Smtp-Source: AGHT+IElgd8TDrBOM4ypykT+b/lbz87g5gXWJ/ODkeUI+dDXsCHZcN5sByXbMgwX2PkFlH8v5Sauaw==
X-Received: by 2002:aa7:cf0a:0:b0:533:4cee:e52b with SMTP id a10-20020aa7cf0a000000b005334ceee52bmr3335483edy.25.1695972704119;
        Fri, 29 Sep 2023 00:31:44 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id v10-20020aa7cd4a000000b0052ff9bae873sm10724978edw.5.2023.09.29.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 00:31:43 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 09:31:41 +0200
Subject: [PATCH] arm64: dts: qcom: sc7280: Add ports subnodes in usb/dp
 qmpphy node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-sc7280-qmpphy-ports-v1-1-7532c11973af@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAFx9FmUC/x3MTQ5AQAxA4atI15pUSfxcRSxkFF1gTEWIuLuJ5
 bd47wGToGLQJA8EOdV0WyOyNAE39+skqEM0MHFONddoruSKcF+8n2/0WzgMmfpxKDjjoiSIpQ8
 y6vVf2+59PwDWwzFlAAAA
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the USB3+DP Combo QMP PHY port subnodes in the SC7280 SoC DTSI to
avoid duplication in the devices DTs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 66f1eb83cca7..4e34d00e246b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3399,6 +3399,32 @@ usb_1_qmpphy: phy@88e8000 {
 
 			#clock-cells = <1>;
 			#phy-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@8cf8800 {

---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-sc7280-qmpphy-ports-20afd4212470

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

