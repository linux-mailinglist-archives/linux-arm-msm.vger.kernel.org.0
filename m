Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A405D599730
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 10:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347151AbiHSIcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 04:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347595AbiHSIck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 04:32:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7109E9931
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:32:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z25so5255414lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8kKp2gVxl2IVtU6eBY60iDxS0j0PaTIOrvwgxTS4yV4=;
        b=WjZtC4ADWuqaywxx98ACB+Zd6WWZIbxhCkhYbD1R5SPGwubtGl7crrwW3VZqDwKv4l
         qspJRZMkY0RPZOfvEg4miGXS1EnV0EkmjbsZdadw21AGgYjsSNnuixwYOhsc44mOYf6S
         CfemEizejIsVbK8aGAZZC9W1rh1CD82bRS3TFq1brO2zjwlnEeBUUSXYCM+LvBSlaFrl
         3UsGCFXtuETx2OBDAc0NNfoLmxSWMGSZnSTGuobKg6H4u++ch1RrQlYpf+dk+n7rCevt
         L9C1rEjdG/YlOMcAbfujTDbTPyOu1Kiz2NKMoUgD00SNZNS7927Yk0kOw4c89LUiA7iy
         OT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8kKp2gVxl2IVtU6eBY60iDxS0j0PaTIOrvwgxTS4yV4=;
        b=fIyEQiqPj9oimy2ORMaPOWBfURzDOAHoFQrYhYtw/qZ+lUXKWtal0vxqWpBnRfhkhw
         fOj0m1GY/Av6HVLqOn1G8H+ckUG5Vj33j/82Z38Clmnbo8PUzxFIzJUIsd1fxmy689Fr
         dDO/YN5UJUuaM/GYTXD4nxV4j3nTYvswFPIJ8qg/RiSpvpZ+n5kz4tLmiQMEGNew7O3u
         kUiOuaVRS0KnnlM84//71vH0B31yrLyibJo/MCiwDO4Rfle5m2jFc8LhbxKVSCvDcG7O
         yfu7mOovSV1XeE2c3jSUgfIOwnp5X1Dm76iosudN/PXunwbduMThfSMnE0aGb53SRBMe
         2IjQ==
X-Gm-Message-State: ACgBeo30txHZEKsvZzQwAd3VCnEWtMAIVXIv05kgxI3TUNgkc1q6vpfc
        7L1yeBvYgJiF1H7oKZL45n3dYA==
X-Google-Smtp-Source: AA6agR5isHHMh5jJA4xgLZE7AfZda2RabaQQ8z+Srqh3cVKl26ot3hQsxzAxApePeqsJZhIoaQLobQ==
X-Received: by 2002:a05:6512:3d08:b0:48b:123e:fcf3 with SMTP id d8-20020a0565123d0800b0048b123efcf3mr2080662lfv.418.1660897944944;
        Fri, 19 Aug 2022 01:32:24 -0700 (PDT)
Received: from krzk-bin.. (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id j8-20020a19f508000000b00492a54f0be1sm545355lfb.284.2022.08.19.01.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:32:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v3 08/16] arm64: dts: qcom: sc7180: switch TCSR mutex to MMIO
Date:   Fri, 19 Aug 2022 11:32:01 +0300
Message-Id: <20220819083209.50844-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819083209.50844-1-krzysztof.kozlowski@linaro.org>
References: <20220819083209.50844-1-krzysztof.kozlowski@linaro.org>
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

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: hwlock: 'reg' is a required property
  qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 5d2dd21da79c..e8debb0da411 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -555,12 +555,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
@@ -1462,9 +1456,10 @@ ipa: ipa@1e40000 {
 			status = "disabled";
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0 0x01f40000 0 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr_regs_1: sycon@1f60000 {
-- 
2.34.1

