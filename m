Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FB460F03B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbiJ0GbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234571AbiJ0Gau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:30:50 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13A5161FD4
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:40 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id l2so425612pld.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uO33+G36OyWr6eCN7oimNs+WJJkzvXiHHivrNLNRVc=;
        b=XCN9Ev67Rcu0zSL1omPQ4ggqYmS5Lhm7a0NMm775ILNkG4WFdGozM5K2fL8G3ZNtG2
         pt9CGnGFX5ib18YNy9SbsjnIZytRpWM8qtzFJ4/xUWd32VyJ7EbE4qjVJ5PeOfcpv3nG
         DmL1NUapmoyc7d6ilmuIFYf4gZXuTLaje4XpUUyI0WBTn9LQ/ZEgdUt2fW4q+OT311sQ
         BetYZ1jG1OsqrIDKrX8iQc078iNesDNQAlTMgYILLO269VxhKC7O+m3E2zmhClZyhPg6
         NNOGhF4eWbQQKRjIyzxFo7ZkUoe24TMDOKpxQgOVqz+CCqhtjUSl9unPsZh0lbRrnY4/
         aW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uO33+G36OyWr6eCN7oimNs+WJJkzvXiHHivrNLNRVc=;
        b=AJvD6lfLc5RG4vxuZXfm67w0Jp0WLLYXmRvi/H/Qr4JLha5fH5gA2eNickhJn/nzX/
         QbSN3ByUnIb7/Itg+msiJ4QLrK5OWQKY/TsokVfsNwBYNHj3VxXvRKFHpMV6yavAifal
         E9duVUg3UXGNvyhEwDTIzf1Ue41CfcO3jd5uclzzAxtcHPUY9WpMyJVFKVNVf9kerVIh
         dYC2Kip6OFPUlnTj44I0G2rArsczBOvM5ubI+pi7xqbYyZznYATzbiGMrpe3M/avDHR4
         9T7ZCzsEl+e081w0ZeqtT1JsXlp/RklUru4ZtjpHbB1jAm8ew6t1aNHeo4K6yGxQ26eO
         3gCQ==
X-Gm-Message-State: ACrzQf0H+7ECAm4V9yC0xcmCsSx65Lg1Ykhy46OhzyGC9YDS0PiCx2X7
        pNVsaFzOS8ERt9xmBq9J7ldY
X-Google-Smtp-Source: AMsMyM6lacqaQ0i0FizRQTnnCWiOAshHJWNl1gd5AMRei0sDAsAast6DY9U20yvOAgN5E5I6kuwNGw==
X-Received: by 2002:a17:902:ee81:b0:186:b1bf:2308 with SMTP id a1-20020a170902ee8100b00186b1bf2308mr16935557pld.111.1666852240257;
        Wed, 26 Oct 2022 23:30:40 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:30:39 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/11] arm64: dts: qcom: sc8280xp-pmics: Add PMK8280 ADC7 block
Date:   Thu, 27 Oct 2022 12:00:00 +0530
Message-Id: <20221027063006.9056-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
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

Add support for ADC7 block available in PMK8280 for reading the
temperature via the AMUX pins.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 4a3464f5e6e9..32086d5edd0d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -75,6 +75,17 @@ pmk8280_pon_resin: resin {
 				status = "disabled";
 			};
 		};
+
+		pmk8280_vadc: adc@3100 {
+			compatible = "qcom,spmi-adc7";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eoc-int-en-set";
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+		};
 	};
 
 	pmc8280_1: pmic@1 {
-- 
2.25.1

