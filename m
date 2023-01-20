Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3168675B21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 18:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjATRWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 12:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjATRWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 12:22:49 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99267474ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:47 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id v6so15698666ejg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuRLDN/glhJQ7GASrPrMhpcVHUOd0R6gamJVh5QWzXY=;
        b=t3C4aHzUpfTSbrHBxARUemK3hlWb7HSv9HTveDnh/gRkjGV1lB/7l/9TzmbgMLYQZb
         /EMVe3MB2qzQECrMaQKAxvv/Nn12GDlfKTxb/YNPwn/MZ0KBT38kKvN5GYWkgKxn2tW+
         l/AOuBfUd059izKdsHMfICoN0a8mwv5ZtxX47sG7ZYy4OO7x+j5zMHi0wq0cq1K4brRu
         Q/QJSRbjcyo4Prph9XBBhl9wQMDo99w4cGS14mYXDKk3hu8/rl/Wl30bC045MRUYXm9x
         YQx4kqAmdvpS/XMB4or/pYSRLJHf4YXikEeSaXfGGhzyVaXf/SGx8/UVhcJ2UDvEoaU2
         Livw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuRLDN/glhJQ7GASrPrMhpcVHUOd0R6gamJVh5QWzXY=;
        b=lJonrou8ozGihf3waIg1Vqh12cHviGav624um2NXIUIh9ixHf9qxZTTF/KABxqPrhv
         d/juWKi10aJJjsyGjwWVV0LNs7FeeU3zL/su3Ms5OywXyJzFI5wvUD1qRdggXQOEj2Mg
         QAvR+gVQc9CzfmR9QWS2opMpcLPfgNy2jJ0p2ZB8L3bTGdv2Wau821nVrGxrjGT5zgQ5
         tUmIJn50b3nZxiWixZ9uoJyjkUiiXCGwtL+J+NdAf9EghmlNLtsostbasNbNqQsUX5sv
         dXCDeuC+pgQhLfV1UWtgJz/gz53w5t/3uYcC1KVm9zNzK4ki+HTBbsEzpibfmt30KRys
         wzaA==
X-Gm-Message-State: AFqh2kq3eWyPoN5VEMX+OMFXh2DF76gd6qrCuewhO8mZ38CEBqJA5eEx
        zQhwrVcPv+T45kk1CBaHJVBIsruw3VbdcCDR
X-Google-Smtp-Source: AMrXdXuR4MwX/4MKfmHMcj8DvWsjJcN1ttHIQoE/8GEawN5qxRWie4s7Yhda11io3YlL6Fjvtq49zw==
X-Received: by 2002:a17:906:1851:b0:86e:4067:b699 with SMTP id w17-20020a170906185100b0086e4067b699mr21112294eje.4.1674235365947;
        Fri, 20 Jan 2023 09:22:45 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b0084d21db0691sm18313857ejf.179.2023.01.20.09.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:22:45 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8150: Don't start Adreno in headless mode
Date:   Fri, 20 Jan 2023 18:22:31 +0100
Message-Id: <20230120172233.1905761-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
References: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
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

Now that there's display support, there is no reason to assume the default
mode for Adreno should be headless. Keep it like that for boards that
previously enabled it, so as not to create regressions though.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On Sony Xperia 5
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 10 +---------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 3331ee957d64..0ee5309408b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -359,6 +359,11 @@ &gmu {
 };
 
 &gpu {
+	/*
+	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
+	 * after display support is added on this board.
+	 */
+	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 46b5cf9a1192..9dfecbf89b21 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -354,6 +354,11 @@ &gmu {
 };
 
 &gpu {
+	/*
+	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
+	 * after display support is added on this board.
+	 */
+	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fd20096cfc6e..e3059f9b98de 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2133,15 +2133,7 @@ compute-cb@3 {
 		};
 
 		gpu: gpu@2c00000 {
-			/*
-			 * note: the amd,imageon compatible makes it possible
-			 * to use the drm/msm driver without the display node,
-			 * make sure to remove it when display node is added
-			 */
-			compatible = "qcom,adreno-640.1",
-				     "qcom,adreno",
-				     "amd,imageon";
-
+			compatible = "qcom,adreno-640.1", "qcom,adreno";
 			reg = <0 0x02c00000 0 0x40000>;
 			reg-names = "kgsl_3d0_reg_memory";
 
-- 
2.39.1

