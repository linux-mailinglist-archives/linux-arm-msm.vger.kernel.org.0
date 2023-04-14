Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41506E24E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 15:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjDNN5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 09:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjDNN5z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 09:57:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5188DE56
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 06:57:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m4so23300938lfj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681480672; x=1684072672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXvnZiBUYIq053kMTXG6IiE5H5AHN38vkwVpGrxQfAM=;
        b=FvxzrKFv6qu6gY8IkmUHTLBKvwF2rccNgKQ52wFuyK+and5ZOaYZ/z+7oEc+6g+kba
         EGeQXR/H/gRG2Z9jiwdIaJs5+5oIDAHZMovZENKlE4qF2de4lDil03ixMVVdG4CNbhkB
         IVO8D3jCKDH0Nb1bGcXO0hY5ntWDOc4dlbreaI0IDnu7EPdBssCQpy/uQvDFLY+FLAsi
         /TrnBq2jnQd9VLBaVY8U/Q3uGGjuxT6N36e4mtenNLeU5WCGZMnONTlFowW3e3sbwXc/
         j/KKpsqJfmSR0Uyj+VDB+br8ae3DguLzeZeSUt/HZmuLUSvAV45O1cq6yCPp1cw70dVl
         s/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480672; x=1684072672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXvnZiBUYIq053kMTXG6IiE5H5AHN38vkwVpGrxQfAM=;
        b=FTvGdcYnqa1v/bMx+d39hUXgEvEdtHV04N8kw2GYnKFwHtRSOGzdxstMvuaymR5RwR
         t1MTQE2InIn8ifubDb/pWnVj6cNF/IOhvzLpa0MeoZ/rU7pY2mYRG1zg9bfSNHVawlDA
         2PfqfiCAJG2m80F5qUofFPrcBRtHQqvowcQGADFgUh0gyKGk1fLAvcdCQIYpS3KYZjKx
         73gHUTgvFwa5JZ0c+gUxwVCUP11iYcpHa9mKQUXYH1YhBPQDkY9tY/6zBBUz+4oP4ppd
         IwcuXIToOqy6WB5BO6yZjmIZc2OB6vjFs4XpFxuswq1t1kExEEppg+1ecUwMRnuYPf9H
         0C9w==
X-Gm-Message-State: AAQBX9dgigD2VWH5T6g193fCVLpFXIgOiWH6TmFdP+aFovSj4163A+2+
        /tjHkR8Xng52NxDWyqsEMjcZIZLcYGFu7IwjDGA=
X-Google-Smtp-Source: AKy350Y8w02zr0TOBQcRwvabEdWzYKknhuOt7AYhTw22LkM3il3oYtICOWzkj4zlx9357TC0SMPSgQ==
X-Received: by 2002:ac2:5937:0:b0:4e8:61d2:72ee with SMTP id v23-20020ac25937000000b004e861d272eemr2693701lfi.5.1681480672256;
        Fri, 14 Apr 2023 06:57:52 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b7-20020ac247e7000000b004cc5f44747dsm808161lfp.220.2023.04.14.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 06:57:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Herman van Hazendonk <me@herrie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom-apq8060: Fix regulator node names
Date:   Fri, 14 Apr 2023 15:57:47 +0200
Message-Id: <20230414135747.34994-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
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

commit 04715461abf7 altered the node names in a DTSI file
used by qcom-apq8060-dragonboard.dts breaking the board.
Align the node names in the DTS file and the board boots
again.

Cc: stable@vger.kernel.org
Fixes: 04715461abf7 ("ARM: dts: qcom-msm8660: align RPM regulators node name with bindings")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 8e4b61e4d4b1..e8fe321f3d89 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -451,7 +451,7 @@ &rpm {
 	 * PM8901 supplies "preliminary regulators" whatever
 	 * that means
 	 */
-	pm8901-regulators {
+	regulators-0 {
 		vdd_l0-supply = <&pm8901_s4>;
 		vdd_l1-supply = <&vph>;
 		vdd_l2-supply = <&vph>;
@@ -537,7 +537,7 @@ lvs0 {
 
 	};
 
-	pm8058-regulators {
+	regulators-1 {
 		vdd_l0_l1_lvs-supply = <&pm8058_s3>;
 		vdd_l2_l11_l12-supply = <&vph>;
 		vdd_l3_l4_l5-supply = <&vph>;
-- 
2.34.1

