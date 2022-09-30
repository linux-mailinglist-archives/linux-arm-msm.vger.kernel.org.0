Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268F75F1254
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbiI3TUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiI3TUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:20:47 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AE418C005
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:20:45 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a14so5781122ljj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mCMgGEyaM3zh+71LDd/ajWDz/tmfPqcX4bkRvNqYiVc=;
        b=tO+PICHmM9I3QO0wyfc6Y+2GR2yPRj1Cp4K3bZN1q7DdhEVj1i0p1kmcp0wyEt1Cag
         jkajq8GyDH67IjCSO3kmLaDUaGebuDHu8KYp3UR7Usnf0qyQmoE47FKIkydYZ0vwhrZI
         0gKzmExQC0bl6xUVdZMPHBCpM8DviiD1CA3dHDnOAcW9am0v3aX4cBuwFrkGKllry66m
         B2KTX/zom8kDDtLHeC40iyw8GvzlDKCw6CqnI7+nsGNZP1Nxs+kbCJ+awsNU7aGbTWRk
         +gxKXq7Or7UvXlzQ6gjWGnIZokfEwn/xK+5KGlu/1hppupGCL2Y+5UTLSFN//Xaf1+GA
         KURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mCMgGEyaM3zh+71LDd/ajWDz/tmfPqcX4bkRvNqYiVc=;
        b=f/6jsjj/o1+yscaY7qmutKtgSXsDY5kO9y70ztnkT2eDAoMDN+WpzLPLzMkxua16v/
         Az5O62UygRvcWxgu5+uDiGFL6azgh81wXwx6wSkdO/Yv8EyJC2Sid+1oG9jSQEt8A6Ft
         1jLHRKpLiPr4s0igG75XGGUFA/SGrJ+pK709W6uoOHjL4g3Dck85QQZX+KDGCEazyql3
         8nzQt4UxVBf/PyVZcBGNNCvqU1IcWCYR1FKt5AXBKoQgvcFroZH8fG0X1JBglOY2CglI
         OaUov4pDJHVW+r2w2fpMpida0laGd6ZlWjQQEggOcOYbghzNCoZ7uCaU+IDiFRxrpeZQ
         tdXQ==
X-Gm-Message-State: ACrzQf3WO5NW+2lRDAjN3N+6o9br9+1MBQRLgUr+4hDL8t25w+R0bxhm
        iPSWNTHaHpA+0dfrZDY/r/5z/V/K4nCkGw==
X-Google-Smtp-Source: AMsMyM4966C8+p83RB3Y+03riKzJGnRBVvCFAj24wpc8BR1L996JBXzC+hBjp/4R9VeyY281DbNsIw==
X-Received: by 2002:a2e:b5b5:0:b0:26a:c76d:145a with SMTP id f21-20020a2eb5b5000000b0026ac76d145amr3478682ljn.119.1664565643893;
        Fri, 30 Sep 2022 12:20:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c17-20020a056512105100b0049fff3f645esm390115lfb.70.2022.09.30.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:20:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vkoul@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sdm850-samsung-w737: correct I2C12 pins drive strength
Date:   Fri, 30 Sep 2022 21:20:38 +0200
Message-Id: <20220930192039.240486-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192039.240486-1-krzysztof.kozlowski@linaro.org>
References: <20220930192039.240486-1-krzysztof.kozlowski@linaro.org>
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

The pin configuration (done with generic pin controller helpers and
as expressed by bindings) requires children nodes with either:
1. "pins" property and the actual configuration,
2. another set of nodes with above point.

The qup_i2c12_default pin configuration used second method - with a
"pinmux" child.

Fixes: d4b341269efb ("arm64: dts: qcom: Add support for Samsung Galaxy Book2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index f954fe5cb61a..d028a7eb364a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -415,8 +415,10 @@ pinconf {
 };
 
 &qup_i2c12_default {
-	drive-strength = <2>;
-	bias-disable;
+	pinmux {
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &qup_uart6_default {
-- 
2.34.1

