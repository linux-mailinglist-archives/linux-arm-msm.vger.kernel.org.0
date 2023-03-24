Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676FE6C75B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjCXCZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbjCXCZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34719298D5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h25so403249lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDchSKop1Xxq66SPpXZxrs89UqPWv/lOnX16IUJPMi0=;
        b=NSom5vke0xjqGrWtst8MZeMpXOjO4NPIEENRyJHs0ucrbkFnlvL5UZ+EyT7wSdB3iV
         gyfZ0ZOhCdCHcbcqJtidKp229gF/vWzUA2bGt2TvHrDZ6IHHy3/glj4GNFlSs8c9Gd7a
         I5b2jacWCPqgqUratrYdhPUTm5xMnJR25BWddAT2McOdA982R0NCjvcDnms3rioi2p48
         tqVoqvkmi+op6QVnjR1AqgrYps4hCc2sjPpDkS4mf8Fgz+mDmTXvxvqA0VvVgQuAxrAq
         9Cc9y0MBAvGMWotYXMtzoQJV/837Ea6IKA9dYuvUj9To0Ru5pB8bzufpnSXzQNCciju7
         ih/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDchSKop1Xxq66SPpXZxrs89UqPWv/lOnX16IUJPMi0=;
        b=sjdAGsTG5dXKk/Vt8eq0ZEfI6Qed41Un/lTf/Ldk3y56AyIAnm52BKv4UKLC4Xld+P
         /Q5YtL+L9a6UTdUwLNdwT+sT5RwjdvWMcg7o2QSFcTZc73qCjqLbxTJr2pSB4iCbUHgO
         ukyWnCptVH2oS9+1mWRBsuJCg7xfWwU9QhWV1NWXDJAhozWvJpdKZw2hs2XekpxueCeb
         CO8Ov8FrGvwpWorOGLdDql9/ayC35Qshq6LaL/rk8JO3h61d6Gq/fEWkcbZwwZoXOUvW
         6nYNBfYb7ZGD3Iz/SGkSBZgOozRj0ssWJ2AD6/TjsPMoNKiAyyFeQ+uJIK2U0l6Fg0PD
         hw6w==
X-Gm-Message-State: AAQBX9dVKL8Ekr+sbNPez96pQGIfCGOjiM2JyxlnBcguY3q0F+ySmVmu
        x/8wOqigrqS/3d6Mf1O8y3QGxCjspg6/ZQUdt+PbRg==
X-Google-Smtp-Source: AKy350aZJxyraI5wGu1P7LI0ODnp2xG8grMQkrrBWRa34TQ96fi0CfpLbm2ZknPx/fqLrpM30j4qzw==
X-Received: by 2002:a19:520b:0:b0:4dd:9aec:e468 with SMTP id m11-20020a19520b000000b004dd9aece468mr219626lfb.58.1679624746597;
        Thu, 23 Mar 2023 19:25:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 29/41] arm64: dts: qcom: sm8350: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:02 +0300
Message-Id: <20230324022514.1800382-30-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index da764ca42129..9f6f11479777 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -658,9 +658,9 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <&ufs_mem_phy_lanes 0>,
-				 <&ufs_mem_phy_lanes 1>,
-				 <&ufs_mem_phy_lanes 2>,
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
 		};
@@ -1662,7 +1662,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -1706,10 +1706,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
@@ -1717,17 +1715,11 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {
-- 
2.30.2

