Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5464E6C75AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjCXCZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbjCXCZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:48 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896282A6F5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id s8so395967lfr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+Yq+h+KrhBwR3/QtnF42L41z1VHs8gUsEyQMQJWXII=;
        b=ZgDdjaaOxZ9IcoMJNB1Tt89FZLJ7Zp3hads9IRrMT55CLnBb0LyAT9X7pOx2i9gFB/
         SCpfo/LhVK3TWiFSEdL1NFUJOYEIBODBsQqYZwhLypcwRCvPXs3dpDQvPqdjqooTGYY2
         AtOv4l7jyHIw+TrH5SrLgFvlLr69vaMNDogEmOuiqJoWNXp8SW7KqSMoViHRmrxr4KTK
         LR4unSCQG/1nJuujZm96uHZmkHZnDmWzpClA4oaQ54jaIato3DR0vfNFxHQgjXpagcbZ
         iwOLrYHhbnpxLUqlSMnxpcojha9ANvAaRHTOA3yGsMMiBky04voIfw0cUvYvdzc51+KE
         Z8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+Yq+h+KrhBwR3/QtnF42L41z1VHs8gUsEyQMQJWXII=;
        b=FXziCGmZ6dxIhosb20RiNipIi7SYeU2KgHI/eyax/fgd8pe+OpW5RUI7pUXkNSOGkh
         JZpEoHGi7G6fk77O1okNpfBwTMoVeAx9ukS/YNXVgQ/Hv820diTyCQH7t/sa6wCMyE9p
         P18wqGVTE+FVLPywhQkDq19kVOTTUyoidCOCa93Q2EZreoGASVZ8E3+ctgCZY8QGhzml
         fZYDXAvY4xvEdRd1rbLpSrGrJHNWzeTFoF/VKwucjgh1Rhi4EgNxHhRdCbNt8mCQ8rMs
         n7sPdaEXBqCCgejea7Qsh475ARGXEdMzbgkslZ/6q+D4gPHd8nBbIsR07Ynwnp82g6Ih
         KXoQ==
X-Gm-Message-State: AAQBX9d/Eu1O88yo0GICoKHYIv7Zum6bXcCU4g3mw0XIqqlA+S90IaGb
        xMy/0HhIul0VgZgcIga9v83hCw==
X-Google-Smtp-Source: AKy350anCEwRXulylP7ysl4vAJBFomNd9M0aNvPNEaFXp9YPHjzCxJ/RR7TrWD8M17P+qdQq8yby9Q==
X-Received: by 2002:a19:f50d:0:b0:4e9:a853:4e8c with SMTP id j13-20020a19f50d000000b004e9a8534e8cmr170476lfb.66.1679624742965;
        Thu, 23 Mar 2023 19:25:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 25/41] arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:58 +0300
Message-Id: <20230324022514.1800382-26-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 2a51c938bbcb..eb30e5cb7b4b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -773,7 +773,7 @@ ufs_mem_hc: ufs@4804000 {
 			reg = <0x0 0x04804000 0x0 0x3000>, <0x0 0x04810000 0x0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
@@ -814,24 +814,17 @@ ufs_mem_hc: ufs@4804000 {
 
 		ufs_mem_phy: phy@4807000 {
 			compatible = "qcom,sm6115-qmp-ufs-phy";
-			reg = <0x0 0x04807000 0x0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0x0 0x04807000 0x0 0x1000>;
 
 			clocks = <&gcc GCC_UFS_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 			clock-names = "ref", "ref_aux";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@4807400 {
-				reg = <0x0 0x04807400 0x0 0x098>,
-				      <0x0 0x04807600 0x0 0x130>,
-				      <0x0 0x04807c00 0x0 0x16c>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		gpi_dma0: dma-controller@4a00000 {
-- 
2.30.2

