Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2036F5F2240
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Oct 2022 11:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJBJUI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Oct 2022 05:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiJBJUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Oct 2022 05:20:05 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB31524091
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 02:20:03 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id g20so8962388ljg.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fl21bdW0ggFUdXB3LXql5VqnPXSvxKQM4G3EfuVCNOY=;
        b=hcCzkPeoqEfVxt3FznZim8/ryjEYK/pg0t/rsOz6MWJJ9/qxj2CfuQFpiczpKz5hy5
         MF7JWsy4Z3tnGX/StgHag6jl8sWl2OGwMpDoNfBL8ljqROwZ1rcAlLUoOwNdTPEoByHc
         lwpxErqzqLMeQoEvCLMBy4dQikDFwGYrKOrvmmkPsnRaCS7IsH0BNUiMr15Nj0armPPu
         v0oPHxcuylvZLuhoY44YC9fGFKoYrqP7LU3EVXDzXAl3+sq9knxTywcBKxuLxhmlmsLe
         7Wy7pchOkQg1FGSL8gb1PZhvZ4MPwG3V4CrBes85nS3L7piIsk8dl023+A+Gkex92vD7
         lBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fl21bdW0ggFUdXB3LXql5VqnPXSvxKQM4G3EfuVCNOY=;
        b=JbljRCsurkoTARYhh26ITsTttVDJ01QzXE4PyWgCurQSLDocn+IKeHnflm+8+ONujm
         NcedM4R3zQq1rsFkiaEjOMVRh/2WkDqma2IgQHWZtkfIMQOBk2xy5zdxmvzYVK73+Mjz
         HkoHE3tTNV/sxdQAxkAzagax3MGJfPUgghnnWqO98cYPg0aAi5r4AcN3MAWoOoHqlPNT
         0X4s4AVguw4EAoKuqsKD1zFOPf2JREBIq4YGqA767weeYun47gpYhZvTIXmemRBWuoov
         ZTiqOjj/+O+yGqxKglLNG9Jw3xgPoBgyhlfqeagNm47c2DOKm2PUkttHDJOF0tyCjmF8
         jG2g==
X-Gm-Message-State: ACrzQf2n66QGnbn9CnTVjpWAwz7P8tgMaKIpaeseNzCRRXyAFLHh8M0p
        oSzTZcvI9FDplIEQfroCWkDP8zEuXO+EAg==
X-Google-Smtp-Source: AMsMyM6OsJ32oSuPOq8kPqjzbRY+ACT8/4mCN8qS2/hnj/34rYRUrOiEhuig2FBdcdfb5mE01xn5Ww==
X-Received: by 2002:a05:651c:2ce:b0:26d:cada:cb3d with SMTP id f14-20020a05651c02ce00b0026dcadacb3dmr2190196ljo.484.1664702402241;
        Sun, 02 Oct 2022 02:20:02 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id du10-20020a056512298a00b0049487818dd9sm1026269lfb.60.2022.10.02.02.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 02:20:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: qcom: correct indentation
Date:   Sun,  2 Oct 2022 11:20:00 +0200
Message-Id: <20221002092000.68844-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Do not use spaces for indentation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b23591110bd2..acb08dcf9442 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -348,7 +348,7 @@ acc3: clock-controller@b0b8000 {
 		saw0: regulator@b089000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b089000 0x1000>, <0x0b009000 0x1000>;
-                        regulator;
+			regulator;
 		};
 
 		saw1: regulator@b099000 {
-- 
2.34.1

