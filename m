Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22726110D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiJ1MJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiJ1MI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:08:56 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5541A1D3E9E
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:08:41 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id 13so12493271ejn.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtRwy+4HAfMc7GVoO6XoNWELcyR2UkUd1zXAHj0aQ9A=;
        b=qjpUTmDfugkj9yvRKDxIq5N1qqwBducxc7dR6mribRQvRRCQ3H7Wcj7roTA3eI5AuM
         gfYA2dZIF8VXPzBvND79At/Z8iJTljOSp5Bt1tqs7EaquGYNoykpCZfX9ioinFaMMrYJ
         yepEQcGfcxdspJqN2r/zwqxxR7y6VyRv300XI7F0FoXrjSmg9Fjda1MmtAJt2mKch5Vs
         TP2yoCd04KbbPLYhKznFbEYkID3gK21PIFuZWhsLKhwbHaAFEJbfahBY5iWmGIuK2DQz
         8EDDPtAP63UcOXdoctrjf3Bdt47AmW4paFzkIZHUjp+YP+M4WJFyPl+xau+kg4TMFEgh
         2T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtRwy+4HAfMc7GVoO6XoNWELcyR2UkUd1zXAHj0aQ9A=;
        b=mZqWHMfTPruuCwdhuiY0X+gmq8nIR4UGnE/U4qPUmaNNhqhCRv+xJ+2CeDYrzs66pg
         2MzVXB9twVZ0CRAERRDOwaXgF83v2sx6/oXV0CcMUPXOyhbRyvA+QozCzqgbSwWoLER/
         JdIRak+XvCO1QbJ+edcS1Rt3M0u6QuGDNQGMLp7L3JExOsEeR7KX4Xb1beudHYdrnTG1
         iy8vdJ5i4Xsljy9QKwzrcbn+w+K4MJ54HsCmlXIlZuHzfaGZ7njOtRaErGVq148kD8ho
         npsMgV7FnXrEgJrE/G5d8LJ5M31DodWbGB9sf8TX9sjM3l94JBp+xUhLlv+zvPQ3xwsx
         X7WQ==
X-Gm-Message-State: ACrzQf11vnMZmQn8/ixftXnGuFfJ1c4uJaH0cTNAzp4NaEMBnkHS3PeL
        Fm2NJrCIsMap8ByTSfWq+flXyw==
X-Google-Smtp-Source: AMsMyM5lH5Y9QOouFAZ+PUSWbWP0YbOcyG6BHmV6+6eAWcPmUy2mNbbxlNt0L1sLlJcWnlXzXsbATA==
X-Received: by 2002:a17:906:5ac2:b0:78d:3358:7694 with SMTP id x2-20020a1709065ac200b0078d33587694mr46608360ejs.276.1666958919782;
        Fri, 28 Oct 2022 05:08:39 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:08:38 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        quic_kalyant@quicinc.com, swboyd@chromium.org,
        robert.foss@linaro.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_vpolimer@quicinc.com,
        vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com
Subject: [PATCH v1 8/9] arm64: dts: qcom: sm8350-hdk: Enable display & dsi nodes
Date:   Fri, 28 Oct 2022 14:08:11 +0200
Message-Id: <20221028120812.339100-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
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

Enable the display subsystem and the dsi0 output for
the sm8350-hdk board.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e6deb08c6da0..6e07feb4b3b2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -213,10 +213,32 @@ &cdsp {
 	firmware-name = "qcom/sm8350/cdsp.mbn";
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l6b_1p2>;
+};
+
+&dsi0_phy  {
+	status = "okay";
+	vdds-supply = <&vreg_l5b_0p88>;
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

