Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF5635A25F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 17:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbhDIPxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 11:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbhDIPxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 11:53:08 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6245C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 08:52:54 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id i22so415044ila.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dw89kT43y0iwP7tVHfjK2c8fjHjZjh3ZGkx92mZsUo=;
        b=vyy83tim/1kFkkganV1nCXVpFNQHJFLUyfRwJ8/rpvAk+qL1HauYxSlbaW6KEnyOUy
         9i2twFrfFikR6jjUNqa1HauKGX/E2AZmHWwV/dPV9ujXy7Mv7QJTr4JkN+JZNMKr+mVH
         i5AKTpPfTv2kGJrxj17Mt6MnI3dYHsqgy2PMrvuUrZvM6jp6mv12pDeiRQCnww/pMLhJ
         aRanrjxtAm9HpI+7cN+8naBiv7W/Lxnq5Qc6LhKsAzttPZSsIL+FG34AKSEVTgAMdKUT
         HsPGie6WCPHWg4pQaRcxlrHPzmdMWKhvfO/zY+zlzUBrQAa+nlfGE7YKL1cUdEChHHmX
         uTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dw89kT43y0iwP7tVHfjK2c8fjHjZjh3ZGkx92mZsUo=;
        b=engJQbXFwFOxUOfuo2LfnRU/6u42EOlUtx69AGHNVXtXAX7Lg2a6HmN6vdOnseq/zN
         Tob8oZa0zTFG2rkFVjNjjr8IikfQRCRbYlxpHbguUuG8Muo/mdRJReYHiE2g8q5ntl3F
         XoSWiUO8Lpb+zl26NhS+aFhR0PCzScM9s0pRVsPjWQ7rKak+kkPcdtndpnYzdpn4JSXE
         GxMQKeIOSNVbPTqqWkbYa7yYGjgsYUanSTi7vTtARg9/z7L9302DvO8YzGfi5Zs2VRW3
         6TUha71ruCg0PSOA0+kaBqqMVv+idwF0p8euoKjL8oGm1KBAMts7SOZRal8PgAHLk9TQ
         PWcg==
X-Gm-Message-State: AOAM533dsSijBCT97FLJg6UDTVvNejuED52YmaBxyxwTE9V0ziTMSfNh
        aHRXrtgdVSUInDI4+PwOG+6GInt/PmDesXUs
X-Google-Smtp-Source: ABdhPJywblXbxYPq4FTyBC85fSG0JwH6jwcI++TM4tDh8Iua7oW7JZk9pNJoKN9w5XEONBK8Amv07g==
X-Received: by 2002:a05:6e02:198f:: with SMTP id g15mr11783408ilf.200.1617983574302;
        Fri, 09 Apr 2021 08:52:54 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id k13sm1296725ilu.29.2021.04.09.08.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:52:53 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: sdx55: add IPA information
Date:   Fri,  9 Apr 2021 10:52:51 -0500
Message-Id: <20210409155251.955632-1-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add IPA-related nodes and definitions to "sdx55.dtsi".  The SMP2P
nodes (ipa_smp2p_out and ipa_smp2p_in) are already present.

Signed-off-by: Alex Elder <elder@linaro.org>
---
Note: This depends on this series posted by Mani Sadhasivam:
  https://lore.kernel.org/linux-arm-msm/20210408170457.91409-1-manivannan.sadhasivam@linaro.org

 arch/arm/boot/dts/qcom-sdx55.dtsi | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index e4180bbc46555..0dc515dc5750d 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -215,6 +215,47 @@ qpic_nand: nand@1b30000 {
 			status = "disabled";
 		};
 
+		ipa: ipa@1e40000 {
+			compatible = "qcom,sdx55-ipa";
+
+			iommus = <&apps_smmu 0x5e0 0x0>,
+				 <&apps_smmu 0x5e2 0x0>;
+			reg = <0x1e40000 0x7000>,
+			      <0x1e50000 0x4b20>,
+			      <0x1e04000 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 241 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&system_noc MASTER_IPA &system_noc SLAVE_SNOC_MEM_NOC_GC>,
+					<&mem_noc MASTER_SNOC_GC_MEM_NOC &mc_virt SLAVE_EBI_CH0>,
+					<&system_noc MASTER_IPA &system_noc SLAVE_OCIMEM>,
+					<&mem_noc MASTER_AMPSS_M0 &system_noc SLAVE_IPA_CFG>;
+			interconnect-names = "memory-a",
+					     "memory-b",
+					     "imem",
+					     "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x01f40000 0x40000>;
-- 
2.27.0

