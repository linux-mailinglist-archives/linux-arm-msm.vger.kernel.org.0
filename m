Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D6E57A888
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 22:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240360AbiGSUv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 16:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240302AbiGSUvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 16:51:20 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3874D5E318
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:51:09 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id q41-20020a17090a1b2c00b001f2043c727aso140415pjq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NFO34Yz57LgTCHi3tidORCIHqJkFKgK7dJO812laZw0=;
        b=GBrCgtLw5cutr/Q4x/ZLLIFTpVxODuomXLyjI6/YeIal2HEgr2yghDY2JFY/55I0DE
         iRv1N1sIRduGCWtRgHG3pSRMgZhYX/PAHZrA8nKeT0LM5xDsF7lhOa4pmwiE325IeqA1
         fVQfKmw6kmcsADF3wG1p46bKygR9OaLaj009NtDwMFFiMkdkfXUzQAJIwbWOUv77aaGt
         hwr/+tEagUv9SDqHhgal3VXRSsuak+srSaimoainmIuGqT8nRJII08RCfC7WUm6LviuE
         ouJIdZ2j1015fQfCfnVX8iYDoPjtGbqOIufgeRWGUD1ZGKzitPbVwoCK1PmpQoVfTLPt
         WFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NFO34Yz57LgTCHi3tidORCIHqJkFKgK7dJO812laZw0=;
        b=zCSPYrA7teU9U5fUD9OVZeYx2k1bWyovjBQMk/D3a/MXx33jCmLyk/gbKEPFKNVC5U
         zUSQRHrFXsFVm11k9E1AF5HUazd7jNXrgZI5yZUdUv6sWs8vNGB02e2Q87fVBzqAeVUu
         63AJsmEgxmXit5tPQhXXpBIYh1o4JfycN1FXPV1524X4RAMAjJyxRaJ4RXvHkG7n35+U
         K+gtRjlxZV706SkBrcz7o0Ex2NxDLUPkM8VDpULRXf+7UYI+529IR+DFUSqXP9beomZj
         Foih/4fFjUt3QEYRc0JPFajawgM3JMkhcSCm1FFnHxgbPQqnSKyqTgAY+4pzfbe1f3dd
         U6UQ==
X-Gm-Message-State: AJIora/xb+s3DIoI5dTiOcLcm47SSe5PgaqbmIYIT4VuoKXWtCWLW/P2
        7q94cGikoxNt++wc7q+aqGH7svVC41uKEQ==
X-Google-Smtp-Source: AGRyM1vq6J6IWKe9INRqVjVpfg3k6LLaM5xMIUGm6hePJMhersOoDvxR80OvktD5IwEdR3oGrl2wZQ==
X-Received: by 2002:a17:90a:7889:b0:1f1:82ea:fb31 with SMTP id x9-20020a17090a788900b001f182eafb31mr1333372pjk.153.1658263868444;
        Tue, 19 Jul 2022 13:51:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:709e:6fec:df37:6562:5a80])
        by smtp.gmail.com with ESMTPSA id n1-20020a622701000000b00525496442ccsm11929173pfn.216.2022.07.19.13.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 13:51:07 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH 1/3] arm64: dts: qcom: Fix 'dtbs_check' errors for pm8350c & sc8280xp pwm nodes
Date:   Wed, 20 Jul 2022 02:20:56 +0530
Message-Id: <20220719205058.1004942-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
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

make dtbs_check currently reports the following errors
with pm8350c & sc8280xp pwm nodes:

arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb:
 pwm@e800: 'reg' does not match any of the regexes:
 '^led@[0-9a-f]$', 'pinctrl-[0-9]+'

Fix the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi        | 1 -
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index e0bbb67717fe..33f939132571 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -32,7 +32,6 @@ pm8350c_gpios: gpio@8800 {
 
 		pm8350c_pwm: pwm@e800 {
 			compatible = "qcom,pm8350c-pwm";
-			reg = <0xe800>;
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index ae90b97aecb8..69f5bc8127b2 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -62,7 +62,6 @@ pmc8280c_gpios: gpio@8800 {
 
 		pmc8280c_lpg: lpg@e800 {
 			compatible = "qcom,pm8350c-pwm";
-			reg = <0xe800>;
 
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.35.3

