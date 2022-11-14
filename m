Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB5A6282AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236247AbiKNOhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237076AbiKNOgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:36:55 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04FD2A437
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:36:51 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id n12so28749279eja.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvz0o4S1fZ5mZUtOuM1gTiLaNsvwKJp3SvciSlsQf20=;
        b=mQNTfHVuG+IbxuzZdCF82Uq2om7Pk+VDUWiKOHrTiE8VwGWHF2TXaFXXxya43WRCyU
         XFCZ09Lu1Y9dKOgIDlg30TZVhKUCMqURrX+acpETcc4J/n+EeKBGrRoIWoNsmW4wfJUt
         hfbdP857BtXVfXb4IGmBZwwv0kGsY4T7g5x2UTQqHI7mhELZIFGREgzwxGfS59C151UJ
         LRgJH5NqFzeB6WLqdP/YGlU48o6LT491jWr5wEM8zV+NAMx/Aa8FIyBwPRnJDBmNn00j
         EdsOQXsza9kN5gvWP4WmhA4SO2k5vPKUfdGncfXOYlQmnTvCwgEYHXEbn9DsbfwezO9z
         KbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvz0o4S1fZ5mZUtOuM1gTiLaNsvwKJp3SvciSlsQf20=;
        b=nbMiY/RBfzGfOJ9TfFIDd1MNFq4bbdSJEWFwrSyTNMqadeaPVJA+lsigGKUPnkltQr
         3vRwyQFeKjNtkZ2Q1gjCCNp+fijUJAwHgKJ+YETbTUuPifklEJIfNcBpxD7+r8rS+Zqq
         k23pDYH4QZHWeRjNVonfzzsuX7dfLLmEwiAA+cJ5AfIDEM35ys1U6a7yWTBmuwH8E/bW
         eODeCrzg+Bv/5lNijFsrCmEk4guyzTlZefPaACw2KCDQomXOMrtZa3pjtQckvRywjQcQ
         l6aE+ezm62bvzW4fBWZlwuykGxJYaBlgJwPkh89qb30sJsc46PnnJU4AhhmZlv+sxluP
         HLPQ==
X-Gm-Message-State: ANoB5pmCawNkFM3t9J68DisBSHXB/J3zBwEMOo7BDQtkqOTrdjE+Eh7a
        kebcEgSyLDcRYUTxfkTjXIedOKV3XIuae8z0
X-Google-Smtp-Source: AA0mqf4VwXhFyQ2hc3csCScXZqGALnmIcRMZbDA4giMaTzNzsnUwP5PTO51xKaY09W1NzjkwGkuuxA==
X-Received: by 2002:a17:906:b019:b0:78e:ebb:cbb7 with SMTP id v25-20020a170906b01900b0078e0ebbcbb7mr10610756ejy.38.1668436610149;
        Mon, 14 Nov 2022 06:36:50 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id n15-20020a17090695cf00b0078c213ad441sm4228014ejy.101.2022.11.14.06.36.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 06:36:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8350-sagami: Wire up USB regulators and fix USB3
Date:   Mon, 14 Nov 2022 15:36:42 +0100
Message-Id: <20221114143642.44839-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114143642.44839-1-konrad.dybcio@linaro.org>
References: <20221114143642.44839-1-konrad.dybcio@linaro.org>
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

Wire up necessary supplies to USB PHYs to enable USB3 on Sagami and
remove all the limit-to-USB2 properties.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index f118caab3d42..4dcaeb7f9bc8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -597,25 +597,25 @@ ts_int_default: ts-int-default-state {
 &ufs_mem_hc { status = "disabled"; };
 &ufs_mem_phy { status = "disabled"; };
 
-/* TODO: Make USB3 work (perhaps needs regulators for higher-current operation?) */
 &usb_1 {
 	status = "okay";
-
-	qcom,select-utmi-as-pipe-clk;
 };
 
 &usb_1_dwc3 {
 	dr_mode = "peripheral";
-
-	maximum-speed = "high-speed";
-	phys = <&usb_1_hsphy>;
-	phy-names = "usb2-phy";
 };
 
 &usb_1_hsphy {
 	status = "okay";
+
+	vdda-pll-supply = <&pm8350_l5>;
+	vdda18-supply = <&pm8350c_l1>;
+	vdda33-supply = <&pm8350_l2>;
 };
 
 &usb_1_qmpphy {
 	status = "okay";
+
+	vdda-phy-supply = <&pm8350_l6>;
+	vdda-pll-supply = <&pm8350_l1>;
 };
-- 
2.38.1

