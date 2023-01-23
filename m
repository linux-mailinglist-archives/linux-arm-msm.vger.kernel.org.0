Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69526677BF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjAWM46 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbjAWM46 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:56:58 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB39F7EE8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:56 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r9so10718394wrw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+F8CiDwyz8G0OX6+bHI7fZ7rrG2Xo0Ih+n0xx9Q0Bg=;
        b=c0uSINS/Sspm5+ASMO9ANiSCqd6XxFEemHp9apFWAxgorJPWaa9JgWSJR+LUlrQCp7
         wtEnOr2UROIm6AzNHv8sSWbQbdopCGlTNXbmfB54YbNS3SjVdrTcXgx+OYlBFeulc2zR
         GOJQHQV3Fk+A354gJEZ4f+Vlg7blyauOWGNH1MQrInH/c9PUntmSrShAtNH1lFxeJO2K
         sDwNmrQxyK0/B1vLFbXuf+DW5FXNTq89RuelzemGnHttbY/J9XWhZNoUWwRDvJVy+WBT
         /nxaftHPo821IVLT/HIv5K87lP593hLEq9bH4nvtm0QO/xUKCseVPSC+sl1x5JdtH+xb
         nx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+F8CiDwyz8G0OX6+bHI7fZ7rrG2Xo0Ih+n0xx9Q0Bg=;
        b=3ntJSrQqVVW78EPRrcoz0/inLVjwlGn7v9iG0CXTOcjV0eXfM0w2FB8r7J5Bm7xJs2
         UDAr/V7JYnf7ImT2wfA6u30h6tzQ00UNtW1b3zSMYYRZ9ep3ifYDjz1Coyoqh9GeiOla
         pg7gxiemfh4Ej9kzpphEVYf/xJUCBNpzmiBApEtjjzoHwituXyt1F4E/Bma5NLeansGO
         Fiw5C2NbGhuaTZ8SGFlIH1dA4GhNMw+xvj+m+6gyziwuD2iGI40K4y/XSkr/FnhuBTPT
         mE0zf7GRR+a5t6V9ohzM4QRC7mXZM+O+xAXzP+x4phPXWqzZD+58AUUbjXVOvf7u9ID1
         vWuQ==
X-Gm-Message-State: AFqh2koD3QuVCwGVwW2RHkfg0eRgjet4yCfLGPfkvi137v23FpM0AMNS
        kOuYZJ0G6Nj7S4QXcEoVkFvO6w==
X-Google-Smtp-Source: AMrXdXsM+9GDR+iqVWtgSSzWkZp8ERQoNPykAzzwzzROI6+jPegvlIRm4w0AEoBxpxoC8GYHVXXlcA==
X-Received: by 2002:a5d:5b0e:0:b0:2bb:e9e6:ac26 with SMTP id bx14-20020a5d5b0e000000b002bbe9e6ac26mr23571007wrb.57.1674478615454;
        Mon, 23 Jan 2023 04:56:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000100a00b00297dcfdc90fsm4569616wrx.24.2023.01.23.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:56:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8350: drop incorrect cells from serial
Date:   Mon, 23 Jan 2023 13:56:10 +0100
Message-Id: <20230123125612.154840-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
References: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The serial/UART device node does not have children with unit addresses,
so adderss/size cells are not correct.

Fixes: cf03cd7e12bd ("arm64: dts: qcom: sm8350: Set up WRAP0 QUPs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 4efe79985186..018f26f729f1 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1031,8 +1031,6 @@ uart2: serial@98c000 {
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8350_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.34.1

