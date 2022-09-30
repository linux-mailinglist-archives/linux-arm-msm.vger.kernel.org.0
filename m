Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6DC5F11F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiI3Sw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbiI3Swv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFAF166489
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j16so8215956lfg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=v7N0FEs1259ZNafoYJ1I+ArdHEmgdJ7OSsJ30ygB5ec=;
        b=xOjsXMS9QEspM50Iaff/0aapuHN2JfuiwtY/vsL+CiJ0C8A3jzvWqobNbVSNfClYuZ
         +Sl5QU0S3xwu+Gp1S8Iz1LiEaXehzud5yz9MogqYDYbegQkJ+D5ZfsoFm83cPj8xnKQi
         /p7SdqRSdozSiYL/OqLAfBV63DmFb12B7orXRSqJ2rHCqAKiPTGD6E1TxeMWxMEatMiW
         NaMVDvl3F+ZDba5SMrc4FrJnsw8hQ2j6OqfibywaVpeT0loh1aMUrHNhEZswgABhy2Vf
         JVWGlgGw5QZ8l+fn6elZw+feLlVM1a69glskQhHl+xuyUq83Uu/MEsPHgF9o6wW/KdY5
         iabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v7N0FEs1259ZNafoYJ1I+ArdHEmgdJ7OSsJ30ygB5ec=;
        b=A/kaWHdnBCYaKWv01SpVXZtoi/v85UDPtoXW56IEljXoIhgyzZRBTunG7/r+/ie+Nk
         Rq79eNgo2PAZ28xAp8DAequ858xyBfTg8k4+lYVb2DsRpxGSjmVvDND4+NeWmm6n2K9O
         Vh8ZayORClzT1curslACHGl2ynSB6EwWv4V24j4NySj+uKFN1pmcD7tZ1OixI8U2C1Mf
         hMvglvNtsggWFWgtRuYrt6+p6THYFk2DZDAnmyChSkrS4SovHagxwZ3cHg0OPYpobqud
         X1gxLTm2XU5xsBxLGhPUaN3xXKJPhqUZbh13eois+pezQXyyxrIBiA+QMD05ZwP2IwwA
         h34w==
X-Gm-Message-State: ACrzQf2FROfaiq0L7/B/Uo5XkbBPLBkZpBGJi/o5kByACnFVWJqYawV6
        JxdLALrlj+K6duqUF3lNNeJ9KA==
X-Google-Smtp-Source: AMsMyM4aB6GEUaa8mph+uDAaAxrLnxAgpfbIyS8GwbwH9OtRXBfSHGhmT9X4uEKlrfPo2+LSf/HV4Q==
X-Received: by 2002:a05:6512:13a3:b0:48d:6f0:64c7 with SMTP id p35-20020a05651213a300b0048d06f064c7mr3714941lfa.20.1664563969255;
        Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 16/23] ARM: dts: qcom: msm8960: drop unit ids from PMIC nodes
Date:   Fri, 30 Sep 2022 21:52:29 +0300
Message-Id: <20220930185236.867655-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

On MSM8960 the PMICs are connected using SSBI devices, which do not have
any addressing scheme. Drop the unused unit ids from PMIC device nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index c5740da3754c..64a3dcb5176c 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -252,7 +252,7 @@ qcom,ssbi@500000 {
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic@0 {
+			pmicintc: pmic {
 				compatible = "qcom,pm8921";
 				interrupt-parent = <&msmgpio>;
 				interrupts = <104 8>;
-- 
2.35.1

