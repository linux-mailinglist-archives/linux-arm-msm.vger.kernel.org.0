Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD3E6F9B82
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 22:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjEGU2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 16:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjEGU2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 16:28:50 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8A64201
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 13:28:46 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ac80da3443so43371731fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 13:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683491325; x=1686083325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hbb+Gw2CW/HbmhZliVRpGRsPwJqaiAgOusSFBwss6U=;
        b=LhaHy5o46LDizECgcW3NDO4ChoSF+jVfMHWkOM6/9BLz/LjpwWu1wRhV5eb0xUgLSG
         JI8Ccfl93neNJMCQ+XFFnHfFG/6wFxCCOccFEWLkDwI3Rj8vJCPGjlmQmvkeqk6WIvyC
         N5GFuGUe7XyMYCMXXEiqsXPdeeOg7XDR832jeoW3fyzLkv/CS2Rq2ukfGF4srAo2GKaF
         sPDPHNjtjCwc6Ydt5cojWEYd/iaj81rZrB5+HKEp3ETo0z/mnpsqWh9yhh84zfmL0sjg
         XKofPsBUmBs46Jcg069/JykjrvHRpNAW6aMtUv6qzSZc89jYxyjHdltnTUeJ97q3ZqSN
         Duww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683491325; x=1686083325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hbb+Gw2CW/HbmhZliVRpGRsPwJqaiAgOusSFBwss6U=;
        b=jRvfK3FXKuXmj7Iw+38yN/WDSHIo0h+MjqFdX7D743dhQUx96NU9vy8SiUkMSG0V6e
         vPCQWm7XV88TYrKaWINziMCXtTEMMyAD5PwdRPnkxfg4WtYMebw1Sn0aEr0p4xCeLV6b
         j2tA8QTHr9QWU+A9RF/5/AOTYKkX8Jd+/AhJGbaOsDeU7v6lol/bID0JJ72jtpoEL9ZB
         B4GXZa78NZ4YhCw/8XAvZD9+Xz8nGQjss9zS9lvtTgiuwM7MhpugeTrrmUqTPZ7LunkE
         7lAIt6Tb3LP+eCVbWvVbFcIYIHf4ntTq+yzvPuF8SfzMILt87fHaRgTfu1tQRCm4b5rw
         Dusg==
X-Gm-Message-State: AC+VfDz/YmQY+oivNu5TNSSjqr5cJlSqXmo26aNXl/K3WhSmkUCAvnU1
        h0AzpfivWgMwcDb1KE4lt4ipwg==
X-Google-Smtp-Source: ACHHUZ7Yw1Dh/Uvxhe8otO9aoqhqpF2X2SkGV+rxNZnajmiPKx/Poiv2C2uF++k1Fio/WtE+SkwuOA==
X-Received: by 2002:a2e:938c:0:b0:2a7:6fee:2503 with SMTP id g12-20020a2e938c000000b002a76fee2503mr2221516ljh.14.1683491324878;
        Sun, 07 May 2023 13:28:44 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f25-20020a2e9199000000b002a8bb52d994sm928043ljg.25.2023.05.07.13.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 13:28:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 3/3] ARM: dts: qcom: apq8074-dragonboard: enable HDMI output
Date:   Sun,  7 May 2023 23:28:41 +0300
Message-Id: <20230507202841.2339127-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
References: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable HDMI output on the APQ8074 dragonboard device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 72f7e09a5bbf..850427bd2f82 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -20,6 +20,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		hdmi-pwr-supply = <&pm8941_5vs2>;
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&mdss_hdmi_out>;
+			};
+		};
+	};
+
 	reserved-memory {
 		mpss_region: mpss@ac00000 {
 			reg = <0x0ac00000 0x2500000>;
@@ -90,6 +102,24 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_hdmi {
+	core-vdda-supply = <&pm8941_l12>;
+	core-vcc-supply = <&pm8941_s3>;
+
+	status = "okay";
+};
+
+&mdss_hdmi_out {
+	remote-endpoint = <&hdmi_con>;
+};
+
+&mdss_hdmi_phy {
+	core-vdda-supply = <&pm8941_l12>;
+	vddio-supply = <&pm8941_l12>;
+
+	status = "okay";
+};
+
 &pm8941_wled {
 	qcom,cs-out;
 	qcom,switching-freq = <3200>;
-- 
2.39.2

