Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D926197850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 12:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbgC3KGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 06:06:38 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44071 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728862AbgC3KGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 06:06:38 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so6523556plr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+enCzaxBEoDGVMdSKKjKI8lbbLVCEuMCoYY+RCjRZzc=;
        b=bLgzHdYxFq/jOwfj7twqp9c1thiyjjQyWpOHgnamernKDOMWDnH8K0VS+Yq1886xcS
         QmlnNSGMZcd2f8PfE3m0ejVIqV7rBClhIBZaCYAb1mW9RuS5o0nf40Il+CFZvRxK3k1t
         lqIVte9SSgcZxfA+zigak1Mu24W3xtxGbWazSn8aD5cL7WBCNHIHMNsFY0lIb6/Xgnxq
         2OFaRYAxITf/p+ZpPVXAjbcRfNUmL1lKFQte4TcFeqsi+A1GnaDANfPX6PBDneWZkvuF
         JNzhGVnK0CuLczdqJ2SGTQ9K39kT5g3gPpe5RnkIoLiIH4dTcUjPCkSD2SHRZpgHEnW2
         bJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+enCzaxBEoDGVMdSKKjKI8lbbLVCEuMCoYY+RCjRZzc=;
        b=OjlWsL+4iqy57kSVxXaFjnUJr55X4FFhoKEV4e9LoazDOiRW9wrp/7U9UjtGdcwlWL
         GOWb+IaoFUKfiUmK3K+WlxTAxRqdnAHgMcpugnvWloQydJE9pnVgtlAnbaHxROtJhqSp
         MtAseqblsiJ1UPDx08WPPuRZ8/Ghs60ezHahqt3zZBJgUXfNqmXVCxbivEJ/U7ZJfTaL
         jM81G+5VEm0DQm3oS4OEKVyivLp/jbJny/OWsAnhVihw1rzGPVHCbToBGpuIdz+4QcCs
         BmOGxFB21znl/Wmdk5OHQB44OaWkWGVpoNyezyOAqerMSS9yOKhlvo4lOyDeGsJH/8HP
         Gx1A==
X-Gm-Message-State: ANhLgQ1MQUOAdtn5jMxfVGdNCRJilE1rABnUuOdGpfztNXZXqNbKY13t
        CasA2zx6WthPRf4oUE/Un2w2JQ==
X-Google-Smtp-Source: ADFU+vtj7nbwgn7byKmRyzD6PpGh35VtxkBIIlSflSxZRU7P+TmE4XwXRJ1sZhXCp7Dx5Q2LTN5Jjg==
X-Received: by 2002:a17:90a:e289:: with SMTP id d9mr14508896pjz.172.1585562797091;
        Mon, 30 Mar 2020 03:06:37 -0700 (PDT)
Received: from localhost ([103.195.202.48])
        by smtp.gmail.com with ESMTPSA id s4sm9736233pgm.18.2020.03.30.03.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 03:06:36 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: remove unit name for thermal trip points
Date:   Mon, 30 Mar 2020 15:36:26 +0530
Message-Id: <2d3d045c18a2fb85b28cf304aa11ae6e6538d75e.1585562459.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585562459.git.amit.kucheria@linaro.org>
References: <cover.1585562459.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The thermal trip points have unit name but no reg property, so we can
remove them. It also fixes the following warnings from 'make dtbs_check'
after adding the thermal yaml bindings.

arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: thermal-zones:
gpu-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: thermal-zones:
camera-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml: thermal-zones:
modem-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'

arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml: thermal-zones:
gpu-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml: thermal-zones:
camera-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml: thermal-zones:
modem-thermal:trips: 'trip-point@0' does not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064f2374e..1a6e28923a45d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -261,7 +261,7 @@
 			thermal-sensors = <&tsens 4>;
 
 			trips {
-				cpu2_3_alert0: trip-point@0 {
+				cpu2_3_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -291,7 +291,7 @@
 			thermal-sensors = <&tsens 2>;
 
 			trips {
-				gpu_alert0: trip-point@0 {
+				gpu_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -311,7 +311,7 @@
 			thermal-sensors = <&tsens 1>;
 
 			trips {
-				cam_alert0: trip-point@0 {
+				cam_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -326,7 +326,7 @@
 			thermal-sensors = <&tsens 0>;
 
 			trips {
-				modem_alert0: trip-point@0 {
+				modem_alert0: trip-point0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "hot";
-- 
2.20.1

