Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A495F51C43B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 17:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381451AbiEEPvw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 11:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380965AbiEEPvv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 11:51:51 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971C95A2C3
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 08:48:11 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e24so6655171wrc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=duIpxtiykCSeezrgTxT8A8q7XE7qrwoHIpE3IVHNv34=;
        b=GMI0FjqJYk3Cx8Nnjj9PAr8HNET0bq+Oq1TTEgpIs6hZSXcCt0Rk+QTCSvV19L5dCM
         noY5hoXJuHmtJ9+fmDwtLu9VtXsxirjN4lno9rK3zOGPxqPFAyYRNd6VPUfqhk9P9e5r
         1HJQZvoEh1OMpk9bn2WBBfQOG5D6z5orJEqfNRvYEeVW6TUuldp+4T8ayqocGlwjb7d/
         ETt5ZFEqBxpa2xYhIYY2dJgT9ZLScb56ietYyvF+tsTydAP+J1zuiyjdXgkpuMKOiwBk
         oskPtPJbckidlC992DsU8jzou3ODmmBzOypCechi1lSyje4bCL/kMrugs+OmvI7NJLQS
         bCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=duIpxtiykCSeezrgTxT8A8q7XE7qrwoHIpE3IVHNv34=;
        b=p2aY6eFCnUNEFDQd/SlZyWmQbdbNtKdqW9o770DVO71BPMFNAdo9RUw5PS4+vfmElT
         qgn1aaJTUTAzLyUJ/RPoT+3PL1A2L43f5aX/jaTfZtFSev3Mlld2+Wy429S51YhnSOJ0
         yog2US9hgwBHCEt6BUhNT5jRuaB646FqX4PT37+9I+9rutoIJ3OQ8rfybqcyDiYT1hpi
         TrY0pV4lPryTN27w9GeYjyIMI/S1+rjndBR76LctLEolZKww0krvNmUjFf2fQcjlOlIh
         gU6+2wcPJ0XFM17Vt9e9evnJ5aZI3KFAsrTCi6wng+ORFQyfdj07YekUNfONSeal1tSK
         k+DQ==
X-Gm-Message-State: AOAM5303OUOK4eRB75lGy7Jmg73Ig05DLtuIznsvViv2+QY8AyBGEwAq
        +FzjS894g3QAZmnUMc8/qvg+rw==
X-Google-Smtp-Source: ABdhPJyHr3Zn6CRC5oyGbEZHHp296FsMl3T6au8NoxhUoWUVnxzNOa/YN3KoPSLfW+hy6vfVaIf/8A==
X-Received: by 2002:adf:f50e:0:b0:20a:c54a:42b0 with SMTP id q14-20020adff50e000000b0020ac54a42b0mr21067440wro.511.1651765690220;
        Thu, 05 May 2022 08:48:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm1518956wrr.91.2022.05.05.08.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:48:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: correct SPMI WLED register range encoding
Date:   Thu,  5 May 2022 17:47:02 +0200
Message-Id: <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On PM660L, PMI8994 and PMI8998, the WLED has two address spaces and with
size-cells=0, they should be encoded as two separate items.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index cfef42353611..cf26432bb7ce 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -67,7 +67,7 @@ pmic@3 {
 
 		pm660l_wled: leds@d800 {
 			compatible = "qcom,pm660l-wled";
-			reg = <0xd800 0xd900>;
+			reg = <0xd800>, <0xd900>;
 			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ovp";
 			label = "backlight";
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 6e7c252568e6..81899fe17f2b 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -35,7 +35,7 @@ pmi8994_spmi_regulators: regulators {
 
 		pmi8994_wled: wled@d800 {
 			compatible = "qcom,pmi8994-wled";
-			reg = <0xd800 0xd900>;
+			reg = <0xd800>, <0xd900>;
 			interrupts = <3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "short";
 			qcom,cabc;
diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 0fef5f113f05..ef29e80c442c 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -44,7 +44,7 @@ lab: lab {
 
 		pmi8998_wled: leds@d800 {
 			compatible = "qcom,pmi8998-wled";
-			reg = <0xd800 0xd900>;
+			reg = <0xd800>, <0xd900>;
 			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
 				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ovp", "short";
-- 
2.32.0

