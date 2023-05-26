Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FB7712D47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237672AbjEZTXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243809AbjEZTXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:23:24 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7F41A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:23:15 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-52cb78647ecso729852a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685128994; x=1687720994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOhQfsJK5dTieFAHpndB0sp0nugrzVr1VK8sl6Is5JA=;
        b=TH3DzXklVpoQLcvmbEHgOMUwYCSXzJn2RotIMOVEnaSCBK5DLHrLNleol3LHbsl8aY
         erU8ZFwyP46nnAPJkfJBG1orX/i15p0f9kVnbRpSAby+UUB3GNMVn8EzPtZ1ZQStGRj7
         VVn5uOGKMDZahEjOU8Xg/88CJeaR0RuP7qYO7AhSOqGM5t/fV4TWvi0bM4pwlbw1PLr0
         o8VAlAgqPsLdOaonmaxCY+IMJ8fmu0/H14+EaW52G9P1qnnqezlAjg5ff7d+atEjgVx+
         UuPfg9l/FIp6z8zPo12czfN39oI0vhXSj/axCiC++aCv6aXjqH0M3tjMJSr7h6rme5/Q
         ejKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685128994; x=1687720994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOhQfsJK5dTieFAHpndB0sp0nugrzVr1VK8sl6Is5JA=;
        b=Dn/Sx46hQbEsP/STxrCAPN3CU/0q0sUPbQqtGUO8+Ehq98E5gxdWVFBcHHoZqQAoMw
         LwXN+PDRJY+c5raNEHoYCZMJPTUjUBhv+3Ba++DAQWXmoQ0bd4+pHZp2fUz4ymsjGBgF
         5LmeZWfZhrH6EDXYjUi0CPzv79W0KEImrjtPWaJmIVPWMAlht+llJuIdycyBPZeVuJCc
         6ed79dhLbcbf39/ZeVwEDhBiPdm5Re8U2qHPOyX31+EqKVW22FYlbyOI/Gou07obdhPq
         Cfb+iH/EmNyhdQExb5wmdacQrhh9Ae+6M1ZQ5tycBuHxIPf39suPGPmMhysip9gbDBJx
         cMyA==
X-Gm-Message-State: AC+VfDxOdUOv3B3zS9kmmRmErk8q5yy3F5TpoySTeRiNXLnePiYSl26i
        MFCv/Cnh+Yvy0Wx1fgygeXczBZfSYsmIlV0QB10=
X-Google-Smtp-Source: ACHHUZ69KXEBSfoKY/MmiFtjut3HQuddyCGPARLHLvRDsNSz6mtvzwJmpCI/R26bLuCllY0hhGCFww==
X-Received: by 2002:a17:902:7084:b0:1ac:6882:1a6f with SMTP id z4-20020a170902708400b001ac68821a6fmr2794943plk.30.1685128994398;
        Fri, 26 May 2023 12:23:14 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:6990:1a5c:b29f:f8cf:923c])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001b008b3dee2sm1955079plh.287.2023.05.26.12.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 12:23:14 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v8 07/11] arm64: dts: qcom: sm6115: Add Crypto Engine support
Date:   Sat, 27 May 2023 00:52:06 +0530
Message-Id: <20230526192210.3146896-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
References: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm6115.dtsi'.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 43f31c1b9d5a..2aa148340277 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -663,6 +663,37 @@ usb_hsphy: phy@1613000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1b04000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01b04000 0x0 0x24000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x92 0>,
+				 <&apps_smmu 0x94 0x11>,
+				 <&apps_smmu 0x96 0x11>,
+				 <&apps_smmu 0x98 0x1>,
+				 <&apps_smmu 0x9F 0>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,sm6115-qce", "qcom,ipq4019-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
+
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x92 0>,
+				 <&apps_smmu 0x94 0x11>,
+				 <&apps_smmu 0x96 0x11>,
+				 <&apps_smmu 0x98 0x1>,
+				 <&apps_smmu 0x9F 0>;
+		};
+
 		qfprom@1b40000 {
 			compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b40000 0x0 0x7000>;
-- 
2.38.1

