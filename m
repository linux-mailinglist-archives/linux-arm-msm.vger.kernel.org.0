Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91F5C550E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 03:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237411AbiFTBF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 21:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234884AbiFTBFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 21:05:25 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2EFB7E4
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:05:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a13so4995191lfr.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKzj6L0K8MJNmRP+vzTm8uPJzi8NEXlEW3OrwZR1Y4s=;
        b=ehbIN6DDHWJgcb8mbxbuZo7vgKAVPRGQKsNFVYB0b8wyWDj7Ye6vc6Vm1SRit6dIPT
         /ZrDDWhQt0kOs5zehbZHINwBE1FJ+SOlJZNlaE2gTjAdfA6RlirBRXbM4M1oBt8TlUr4
         FA55YQ75bS3s38zggMMtZpWLUu2VwVt8U8stbl8t5TMXkyZmbD69JczPQ7Hr7sQCTjyY
         9zJmA36E0aD4TF4qd+IY9MoWtjlcN3XDA4EFiZ7EaBA0gMrgsdbUSScg+V06FQqpV4pK
         /R/XVZtwd7NXHm9ShZu8z7eIlPR+/4kQFpdKZnKMcks8p6LYAJxI2HC9Paskkn3kf7hV
         o0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKzj6L0K8MJNmRP+vzTm8uPJzi8NEXlEW3OrwZR1Y4s=;
        b=lzDcXwFpfY6MO0+khHt2vsks0tvYccqxLt89zImFW3wSy03bD4rVJjaeMkFJ41+UE0
         fBivmIy1wIqBay9Fn5DRN8RcYb1Sr2fudnipIa/kF/e2Y5VEfE5MUVCoVL3qukazfRJR
         6J/dq4t3uaBzWYBNoPgSMaoMKfWrLC3hz8nbBav4FawgAIRHPFPbTakwIFXPlh8p3Gvb
         Vomd+eEPWAFQ0JPK/UeYMcQFozSFn/5OzHTrn1aUveKdQiYL9SeIzkntIuB7ioHBUglN
         5v/O0BfEJO1pyDGDlqqDK7lPHr4iBcIQIUmCKj2mrXTVOzsOUL7mAH2FI5i/jA4rMYYJ
         hDMg==
X-Gm-Message-State: AJIora8D2ZnCIHzolfxOzsEvKYavA5ZcBS/EXVSK10nd9n7CnHEzLDuR
        lH1xO+5fYXSyiZ38Iqx34U+V1Q==
X-Google-Smtp-Source: AGRyM1syw6wr5qEXJjO8AL6OhfBBlFYolL5iTnPvXzK82XaidCCiBDd0cmRf6hvHckJK5roZ5q47vA==
X-Received: by 2002:a05:6512:4010:b0:47f:6fe6:119c with SMTP id br16-20020a056512401000b0047f6fe6119cmr1451315lfb.499.1655687120582;
        Sun, 19 Jun 2022 18:05:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h11-20020a19ca4b000000b0047f73f0af8bsm79826lfj.221.2022.06.19.18.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 18:05:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8916: add xo clocks to rpmcc and a53pll
Date:   Mon, 20 Jun 2022 04:05:19 +0300
Message-Id: <20220620010519.1533364-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Both a53pll and rpmcc make use of xo as a clock parent. Add it to the
respective device nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 562c42ce2c5c..d679aa5989a6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -301,6 +301,8 @@ rpm_requests: rpm-requests {
 				rpmcc: clock-controller {
 					compatible = "qcom,rpmcc-msm8916", "qcom,rpmcc";
 					#clock-cells = <1>;
+					clocks = <&xo_board>;
+					clock-names = "xo";
 				};
 
 				rpmpd: power-controller {
@@ -1872,6 +1874,8 @@ a53pll: clock@b016000 {
 			compatible = "qcom,msm8916-a53pll";
 			reg = <0x0b016000 0x40>;
 			#clock-cells = <0>;
+			clocks = <&xo_board>;
+			clock-names = "xo";
 		};
 
 		timer@b020000 {
-- 
2.35.1

