Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063BE6D34B6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjDAWIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjDAWIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:25 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC962BEC3
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:22 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id z42so26613826ljq.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQcvFQ9kHeNL8IHceY65oLWn/T5sUycgBhvoOeDCGS8=;
        b=l8LipmmPEPafjGuO2N3xSP9FojJsVdZrEgkYuzcKJoi0L9qS3edOM6WL76Y7N6FK5u
         FkH87FgUmo6qGbv57vR8qh4nRRm5tgOVWF1yd1ksuElpIjmfuo/UZVdN8QYfYIwR0SXh
         R8SK3/tWR3jNo2zQXGeYIxqCfPYyr5X/dJ5MvchIdMmoCFz26IvCTC3FxHM91BNbY9jS
         CjZer0mdDfk0n76Jh95loIFykDcF18ExMuO64+G5QJ9ehol53V1eBnlZ3oMUZzpti1t8
         tdgYacDb8qXItq2B9pjWLqJxWufWZAM5UZ0fetHREgPruNmV4PxtK/NeZoezkMkLD/EM
         cqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQcvFQ9kHeNL8IHceY65oLWn/T5sUycgBhvoOeDCGS8=;
        b=MiVaxFP2tWgO39LVD+EqAGnirZcyUAOOVkm9GOWoz+HWPlAt1WQvdqsbqOTk5Z+5eg
         YT6chpQE7zFFKRuqZSWCe+OQYBhc/+RpW3KHPWV+H4RqhAKw0t5VDAbuVReUwSQ6eFWi
         RGkInaw7ARY849zSvrYd0dUonro+AAGBUZcFvG+7a9e4iV8aJqJ9A8RNmpV7oq3pboE0
         Lvo2AyJDONyQmEyubAk0DrUD/z9uV8svySWKLiIVCQwRFZfTvQs9/aL4KR+xJ2rGr0Yu
         c9O1y2r/4bT0BdNPIZ6x0gkI6FBzKxooaTuRo1PwYFdp3SJr7Fjv/rTI5b4RnlFzz2MF
         KhwQ==
X-Gm-Message-State: AAQBX9dghqhQwGr8jSghI9swH4ugcAyZEEYd+TVje75agVr/mUNLPceo
        0oDjtd11uwIlUZlOy5RK/86BiA==
X-Google-Smtp-Source: AKy350bvN/CKvFinouzJhGtptL8M6mIPhxsjXlT8iGe9Xvr0pWQAgGSuCYWdsO7ajfzeTotjaD0AHg==
X-Received: by 2002:a2e:9001:0:b0:29f:6fd7:697c with SMTP id h1-20020a2e9001000000b0029f6fd7697cmr9134501ljg.28.1680386902171;
        Sat, 01 Apr 2023 15:08:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 17/22] arm64: dts: qcom: pm8350c: use interrupts-extended for IRQ specification
Date:   Sun,  2 Apr 2023 01:08:05 +0300
Message-Id: <20230401220810.3563708-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
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

As stated in the commit 2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics:
Specify interrupt parent explicitly"), we should not use bare interrupts
for our PMIC devices. Instead interrupts-extended should be used. Change
pm8350.dtsi to use interrupts-extended propery.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index ddfc8fd6bb3e..eef36900dee6 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -51,7 +51,7 @@ pmic@PMIC_SID {
 		LABEL(temp_alarm): temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
-			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&spmi_bus PMIC_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
 
-- 
2.30.2

