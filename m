Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AA9634B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbiKVXhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbiKVXhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:37:07 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E50587A6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:06 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id h12so19618901ljg.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPVJTDjd2xUbT1EVwZ8K5CXf0vs2sTPC7eU4qBWDs5U=;
        b=fPpiLqPI806jm8YPMkw1hWfsfu7fkbK/dGLtFK0YimCA9reWwAmU5dmkW5N/Y8Puvz
         HW7clDd3O/0vNf9wWehUp4xiJwkOm6hwaxuuiVEMjE48kRB0ipYaT5n1FtPEu+Vsx5su
         G6Z2V6NEZYLvm5fBmdvuoEficjMDlD6RABF7HwUfwXCt9A9bppvZrGdrfQ2SIA97djWN
         LCP9U5UJ/zzqpSpICwbFNne+69OkhAS3SQyyseeVLX0hwqb/qTu88q9o3KmHYro25skI
         Hz5JD5nDEo9tMLIVPp3MBShR5gy4wrjRPXpYqD9VFXjrU5vY/MKaYz8NQeVewFLky03T
         G2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPVJTDjd2xUbT1EVwZ8K5CXf0vs2sTPC7eU4qBWDs5U=;
        b=tYUvbJDnadg2ye2HjPI7EpAwI7pmGDof22DwHBX8wQt2Z1mjNlNW+cE8x/+CvhKf35
         pmQYuHyCvz8MObSxYn5ikWvEi7gBeMNpmxLc1IIVeKLLMfKO4pT4Vrk2wywVjcI2yCjE
         u8YEg+04mhodpOZo7Xy9IXxX6lUcWJD9tM8ky3v9/dUYYZjXpMthoeUathbDEPDSpfG7
         AN/AaYx2FCEwnz2jGUpIzUkditC6z27Qr+4g6ryyxiSOq+El0P+sEDRmSBK5RQf9vyj8
         /IM2+Pln27weNzsXL3qidSm9CgdjWEBHm8q5HiBMtakYx3/HQEUhVDhYxbd3bpN/L0E6
         fP+w==
X-Gm-Message-State: ANoB5pkt3VVryzqX+rc1vOLtrw36SA4wiEpOeSYwQYnCen7ErZ2OuG78
        qcp3U8gvNVFbQXewyME8GqgfYA==
X-Google-Smtp-Source: AA0mqf55ZYf37eIMcQj+RS7jDuAKKcv1Lzm98k2aIlZO+llxYLLijwT6AOAf6KcsrXk/Yx5Z9F4rbA==
X-Received: by 2002:a05:651c:220a:b0:277:2428:3682 with SMTP id y10-20020a05651c220a00b0027724283682mr8835362ljq.291.1669160224548;
        Tue, 22 Nov 2022 15:37:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:37:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Date:   Wed, 23 Nov 2022 01:36:59 +0200
Message-Id: <20221122233659.3308175-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 6b6dcd0e0052..709cddaac781 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -393,6 +404,26 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
 	};
 };
 
@@ -405,6 +436,11 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5b_0p88>;
 	status = "okay";
-- 
2.35.1

