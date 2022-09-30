Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69CDA5F14A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 23:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbiI3VU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 17:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbiI3VU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 17:20:57 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193B1165107
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 14:20:56 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id x29so6074106ljq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 14:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=h81yVJyVfQZQpM33TkOO8Nwc9//kamAbFBsl3zmnHfw=;
        b=rjZxmluqBhEmOxi7pOrXJuNslOGPyaWvL5Rbc0+vYF6LiCnreqbwL8KW4UG1g/7L74
         myQPg8b1WM7DAds/0Xr9zIvl2PzIGyzbYnLU5Fk8JFRz2qVwhmlG9IQgcd96en125nOB
         Oa1tNPg4bI3ncWsdIlb5QAwfQKYOpVbqzZFwOInC673q4AfKewCjo3W6jx6dUiwqWUQw
         OnH6Tc7zSG5F9PWMX7ON+HikIlikEpXXUzHmfVbtIZ9pTTe7livpoh5NChqjYYKv3YQN
         lG74z65gIlwxE3aj7U4aQu9ZkbhzFmS0n7k+ajl5DwyIAtit4wcmNPH8Vjcr9PC5zTae
         4Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=h81yVJyVfQZQpM33TkOO8Nwc9//kamAbFBsl3zmnHfw=;
        b=sm4WhEnqwPg5QD9PFrF5n0gLXGX3qSv3eeRg10Ia+9TgrYrBG9Dg8C7EjxqeKEncsQ
         +mTmoe3Be0XEdqK6iTxX0pM/mFSY4vSDi8joNd2jeBMQkRCKOeJ1prjl+mXbaeJHlCJb
         msWWFRLU/evu32I9BNm6Z5lKCsxFie9NBWM5mmkm1SobmbRor463YiNcFeny7ZDhIWOL
         0kVv2Xlk9+KvtxPc6OwBVvU2GsEx0cYQVGWO5hYQ0OQhNgfGSrgYISSqGSnBesLlVB65
         Ci/a6K7L5toPFGNnNBcAI2Bi32sjHDDMwcMNqRp8v2o/RmmnKFl1sCaA1jOMNnDZe0p9
         88ww==
X-Gm-Message-State: ACrzQf09UVhWc59SCUtTiPII9Z5/2kKz7oYGGS0o9RR8K8J74C+DxNPn
        5qhg4LAtDgZ3yZJqAm0NOKXoNw==
X-Google-Smtp-Source: AMsMyM6lTZWCHhd/wWgGR96jRfRIx1r6aIIMUDiL2GHem2kuHgDxdoo+d+ZRFEGzbIefRkCirBrYiA==
X-Received: by 2002:a2e:a5ca:0:b0:26c:1dfd:8f5b with SMTP id n10-20020a2ea5ca000000b0026c1dfd8f5bmr3269783ljp.447.1664572854479;
        Fri, 30 Sep 2022 14:20:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b18-20020a056512305200b00492dba3c85asm431397lfb.220.2022.09.30.14.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 14:20:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: qcom: mdm9615: drop unit ids from PMIC nodes
Date:   Sat,  1 Oct 2022 00:20:52 +0300
Message-Id: <20220930212052.894834-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
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

On MDM9615 the PMICs are connected using SSBI devices, which do not have
any addressing scheme. Drop the unused unit ids from PMIC device nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b47c86412de2..bb17a57a2b90 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -283,7 +283,7 @@ qcom,ssbi@500000 {
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic@0 {
+			pmicintc: pmic {
 				compatible = "qcom,pm8018", "qcom,pm8921";
 				interrupts = <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
 				#interrupt-cells = <2>;
-- 
2.35.1

