Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD326B7DB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjCMQeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjCMQd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:33:57 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D3B311C3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:33:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id g18so13270189ljl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678725191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CxONYlXbCE46JzSnrD2nWGCh+WkRTAjOZ5NSyDbpw8=;
        b=AFQifsd1SLgid7KrqFkxfOw0+evOEq1iGhOY8CvifCXnW39zPJQSxXsqbIhh8tvTK9
         VNPb0zyL9o+d1vcRvRuSsD6thg5wuLMaIBtBfenc3OR2AN6TrZH1PI0uvoEloYK2FIvj
         8vtaM2DUS+dOH0CrkCUZSbVG2MRgCoNhf2QjGrrgVKUHnDbjD/t052Q55BzXBualhHIu
         rg2HJ3guo6kTG3J0N0O2KCIsLXinUrnEv5mBesmw74wfQ3K/EAdYdFp6no/soU4MFElm
         G4EhQ1nhtr59eGVLIkQb/ekdvUd4glFZdsML+323p19qpc06A7A8dfuTnnnFeWn2e4Lw
         toUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678725191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CxONYlXbCE46JzSnrD2nWGCh+WkRTAjOZ5NSyDbpw8=;
        b=w8iPRCTDZ/ysbrqVrHu/O+eOGuUSUJpW+uLmWh3/lo/peJk2i3vYeQlMfwP4+Ekw9Y
         Czko9oLQFk2na4LPY4mU/lYHFW/dZZMcEzyG34FFZD9ZKq1cxoRFMVeb1vt0FNSj3UgX
         RJ7Y5ZGer/pd4KTCax7V/03d5S4L2jzRs7CnS/CC/vi2Toou9HHzV0qaSEH9LPLKxzZq
         dFAiAuFtmnY4kny885JSpxt2MnoT5dFsfe+CaRUp9Cb7JfBTNpERLokn359oZcwXkxWY
         NSZ5yPUwc3dWIkFbyHhXGIKPWwo3sIXjDoaL8AwDBvnqSrgQqAPUuT4yuW4uQzsGxtd/
         FVUw==
X-Gm-Message-State: AO0yUKUrR699sWvTY0O4rXaSDhxu6I1zLSuuDQXkEWTzz8Ucol/f6u11
        dgvi2oo3vVsjke/1uxCL3JR6nA==
X-Google-Smtp-Source: AK7set9Y/uAi4/8XToEc/9gCo4pvToZZ2iYC6eD0ylb+V9MwdW7caDc2WemxNevU00Jfn9cKJzJjaw==
X-Received: by 2002:a05:651c:2203:b0:293:5359:79e5 with SMTP id y3-20020a05651c220300b00293535979e5mr14118542ljq.45.1678725191097;
        Mon, 13 Mar 2023 09:33:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id q62-20020a2e5c41000000b00295765966d9sm57417ljb.86.2023.03.13.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:33:10 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 17:32:39 +0100
Subject: [PATCH v2 4/6] arm64: dts: qcom: sdm845-tama: Enable remoteprocs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-tama_disp-v2-4-37ececf43770@linaro.org>
References: <20230313-topic-tama_disp-v2-0-37ececf43770@linaro.org>
In-Reply-To: <20230313-topic-tama_disp-v2-0-37ececf43770@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678725183; l=1234;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Rx28LjNFzrujYPOWBc+/k5L3Y7mtVY4k0AwlMaNoEFA=;
 b=ADboLTLkeQJze9/fjAEOc9v38IdLgp+bxeKFNj2+NK9ZCWrjtmC1rvUaLhu3F98YheqBOWsU9rZV
 RYXKJlxuBabuE5R/uWTNBMR6F3XzhWIhV1d8+/F2sIlcePUIT5cd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Enable ADSP, CDSP and Venus.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 0e03a4f3449e..68faf46540b0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -98,6 +98,11 @@ ramoops@ffc00000 {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm845/Sony/tama/adsp.mbn";
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -358,6 +363,11 @@ vreg_s3c_0p6: smps3 {
 	};
 };
 
+&cdsp_pas {
+	firmware-name = "qcom/sdm845/Sony/tama/cdsp.mbn";
+	status = "okay";
+};
+
 &dsi0 {
 	vdda-supply = <&vreg_l26a_1p2>;
 	status = "okay";
@@ -663,3 +673,8 @@ &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p1>;
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/Sony/tama/venus.mbn";
+	status = "okay";
+};

-- 
2.39.2

