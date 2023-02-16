Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087886994E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 13:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjBPMxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 07:53:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjBPMxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 07:53:08 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3CA42BDB
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:06 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m10so1752329wrn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOyfaP0VQoPSZZRozrnt7Rnbt4hWMK3D74BD6fdRa7c=;
        b=4XnN77q3TiQ1taMtkjTpChQxrfvzDqmWliLPFdJNCLzLB6VqwCqlSSbFkwuJIu82/V
         C4qCDiSUAHlf9fBlGvHBkXoc5owwer2wkzXVbe2N/5nTUD6pqeioJB7Jxfv05StIACpw
         8cS6ae5BeJGoY02zllpKToEUD3yVgzbVkFF2Thqv8A0U3BcURbFBzN4aLkDAhXqx2ON5
         QqgELCKImB94ejex0/x4J7folAM5UNl/0RNQ55mj5PfjoHIK0wKUR6WLNyANh+VNM36u
         zs+6sIoS3B9ZqcXPQuvynIaj5pcNbaVZ21fwJ+C3dqgjAthqAn9r5EKgVpnb6/+qyaFd
         nAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOyfaP0VQoPSZZRozrnt7Rnbt4hWMK3D74BD6fdRa7c=;
        b=gArHbRS5QhSK/LPs2d3p9O9AlmtCtbO54P3Z0T3AnCnDNt04E40yZTha5XFh0Pgmsz
         /TdPMXHteY6RLrkKUmde1GfLyAmtwHwd7ElvOh3FwfFSPKzQ+U42fU0R5pblVSaE3Ff+
         nqn31sS7qmeRfEXZJFAye1Y7TyNiOQ3wQSZ0s1n8Ejs+AF61quOcsxS19hZT7J+6FHF5
         0wzAX6jgBNkbiDSy8EI+6azy6cueG9Lggfywyj6kPq+Wb3nZJWpoCxUt/ZpeBfhG94xW
         w5Z82idZub2Hs1maoFTR9n1l6+33C1X8KHxZE6pnT7j6pbXD/d8g98KURmvDv/M16OrK
         E3dQ==
X-Gm-Message-State: AO0yUKWfkrnnpN3dgDXU/d29LxFv3pVpoaP1BWsY+4PyYPXSvw2Lqh//
        GbnDeXA/9f6kuuCUKaUgTjAvNQ==
X-Google-Smtp-Source: AK7set9YMQWnHUBbbfQfcw7q7A8wTJ/SKidpIupgzyqYku5y5w76qNvVYogLjKW1LlcXsf67s8OWvg==
X-Received: by 2002:adf:fdcf:0:b0:2c3:f026:907e with SMTP id i15-20020adffdcf000000b002c3f026907emr4805826wrs.10.1676551985150;
        Thu, 16 Feb 2023 04:53:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b002be5bdbe40csm1453292wrs.27.2023.02.16.04.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:53:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 5/9] arm64: dts: qcom: sa8775p: add the spi16 node
Date:   Thu, 16 Feb 2023 13:52:53 +0100
Message-Id: <20230216125257.112300-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230216125257.112300-1-brgl@bgdev.pl>
References: <20230216125257.112300-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the SPI controller node for the interface exposed on the sa8775p-ride
development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 4666e5341922..eda5d107961b 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -503,6 +503,27 @@ qupv3_id_2: geniqup@8c0000 {
 			iommus = <&apps_smmu 0x5a3 0x0>;
 			status = "disabled";
 
+			spi16: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x888000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 0
+						 &clk_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_APPSS_PROC 0
+						 &config_noc SLAVE_QUP_2 0>,
+						<&aggre2_noc MASTER_QUP_2 0
+						 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c18: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x890000 0x0 0x4000>;
-- 
2.37.2

