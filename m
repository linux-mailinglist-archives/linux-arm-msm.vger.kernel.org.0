Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218285B9EB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 17:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiIOP0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 11:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiIOP0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 11:26:34 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6F64661B
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s10so21996001ljp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=M/rdnkmf/apVOo34qI05Gx9FcrOVUvjfskbz8KTOn00=;
        b=qEOxHpJK9rPMy999+rGsm4MMZqd3C3NMmLdf7mHIn86rkyrQGbypFX688gLxcpCNwA
         dLaNqSRlxu6FEjGhwcEbyo+dI/gR+86hucJPMXVi2+2L+VLAQb9H7RsHyLsJea5J3um0
         PqX8SWOei2ikWHOqXiMCsj/K6dKD0kilr2GrMVL1NlIY4jKiTpYGlwcWCRfZiThYm0JD
         hfAjiWGNIO6vgVXfRSHrIcTUfZPRYpAoq9iJIG8K5WxgRs1uHNxVA2bE0/TKhfVawtFe
         AGFCfKaaKXIo1ADW7Rut+FvMc0aD68hoBwXmFLhqa3fSGEFL6JEOHa31lVJtiJ4/48p1
         l13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=M/rdnkmf/apVOo34qI05Gx9FcrOVUvjfskbz8KTOn00=;
        b=wbGhUuheNkArOVmj9r6+CGYqO0MsSK1JX2JFpkhu2tbNA4fgXKCJ9HUZsWidvpri3c
         0M3SY5WlsYeiQU5XVMXVYEjc9oaVZpTE2EQ32EzkwZOlw7DWX5pc5r9u5ZOFny23LkuZ
         hlV5/MpzSpBJuZNsqpZn5ZsaVbV6qVpyREJQp0gtDz/AsotC6D+yI898JjfC43lHBv01
         ndPJQeXHCbblXGWQIk4xwBxsGF2YdBXdcde+1/z8WIOKZCNl0cjYysf3dcRTBQrW7Gwc
         V1qep2yXSV1YUiLmn718yoMDYd0sDlqoeyqOA2mnzLHAWH8JimXTBecRUQVwR/xxEzNs
         y+XA==
X-Gm-Message-State: ACrzQf1v/M89/C2swN7FlyFXL21q+CLauZAEwWt4GVx3aNnaWSYwxhF1
        OqAfsLWeWRFL0ZAFtmel0uJayg==
X-Google-Smtp-Source: AMsMyM673haWp8zhu4KTepfurMwa+LEaEHrie0p26kOzLMGn2dmXsZ2+6RYCp5UXF0BdQAoUUzNK/Q==
X-Received: by 2002:a05:651c:238e:b0:26c:17ce:fa3 with SMTP id bk14-20020a05651c238e00b0026c17ce0fa3mr72687ljb.529.1663255591914;
        Thu, 15 Sep 2022 08:26:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a18-20020a056512201200b00494813c689dsm3012653lfb.219.2022.09.15.08.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:26:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 1/7] arm64: qcom: dts: c630: correct firmware paths
Date:   Thu, 15 Sep 2022 18:26:24 +0300
Message-Id: <20220915152630.133528-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct firmware paths for the Lenovo Yoga C630 to include the SoC name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index be59a8ba9c1f..35d367bf97a4 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -94,7 +94,7 @@ backlight: backlight {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/LENOVO/81JL/qcadsp850.mbn";
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qcadsp850.mbn";
 	status = "okay";
 };
 
@@ -306,7 +306,7 @@ vreg_lvs2a_1p8: lvs2 {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/LENOVO/81JL/qccdsp850.mbn";
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qccdsp850.mbn";
 	status = "okay";
 };
 
@@ -345,7 +345,7 @@ &gpu {
 	status = "okay";
 	zap-shader {
 		memory-region = <&gpu_mem>;
-		firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
+		firmware-name = "qcom/sdm850/LENOVO/81JL/qcdxkmsuc850.mbn";
 	};
 };
 
@@ -475,7 +475,7 @@ &mdss {
 
 &mss_pil {
 	status = "okay";
-	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/sdm850/LENOVO/81JL/qcdsp2850.mbn";
 };
 
 &qup_i2c10_default {
-- 
2.35.1

