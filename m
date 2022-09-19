Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880AD5BD70C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 00:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiISWPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 18:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiISWPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 18:15:45 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0354F19D
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 15:15:38 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f193so698225pgc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 15:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ULCMcZ+Weq8ahgDLA2SKhRRxvxoclcBLchkSc7jAqNM=;
        b=jI+49eoEG/2Qtd+35UCQhAVS74uxrxtiXIFxaVL/4mvvDUMyQAwlMVCJ3hHL/AFlI7
         qTFPV8cQ90E5BUX4h0V0qJG0ZDEqm7K53MPz7ERCy7HFayZe+TUdiR5kfiPpxsTKGtS4
         Biy7X53MJohEV2P8x2iTMnydPwrfB2osxpbhCd220xaLe6DeZTJINAs1T7Whhu+YHA3q
         Z7hM5VuaRlwSVH+eyp21VMr+yxVr24fATHAhDCV/1r/xD0m0d8QqVMm0esVl6XJ00t08
         rKlcoX8GydI3wxibNF4TOn6mKEiEtL7ykw3hHOcwZ2EBpDI80zG6eBOaBU59l1zXNKHG
         o84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ULCMcZ+Weq8ahgDLA2SKhRRxvxoclcBLchkSc7jAqNM=;
        b=pLyFqIEvShQyjNFfeCiJUjemRXKzQhjciNRks5ZF7w7u7Oo9ns6pnhGUaJ0R7YnA9Z
         zSwavKrNB7OheUsy4qEZsQtVlGqCs2GZsewLvwfXSaafT86ulcgHo4cWBNjZdCVQnege
         KGEzoiP6MJx1dFUwOFbh6BVD5Gliwvb8H5zr34DFn70oan90xBGu7YxFtipsekfo8Dph
         i3y84AIwxoBsw/R18H0kKwpTPC7zvTQNjnrhUo/MjDFmdyvhrLK8+8/8jICk7y5sdMw/
         Q7KZmNeUdlVBG+mQCHeJUUQHf09EXzjXcCqQy+VZ4SzJgvnjky6dvh0AVlChqQ/bTAFb
         pi/A==
X-Gm-Message-State: ACrzQf1HhsnYTiM6+m13ELRjByUQClDzTmC7jAntlcv1DocRxIeecQf1
        dY2+ATsDZg2CxFsypZu4TAOEiA==
X-Google-Smtp-Source: AMsMyM74rQcRBLSqdZCMeOtVmNfkAtXPu7rDOxknVQcOrFlvyB/PYYjJ0F7sTACAHxOBIcTi9CT94g==
X-Received: by 2002:a05:6a00:ac6:b0:530:3197:48b6 with SMTP id c6-20020a056a000ac600b00530319748b6mr20478986pfl.80.1663625737218;
        Mon, 19 Sep 2022 15:15:37 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:6535:ca5f:67d1:670d:e188])
        by smtp.gmail.com with ESMTPSA id b22-20020a170902d89600b00176ab6a0d5fsm16198966plz.54.2022.09.19.15.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 15:15:36 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, thara.gopinath@gmail.com,
        devicetree@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v6 3/4 RESEND] arm64: dts: qcom: sm8150: Add dt entries to support crypto engine.
Date:   Tue, 20 Sep 2022 03:45:08 +0530
Message-Id: <20220919221509.1057574-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220919221509.1057574-1-bhupesh.sharma@linaro.org>
References: <20220919221509.1057574-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm8150.dtsi'.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index cef8c4f4f0ff..6e21352a158c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2041,6 +2041,34 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x504 0x0011>,
+				 <&apps_smmu 0x506 0x0011>,
+				 <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8150-qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x504 0x0011>,
+				 <&apps_smmu 0x506 0x0011>,
+				 <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
 		ipa_virt: interconnect@1e00000 {
 			compatible = "qcom,sm8150-ipa-virt";
 			reg = <0 0x01e00000 0 0x1000>;
-- 
2.37.1

