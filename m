Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6FC35B9EBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 17:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiIOP0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 11:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiIOP0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 11:26:35 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BBD422F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u18so30940341lfo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qvHk4DrIbTDxru8F4UVY05nNjanUC/r5WgFJSexSTzs=;
        b=h7sB0UdV8hX/Y6FO9Kx5RtiHkCYJsq6LKFWet0KfXhD2XPr1Zv4Sg2pV0Oo4WSO1I5
         1hb+kOuUdpQDE4QUdyt9il285+FNC716D8gc61d1dQeNU8gOgCUcL8ast9hQzNsAIaLu
         RFL+2eeHqepiT5fH1MxhzOZh0CpEGIyL8uuEZkOm+s2ik1RhIAa8iC5QjEhFyhj/igG5
         FzohW3+u2CLr8ANfPm+PxFy4ysZ2MDhb1Va7jMsr72oQegmjGfJwTdAU0Z1+D7EdqU/L
         XObrkZWKBPThBcIOqkdn82mcCmjSN4qQZTLflFg1B5CSUdFXrsKR1koIwP/OW8dULO0R
         CepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qvHk4DrIbTDxru8F4UVY05nNjanUC/r5WgFJSexSTzs=;
        b=sTxNc8cVD9UdYJda/BOq46MbqXtguRKeqUZmSO0Ke80Ly+4LDWP/YPm/e6fObn+PS7
         7nevcLLSQxoZyBOC+9w6X3SI2ltDw9dBKOh0cDgEIjOS+HhycZ34o1nZMIK5Ky/NZP8x
         CVdkT6SNHlkHM+g0Yw9SDoLFeCTfUY+JxrwFFkTMhcAwHIL3girylvtiV0zk0L2fhz2w
         ljnP8RDaQi5/GI73HmMdyngsBxsOLLt5gqO5vtkv0GGrrkwi0aDABDepR41ECX5drWi1
         Gijd2svjJJps2352egMR2Uu+AVZPo+bitiGvImTBDeNaFncfHYk2v6d/H5oxpfUtJvXm
         4aLw==
X-Gm-Message-State: ACrzQf3l4lj/YRrjzy4xtpcnZRAGyNjGNJkRWV+ANdggrWVxA4S4dwCd
        GnJTdgyrLq3EuVrswvCp7QSYZg==
X-Google-Smtp-Source: AMsMyM5+ylozfKDFXCPIT/OcDAHAEGyGSISUsbexRgJk8enEunm+V+PWXG2DOgcTZtvcj5vMKor5XA==
X-Received: by 2002:a05:6512:39c7:b0:49c:b8ec:14b9 with SMTP id k7-20020a05651239c700b0049cb8ec14b9mr127415lfu.569.1663255592695;
        Thu, 15 Sep 2022 08:26:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a18-20020a056512201200b00494813c689dsm3012653lfb.219.2022.09.15.08.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:26:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 2/7] arm64: qcom: dts: w737: correct firmware paths
Date:   Thu, 15 Sep 2022 18:26:25 +0300
Message-Id: <20220915152630.133528-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
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

Correct firmware paths for the Samsung Galaxy Book2 to include the SoC
name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index f954fe5cb61a..78eb967041e5 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -124,7 +124,7 @@ spss_mem: memory@98f00000 {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/samsung/w737/qcadsp850.mbn";
+	firmware-name = "qcom/sdm850/samsung/w737/qcadsp850.mbn";
 	status = "okay";
 };
 
@@ -336,7 +336,7 @@ vreg_lvs2a_1p8: lvs2 {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/samsung/w737/qccdsp850.mbn";
+	firmware-name = "qcom/sdm850/samsung/w737/qccdsp850.mbn";
 	status = "okay";
 };
 
@@ -385,7 +385,7 @@ digitizer@9 {
 &ipa {
 	status = "okay";
 	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/samsung/w737/ipa_fws.elf";
+	firmware-name = "qcom/sdm850/samsung/w737/ipa_fws.elf";
 };
 
 /* No idea why it causes an SError when enabled */
@@ -395,7 +395,7 @@ &llcc {
 
 &mss_pil {
 	status = "okay";
-	firmware-name = "qcom/samsung/w737/qcdsp1v2850.mbn", "qcom/samsung/w737/qcdsp2850.mbn";
+	firmware-name = "qcom/sdm850/samsung/w737/qcdsp1v2850.mbn", "qcom/sdm850/samsung/w737/qcdsp2850.mbn";
 };
 
 &qup_i2c10_default {
@@ -696,7 +696,7 @@ &usb_2_qmpphy {
 
 &venus {
 	status = "okay";
-	firmware-name = "qcom/samsung/w737/qcvss850.mbn";
+	firmware-name = "qcom/sdm850/samsung/w737/qcvss850.mbn";
 };
 
 &wcd9340{
-- 
2.35.1

