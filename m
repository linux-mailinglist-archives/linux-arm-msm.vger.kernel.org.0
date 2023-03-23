Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9B06C7428
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 00:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbjCWXiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 19:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjCWXhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 19:37:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D402E0E0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so69088lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679614665; x=1682206665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCsZad9X/4syLP5Vggx9hok5CS9phhLBm89vT4ELF4Y=;
        b=Am2Sw0F2UcRFFO/VT+AhylPotRXwCbP/ptLNEw2L6kZOnEiLaMccIT4/hvTQxwMHLx
         4lnnMOXkMPcHaAs7OBbyGyXucx4fgJqg73OgjNlhSvDADyr2/Glk+GRCfSS5AvQRdFlP
         ugaZIs+xA2uQCRV8hCb5XJtFcq+s58oXfGrloiOFyhgZpiqLNaNl3n7Dgj5V3kfKamoa
         9H04k6p1Cir+BYXF1pcmkEn0drMrjrRpcS9TA3xM8nlCowFxhQLWQYheNjgDsO+Q52Te
         /4jAbGrUwn5+mpKLoIKCXOc5MJM5KLNMpFYQWW32qN0jhUYedPoDrrtpEnJ/t3VOOYan
         F9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679614665; x=1682206665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCsZad9X/4syLP5Vggx9hok5CS9phhLBm89vT4ELF4Y=;
        b=DN5UOth24nErZUyY+kr65E2vT5ujmBqkkti7tbKOHHFLEfQ1nMIuNB1lheWywHM2C9
         0G1dwxXEIpW6oUo5FjvXKsZBcut5JFVjZ9+ihIym7QlqKJGnv3zXII6KMAnNlCAVULYy
         ABagFRuFQFVyFtYKVCtNLqE4yKdPKHm96OIPWgHy0IxNNMQD3+AT42MzJfad0CFhfUD3
         GrVZMcRCMEvw+r181yHhCvOJBqnWMkyQ4CMU34WyF+8auv3HmPKb+M5iHatyt5hoqIz7
         0+jJVnDQQeDsndTgBmLL92PGr4FpVn1P1M2x6UKMMAoLcxRMgIz40EKJzqVv6HQPGssA
         yy9g==
X-Gm-Message-State: AAQBX9fJkn4pUDHUjGBE/fPK0Cwl1XxLkmcYy4ETUQp8+w9xJoVn5ybo
        a1+K5tYAXvRQU8VqHeEXJlESCQ==
X-Google-Smtp-Source: AKy350b0uRDsG0Egt/nKDBTPMgykgkHTr0qtr9WmkQhZ8QpVPrTOqdG8/sU0qU82wODZqfbG1gFGxA==
X-Received: by 2002:ac2:5961:0:b0:4e1:f70a:3b04 with SMTP id h1-20020ac25961000000b004e1f70a3b04mr75636lfp.4.1679614664970;
        Thu, 23 Mar 2023 16:37:44 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b004e845b49d81sm3105264lfk.140.2023.03.23.16.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 16:37:44 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: sm8450: add description of Qualcomm Crypto Engine IP
Date:   Fri, 24 Mar 2023 01:37:35 +0200
Message-Id: <20230323233735.2131020-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
References: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
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

Add description of QCE and its corresponding BAM DMA IPs on SM8450 SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index ce4b7d0a09ab..228c26fb9003 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4081,6 +4081,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <8>;
+			qcom,num-ees = <2>;
+			iommus = <&apps_smmu 0x584 0x11>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8450-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+			iommus = <&apps_smmu 0x584 0x11>;
+		};
+
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8450-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
-- 
2.33.0

