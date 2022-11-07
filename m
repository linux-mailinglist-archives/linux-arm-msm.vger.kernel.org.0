Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC91620427
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbiKGX5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbiKGX5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:12 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F55A27CC5
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:06 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so10645325wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZlqSGltEqXeKq0QRNA2iPt1zbq8bom5f/XvYE1Kfaw=;
        b=rUq1do5MQ6lhbrQfyV/c0vV2Wcy/LO9IaOSOF2g9hvVJwKxxdQj4xjH7ZohDnbyWMU
         +kJPnykaZZMN2y13R6Kgunw7Hm+Ckq4zxxEOY6nTevh+qvxSFIlbvz9YUrLx6KJ8Rv8j
         jjGqpCnVJt2bTYpn4IL6a2EuFWDnYuqxqFiFUHa0o/vcJPGB1tkvxyuF7gJFQnAyRycX
         gtaXFaBL1917d+Smf8gWGPVYSiQTzv3ghrS8DIlYZCrWr4ns+2eaqzHKqzIGD+jDzLbh
         7fPAn6FBDadTsrlz9g0zt5uQ5mSRMUNqj4K/fMjEoE+c3HRFsl2hgEGJaf6e3+k7YAxR
         XNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZlqSGltEqXeKq0QRNA2iPt1zbq8bom5f/XvYE1Kfaw=;
        b=orkJJi6vooaNmng4fsebGmNwwr2DaCyx7IwRtIHxLPbeQJtlpzfD2S/fz3mLkGTM4E
         EC6Iu1zqNdS4AseBA0znx9qKiF4c2LArkKa1ijw2HwJq8moPL5GjwWNBA455+16qFs9Z
         ov7149P5t/VR+bgq3RjY0Yx0AvbD6W1z3nf3Vjf0WU+8hWZEDqIadriLemTgRyI8mN9J
         HtSa2Cdq2ONumO2L+obvwitgFglmWiqkrhrHOoDnjUs0yKPItNNK3dtCcx6He8be6neZ
         3gddzyXS2/2SfPk18GWTKE5l3vAkEA4KZebja8+tC2zCbRMLyMl7TDZ5BTZ7mUOshua7
         PAUw==
X-Gm-Message-State: ANoB5pnJNZarLH+J2okSQEcmnbLmDqolnkLwotJU4Mf7XM75p4WfjYPP
        zyYWhtANN33AgbJ2Uw2LYfu5mA==
X-Google-Smtp-Source: AA0mqf4//yxYN29+zyMzXaGKAD1/zWwei0KIXgRH9g1E9RRlFVLzR8rR308VYEtmu1CTKLKFag7HCQ==
X-Received: by 2002:a05:600c:4f0f:b0:3cf:b73f:bf86 with SMTP id l15-20020a05600c4f0f00b003cfb73fbf86mr592665wmq.137.1667865426038;
        Mon, 07 Nov 2022 15:57:06 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH v2 09/18] ARM: dts: qcom: apq8064: add compat qcom,mdss-dsi-ctrl-apq8064
Date:   Mon,  7 Nov 2022 23:56:45 +0000
Message-Id: <20221107235654.1769462-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

Append silicon specific compatible qcom,mdss-dsi-ctrl-apq8064 to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: David Heidelberg <david@ixit.cz>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d036dff4b14f7..f3624832e6841 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1287,7 +1287,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,mdss-dsi-ctrl-apq8064",
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

