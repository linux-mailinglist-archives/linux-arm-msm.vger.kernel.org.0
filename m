Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5320A4181A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 13:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhIYLkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 07:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhIYLkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 07:40:14 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223A6C061570;
        Sat, 25 Sep 2021 04:38:40 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id c21so46359709edj.0;
        Sat, 25 Sep 2021 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=roWdXJBSdw9+VuRoLQLUX1eQtYSQ8tE66jDz+31Mfiw=;
        b=JaBl1QCrry8L/oNAUtR1rnb4mbXgXtEF+LWU6mHBLmllb2DnwXDSsvSMaJuNMPqeNP
         LeY07lVfv/8z9f73Ng3XIWE79OKKroy0qDmB5DWg/rDdfQZNxUyWAgP3OqBKYM3gb3aB
         bIsj6imfnZ5yWyRzD8y6+C3cn9JmihxPH/i/D6m2tWEU3S/5Fc/m06+48ue9tuXw+q+r
         97H+45NylVnBmg5Z1tmMAwdWxVgPOfXtZr7FtXP23nmwDJZjrim7lOyamyGMMDpr23tt
         o+SL08cPrDrPXai/e5ux+y1EeGGVrfpeVTRshXZvAR3rwXKcRXnOvB1D5aqqbntx8Gun
         hwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=roWdXJBSdw9+VuRoLQLUX1eQtYSQ8tE66jDz+31Mfiw=;
        b=FwMe1o52VzIJn67ZvloBis4BSxQ7YFMo1ggjoq+QNrDCm4Ve2xiKlFQqJKJnZoAQrO
         yPEyLNuDk5EnPJVuaMQ/bYpwyUdhHTQY+fLWoBfreh0XOhJMwAK+hkpVG6uy2kHkw7ZS
         P+7FCIKSTW8bExsIITmaKLYmWAk52X7agw1f2ewD/GJfgPdhyHpih9gA7osPtFXyUuFb
         6nvSizpeiJUuQK1y+TWlx2R4MGeipnc8mLrsl0oa4ynIWWDORNQYjjONUe4C5kxn/xng
         npRmlgBCjq+QTsCFaUYOVDqKGgny2rWcXxzntjjRET3FM1NnF+AW3qGolmkk8lcm1T0E
         Gv0A==
X-Gm-Message-State: AOAM531m1oTRAMqXRBEsKkkhUE2EWT2DAZZxGuPT+z++Ux628O7jS2yr
        4dV0yuEU0rPbh7dNXR+Kr6V2JeI/mH5ctChWmEM=
X-Google-Smtp-Source: ABdhPJxtfaImb1rZz1q8iQAhUycsglBjxCjNlFI8To/wF1yaN8UGDZEcLyBt5G26p6AfbDMtGeJ33Q==
X-Received: by 2002:a17:906:658:: with SMTP id t24mr15884482ejb.358.1632569918702;
        Sat, 25 Sep 2021 04:38:38 -0700 (PDT)
Received: from localhost.localdomain (net-93-144-178-230.cust.dsl.teletu.it. [93.144.178.230])
        by smtp.googlemail.com with ESMTPSA id c5sm7294283edx.81.2021.09.25.04.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 04:38:38 -0700 (PDT)
From:   Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     y.oudjana@protonmail.com, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996: xiaomi-gemini: Enable JDI LCD panel
Date:   Sat, 25 Sep 2021 13:38:08 +0200
Message-Id: <20210925113808.524749-1-raffaele.tranquillini@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the JDI FHD_R63452 LCD panel used on Xiaomi Mi 5

Signed-off-by: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
---
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index fe950be0a722..ab6dcd44e673 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -90,12 +90,45 @@ synaptics@20 {
 
 };
 
+&dsi0 {
+	status = "okay";
+
+	vdd-supply = <&vreg_l2a_1p25>;
+	vdda-supply = <&vreg_l19a_3p3>;
+	vddio-supply = <&vreg_l14a_1p8>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&mdss_dsi_default &mdss_te_default>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
+
+	panel: panel@0 {
+		compatible = "jdi,fhd-r63452";
+		reg = <0>;
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+		backlight = <&pmi8994_wled>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+};
+
+&dsi0_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &gpu {
 	zap-shader {
 		firmware-name = "qcom/msm8996/gemini/a530_zap.mbn";
 	};
 };
 
+&pmi8994_wled {
+	status = "okay";
+};
+
 &q6asmdai {
 	dai@0 {
 		reg = <0>;
-- 
2.32.0

