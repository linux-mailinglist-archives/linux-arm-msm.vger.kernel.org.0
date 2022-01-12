Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5812048BDC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 04:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350526AbiALD4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 22:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348077AbiALD4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 22:56:05 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F00C061748
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 19:56:04 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id c3so2191130pls.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 19:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVcIHrZRwmWTRw2ZVy9SM+LddmUY7SxRVXVl2VyF3ZM=;
        b=fy4M8tiTb+wDZhdf4JuBYs/4ufOPtDgTGmOORBUGsGU4SLpl6i3/J8euvO6DjNGCO2
         7SP51hej1l9opkuEXNWS8cE3gAzLGQF79spjt/6lPtLh+7p48qgHQ1/9xjdwh/swqzH1
         V5x/M0nOh0zkdrev+dWr9RQfKyMLS6DQcvb77EsUA0dOghlXTsZ7T81k8rNg6TLKvzLy
         YuXj8wOJ6Q09oxc9oIXwjFvBDCw9BBmS5k4vprTraDRCuawd/gn9NRF4zeJL3b6RN7ZR
         ebZ9wI/TdZBfQ/6Lo/NYcLPQe5m/ExTJT7ZlPBQvrHLSkgFV1n6l6t45MMM2rz921l9z
         yLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVcIHrZRwmWTRw2ZVy9SM+LddmUY7SxRVXVl2VyF3ZM=;
        b=uJwFcPE7LG6427Ld8RHHWCCFSoD5st1JQ9yfNnLi23z96reML4GKXuGL+bcV5voQS0
         tzXblOGgw6bR18sT2Or4mPmnUZLDroF0xyucGlfFQZS2i9Rr67LyIoupdxaVdnGZ7fRV
         QnaFjgErSPywfbNsxycRpWokZ9nDabOgkro96NiGc70up0QbyOD3eZZNMeT4qcfvwLOD
         Fa2KX7W5zXOxtW5RSTfTsLDjc8B+vrS6/c6tm3CLyEEfa7yb/ZWk9829llQ5leAcI99l
         Q0pDYWTMjg3zLhABVxuyGUkiCsEcS8yhOBeeX7AoD9LnrygNwv+AeYCMQYryZiy93kvs
         hz1Q==
X-Gm-Message-State: AOAM5330arMoTdh+favO3MNYZxmR3n8xoMtYh2b3D33z9wr9H8X18EIq
        RoqvgItbhueJjfRBE17irrmO
X-Google-Smtp-Source: ABdhPJyTSBootufK4YPrKejqjZ/YePk0bzcLG6ZklPCMT8VwktRgk3JhXnkde3psz0Brbd/03ES3HQ==
X-Received: by 2002:a17:902:d510:b0:149:3b5d:2b89 with SMTP id b16-20020a170902d51000b001493b5d2b89mr7227064plg.97.1641959764056;
        Tue, 11 Jan 2022 19:56:04 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.172])
        by smtp.gmail.com with ESMTPSA id b25sm775028pgs.56.2022.01.11.19.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 19:56:03 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>
Subject: [PATCH] arm64: dts: qcom: sm8250: Fix MSI IRQ for PCIe1 and PCIe2
Date:   Wed, 12 Jan 2022 09:25:56 +0530
Message-Id: <20220112035556.5108-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the MSI IRQ used for PCIe instances 1 and 2.

Cc: stable@vger.kernel.org
Fixes: e53bdfc00977 ("arm64: dts: qcom: sm8250: Add PCIe support")
Reported-by: Jordan Crouse <jordan@cosmicpenguin.net>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 6f6129b39c9c..8a3373c110fc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1487,7 +1487,7 @@ pcie1: pci@1c08000 {
 			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
-			interrupts = <GIC_SPI 306 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
@@ -1593,7 +1593,7 @@ pcie2: pci@1c10000 {
 			ranges = <0x01000000 0x0 0x64200000 0x0 0x64200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x64300000 0x0 0x64300000 0x0 0x3d00000>;
 
-			interrupts = <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-- 
2.25.1

