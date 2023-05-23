Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA7070DEBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237223AbjEWOJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237138AbjEWOJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:09:13 -0400
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA5E170B
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:29 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so2256420e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850788; x=1687442788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01Vg0JlFhIBK9VCY79xD919ZIBHvFfJNH1ZK6oy6Dl0=;
        b=FUBWz7BpzpnnC9xYaqTrKP0L3hW7W3YcyRJzZ56aALva/3xFQzusQ1TJh40bcWzbU7
         gzyFLBDjFigf3G6qWFWWGaP6oQcRVrmoHc96mQFhLOGs8PzKZE3QAaPe9FaE0mqNHnvj
         /DlE1uBfct0SVH+8H4TfxC524mr6YgF4BU3Io4L4IiHuL4UBCO9KGkKmt09EPWgZkiW4
         CkbI5e6k4mvmEhTu1cgjIOJYMVZnS2Jaq+aWoi5kFlCM9w+CgXbrLaABypq8Vuul2VVf
         y8AEUwjA+mUS+opz9L2ey5FaOSPJpPt6LHnXPfxGyVLkb7cK6bbU46DPmS8srCLA2Z0O
         4KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850788; x=1687442788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01Vg0JlFhIBK9VCY79xD919ZIBHvFfJNH1ZK6oy6Dl0=;
        b=WvaJV11VeHWZ/ye7IQuCJT7Mn+7HXJNdl1xUbr7beVLadK6FM2LqDktoPV7Nka4cn4
         h/WvbyIhzMJ7HZY03808ynSFfBWKE120HUmOHBJ/uzQ2K4XrHRIafUUz69M9nJnFfGc7
         agLjbiyszCJUcLE2CG7BjgCmN7dCFNf8L1GX+uRtrBIpkUXa4ddX11BI83XvyP5m78yI
         WehCS2+8mFvyUDperAagnRIzXJK8B/YKv0GNPfecq/5w6IpUIl8AI2ml5oaV1lFDwiYp
         JRHC7+pljJUvcoltdR2uzRWbOrBwVadEgaTsMMlgnaSGdHN5vp3oy6VJhkvZUYN2LLGA
         sK8A==
X-Gm-Message-State: AC+VfDx2/JLsGYhUd+y4abgmXt0LdYdNMD+tYr/MSpYcOa1fwbpjVow4
        bbrkprMqQtcxlAWLf2FyOuvDBg==
X-Google-Smtp-Source: ACHHUZ5KVDqjEQ+Sq7Uzx0iYxPei7ms2WeubpzzVQaDDfePP8GFsSsxvh65c5IIxzEzbfOI56piyIQ==
X-Received: by 2002:a2e:7e02:0:b0:2af:a696:3691 with SMTP id z2-20020a2e7e02000000b002afa6963691mr2999576ljc.40.1684850788199;
        Tue, 23 May 2023 07:06:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l1-20020a2e9081000000b002adbe01cd69sm1633536ljg.9.2023.05.23.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 06/11] arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
Date:   Tue, 23 May 2023 17:06:17 +0300
Message-Id: <20230523140622.265692-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 631ca327e064..289b96d31414 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -784,7 +784,7 @@ ufs_mem_hc: ufs@4804000 {
 			reg = <0x0 0x04804000 0x0 0x3000>, <0x0 0x04810000 0x0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
@@ -825,24 +825,17 @@ ufs_mem_hc: ufs@4804000 {
 
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
2.39.2

