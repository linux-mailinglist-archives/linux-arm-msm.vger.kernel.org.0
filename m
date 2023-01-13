Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75C5E669140
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240691AbjAMIhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240722AbjAMIho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:44 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36CC69B0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:42 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j17so32135774lfr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfkoFa2aWXIMsvEye5R5adifXz0BMNct0gxornememI=;
        b=AoAqetfS3RLSABRWAprBoSvGGLyiZySm4fIcetmApEPKeEHb9Xb+CUSZd4monuRWN3
         cv5N99BpPaHPXosXS9WhmAbXBtgyIC6L7RyZhzV6M+GmZW+viutz8TDEsm65YTurvDJo
         Q6uVHe5eaP+gbVMRA5W9XCvMdh9kLaJGWR12rzYbN7AA/pZbg41VnQDe0DvG1qpaCK4q
         jhhzqL6HhHAOspmYHEvbaBJQO/WeV+a8y+Ho+fSMtN5uzgyl+opY4O5iHAnor+MOSWcv
         /1Fmj7mfg4DW3mnCq5K23O+r30+VvXB3t6KNbSSTYgyAO3bJpoIqKUnwbwiNeB8LU/eB
         Uuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfkoFa2aWXIMsvEye5R5adifXz0BMNct0gxornememI=;
        b=fjpvVEYslI5xyjqy46qCwImfM0azEkfQGey+kCwpWx/Ws6W2zIkAdHk6Fixamb5gZv
         GsILoy7pbSCEPX8GjPHQdeiSyj+iERKGfrtxG//7hElHrRRIKNWlcWKVjnY4MHf1WpTt
         U6cjNw5fendKB7Ft+Rsl1t69gRhj7qv0mpafM5Yt+bvRrUATNRfxWBu0sf55eVPbLRD3
         qBOvBOsPhEH1KW067aTb3sEZ7SKzUT5ERL83XQ7VNpTDylUVClc91yekOZsJLftqtUx6
         KvaqXX0RWmHqf5gpZyRuR4rLqlJBqEF5pgcwDaFGHAa6HD1f53lVwt6xELJqgLlXQMWY
         1XCg==
X-Gm-Message-State: AFqh2krmdh9PTh/zZwdukemOlLyoEmumGvpki//W4DPiCpaUU1nOCZ18
        vnVgc97xYLWZIW8Z3dHmSagxSw==
X-Google-Smtp-Source: AMrXdXv50Vl5IXHjr9MKDidF5CnW105R55HzZ4q3U0nm6Zs3daEjfdbXxBNi+8HL79VJDe0zZLBeJg==
X-Received: by 2002:ac2:4bcb:0:b0:4bb:8d56:d859 with SMTP id o11-20020ac24bcb000000b004bb8d56d859mr23664966lfq.6.1673599061082;
        Fri, 13 Jan 2023 00:37:41 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:40 -0800 (PST)
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
Subject: [PATCH v6 11/11] ARM: dts: qcom: rename mdp nodes to display-controller
Date:   Fri, 13 Jan 2023 10:37:20 +0200
Message-Id: <20230113083720.39224-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdp nodes to generic name
'display-controller'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index e045edeb5736..95705703fe8f 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1493,7 +1493,7 @@ hdmi_phy: phy@4a00400 {
 			status = "disabled";
 		};
 
-		mdp: mdp@5100000 {
+		mdp: display-controller@5100000 {
 			compatible = "qcom,mdp4";
 			reg = <0x05100000 0xf0000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 2e46a8b6bb14..3c725ada52c0 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1577,7 +1577,7 @@ mdss: display-subsystem@fd900000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@fd900000 {
+			mdp: display-controller@fd900000 {
 				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

