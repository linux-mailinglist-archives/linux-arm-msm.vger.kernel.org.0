Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9E443F402
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 02:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhJ2Anu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 20:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhJ2Ant (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 20:43:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347D1C061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:41:22 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id z11so5651724plg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vCbr9sHhPoOYTttiMC9wrUBW6ygnU7eeaDDHFz4/imE=;
        b=ECAx9YAlPnA1iDQafmSAgZSeqWS3vJClmNYWenxzFskKGgJJu/Enn7b9+gLoiXpAJL
         y9Ih/K3w255iNuV83wasztitEUlwySOreXKHMiXo6mX7jRTwBUD1Q/WW22LvH3Z3rXTQ
         qcfcyrGM5LkMOLKL6B4cvgFIXV73K0KbqHDVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vCbr9sHhPoOYTttiMC9wrUBW6ygnU7eeaDDHFz4/imE=;
        b=7pjm7Oml5560O/y95jAC/B7kRT1QEW+60bMuAp3RdyXqwK9K5TGUj8QkPTvPJtDJQc
         AShfV3eS4bNkZc0SPVFigXVxV47vSuYFMnoAuDbX33j+zQUFzFJKZu1He7MMzI6gz0IA
         YfzFt1d3MD0nYm2pySdErkiTtwtpYkORomjUBl+tdwsbndKdzvO6psbjh2QuzQzpGRxs
         b5XodjK9JzL00BwSLwvky4GZyfWTBSnRhw0CU5jqV7kzIz7ny8/1ODzHMGYAaYz66m8e
         2ofCODbIvKyZJg6ucd6Ptjbgafve1/KQYuEQobIZrVqCHQVGrPx/Gn0Jj3CqBPBIRQv7
         YKOA==
X-Gm-Message-State: AOAM530qN2YSPHiR/lQGR15MWNTIl+AM48axSQZgYH7K76fiBEdPaiHX
        rP7wPiJxsqpQMxHZh/lW0gAO3g==
X-Google-Smtp-Source: ABdhPJw1+zcw8qqYdbD+AuRBSzHxdUw5h2idj0R/H3v8Uv47IRYiimIrRoNqpSgTqGVKd80DDLomLw==
X-Received: by 2002:a17:902:bf02:b0:13f:cfdd:804e with SMTP id bi2-20020a170902bf0200b0013fcfdd804emr6744632plb.1.1635468081547;
        Thu, 28 Oct 2021 17:41:21 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:e956:ddc4:6e27:e270])
        by smtp.gmail.com with ESMTPSA id s2sm4373846pfe.215.2021.10.28.17.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 17:41:21 -0700 (PDT)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: sc7180: Include gpio.h in edp bridge dts
Date:   Thu, 28 Oct 2021 17:41:15 -0700
Message-Id: <20211028174015.v2.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The edp bridge dts fragment files use the macros defined in
'dt-bindings/gpio/gpio.h'.

To help us more flexibly order the #include lines of dts files in a
board-revision-specific dts file, let's include the gpio header in the
bridge dts fragment files themselves.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
index a3d69540d4e4..6a84fba178d6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
@@ -5,6 +5,8 @@
  * Copyright 2021 Google LLC.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	pp3300_brij_ps8640: pp3300-brij-ps8640 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
index 97d5e45abd1d..6dbf413e4e5b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
@@ -5,6 +5,8 @@
  * Copyright 2021 Google LLC.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 &dsi0_out {
 	remote-endpoint = <&sn65dsi86_in>;
 	data-lanes = <0 1 2 3>;
-- 
2.33.1.1089.g2158813163f-goog

