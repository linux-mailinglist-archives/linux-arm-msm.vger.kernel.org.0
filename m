Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D171B65A447
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 13:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235681AbiLaM70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 07:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235660AbiLaM7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 07:59:21 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173E6DF37
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 04:59:20 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bf43so35168783lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 04:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cAYcl1UGKe53clhWmV9RL6vcqqgiL5NnYIFU0LLaJU=;
        b=d1q4jpuns2Un2aEpgFq0bcfCt1q8WAvIomdXbxSOIzoeosdjKj1J7t0bfViQZcXleC
         6Xq5mycPQ0tsVqZkjqOUn7G9w+dXM6lsCNNslD2mguCFMqlwJSOLQAmnS6f05qA8+3c1
         hfn022LZI7pEW2M8ACAZAYGaUvi1cS0i7+SVIjhYmqauK6koEfA0RG6VBkkKO06Nh4QC
         odJ1o/amiiu0/+U5jUKtwmYlQZpYDwEtPUZ1rbxd2sFs6l+EJbnfITjD73p9+JWNr99v
         EKyuk93jGoKay5AS4cKZD4WhdLRUtFZ98hAEHGQ+Knkg/IEkkG55j6+OZtQLRGBUwICq
         bIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cAYcl1UGKe53clhWmV9RL6vcqqgiL5NnYIFU0LLaJU=;
        b=U+59uD0sqttLEQTdx4rqO/TRmBCeUXDBNg+SVKg8LY7SclZR9WSeBemQnXimsavO/1
         z/zhXqthoyqmIjiHayGqCKTjwbt5LgqAp8PSm7AKDzZsaYcD7XFkyQsEZXaSndiOYRfv
         H81vCRYSVxybqdcT7mCrJRY+lAEaOAs59U1d2AkCNm3qN7EqDBs0YDwM9ZZPcvK+bIad
         +E69tYMVMXGJs5NI8dk+VauH7S6w8tF0L1ATxpvStas89wGQw0wJhj++O8xAasWk+hSD
         vmrTNWRXAQtOhqoMSrLnqNEeHbelugN0Ax+ARmdeP/FBFVAyXrf1883XQwjdTDqGKEAQ
         O5bQ==
X-Gm-Message-State: AFqh2koNzbC2iWM+/2QrPN+0mQnuGOHr62Y2PG84DZaID3nTyRjT0ecY
        FyYE1t/8VXcNY/8c2s/2VSJiowsIo9/ff3KV
X-Google-Smtp-Source: AMrXdXvWbgYwOM5NkjO3bGFkBx0s9VjvJXWj+PbFwKjI4sUyWVsUAdtW7Q84LphOOL9++ZB+Zn3Tlg==
X-Received: by 2002:a05:6512:39ce:b0:4b4:e559:8b10 with SMTP id k14-20020a05651239ce00b004b4e5598b10mr11152166lfu.24.1672491558252;
        Sat, 31 Dec 2022 04:59:18 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id d10-20020a0565123d0a00b004cb344a8c77sm22266lfv.54.2022.12.31.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 04:59:17 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] arm64: dts: qcom: ipq6018: Use tabs instead of spaces
Date:   Sat, 31 Dec 2022 13:58:55 +0100
Message-Id: <20221231125911.437599-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231125911.437599-1-konrad.dybcio@linaro.org>
References: <20221231125911.437599-1-konrad.dybcio@linaro.org>
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

The dwc3 subnode was indented using spaces for some reason. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 17e15a06254f..4b74eee35971 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -706,17 +706,17 @@ usb2: usb@70f8800 {
 			status = "disabled";
 
 			dwc_1: usb@7000000 {
-			       compatible = "snps,dwc3";
-			       reg = <0x0 0x07000000 0x0 0xcd00>;
-			       interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			       phys = <&qusb_phy_1>;
-			       phy-names = "usb2-phy";
-			       tx-fifo-resize;
-			       snps,is-utmi-l1-suspend;
-			       snps,hird-threshold = /bits/ 8 <0x0>;
-			       snps,dis_u2_susphy_quirk;
-			       snps,dis_u3_susphy_quirk;
-			       dr_mode = "host";
+				compatible = "snps,dwc3";
+				reg = <0x0 0x07000000 0x0 0xcd00>;
+				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&qusb_phy_1>;
+				phy-names = "usb2-phy";
+				tx-fifo-resize;
+				snps,is-utmi-l1-suspend;
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				dr_mode = "host";
 			};
 		};
 
-- 
2.39.0

