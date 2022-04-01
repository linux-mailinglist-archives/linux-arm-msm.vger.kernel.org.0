Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0223E4EFB7F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 22:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352392AbiDAU3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 16:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352936AbiDAU3A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 16:29:00 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C40291AC5
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 13:27:09 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y10so4276849edv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5EcbH8C06sbTvlj74VImlROx9fT7kiTAHj1cznf1og8=;
        b=HVostgqO9ijPRrzVm+/N5vnVlDc2a2ADFntKm8u891rPiZ8JwpXJXqj1vML4NLcsWN
         leXSL75FtMkwb3dDyr6CwwYW+y8BO+aeRhGie9oWTpB160LiIgjSMTBA77YuyyPG/+Kh
         lIZYXCg9twtkNLgx67c6S4PmAEk5g/LaSzAS/MeMwz33o/jPtQDGspqjMG+94jIknCvb
         LjnIJB8CK7Jc5Nz0NZ+S21Tpc3gjQjzQecuSHPeIJDPykGYe6iD0M9derVY06C0l2Fqy
         go8wIi9p2IIs+EYLihONFAKgMGaUO3i3BkB8R8+HNAKVPNmBVXFKBsO6Fq9bH1BFVxRp
         FTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5EcbH8C06sbTvlj74VImlROx9fT7kiTAHj1cznf1og8=;
        b=mRUuBeiNJ8d/RxzMK9EWQGguZXSWof/DcVkqGM8wYnwoG4CHTcxdiIUk4PfSLbw4M5
         uMBHzFWqjalCw9xf77wJEwoCkqoVp0bh+GNde25A4GmbRaiBa+6/LmXAWVWOrQqR2QpY
         NuELlWQ/9lc5uqpjUrxsUVJ3CRDY1TbHmgAviAPEnCOHcSoGORaGY98HnX0FuD0rano4
         Yai0VmC2cq/ByyASYflNs7cc6dI6deuk0YP82TEgJvKVyyQ+iRUiIX26RvuXVdtFm9Zb
         5aQ9RW8AkjnSmpdwzTbLtK22QG1WqQ4xSmITI0dr4bkxl+1/P4giGBtD69QBlN4kSsEK
         L7rg==
X-Gm-Message-State: AOAM5318pZoPG4jIK+lnwHxfZ/yoCZx6odRI3z4skXthPfDEXHUOKouj
        /MiThQkEnpSebkERb1d1A0okWQ==
X-Google-Smtp-Source: ABdhPJwRSLi250Su9ajmam0SO1iSbT66aIOeUt1cJ8/y6EbBmdH8LL85Ta4dfMZvVTIM+pxHahEIYw==
X-Received: by 2002:a05:6402:4247:b0:419:3990:3db6 with SMTP id g7-20020a056402424700b0041939903db6mr22428286edb.193.1648844827858;
        Fri, 01 Apr 2022 13:27:07 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm1619346edl.22.2022.04.01.13.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:27:07 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 3/6] arm64: dts: sdm845-oneplus: enable smb2
Date:   Fri,  1 Apr 2022 21:26:40 +0100
Message-Id: <20220401202643.877609-4-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401202643.877609-1-caleb.connolly@linaro.org>
References: <20220401202643.877609-1-caleb.connolly@linaro.org>
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

Enable the smb2 charger to expose usb attach/detach events, charging
stats etc.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 3f1b05603701..afc8b0c3aed7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -461,6 +461,10 @@ pinconf {
 	};
 };
 
+&pmi8998_smb2 {
+	status = "okay";
+};
+
 &pmi8998_rradc {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index bf2cf92e8976..b0fb2f8ca6d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -32,3 +32,7 @@ &display_panel {
 &bq27441_fg {
 	monitored-battery = <&battery>;
 };
+
+&pmi8998_smb2 {
+	monitored-battery = <&battery>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 1b6b5bf368df..3e3c757fe6f2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -33,6 +33,10 @@ &bq27441_fg {
 	monitored-battery = <&battery>;
 };
 
+&pmi8998_smb2 {
+	monitored-battery = <&battery>;
+};
+
 &rmi4_f12 {
 	touchscreen-y-mm = <148>;
 };
-- 
2.35.1

