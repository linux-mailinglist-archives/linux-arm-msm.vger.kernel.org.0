Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C710B1B2561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 13:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgDUL4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 07:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726018AbgDUL4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 07:56:10 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB11C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 04:56:09 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h2so3221200wmb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0FvvhZYz4QlBORpPEtOzbwjeZaLUGECYXrqPFDyA1s4=;
        b=U+u6/t4rlZVRFXmKbFDqvHMmtPGStas35/wvf9CADttDpxJ4L+tZzct1u3yj34l0r3
         63Nj6ok8XEksS1XH4ku0AWsSLCXsfm9TTV930R/yDDgrdXT+4XmPKKuFgsyUNfy3wwNL
         CMtUkaJ5xrUKwEOGp9bUagsqX9YLVq86j0nHqxDw7JcYnzr1Fpk3V1vJ8neOesT2haEm
         S7i34I/6IpzcqY/SNZJCozi0SN5fqqCOA/4Y08ikV84KGMEcWJym2T6snWZes0PWmOi3
         0Hk98JmIyVF9IX92b8Ik30kl4XYCje9ZNDFtQ2jW5OkyCHdtpDt8ZKhHYzU1WOfpFE1n
         7MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0FvvhZYz4QlBORpPEtOzbwjeZaLUGECYXrqPFDyA1s4=;
        b=J526aqzA4a08xn4e3wMGsZZwYA3rgwdHLSLxDiPzEoN1/6AOp3u7vmxYqP/eLexBfK
         k9ymtZOSqp16qnJVrS19KLqwPfUMnpYimyrDPTQALVfS/QHv69En65ZENohzhplyzI8c
         B9g6W+rVHRAWUqUBan5kuZayWYBeyoDOsgd+AYTnyggysCELRBaqPCdvdCMZQYKuqYhh
         uTnCJvO/GXOhYk91rhcbTP68mx6oLfw471Bf9dczIdyk0gXEQMM7jbb6xL0RP1K0uIhe
         vj9x61NyoY5nh+jm6zsVDaPdWjrSccmlMEIImDlcuQmNORjdiMmWhjCoEMBEYhHrhfki
         dxZw==
X-Gm-Message-State: AGi0PuYeV8SJJUH70QaDgD7IzCyCkWQsoRcVvAF7OVDTRFLEPnx45xlA
        vKlYQGgzNV1hkDy6O4DzEtBMhA==
X-Google-Smtp-Source: APiQypJVChJ4zWzfJ0Q+Au8Xd1yJEw4fX2FlhgF+dlfv3gbQOel3wsFH3lkzJw8TPkGkbNhK2eGZQw==
X-Received: by 2002:a7b:c772:: with SMTP id x18mr4766070wmk.39.1587470167885;
        Tue, 21 Apr 2020 04:56:07 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id u17sm4116430wra.63.2020.04.21.04.56.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Apr 2020 04:56:07 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] arch: arm64: dts: msm8996: Add CCI node
Date:   Tue, 21 Apr 2020 14:00:25 +0200
Message-Id: <1587470425-13726-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587470425-13726-1-git-send-email-loic.poulain@linaro.org>
References: <1587470425-13726-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add CCI controller node, which can be used to communicate with
camera sensors (I2C subset). MSM8996 CCI offers two masters,
i2c-bus@0 and i2c-bus@1.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 24a4625..5bd0d8a0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1105,6 +1105,43 @@
 			};
 		};
 
+		cci: cci@a0c000 {
+			compatible = "qcom,msm8996-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xa0c000 0x1000>;
+			interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&mmcc CAMSS_GDSC>;
+			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
+				 <&mmcc CAMSS_CCI_AHB_CLK>,
+				 <&mmcc CAMSS_CCI_CLK>,
+				 <&mmcc CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb",
+				      "cci_ahb",
+				      "cci",
+				      "camss_ahb";
+			assigned-clocks = <&mmcc CAMSS_CCI_AHB_CLK>,
+					  <&mmcc CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <37500000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		adreno_smmu: iommu@b40000 {
 			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
 			reg = <0x00b40000 0x10000>;
-- 
2.7.4

