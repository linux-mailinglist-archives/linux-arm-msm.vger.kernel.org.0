Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 075D1553F02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 01:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355398AbiFUXen (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 19:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355200AbiFUXef (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 19:34:35 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E07B63C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 16:34:25 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id jb13so265712plb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 16:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ViEFcKjroQXvwBGepxaEQeL4Q+Xf8p05t8vesOONSwM=;
        b=iOIeFKS1PDNNnEKTQ8DM/+fsNaaVzzQfZlWTkM4SC+6zPlpmnT9VqwCHD+OtHDxbS2
         f2UOsP7lPVsfJbYwLAtil9gq2RnDBR5wcz81MpZntsQ555etBAmE+LbxT6cyVnApN22U
         BxngAJICMfBz2+EqJOJgVogunEW0KBlODrekdbqrcAgBA6SSKOuA+PEelKLKvMJZZFmg
         /7gmaYjRfWExSJaW68nQmasr2sUgBKcDiAvoh8JRnI+/Hq7BQ02tJkHeVQcI3hd5kYF8
         AWPF9ppLjp4a2UTMZqD0MdLYMwjmzz/oiCuiu+U8G5t8EwfQvILbyFD3q6Ikw+21yZXY
         dCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ViEFcKjroQXvwBGepxaEQeL4Q+Xf8p05t8vesOONSwM=;
        b=q7jCExDtZfwAOvFs5Bo/EeAQuzlmgIL3Y2k7VoXHW3nbShKQn3TeyLcH1HByVniz/4
         +/0350KWMSEF7mB7ipS59uYXZJzvN/V67uwkhkHWhtrm3D2DLJLQa9OsWRsUuclkwRuw
         tkzo0R61R18KxN3Cx8THNzSjqz45mlsn+oBxdlwrd9RFurjrNas65xUcc2mcDGCPX+Eg
         5MOso74oCwrQuPFKI2DMM0Ahx6hLCl+nFvGtWnrh6plyBgAnWZjmjdan5J0SnHjCV8me
         YZqHtExO5iiZss010xnUN1zELoFN9QT6gHaLEEC/RLYZBa4QfmWbmpZ58t21Dcdjnx8i
         3fQQ==
X-Gm-Message-State: AJIora/bU/kuytwS0oRZysOw0mOGVnJm1dUJZiWrMJzkh5Vmwn6f00s0
        7tEPUYI6MFCcf/8rsFOrdBH2QA==
X-Google-Smtp-Source: AGRyM1uA3DgDswAU+ttXuWuvTdwhYhitUaUKJz7J9lYdhqUCo/NT6EpS1MtC/WtMklbduEikCBvKgw==
X-Received: by 2002:a17:902:9b83:b0:164:59e:b189 with SMTP id y3-20020a1709029b8300b00164059eb189mr30449024plp.91.1655854465221;
        Tue, 21 Jun 2022 16:34:25 -0700 (PDT)
Received: from prec5560.. (71-212-119-14.tukw.qwest.net. [71.212.119.14])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090302c700b00168e83eda56sm11297873plk.3.2022.06.21.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:34:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, robert.foss@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v6 6/6] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Wed, 22 Jun 2022 01:34:12 +0200
Message-Id: <20220621233412.506768-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621233412.506768-1-robert.foss@linaro.org>
References: <20220621233412.506768-1-robert.foss@linaro.org>
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

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2
 - Remove interconnect include - Bjorn

Changes since v3
 - Switch from .fw_name to .index

Changes since v5
 - Revert .fw_name to .index change


 arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 52428b6df64e..99464cd1299e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2525,6 +2526,31 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+			power-domain-names = "mmcx";
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.34.1

