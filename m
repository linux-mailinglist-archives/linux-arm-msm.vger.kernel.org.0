Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329E933C7AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 21:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbhCOUX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 16:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbhCOUXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 16:23:52 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE919C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:23:52 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q5so8487895pgk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZu7/V3GT6uftxTccqNjz6wfZExwBmSHvrxB/n5WhXQ=;
        b=V8dYHNBsN+d0zZpENFZm3uDvEFk+rhV1osVp3G/TuHJkYDD9CMwaFIl1wdjmncYMB/
         fR/LsNlUbvJ07mDm6jlBuUaChGluZA6PUqNoFoCC1yJf7AycH65DAYlZiEXpoVALvyQ5
         yjJDl/u4Sq5+8nCtBt2WK3C0VBA+YdreRMw2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZu7/V3GT6uftxTccqNjz6wfZExwBmSHvrxB/n5WhXQ=;
        b=s/wy8rXzbwJIEkek0lVECBZ4KOqUzyYOdMOnX2mwyNlrfn8l6UGFZ+oKmqu+ZVeNh+
         KI+YGJxvuMVSRjFWZJlaUx50Leyk8aTDhR8qV9mU/cfC7lum+kstlw73MVBsmtNwZ6vQ
         OoMl185WcIv09o/Wt0u8aCvhDY8MyVJMT9KP/qjHNs4kx4NgjjhilVli2VoITZJhsomz
         IeGcKA4dMOr9UE/RS05ApSlQtlIwsdgFlhMHu/G+RpL0iEAONDnK4YctUI1+HddPO5EF
         STdbuV7WlhcZZo7dq7mngGVLIRWcBg81ZCRKc6vYWeRslvdILGzULdGUlo9JUYLe+5Rw
         yk4g==
X-Gm-Message-State: AOAM530Gfny3qmsk8dwd8PGmZH2+PsR+v4Jjc5BOZJGXARCOSgRZPVj8
        hmuPSsXw9Fto3tEoDAjrfAumIQ==
X-Google-Smtp-Source: ABdhPJzRt36liQFt91K9dXkzTHyGZDOhxdq/xNtR0/bVbhGob08+MN9jgPm2nQC6huuPHIK3BoOfyQ==
X-Received: by 2002:a63:5a0c:: with SMTP id o12mr761248pgb.76.1615839832328;
        Mon, 15 Mar 2021 13:23:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:14ce:2d12:6a1f:f42])
        by smtp.gmail.com with ESMTPSA id i17sm15614361pfq.135.2021.03.15.13.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 13:23:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: Add "dmic_clk_en" for sc7180-trogdor-coachz
Date:   Mon, 15 Mar 2021 13:23:18 -0700
Message-Id: <20210315132256.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was present downstream. Add upstream too.

Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Ajit Pandey <ajitp@codeaurora.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This applies atop the patch ("arm64: dts: qcom: Add sound node for
sc7180-trogdor-coachz") [1].

NOTE: downstream this property was present in each of the board
revisions. There's actually no longer any reason for this and I'll
shortly post a downstream patch to fix this.

[1] https://lore.kernel.org/r/20210313054654.11693-3-srivasam@codeaurora.org/

 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index e2ffe71c2d52..4c6e433c8226 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -93,6 +93,9 @@ &sound {
 	compatible = "google,sc7180-coachz";
 	model = "sc7180-adau7002-max98357a";
 	audio-routing = "PDM_DAT", "DMIC";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&dmic_clk_en>;
 };
 
 &sound_multimedia0_codec {
@@ -247,4 +250,17 @@ &tlmm {
 			  "AP_TS_PEN_I2C_SCL",
 			  "DP_HOT_PLUG_DET",
 			  "EC_IN_RW_ODL";
+
+	dmic_clk_en: dmic_clk_en {
+		pinmux {
+			pins = "gpio83";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio83";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

