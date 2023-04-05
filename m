Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205B16D86B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbjDETTa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbjDETTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:19:18 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86926181
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:19:17 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so38288151pjl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680722357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt7M02oqu6KTx155BRHBlS3z+3ibHCaV+H3c4NDslQk=;
        b=svFkAQDPQ6lQfJOy3eX2VKdwwi9AG2pmGyTJt3q8YsxggmR0MxczaTHGDaotjex1ZO
         RbbVpQVur6VgIgNdFu3VJUYmc+HTnw1RydgsvixTJ93qXriZVDZiCgeqWl+6zxtYcNQ1
         AfiKpiiQmnAY5Ybr8Ay9efQIJus6Hvc/k2XdGj9AX96M1pLdGkkQXCavOu9+DSHgoDSk
         3e0l5f2gEDkd4y9vUi+9pzVa2/GkbFjAcxLO30sgfV9VCJ2j59VBt7wctYuEbQmrWtZ2
         suWIEjXI2ESpngeQEPxMaINxc3KjO8M4YOJIvKPxm45NNQCSU6SokjZPJULyOTyYyhEK
         bAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt7M02oqu6KTx155BRHBlS3z+3ibHCaV+H3c4NDslQk=;
        b=Rh/RCikU9MawJDcspe84PFjKz0Dww2tT8UbwTHkFxaePp3jOrHEkNXwdr6AkKpmJeK
         kOjsFVJpi3ecqa3qqmIoh2rnB2MyTdEhAoq46c4lWDRG2aAZX3VsO3EZkEOpZA2WHreT
         Adkhrv3x5vl99LQj2sOSolwQAaiaW17JugOjQi6jwioVLQb40XQbS6tNC4JJGjaXDT/j
         6NzSOM42bYzE8IzUTBSlY6NdLJIv+l8m2kDuBrbeJZW7DM55Ku1ewhWUl8JIPAW8BCaW
         AkWn0FTJBeTX8zsGKhmKh0ml752jRIdIttbiID1Fgj//zaFXTJFKnuv+JHUeI+JK2901
         tBJg==
X-Gm-Message-State: AAQBX9f+F1OLX3CoFgpf6Rjz3lsym3uPUIK6u5m8YQ8vY7clVMxYC2Qa
        iUJf8uWONeGNHLDO4rMigBP0Tpx2wDkTIn/e7Iw=
X-Google-Smtp-Source: AKy350b5JJdiYtWrN/RCf8v35EVXFdkifQOPo8juFYtwRgi6PZ7VfAaOzPfZ1PQwnNrV2zwYHiig1A==
X-Received: by 2002:a17:902:e18c:b0:19d:297:f30b with SMTP id y12-20020a170902e18c00b0019d0297f30bmr6156444pla.19.1680722356788;
        Wed, 05 Apr 2023 12:19:16 -0700 (PDT)
Received: from localhost.localdomain ([223.233.67.41])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902aa8900b001a1d7329235sm10478097plr.234.2023.04.05.12.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 12:19:16 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v5 1/2] dt-bindings: phy: qcom,qmp-usb: Fix phy subnode for SM6115 & QCM2290 USB3 PHY
Date:   Thu,  6 Apr 2023 00:46:32 +0530
Message-Id: <20230405191633.1864671-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405191633.1864671-1-bhupesh.sharma@linaro.org>
References: <20230405191633.1864671-1-bhupesh.sharma@linaro.org>
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

The USB3 SS (QMP) PHY found on Qualcomm SM6115 & QCM2290 SoCs is
similar to sm8150 QMP PHY (which is named as 'usb_1_qmpphy' in
sm8150 dtsi file, see [1]) in the sense that the phy subnode supports
6 regs, namely TX lane 1, RX lane 1, PCS, TX lane 2, RX lane 2 and
PCS_MISC.

Update the dt-bindings document to reflect the same.

[1]. https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm8150.dtsi#n3394

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
index e81a38281f8c..1575dc70bcf2 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
@@ -276,7 +276,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcm2290-qmp-usb3-phy
               - qcom,sdm845-qmp-usb3-phy
+              - qcom,sm6115-qmp-usb3-phy
               - qcom,sm8150-qmp-usb3-phy
               - qcom,sm8350-qmp-usb3-phy
               - qcom,sm8450-qmp-usb3-phy
@@ -318,12 +320,10 @@ allOf:
             enum:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
-              - qcom,qcm2290-qmp-usb3-phy
               - qcom,sc7180-qmp-usb3-phy
               - qcom,sc8180x-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy
-              - qcom,sm6115-qmp-usb3-phy
               - qcom,sm8150-qmp-usb3-uni-phy
               - qcom,sm8250-qmp-usb3-phy
     then:
-- 
2.38.1

