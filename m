Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2200858C090
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Aug 2022 03:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243354AbiHHBwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Aug 2022 21:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243583AbiHHBvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Aug 2022 21:51:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA41192BD;
        Sun,  7 Aug 2022 18:38:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46D0660EB4;
        Mon,  8 Aug 2022 01:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0FFC433C1;
        Mon,  8 Aug 2022 01:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659922698;
        bh=NZXzu7cVGXXB/nusfk8PNhWsU7Tedr6sdn/56oyxKnY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J11KcqXfLX9zPXJobcUkrlXBGWMYujSCDRRl2cDtmf+Orn5JcT4llYpaEA8ep2FKS
         eFoQp6MkKd/aoBGxr6pBT5NTGaI15/jGENEDqRTUcquB12jL1hwA3RaxucWHjs8jjp
         J6YYffWFCvFZ2Pff0xFiB9X8CncGlqJ5S87gjya3ZLT1Drm8z8pMj8UFnv4p0B7Ib2
         HdRqBuUMCuJxUbFmajS25IIwy3dnwxBdYE/f+AoeFKoo8W9A/q2BS6MIZJEUCFL5Kg
         wanZHas+ewQcqVdoURKyw0p6ax/olrULDeRQNMaWKcaqwj3VZEj2liZJhc8mZhR/SD
         HqTGL/9m4vTeA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>, agross@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 23/29] arm64: dts: qcom: ipq8074: fix NAND node name
Date:   Sun,  7 Aug 2022 21:37:33 -0400
Message-Id: <20220808013741.316026-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220808013741.316026-1-sashal@kernel.org>
References: <20220808013741.316026-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Robert Marko <robimarko@gmail.com>

[ Upstream commit b39961659ffc3c3a9e3d0d43b0476547b5f35d49 ]

Per schema it should be nand-controller@79b0000 instead of nand@79b0000.
Fix it to match nand-controller.yaml requirements.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20220621120642.518575-1-robimarko@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index dca040f66f5f..99e2488b92dc 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -383,7 +383,7 @@ qpic_bam: dma@7984000 {
 			status = "disabled";
 		};
 
-		qpic_nand: nand@79b0000 {
+		qpic_nand: nand-controller@79b0000 {
 			compatible = "qcom,ipq8074-nand";
 			reg = <0x079b0000 0x10000>;
 			#address-cells = <1>;
-- 
2.35.1

