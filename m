Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE386D2612
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 18:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjCaQqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 12:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjCaQpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 12:45:47 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA41E2293D
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:17 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id x15so21023498pjk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gaq2pRYkVNQyPJ3XRF2sgEEJ7K2B6BxZF4eeMfjNR0=;
        b=vhvt1bNb6QkU5yrhCJAjrMCm4NFvN/8wcswt3yPGyH840zrvkgicpCW1ZQXoxRQMAT
         MdCH92JUOLelQIWBSKgBknCJYoQ5imnQb5whSd1kwPDVFK/EQF1mRYfMGTJ7Qp5ZjxJK
         IryyT7WZGDYMZuMFlFPpdDnyznh5qJxCb0PaI78OZBQOPjSjTDX8aZcWkwl5WpCEhkWs
         CSDiIEw9aEyG52ME218fAyNy+ZKGg1dqf1wT2YIAyfb5WG7v42xbgwTWiiABQrIEnhc5
         Sv2vmv60UHnDteGgFv3qS7/jLecVSGBk7AXHANLNnZULTybm6GG6En+D9LVUldeTzCLA
         kaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gaq2pRYkVNQyPJ3XRF2sgEEJ7K2B6BxZF4eeMfjNR0=;
        b=FCykwt3D/9agawLdnQJbAvtH35yAJzY/88v27k6u2oq9QqtH8W1HpKVYrXcYfX/CdP
         4qYgiG92UKejfjGkNE4qEgox9n+C+J9r3En58LG668rqFUWp+cvuY7YAZJBaXVVpX3xe
         7z12MpxRrTmOo9ZXOJcs1vRqCfzV13EXHPSa6gEyY+qNYpsdmFA/IMbT7zcKAEKsXV+d
         SeaUDmhVTbocL4Vuyu2C6877Mu1qsD6GMaF4Glg+lSknTzJrGFf+72uE3TnsP4PUNXOc
         1jd3ImknntcE0jj7YHIBdwcjJPDwLO1fz7H54idtd36Kr+tXPkSwn9VgQuTsGVacrMcD
         E45g==
X-Gm-Message-State: AAQBX9dM0hDEuOed5NoyE0zuDZmNvefJrczNlgBoOaVOoqJ9YI7r9bS+
        XAKmyAoIWWvVRIQKcLIna51nY7ODL8pGKKn8Sdk=
X-Google-Smtp-Source: AKy350bI21QdT3vGDseYMrm+B1KxJgtuQgMR8t6b1p09QFTUm9RPyR3sm1GRQMrQTOHhVza7DqEiLw==
X-Received: by 2002:a17:902:e30b:b0:1a1:7c2b:4aea with SMTP id q11-20020a170902e30b00b001a17c2b4aeamr21635785plc.0.1680281055758;
        Fri, 31 Mar 2023 09:44:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:53ce:1f39:30a5:d20f:f205])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902b40d00b0019b089bc8d7sm1798767plr.78.2023.03.31.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:44:15 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v4 09/11] arm64: dts: qcom: sm8250: Add Crypto Engine support
Date:   Fri, 31 Mar 2023 22:13:21 +0530
Message-Id: <20230331164323.729093-10-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
References: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
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

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm8250.dtsi'.

Co-developed-by and Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7b78761f2041..2f6b8d4a2d41 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2222,6 +2222,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8250-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.38.1

