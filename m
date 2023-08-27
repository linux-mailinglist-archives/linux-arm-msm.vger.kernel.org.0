Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50414789DCB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 14:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjH0MPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 08:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjH0MPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 08:15:06 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D136813D
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 05:15:03 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5298e43bb67so4929001a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693138502; x=1693743302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nL00MkR7LeahzMDUv+0Kc99z+1SowEYeDRlQjwoP8ws=;
        b=glZdThQj3GUhm6yRWkpKmXv8rdIV58JZJXhJWsdfao+aJXMyt9EWSNYRZYQvorLYBF
         lGJj4exN4qs6+0z9eeRX6fDoszliok2gvc6bTTiklULpfJYKgLR5kRGp/wimeyCmSCe3
         /jIoD4vDd2RLOx5rcbD4h299yQiOrvihdW2lLmMAWXt81zaCxwGUyO4Fnbkkv2YOT8T/
         Ahrg8YTsv/hs1ZH8z/q+355Xc/7BmPi/Y2CNYQMSw8YK3H8kI28fO7AEkqnxBS4r2yse
         iGW6Tc37Ikj/h4anayDF7r6i9kFHSELfb9d1DtTs2Fy0cGSQFeO3Jd8Eue+DC3Ul7Lui
         EMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693138502; x=1693743302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL00MkR7LeahzMDUv+0Kc99z+1SowEYeDRlQjwoP8ws=;
        b=KM3uGssqBMrGHI37TlILaMKPhzc8BzkFPezwJI9xBVtLmyRkW2myATBmkNhy8RxlLE
         CsVXuoxECmA3d1L/KvixLXCcK1G4OL2SM41Ncxwd3mJJlhcb0xIX2+jyuu1h3QkJEmx5
         1Fh+R8Zw7H/9i4N/zA12S81vhonVs15SWQEuFnKZfEClo8xwotvPeJz80LViIcEKjzo0
         XXoSBu9BpE30q5gbSeGyIeuGZV/SZFPhi4aDr7uPhvljVV/VfQSkZp0iSvkgDL25ESEk
         U4yeItJ6ghTTam5yX6m55seAGHgMu7JYyZ89EHKQKvhNIY1zOvaOH4Bn6n8bY/otTqgC
         dwHw==
X-Gm-Message-State: AOJu0YzKUfY4Ku+NE5Ri9Jiz5bD4HXzcgJL4cGUQ+c46K9nwf7nzCtd+
        z+99lADrhtk6USfADxAv0zV7Cg==
X-Google-Smtp-Source: AGHT+IHJk50T0YOAxhoYaNypDAGvnuDOj7ZbUgBV4kxxaM6gDB6JHuiu6sxSQekum+voYE+n6xrJcQ==
X-Received: by 2002:aa7:db47:0:b0:523:b37e:b83b with SMTP id n7-20020aa7db47000000b00523b37eb83bmr24339093edt.13.1693138502090;
        Sun, 27 Aug 2023 05:15:02 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id b14-20020a05640202ce00b00522572f323dsm3247656edx.16.2023.08.27.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 05:15:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: qcom: sdx65: correct SPMI node name
Date:   Sun, 27 Aug 2023 14:14:59 +0200
Message-Id: <20230827121459.62539-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Node names should not have vendor prefixes:

  qcom-sdx65-mtp.dtb: qcom,spmi@c440000: $nodename:0: 'qcom,spmi@c440000' does not match '^spmi@.*

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index 58635bbc1123..ff596215ae3c 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -537,7 +537,7 @@ restart@c264000 {
 			reg = <0x0c264000 0x1000>;
 		};
 
-		spmi_bus: qcom,spmi@c440000 {
+		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0xc440000 0xd00>,
 				<0xc600000 0x2000000>,
-- 
2.34.1

