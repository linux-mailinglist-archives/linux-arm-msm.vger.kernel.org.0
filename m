Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552016599FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 16:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbiL3PhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 10:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiL3Pg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 10:36:29 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311411C11A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 07:36:20 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso15402164wmp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUZ4tH5NR3ShWZI1wP6dN+Rtb/3uNAvjYHh4qP5xPyE=;
        b=FuUdHcpUYQ9YPPxX4SKwXxQvofU88zGqyShLAyTMeaKmnILpPJQWKjaD9YxGKVrQcV
         W2hIH79me7FKOF8/Y1SB/koRnyad4gOnEl7UQkCVKXSw1RTi28RHLKhZ9jsnlh9QFU3y
         lK7oQ/5Ic27ki8095V8Cthvy3rc90ovibaN471dl1lcBjRDnU9rafr4zITjqECRkuXxG
         6nJmbXYELd7+JuPC1G8TIx7GrtYlPLYEKVppT194T61kc35ThguwFQimR+PMNEsMpbkB
         ETj8IXSQCPjYdwH17YFaYu9c5k/I+qVRuYwEYFYq+9Wgw4lHHF+a4PXwaHkdRCzuLCjk
         Trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUZ4tH5NR3ShWZI1wP6dN+Rtb/3uNAvjYHh4qP5xPyE=;
        b=2tH+UrcKSVS6M8GETkU5xQxJ/6aqlQ3fmWu4UHZv8S6Bxx1e2Vr1TpLelq9T8pMf3o
         ycVWcrtsoOaKeQFog0SB0kap8VqTd609Y78hmcZ+XAI38FGrXez7mSB43810A3C1Vrqs
         WinP7SdjamfXexc9MhXhgcAHohD8BqEyqPGBI1VGyaGZRBZSxTLP/NNffVfytHyGi/CO
         PM4Y9qkNaY8kdwV8NhOx41JUzql+wmXTVTx+0o2k++aR8TTFhIO3GQh3sgFKYYLbvfYm
         7nRbDnr14K8FHkcJH/KTaGFI6mGlg5k9lGkvxZ963j+nr6aWtjc55IJ3Ph67ffgqbzf2
         YoKg==
X-Gm-Message-State: AFqh2kpO8lm/6FZt9UJmGSMukAwEukU7zfBFye6B3GWmGw7rA5yYLwxB
        grbPYciAIlXMfu5rez9UphZsYg==
X-Google-Smtp-Source: AMrXdXusPgecTGP7fZw7vXdt4tF+S4NwgTctVJuFf4pxyAgs9zjLTxk3FWQlnp0PQZM4bfCkaapj4A==
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id ay16-20020a05600c1e1000b003d1f496e25fmr24402994wmb.16.1672414578700;
        Fri, 30 Dec 2022 07:36:18 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 07:36:18 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        quic_jesszhan@quicinc.com, robert.foss@linaro.org,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, swboyd@chromium.org,
        dianders@chromium.org, liushixin2@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org
Subject: [PATCH v4 10/11] arm64: dts: qcom: sm8350-hdk: Enable display & dsi nodes
Date:   Fri, 30 Dec 2022 16:35:53 +0100
Message-Id: <20221230153554.105856-11-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the display subsystem and the dsi0 output for
the sm8350-hdk board.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e6deb08c6da0..1961f941ff83 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -213,10 +213,32 @@ &cdsp {
 	firmware-name = "qcom/sm8350/cdsp.mbn";
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy  {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 	firmware-name = "qcom/sm8350/modem.mbn";
-- 
2.34.1

