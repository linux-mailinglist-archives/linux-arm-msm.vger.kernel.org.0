Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9B86F9B11
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 21:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjEGTHr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 15:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjEGTHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 15:07:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CF6359C
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 12:07:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so4288805e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683486459; x=1686078459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSq41UJRxM1Id04+5Bgr5nBkxb99E6+NG+r6r99Xdss=;
        b=X2UPItrb69Iq2LW98ux7h+6Hr+2d7mH9vholzNqwX/ReqBihFSjzMFZMLxdSBnjwRn
         1MC5k+sVCusWvTy3FtDGBdNAUqAKG1J/vbflMPMxaiVeWzr482mKTE7pedT4iKGzzF+k
         K16qIkQ7L4QVvpPa5RvP4vUSzzxRX0rw3XvUidbo64zkaU0OT/K9inIMWZniJ6vjtkIG
         +TsO/ZAhgNNIDOTIYlJUITc1NEbtaVxCESojBI5/SMabVAgbKGDd3dnSQVVrx+vEA/XO
         JsxZkCeJX/5K34pK38rz0nlign9+9VX4iISp984hyYQ4SpBxA/0oCUEf3iJ/cZh544Ww
         Jo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683486459; x=1686078459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSq41UJRxM1Id04+5Bgr5nBkxb99E6+NG+r6r99Xdss=;
        b=YnMXbxYVO3aHeuvFVVLtrbBs0jwUtsnaokbeA5T+qreZukGbbBox0mzWInnzssQXmO
         RlV09LvGVlTXeUumh+Zz8FkoBgKKtLB8zAb2PIIYIFmFsyLYGGwngTzaTex2kWsbO3vD
         ERetwan1RoTdEv0JQn0GUuIvnQJtpl/0LwJJzi5uYjpTPqjz7ToC8kvIfDI4UQzLOPja
         Wma6ZQBhOSl+DELgRFjLKEaI2PwjJBbkwbqn9wOjmC+/bghzFqfnSkOEB41l7klxfhEz
         gd3Vd2dof5clpICpGYYJk8tktJhqsVYb3BvUvlXKhYN1df+OiCLEtg/LoiodZcrGH52J
         77og==
X-Gm-Message-State: AC+VfDzVy9fZs61dnc/NW4PLGl3O12YSO4FWwuhPkZ/ZKeIZf2a+NYqe
        tWhvO5OIsoCAzGtZe/sCToDAqw==
X-Google-Smtp-Source: ACHHUZ4cx4F0q2aBgA1kXEmiFrVY2oIHHctVd/EdZd+fb7DC1OKAWyz6Ls/a/OeQXeq5q1HFrW+jXQ==
X-Received: by 2002:ac2:5542:0:b0:4ec:9e63:6144 with SMTP id l2-20020ac25542000000b004ec9e636144mr1690875lfk.42.1683486459550;
        Sun, 07 May 2023 12:07:39 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 12:07:39 -0700 (PDT)
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
Subject: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and MSS
Date:   Sun,  7 May 2023 22:07:34 +0300
Message-Id: <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
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

Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
differs from the one defined in the msm8974, so it overriden locally.

The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
similarity with other platforms). This requires a patch for remoteproc
to be applied [1].

[1] https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 6b047c679370..c893afc00eb4 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -4,6 +4,8 @@
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
 
+/delete-node/ &mpss_region;
+
 / {
 	model = "Qualcomm APQ8074 Dragonboard";
 	compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
@@ -17,6 +19,13 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved-memory {
+		mpss_region: mpss@ac00000 {
+			reg = <0x0ac00000 0x2500000>;
+			no-map;
+		};
+	};
 };
 
 &blsp1_uart2 {
@@ -39,6 +48,25 @@ eeprom: eeprom@52 {
 	};
 };
 
+&remoteproc_adsp {
+	cx-supply = <&pm8841_s2>;
+
+	firmware-name = "qcom/apq8074/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mss {
+	cx-supply = <&pm8841_s2>;
+	mss-supply = <&pm8841_s3>;
+	mx-supply = <&pm8841_s1>;
+	pll-supply = <&pm8941_l12>;
+
+	firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm8841-regulators";
-- 
2.39.2

