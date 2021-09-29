Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FE041BDAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244126AbhI2DpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244129AbhI2DpD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:45:03 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FC4C061772
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:20 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ce20-20020a17090aff1400b0019f13f6a749so2969139pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OGr1UhBmzv1ZbRN4Jw2f9I0cji4GhDLktnzGXnOfSCw=;
        b=lojz6FLPpIyl/A59txe+JHKvs0tCb0UDRptBdBrDrIrrWgrcokj/x1HSe4Hhp50GYs
         U8XmdWwKpC+k+MPz7KBY1yZHubAPNbDt7Tdewt3igCI4axF5G3kxktfW2I/52ctLAm3x
         gN7JAhAuyFMi3HXqIdRBNTpz0BUJi0q4mM8jTzZO4kk4l1fZ6soZgXhvBEJ1Ew1liuam
         chGBsDQGCbKP7wl5fYYfkIRCb2kLudDdbwVhZNN0PcvlnsR9NXxjF1UQoZhES9G0fwyb
         3d2xdnGW6IDDlRABDOMrF87uTfdMdCmbqv4da/f2gfFWVN+UrGXvc1GHxoqFJWG7g8ho
         GSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OGr1UhBmzv1ZbRN4Jw2f9I0cji4GhDLktnzGXnOfSCw=;
        b=ohGMKGj0rrtN1wk8KW7PO6KSla04dA+s3WxF7oTgrXybM174NzdRxsjkaixg+s+fOd
         7vLJEoIPM0TQ0bHioodhTfVTrB9koQVAy2ceurtWhDRbB/BqKipi5kUdplOWpQ+oIRok
         RPQHUKiZ0hxMLIpnXes2Jet+I0ngSUn4dSTPgZu3nmL3MaGVPas/xF9pGkAv2cfkMKXt
         Ddu8CZbKQE1RQzaja+EZBoOVc2CgZP/x5ofPNO+0UkNAfaPgL+7ps98G6K8ufTaMfQDP
         JLPoP+qJIEgAiCUp/0Za5TDM6T+qcHmS1hf5wHAj/zcuCcPrLb0vaY+JusH9eXDtKW6K
         ccQQ==
X-Gm-Message-State: AOAM532a/eSjW7wwxX6g14wY/2Uy6rjXQB6OterlvUlk85FemNLFDQPW
        chpLMKr2e5cuKWbnw9ACFwMklg==
X-Google-Smtp-Source: ABdhPJz/CbZ/RVuQyXsLtfbfTUh9HP70UcEOYZ/Z9mDXIxeGLpabjuICfiiIaLeetmoAaxOHYEUvjw==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr3884145pjb.15.1632886999671;
        Tue, 28 Sep 2021 20:43:19 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:19 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 06/10] arm64: dts: qcom: Drop reg-names from QMP PHY nodes
Date:   Wed, 29 Sep 2021 11:42:49 +0800
Message-Id: <20210929034253.24570-7-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 'reg-names' is not a supported/used property.  Drop it from QMP PHY
nodes to fix dtbs_check warnings like below.

phy-wrapper@88e9000: 'reg-names' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
        arch/arm64/boot/dts/qcom/sm8350-hdk.dt.yaml
        arch/arm64/boot/dts/qcom/sm8350-mtp.dt.yaml

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ac775189a2e4..216d703f3e55 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3678,7 +3678,6 @@
 			compatible = "qcom,sdm845-qmp-usb3-phy";
 			reg = <0 0x088e9000 0 0x18c>,
 			      <0 0x088e8000 0 0x10>;
-			reg-names = "reg-base", "dp_com";
 			status = "disabled";
 			#address-cells = <2>;
 			#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 4e943e4a93c4..99cd54c69956 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2994,7 +2994,6 @@
 			compatible = "qcom,sm8150-qmp-usb3-phy";
 			reg = <0 0x088e9000 0 0x18c>,
 			      <0 0x088e8000 0 0x10>;
-			reg-names = "reg-base", "dp_com";
 			status = "disabled";
 			#address-cells = <2>;
 			#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b19a3619e56b..dcda4fac46b1 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1202,7 +1202,6 @@
 			compatible = "qcom,sm8350-qmp-usb3-phy";
 			reg = <0 0x088e9000 0 0x200>,
 			      <0 0x088e8000 0 0x20>;
-			reg-names = "reg-base", "dp_com";
 			status = "disabled";
 			#address-cells = <2>;
 			#size-cells = <2>;
-- 
2.17.1

