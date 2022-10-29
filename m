Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28F9612068
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 07:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiJ2FQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 01:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiJ2FPn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 01:15:43 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6441974CB
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:35 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id f140so6469543pfa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssWG2K/L40ECA7RFYZd0Ssg9F64AzTozxaoR5gGuJ3c=;
        b=atqrHA5b6gwjGelKryJPqzyTJ/MjFn6RwViURNGVYZkpPqP1WmK64iKvymNtbOQlnZ
         mbKjZPP+2vpChHNpxOzyySCMtpI5epMG62Op1NivSB8eAPfiHiEDKseMjyCrLlv77Yjt
         GOVk2vklEAdyMrqx4rJ981aK+5zI13WoYld2Z6MSweGc/avsJG7gL7jj+p7zhB5kQwd7
         S+rSk1uN4Orc5P9eoOR4Oiz3F2C3UINaU5Jvr/XYji1FvzcqtJb43FGCFYu3rhyhXub6
         B6at9pHCGdJhjDXaVmsrijjlm6O7SIsGuUbwmw/kQd3gcoKs4GG5ai7YSv/0ZYA1vykj
         uO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssWG2K/L40ECA7RFYZd0Ssg9F64AzTozxaoR5gGuJ3c=;
        b=JSlNiGtmQxDWgjtMz/78kAOwJhGoBPjMlvDDWsupfv0EezVCulBnoaQNoRpACK1lEE
         py69EtVOZ+KxkDSsSWZ8mmF2ZLwm2nj8BmWpsk8c760uHk+C8tMHJtQ/+qAxBhmEfkmG
         MGZBW6GXy5mlu9mvV+pzw8vO//QR+NAsbGGrzQf/0OFkNouaRFr1dY5NMjbFsiAC/BS0
         roRjM19GTTqQ7BD93cJOrBFSz0zFUKUcbUxdZlHQu8vXMfI0K2W2QdasICSulWLZSBAY
         pdKp3HOh1QscygfTCIecmP4eQ3rMsZ7pDID6XSkgd1B9zEbyC2UkShHyykRkh9U4HHcf
         JmVg==
X-Gm-Message-State: ACrzQf30GO/yU3CNfMcD1e7dYSVEf3jSAUiKIEu8zaiRJ2jzDr4fAA9e
        mg37gm03ACAMQQvPlAxRXYok
X-Google-Smtp-Source: AMsMyM45JM3p1b99TdtBq2OT4YrKkPggdXFEOeVTDglVAcZi7VCOqtTii1I4/mPuGvU6kKMfGQHb5A==
X-Received: by 2002:a05:6a00:891:b0:565:85a7:a6e with SMTP id q17-20020a056a00089100b0056585a70a6emr2653028pfj.21.1667020535231;
        Fri, 28 Oct 2022 22:15:35 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm363150plg.100.2022.10.28.22.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:15:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 06/12] arm64: dts: qcom: sc8280xp-pmics: Add support for TM5 block in PMK8280
Date:   Sat, 29 Oct 2022 10:44:43 +0530
Message-Id: <20221029051449.30678-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 3c56e4cb5b5b..6f95743bf87d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -84,6 +84,16 @@ pmk8280_vadc: adc@3100 {
 			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
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

