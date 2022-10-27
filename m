Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07CA860F046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbiJ0Gbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbiJ0GbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:31:12 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944611633B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:31:04 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so5321232pjc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9zfCoPbv1xIgqLZ/LFbFJSfu67nIjBlVVkKmd65qsM=;
        b=is8QnbnoChevKHiay+bv5Egd+bDsQhPC0aq/P4NjR+ALCycC/OB1OdwDPfPyntNJc7
         UiheyUL7BK+kynwb3kLtygMqaeaYJvL5FRP5DzFRGxJNaPlhHFqvCiOx+pFopgPjBWM7
         BXTXwmkAIJ3YG//Wgr4rrK+f41MChPvZgDOncNAazTphhD54qDyEE7joSCG9PlXllAfx
         QY0GxWK1smipMMGlHKIVkIqC0LDI0JCqkZ5K/O/zu7U5+Y7tW0jGSfcbXtS2bkM046+F
         JEuSLYoXF4m++1qHCb+a99lBt37sjPiXV6AvEM9xQdbieHAbuHNNREemBpx4qX9A54n6
         p0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9zfCoPbv1xIgqLZ/LFbFJSfu67nIjBlVVkKmd65qsM=;
        b=v1z5ZKPkiElbdrsi0uXQ1ZAjXhQ2rSJaaq5R/SKIyStm5/toBhL3hGcDpaMRO46jXz
         zXdB2wlZmUt5w0Jig8uDZfn8oAWG30ycvA5At0eSt/9ceuERXQJ5VSx/svycVYyfVfEN
         pRifv6TChvELg+Yda9lv32fUXbtCodSofxF/vMuxiGgcYUZse3SjckpU9hoobwNki/KG
         FvGXZZZG3Ua7IZfcukWvy8FepQS3Pk3A8Zbp4zNaouWzpCoDJR1SiKaZcnPOC2FsXxDe
         b7xJeBVPNx5ERDkyN1nOYXHWP9gotHOGBwuWgrWIlVaKLcj+maESiJCiUI1ECQwxEnB6
         0ERQ==
X-Gm-Message-State: ACrzQf3UWJiSgt9IoFrzFt4hMN4xM38riF7oLFNvYteblkAjO+87Nxar
        ZtckRzw9xS5aNcYPkcnp3Rm/
X-Google-Smtp-Source: AMsMyM7Q/eezkojdGLTN34Rxc4KS+ssNZthocVIq6NSgFAtGAAaGSNRHdkULICxqAmVEsDKc2oVvAQ==
X-Received: by 2002:a17:902:e790:b0:183:88dd:1d30 with SMTP id cp16-20020a170902e79000b0018388dd1d30mr48171770plb.62.1666852263725;
        Wed, 26 Oct 2022 23:31:03 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:31:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/11] arm64: dts: qcom: sc8280xp-x13s: Add PMR735A VADC channel
Date:   Thu, 27 Oct 2022 12:00:05 +0530
Message-Id: <20221027063006.9056-11-manivannan.sadhasivam@linaro.org>
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

Add VADC channel of PMR735A for measuring the on-chip die temperature.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d300d217fdc6..babf594384f2 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -250,6 +251,12 @@ sys-therm8@347 {
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
 	};
+
+	pmr735a-die-temp@403 {
+		reg = <PMR735A_ADC7_DIE_TEMP>;
+		label = "pmr735a_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &qup0 {
-- 
2.25.1

