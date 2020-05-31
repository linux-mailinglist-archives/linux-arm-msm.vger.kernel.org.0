Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BA01E995F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgEaR20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgEaR2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:23 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4817C061A0E;
        Sun, 31 May 2020 10:28:22 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j10so9135474wrw.8;
        Sun, 31 May 2020 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M99xapCK77TQBGDLImzUxTVYpAgAInEST24y58JcXcA=;
        b=pTQGe52iccLG7iuo/QdTOa7D+OSDTDHynohwseKgP6zuT5GGjefq/G9YTk3Muh3aLR
         /06DEM1SdYvuMPLyrfM51goynX8HBbjma+kho1q/OvrIz8AbQK4dNKQPyTAKwuEJU6qB
         LcNcT7kx8laEIxwIVa6+kJ/D/9KD7b7j7HJStNOGHsjEQ6rUg4M5obdq+7EWHloARsOi
         3y1H7H/YbrNguxcXb3w2NiKag6RiavOMauR4EISjjjunwVjvBPnm64goiRQ4ecE2Ogyh
         J8VVX0JmJwLc2Fw1AO3okeTOKJ67Hr/O8QlwzXGh4PMoIogRh9xNO5pMFfqUFijNDulc
         tLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M99xapCK77TQBGDLImzUxTVYpAgAInEST24y58JcXcA=;
        b=mTvaeH2oXlhwtC6eUymJYFolKMtNERml2eonqdLij7iAQkdH49fDZ+9ARpIaDhs19y
         nEKilWNH3edFOerdQSiuL8k7yH5vC2BYGFQZS3iF2r1t6LQafvoWfo0NYVDocTDdXIr3
         vvbvkmI0NDRTgp7vjjZ/A2CsMHWfDluAE8AtkDvvCxJ8LgeTBxAW8/fQ0K4WrCq9URM7
         eA2GBidjnYbwVUy+v8pfChXR3hlzS+EFewUkrcQBbQE5GjIzaAfVYMBCLkqlvYIzDHp1
         olP/rkRpkitMtF+kS1Ak4lnP0kjOgk76LiQwO4nVuT8z3bJS2fsJ4zrnSHFhZeytD8LR
         1/Iw==
X-Gm-Message-State: AOAM531RUflly5zu+z66n7KMLxRULNK3ZdaJkGYx1ShGBcthGbWkNEBE
        HMSV+NyJhsMxNclsRdE4dAM=
X-Google-Smtp-Source: ABdhPJx7uu2tMxuFo0q87vDz7F6CQ24nwBj9mCqRHFhigMvaEAX8XQSlUms2UKLUhU1jSFLfkd88Hw==
X-Received: by 2002:adf:c98a:: with SMTP id f10mr6677167wrh.329.1590946101663;
        Sun, 31 May 2020 10:28:21 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:21 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] arm64: dts: msm8992: Add BLSP2 UART2 node
Date:   Sun, 31 May 2020 19:27:57 +0200
Message-Id: <20200531172804.256335-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit enables the usage of a second
UART interface.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 8f7cdf2b9a1f..ff745905525c 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -279,6 +279,16 @@ blsp1_uart2: serial@f991e000 {
 				<&clock_gcc GCC_BLSP1_AHB_CLK>;
 		};
 
+		blsp2_uart2: serial@f995e000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf995e000 0x1000>;
+			interrupt = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
+			status = "disabled";
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
+				<&gcc GCC_BLSP2_AHB_CLK>;
+		};
+
 		clock_gcc: clock-controller@fc400000 {
 			compatible = "qcom,gcc-msm8994";
 			#clock-cells = <1>;
-- 
2.26.2

