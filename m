Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B247623A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 22:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbjGYUiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 16:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjGYUhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 16:37:48 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A341F30D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 13:37:24 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51ff0e3d8c1so8543109a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 13:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690317442; x=1690922242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8EFcfDJur6Q/cyUGY8oZE5QsCZxjq5T48R8GlfFPEw=;
        b=R29tX040z+qe2Vlrxhn1pwbhDNdOW5WzGO/cPAmsxXlQ2FIJM7pjqlseW1dpyltcEW
         12J+Y0fyBDfrjfAVs2exBN46xd5H0r3RHJUp3yPGj3261ECMAwQcZ5ti2fyADw4zEtln
         FgRh8WLaSAFdyAUAxZz5wF6Wafrgg8dof6xfHJCs7BkElz52x0FhSEva8NwluWj6wgc4
         z0oCXCammOjUc31D0Gx4x5JsLRo/V9XoHVFjK2Afc69d64giQM1sBBHKjdN2zq2y1/QP
         Y2U4G9rofhgktXpOpVlJ9zArQ/0C6W6lueB6r2f8i0ZDdnupVebVmdRtZCNAetKieDtt
         MB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690317442; x=1690922242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8EFcfDJur6Q/cyUGY8oZE5QsCZxjq5T48R8GlfFPEw=;
        b=Jda+sCz0ONFYVPt2tSj5PJeThfBfqXcA6utrsKbl3AwHhd5ZRra468U245LNh7RBVv
         jeqnc6dkfEJ8jlDE4iJViLVzHlSYTW/WCejGYkq+mk87u2Rp4dqqIVRscL+KKutOuIfF
         8Sj64TEgsQZay4aZzsbnOpPmwGp+1oixdRm993APWHAhq9oPFYtcg/OTxc9rygIkykbV
         XE6bVNULglMAUk5jhAG9XhMwnajm7y5BKNJUb9wWiCBPvyYQMf5sFBcXCoCi2dVkBUeS
         G7M/oHPlW/V58dqRKkT6pFY+xk5U33U2DjvevFB0ezLCFemJVVLZm3mgYuNCMMX6p2yk
         FSVQ==
X-Gm-Message-State: ABy/qLYgtyV4neNajj2w39/WZzlxTOPA58UEKvtYm1FHOAMr6L52V2KE
        dBmFSeNWSpbQED/2mUoaRO2VsQ==
X-Google-Smtp-Source: APBJJlHouXij+Cjl+4lvV6lM3MzJYZz6FGESDA4/HPSPunUv+BrddOvplajXI9EyPZVAn2Qfkog5Fw==
X-Received: by 2002:a50:ee97:0:b0:522:2d1b:5a38 with SMTP id f23-20020a50ee97000000b005222d1b5a38mr19784edr.10.1690317442552;
        Tue, 25 Jul 2023 13:37:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y11-20020a056402134b00b0051de018af1esm773834edw.59.2023.07.25.13.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 13:37:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
Date:   Tue, 25 Jul 2023 22:37:18 +0200
Message-Id: <20230725203718.513724-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed regulator put under "regulators" node will not be populated,
unless simple-bus or something similar is used.  Drop the "regulators"
wrapper node to fix this.

Fixes: 2c5e596524e7 ("ARM: dts: Add MDM9615 dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index b40c52ddf9b4..bfcb4fcf6546 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -46,14 +46,12 @@ cxo_board {
 		};
 	};
 
-	regulators {
-		vsdcc_fixed: vsdcc-regulator {
-			compatible = "regulator-fixed";
-			regulator-name = "SDCC Power";
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-always-on;
-		};
+	vsdcc_fixed: vsdcc-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "SDCC Power";
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-always-on;
 	};
 
 	soc: soc {
-- 
2.34.1

