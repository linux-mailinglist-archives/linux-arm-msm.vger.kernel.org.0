Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 890726C75B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjCXCZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbjCXCZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A332298CB
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so428790lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKQAL4iax+jVCDzXN2tBv7jtLm8ckLZ48UB/bWbPt7Q=;
        b=aZsm1vv4P5WmKNWWEzC+gHSlcl3wltZ21f8tAAvo63ZztQt1UMct+LFahXwEK9XkTd
         Ajel5HsXUYQ+zsawEqqcSp/qZksCrg6Mc6eLIeeUXKgnmGoalKErXkHAQgIdYN8I2Ygz
         OhbR90QLeojsxX3PT0M22WPyblZl59PcHOtJkvPoKt4xjCRPfug/xV4XPnnHhZlQH+Kw
         WpnanqZe8QYmkHejxhvz+Y1ep6JCcW0VL0jcQdIEVGwU0fPjWb9BAySP+aNQKh8/rp/2
         ObKsZzT16GJOOBVkIX7RGAOxaKgJSle6CgW83yeZt9libSJmkSY1L0HUNM+UNzm663WY
         Fb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKQAL4iax+jVCDzXN2tBv7jtLm8ckLZ48UB/bWbPt7Q=;
        b=U3jASHOsbgDj+dVqaXRPsIa5jKPpL8q3to4fv8jxGu1Z+uPnnaUkADYA0xeyydsMLn
         lbOLGsMVUIh+ZwW5hopFCjenTEuLCm+lo4cOxsD02ZTmaqB74nWxgjp55gsbxtLHvW53
         djnvHSrJzwnAw4lre6VB2P5/3ccYbEyZzKS01wFJCyiGI4W8iseSXeQ4DTHyCwxpSW0C
         gXaVC+aIy3CGf8+9A3fDVGnvwBOIrho+mt6nWzLgkfkjNXaMAClS3rZAG8tKytMc4Nyn
         fCfHoU7BfYhSnlrlwCn2hwqpgUE0G0RSqCk8vdt+Q/9/TlQqaC70zZyUpD3AhvSTq0ST
         uHVQ==
X-Gm-Message-State: AAQBX9eh6qpIJpohJGrrXBrVhugqaNoTrW4uW/3vjbpEi/CMf5eR6+/d
        AdU6y1IXn9aTA3fJi4IxMAbHHA==
X-Google-Smtp-Source: AKy350aD3AIl53GTd7p+9glt7NCL2UNGDb+r8fHRQfhIyc+15pylEtNWumjuJnGOqz9+ADHPCR57Ig==
X-Received: by 2002:ac2:43c9:0:b0:4dd:dd28:31c7 with SMTP id u9-20020ac243c9000000b004dddd2831c7mr173879lfl.38.1679624745731;
        Thu, 23 Mar 2023 19:25:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 28/41] arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:01 +0300
Message-Id: <20230324022514.1800382-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e7b1c9fc13c5..1d13864e978a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2156,7 +2156,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2200,10 +2200,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8250-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
@@ -2211,16 +2209,10 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x16c>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x16c>,
-				      <0 0x01d87a00 0 0x200>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.30.2

