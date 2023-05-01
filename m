Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC72F6F3025
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 12:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjEAKVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 06:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjEAKVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 06:21:07 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C733E73
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 03:20:52 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so1789149b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682936451; x=1685528451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=380yTQfyf1kIhmDwtCqc51zaHbJPWsGW9xsWD9WICFk=;
        b=h/y3juOSd6/vq5PkD8g1lfgt7gRr2G4qvTvcRjGxmyhskKd3nLwXcPUfMXwf5SJIKS
         rJYU5eU7EykSblwIzRMnPP85C+O3rP6cnjNNvPl4qAZzVTdkLczyT0AjH4ncHhx2tUGW
         rN/wPqEtJL1QlVC7RFgWrq7HiSf1EqwcnEdRqHbVKSd7epM5uiWdELxdQrfrUiGqzwP4
         6vJ1dV15d0lk34hgUGIRk4WihZ45MJFfYOeUg3l/wARbcmosHv8vv+fSZ1bVIRko+DGQ
         dUsHoamsdBNuCMzPE/zrFb8Uk34hVsftMB4yAu/zQuGCO9GHMiHJwx4BWwsj19RDlaV2
         oqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682936451; x=1685528451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=380yTQfyf1kIhmDwtCqc51zaHbJPWsGW9xsWD9WICFk=;
        b=RsvgNiWFWzbdVZf/eVwCDtOauYT5XkvhGCfHEAxDN1J4Z4P6hktR/kxJgmwjH9NLus
         86OBUqTYy4Aam+r+xyWI5KC8N1Qy6oK++EiaExWyBvEbCGM4v+DQ0Ds6JgGGn8rO8aY3
         BHiZx/NLPd8/vW3TSJa4mYZS7aw35AI3g+1JXd8PmZjh9XsldJio9T9QspPBjQa+GOou
         xpg6MmeHt9jxidLU+eCQQoBuszqSRXkf/AJ30s91HoiL4mx0G5/GHLjnqXr2rqGrAWYZ
         kdQ2fctMrMMX0+tOwbafAESy0OUsojT6n5mxe6ov13uKH/wm+sxpZWgvBhAtlSaSnvMA
         5GTQ==
X-Gm-Message-State: AC+VfDwN2wPEVtqW5VsvMQmZ05Mq65EF5jtm0oCppLO00mj7HJU9evV6
        WXoLI0L5yOALUMaCfTiqamSNwOARryB4l5uHTss=
X-Google-Smtp-Source: ACHHUZ61JDcXJwAIn7Bod4229oxzORL+Juog/Yh6RaRIs8Q6hfa5hq8OkSKYLQCkipRCvB/akk7fww==
X-Received: by 2002:a05:6a00:1916:b0:641:3ca2:1aec with SMTP id y22-20020a056a00191600b006413ca21aecmr11446875pfi.27.1682936450993;
        Mon, 01 May 2023 03:20:50 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:58fa:39f6:37e1:bb9a:a094])
        by smtp.gmail.com with ESMTPSA id k16-20020aa788d0000000b00625616f59a1sm19198903pff.73.2023.05.01.03.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 03:20:50 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: qrb4210-rb2: Add SD pinctrl states & fix CD gpio
Date:   Mon,  1 May 2023 15:50:34 +0530
Message-Id: <20230501102035.1180701-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Add the default and sleep pinctrl states for SDHC1 & 2 controllers
on QRB4210 RB2 board.

While at it also fix the Card-Detect (CD) gpio for SDHC2 which
allows the uSD card to be detected on the board.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index dc80f0bca767..bff6ba1d689f 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -190,6 +190,10 @@ vreg_l24a_2p96: l24 {
 };
 
 &sdhc_1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
 	vmmc-supply = <&vreg_l24a_2p96>;
 	vqmmc-supply = <&vreg_l11a_1p8>;
 	no-sdio;
@@ -199,7 +203,11 @@ &sdhc_1 {
 };
 
 &sdhc_2 {
-	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>; /* card detect gpio */
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_LOW>; /* card detect gpio */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_state_off &sdc2_card_det_n>;
+
 	vmmc-supply = <&vreg_l22a_2p96>;
 	vqmmc-supply = <&vreg_l5a_2p96>;
 	no-sdio;
@@ -216,6 +224,13 @@ &tlmm {
 			       <49 1>, <52 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
 			       <68 1>, <72 8>, <96 1>;
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart4 {
-- 
2.38.1

