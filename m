Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3181361773F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 08:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbiKCHK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 03:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbiKCHKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 03:10:05 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B3EB03
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 00:10:03 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k5so817287pjo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeYJbVuqGDHsqyzLjF7twJNYqifLyyH6qytnIHxb/r8=;
        b=ok6MJ8U8j3Ib/3c3DFsgqYs512jMCHBXC90uoLjbsNw4brDmgL6WGJnQmP8NzBw05w
         OYqiVx5SrGdUB/PJJeMCQuGp/ytOlxQM2U4LStKDfGNVAeh+Ruifm3a6ua8/iVwqxF9O
         wfidHGKY8mejBmqgOLT01uCW0GLP1nWp9A2fH6GsqEeizoj/Vy0orTh5gEi0ugHc2QgF
         LIWysYAKJ0BD7mSQWPwNc7BQ/RweiJxQvwMrTriU2scSiJPsa283BL2UhUgmbwCwqtLx
         KWiPqOvoob6N6Aq96wvFHfczjabY7uTSyvcnwL5Xm2xjUkn5xRVxaZvzzVE1NVOcnP/o
         4qJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeYJbVuqGDHsqyzLjF7twJNYqifLyyH6qytnIHxb/r8=;
        b=w648z3jKjj04phPPPfiM+LTJEbrvyfsqnM2qXycCVKiToAxUXp5ZN2z+h6oC4mfcsf
         HVr7Icdbu8CrHv6XO8qQbVvF0Qf/jDAlVO5os9fl9kPn64CfJATyXzufNZ3kekelw5ET
         1ixhwyfLu9XW1BwFx/DGlpJsEczMWw5gdpPD6f1mTDh6oH2DykdHusnUiDMFRNFFwMUr
         u6NFxrrJVcVlHpf8g/M6y9KYZjWRWuE/pW4C5thTkNqS8yaSROgSUdCKuv4X9tNgK5Kq
         MPYohoMkfGf5gcZZr35fgyqo1zwzwMNswFxhP+tsyJ1JlJEQCs5Eb2lkdIqWdYrghZY9
         MQZA==
X-Gm-Message-State: ACrzQf2Vt+uEp+3oK1hhpVvKfenYOCfW1Ss2nmln5WEp9d+r7NemnD+K
        jSF0S4FYmpDi1sKn5R9KGoNY
X-Google-Smtp-Source: AMsMyM7UQRq6LAbXGQYzFOlC5kKEyTXF5VB6Esa/Ig/9liB2l3kmJ8rROJCDU8/I0JLtrK+idxqiHA==
X-Received: by 2002:a17:90b:690:b0:213:d98f:ed6a with SMTP id m16-20020a17090b069000b00213d98fed6amr21353026pjz.37.1667459403119;
        Thu, 03 Nov 2022 00:10:03 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id s9-20020a170903214900b00186748fe6ccsm9451244ple.214.2022.11.03.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:10:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 06/12] arm64: dts: qcom: sc8280xp-pmics: Add support for TM5 block in PMK8280
Date:   Thu,  3 Nov 2022 12:39:05 +0530
Message-Id: <20221103070911.20019-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
References: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
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

Thermal Monitoring block ADC5 (TM5) in PMK8280 can be used to monitor the
temperature from secondary PMICs like PM8280.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index b1cdde2f7861..f2c0b71b5d8e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -85,6 +85,16 @@ pmk8280_vadc: adc@3100 {
 			#io-channel-cells = <1>;
 			status = "disabled";
 		};
+
+		pmk8280_adc_tm: adc-tm@3400 {
+			compatible = "qcom,spmi-adc-tm5-gen2";
+			reg = <0x3400>;
+			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#thermal-sensor-cells = <1>;
+			status = "disabled";
+		};
 	};
 
 	pmc8280_1: pmic@1 {
-- 
2.25.1

