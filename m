Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67BA3969C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 00:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbhEaWrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 18:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbhEaWrM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 18:47:12 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7011C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 15:45:31 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id v13-20020a4ac00d0000b029020b43b918eeso3067130oop.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 15:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opmce6Rxnuaces55T3McLEYWuvos7Vs5yiViL8336IQ=;
        b=f2OEVwPqTNs4SFeTk+vRARVjcMF7xFdzRyGcX8zEhtOquraGg7crn/Ps8h+7l/+Js/
         2AWbkSUkoToPhpTGc4VW7wyOHo8EGIRYWkAJ+QZDKQ6bbdbd2GDqR1lT3M2YHJNsLKWB
         Zm9rqY67UunCP0AP2TJju0y+k0ZsrHTKisZ/XDlUWYvPhGuYScFeDHlhoBLZlhj13pVP
         KYNcfO74fGCWs4UspWbqcLcWXyPRH35NNFH2LhIf7u1KfnF0DNtTtbf3vo73TeXZDI+E
         sV9IpPZRphgzPWnxz8BToCwDwloqdA6ReSHS5ozR4/+J2B1qfi1iDPA2yh7ESkL57xxj
         gQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opmce6Rxnuaces55T3McLEYWuvos7Vs5yiViL8336IQ=;
        b=VJUKGO93saV+SNu8IjC4BZxlFl9e0moiIeN7sBQaACkty60UM7Gpi9YBgl5PxZVjnv
         UBHZQQOmOAzEzSg5Q1AQ9+ZvmG0/f8JuhEkly15rWr9evx5EHR74cA35IwjwI2ec0G43
         ox3fZAsa5sochA8emZbd4aBwuiF3swOg09rn1KtS7h/CgM1+MVQUNtV8dTa7Bl5mlMV5
         6CX4tE+2Z1jzsfkglW/O2vMMi9xn8zgClo4KikDcqneFMhbxH2NJWWeDwPsv1wBL5yB1
         QfR5WZp4dpfbcDTuktuE+YnohtpCKqLN8xKqQZL+9jeylwojYptDcEEIfIa6nOpVvld1
         QMTQ==
X-Gm-Message-State: AOAM531JzbxAFfq/YWeiNQ7BEQmy8YarpQKZpAyXW2cveWfdmPAcDVCm
        8kFdvAT/aD+NSr0jQtmZLK/onQ==
X-Google-Smtp-Source: ABdhPJx/Qp5zgllv9Vp37l1DupQ6t3i2dFFMbwnaF8G5LKLMcli4A812r58mrK+IId0S5WG2RHj0uQ==
X-Received: by 2002:a4a:97ed:: with SMTP id x42mr17736919ooi.40.1622501130540;
        Mon, 31 May 2021 15:45:30 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l9sm3041877oou.43.2021.05.31.15.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 15:45:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Anibal Limon <anibal.limon@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: apq8016-sbc: Update modem and WiFi firmware path
Date:   Mon, 31 May 2021 15:44:53 -0700
Message-Id: <20210531224453.783218-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The firmware for the modem and WiFi subsystems platform specific and is
signed with a OEM specific key (or a test key). In order to support more
than a single device it is therefor not possible to rely on the default
path and stash these files directly in the firmware directory.

This has already been addressed for other platforms, but the APQ8016 SBC
(aka db410c) was never finished upstream.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi     |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 6aef0c2e4f0a..448e3561ef63 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -305,6 +305,12 @@ &mdss {
 	status = "okay";
 };
 
+&mpss {
+	status = "okay";
+
+	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mbn";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -312,6 +318,8 @@ &pm8916_resin {
 
 &pronto {
 	status = "okay";
+
+	firmware-name = "qcom/msm8916/wcnss.mbn";
 };
 
 &sdhc_1 {
@@ -394,6 +402,10 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
 
+&wcnss_ctrl {
+	firmware-name = "qcom/msm8916/WCNSS_qcom_wlan_nv.bin";
+};
+
 /* Enable CoreSight */
 &cti0 { status = "okay"; };
 &cti1 { status = "okay"; };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 4f06c0a9c425..6abe0f8edb55 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1738,7 +1738,7 @@ smd-edge {
 
 				label = "pronto";
 
-				wcnss {
+				wcnss_ctrl: wcnss {
 					compatible = "qcom,wcnss";
 					qcom,smd-channels = "WCNSS_CTRL";
 
-- 
2.29.2

