Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CB4675B23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 18:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjATRWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 12:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjATRWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 12:22:49 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042F14ABC4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:48 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id bk15so15640245ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV0xY/b/Sej2+XZC7CtxW6ZSr+OVfA842ua4UMfkNUo=;
        b=NDLPUMjOYz1z+rmJxzxO2bXojXdfvuEFt1H8X0sLAMQB3rbRiOueeLkXtMlHLr0dnM
         EvygGxTwqnAHDaZc/h3GirJBfgjtXvNepEmm4KUoFFsAeKGwABv0VdP39ZerZWFgOU+p
         i0s+9XB5u11H6LmqoGQaO3YYZhDBUkQWndMfrq+0u/KIvVcuMKlWQrzdvetV79A9/xTg
         LLZ5jPmXoAQRqRsqpbw9vBpysdLdNOo69vRDAg7iMdu6YcDRTiR/mptrtgEve/lo+fw7
         gVbZV1BKl1vElqgKWTkg5n3YrJQ47AX7VRRZqiik5f/JyMP2AlwmbLqejVObFavxF1HF
         GInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV0xY/b/Sej2+XZC7CtxW6ZSr+OVfA842ua4UMfkNUo=;
        b=RzkoRoixkbYE5sQZaMylXM5ou+3nTG9+4NOEQVqy3rizF1u3QRittCcBSVHlLGXiE5
         aaJI9M4YpNDnNAJTihHW42YvrAe+RtaLySe9Bc4ugxj9IsLOwevktNTebFAuiRTx73MQ
         VOItVxqhZWwKm4porJKmkvPzF9QDY6sBxjR5bQqKjpABkCbEHTjhg6fV8eDuzHbv3uAf
         Hq3rnX2tyJWc/5sNEphdRKN7kWs1Cc0cQ939cBhUjc/fZUJX1nADRRmF/Adq7UXVSyRt
         3nCiTc2cHGKFDmw97WOYAHanLoKL/iU8Zj1YzGc5ds/iV58xoGkzBTIU2At8cVZMNZ00
         qd+w==
X-Gm-Message-State: AFqh2kpKnB3C2ICzFoE6GMrZCyJIiUKFvrb3nEOqAoOXosGHTaCpZ8r7
        Oxp62GxngOStyqZA+xWqbR21zxIaQTopW/OT
X-Google-Smtp-Source: AMrXdXugRcDVabHRSqs7oYYrnZ3bsAcSex0kM3FsefO+XUEGZJFZroBlFD8aXPQfA4t+Pn1bZdhIjg==
X-Received: by 2002:a17:907:961b:b0:872:8e48:3b91 with SMTP id gb27-20020a170907961b00b008728e483b91mr20109875ejc.52.1674235367436;
        Fri, 20 Jan 2023 09:22:47 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b0084d21db0691sm18313857ejf.179.2023.01.20.09.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:22:47 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm8150: Add GPU speedbin support
Date:   Fri, 20 Jan 2023 18:22:32 +0100
Message-Id: <20230120172233.1905761-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
References: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8150 has (at least) two GPU speed bins. With the support added on the
driver side, wire up bin detection in the DTS to restrict lower-quality
SKUs from running at frequencies they were not validated at.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On Sony Xperia 5 (speed bin 0x3)
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e3059f9b98de..1c7ee0cd816d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -945,6 +945,17 @@ ethernet: ethernet@20000 {
 			status = "disabled";
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sm8150-qfprom", "qcom,qfprom";
+			reg = <0 0x00784000 0 0x8ff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@133 {
+				reg = <0x133 0x1>;
+				bits = <5 3>;
+			};
+		};
 
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
@@ -2145,44 +2156,52 @@ gpu: gpu@2c00000 {
 
 			qcom,gmu = <&gmu>;
 
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
 			status = "disabled";
 
 			zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
-			/* note: downstream checks gpu binning for 675 Mhz */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				opp-675000000 {
 					opp-hz = /bits/ 64 <675000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-supported-hw = <0x2>;
 				};
 
 				opp-585000000 {
 					opp-hz = /bits/ 64 <585000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-499200000 {
 					opp-hz = /bits/ 64 <499200000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-427000000 {
 					opp-hz = /bits/ 64 <427000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-345000000 {
 					opp-hz = /bits/ 64 <345000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-257000000 {
 					opp-hz = /bits/ 64 <257000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 			};
 		};
-- 
2.39.1

