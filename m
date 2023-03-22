Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA9C6C472F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 11:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjCVKE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 06:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCVKE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 06:04:56 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4181234D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 03:04:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso12646237wmb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679479493;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnKv2/0pLj+u/2/hsOcIOqSmXG2xDHS6flq29wa6s2s=;
        b=F8ELitklREwxk8RrLEx0O5NZULzdd7V4z/GmZO+bCtXw4VeQbSTAK/v+zUeW1350qv
         ms/Mtufw3M80BA1WpJiegQoDnkhzUDoYFShFn1+Hn8qxLfAKrKAYVKRB03Nyoa3IxIHk
         RwfO8wyvK38ZIoB17haxH1/TkrlziLhB2aqbFcfVuBxvWIoyL+tvyBZLW0w1FIya2mNe
         YTvHrSKERFU+t5/YLivsXDAqpKpPhC3+fqV57IP+H9+EDEakqGMcrkxdvzA4f8K9Ehju
         22COx57MVCZrc5MYklNuZHQPds7Ck9g7+Gl5LWZpO6M9cWpHeoC9P0tGDlWYYtm4Slb0
         02UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679479493;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnKv2/0pLj+u/2/hsOcIOqSmXG2xDHS6flq29wa6s2s=;
        b=NBQkqo8EAjWa5pwBzSGhphlrghLUNvXEKLk+14bAsUfdkCG9lpQgc8Bw/Wp/EreE5R
         6thvvp2Qc8S/1e6IF/rjJ634CoGS1XHmfzGTr4I2PmHif1DkEFtmyb+2Rw1Yve5EmbGV
         Cmby9OHSA2Y4sLBlq9UYqR51keSCa3X/bOK11lI8uONUUJEFRkm91/Yq/+QYa4h3aCQM
         VrDYs9sl0IOnnKl1XLVKjvkZDUzR9nuKePbgNlgMz+rFlSivR8JlKAgaw/PQnBNpiHnK
         iratkYdU+E+T/H1yU6y1Cn6icrGcxqOrndjbJj3K7wzoF2rVRncclu08Y0Z3K43SAUkQ
         ghiQ==
X-Gm-Message-State: AO0yUKXhhtD5cyce/BMXq0ZIy3beZLPj04sbsawPibaSzys8DQKgLy8P
        9ZYen58xUq4wxQ4VCvy5lTNXmw==
X-Google-Smtp-Source: AK7set9clMY5GiOSQ04VrnVX2Tsg/u07bANE+4maY3IPCcdgGUhSgdNqwho4UFa7wQpOTy3QfObmIQ==
X-Received: by 2002:a05:600c:d8:b0:3ed:3cec:d2ec with SMTP id u24-20020a05600c00d800b003ed3cecd2ecmr5320069wmm.15.1679479493211;
        Wed, 22 Mar 2023 03:04:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c4f8500b003b47b80cec3sm22551299wmq.42.2023.03.22.03.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:04:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 22 Mar 2023 11:04:51 +0100
Subject: [PATCH] arm64: dts: qcom: sm8450: add crypto nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230322-topic-sm8450-upstream-qce-v1-1-b76eaa1824ff@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMLSGmQC/x2NywqDMBBFf0Vm3YEkWgj9ldJFHmMd0JjOqBTEf
 2/o8lw495ygJEwKj+4EoYOV19LA3jpIUyhvQs6NwRnXm9453NbKCXXxw93gXnUTCgt+EqEZchh
 99jZGC82PQQmjhJKm9lD2eW5jFRr5+w8+X9f1AzhK2VWAAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions
for the SM8450 SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7c1d1464a1f8..d7e0a1993558 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4084,6 +4084,34 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x584 0x11>,
+				 <&apps_smmu 0x588 0x0>,
+				 <&apps_smmu 0x598 0x5>,
+				 <&apps_smmu 0x59a 0x0>,
+				 <&apps_smmu 0x59f 0x0>;
+		};
+
+		crypto: crypto@1de0000 {
+			compatible = "qcom,sm8450-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x584 0x11>,
+				 <&apps_smmu 0x588 0x0>,
+				 <&apps_smmu 0x598 0x5>,
+				 <&apps_smmu 0x59a 0x0>,
+				 <&apps_smmu 0x59f 0x0>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+		};
+
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8450-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;

---
base-commit: b12b871ec9079b0baefa69f8a869712682d16020
change-id: 20230322-topic-sm8450-upstream-qce-04daf8d81bb1

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

