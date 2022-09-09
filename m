Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783AA5B359C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 12:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiIIKvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 06:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiIIKvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 06:51:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE5F138E41
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 03:51:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w8so1979263lft.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1L0o6NKnIV8PSSFa2/xbs05lMO9hcH96sS6kcxPnOdA=;
        b=CM7uCMcgcaeKthkDDiZiEqe+iYb/GkFNa1bl7Y3Sex5dwQOkEVJwK5SdKp+2z4DqHe
         5HlhlnI7abHrm/TFrl9lvs4V55XF0xzYHnS7uBhXKWybUrbI9oATng9ISmSLlsasO4w0
         MtNEjUxEeE4NstwLuY4Hlxx3l7OMDwmoHm8GEpyNg/aGphFPmqvOji17gU2piHsSr30S
         2b070rBRUfN0t0rcenTjxSEdVkBnWjoMsZSi+au6wKTBGldRypvQulLlw2baNeFBNPaX
         FJN5Pj7vXjnNx7wq5hPe7bWEsv3FzyvSGQWAnvgRtSxEMA1M3jI2IX/S5jkTVNIaUrsa
         92YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1L0o6NKnIV8PSSFa2/xbs05lMO9hcH96sS6kcxPnOdA=;
        b=sctJZRxJHjXIS+AYaIgVGeoaGagUOEnU1OT5UrrDzUJrndXOZ3NHnt+HcMehSW7YkL
         IyRlmaQYWmfAW7VbygnSYfRH85ChI48R//D4eO9/QtfTyYTJJs5y2M0OotYPsLn/d59i
         vwinLguFtEowPQmTy327vgT8mP3+yqEEtJkfshdRCUcJotNso8XWCvQmKayREppBSNWu
         CElHlRCAGPX+EH0TRbboZ3LOx+gcI/m1wuSqIwYLAYVoz0sQPGUw2wtcLEAQb2M6Qlca
         SHOupw9cif35cy+hd/HNN5SP+XDzpIW37mHN116v7l3gTb72zaVnuN9xB7E7ftcAcJG2
         3JPQ==
X-Gm-Message-State: ACgBeo39aKLl6hYPpiivKDEPyTFjbJXrDDZ/u8jnX/P3kk2S1dt+A7Bo
        8fd60qbedaWK9xj8djK6ieb9TQ==
X-Google-Smtp-Source: AA6agR6HZMSkY/vcQvNbhKyTUVdQqJaSpu4hSrjnsI5wU2M4jaN5LwZ+qKLXdojP+zCLHVY80T3Y/w==
X-Received: by 2002:a05:6512:909:b0:48b:954c:8e23 with SMTP id e9-20020a056512090900b0048b954c8e23mr4724150lft.670.1662720699917;
        Fri, 09 Sep 2022 03:51:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004949903efdcsm25428lfr.287.2022.09.09.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:51:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/5] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
Date:   Fri,  9 Sep 2022 13:51:35 +0300
Message-Id: <20220909105136.3733919-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
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

Add pxo/cxo clocks to the GCC device tree node.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 63a501c63cf8..153156f48421 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -50,7 +50,7 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
@@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&pxo_board>, <&cxo_board>;
+			clock-names = "pxo", "cxo";
 		};
 
 		gsbi6: gsbi@16500000 {
-- 
2.35.1

