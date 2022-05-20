Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C6A52F3FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 21:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350585AbiETTst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 15:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346495AbiETTss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 15:48:48 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949B919321E
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 12:48:47 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t11-20020a17090a6a0b00b001df6f318a8bso12331981pjj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gkc82O7PaKdKkRxUJGMxoAWWDNBCmeUjeFabaWuuuZg=;
        b=PqNLOs88i2r/hYuPWzvOtUEQweTuKWXYsfEjYPk2rd/7klIufF29F59+0PBPIdTIJZ
         5/pzadMoyFy2ycDX4lw79K3IRWsGg5Pr6vHJzQ71Ta9yS59Cv3kpP5fNtyhYam864eSQ
         xRB6ough6AFryDPDrGWCf023tLe3zffF26b90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gkc82O7PaKdKkRxUJGMxoAWWDNBCmeUjeFabaWuuuZg=;
        b=KkDD627vLUV5uky2dPq0YRQQaMQxkPTfaMRZqo5wK+BNJNI2SheyyVcUBPh/RYEThp
         jM+DlZf4ZqSD8UE0s4crlDH/6KSzKW59uTxYThC4ufSIeCHdQNcyjEhJmD48TspwG9NE
         7BINOGOneJ+4AAw1P38ZMIMFceGsIsWxGeDwdtqsrJ3a8u2T5ncV11cX/iXcngcQRScj
         GLM7p4cCKbYw2wyfhuTk0hwMOCR3+kVZQWoG0lCsfkTHMZ4PkTU8ltS+scmQC+327Bef
         AzZt8R2BxBOYg1CPzX2QnpbcY8XCn5IWgUB9/Tm4DPc4OfriSSr/UuNzXfymhuAJbgcm
         21rA==
X-Gm-Message-State: AOAM533P0XzxiM/uY+YUaaXAe8fiG5knvy6oNxIvIM6URVo9gvtfW9uv
        4lom9Ur3WhvseqflrlDDARiebA==
X-Google-Smtp-Source: ABdhPJytVyk99zp7E/sbxxFZ660xpfRG+5QYCHh9efeV/6QzW+Iv283XMdlmyWxdE5yGnBRQuY9dqw==
X-Received: by 2002:a17:902:ee8d:b0:161:5c5c:d0e6 with SMTP id a13-20020a170902ee8d00b001615c5cd0e6mr11597325pld.32.1653076127113;
        Fri, 20 May 2022 12:48:47 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:5332:2096:60a3:3455])
        by smtp.gmail.com with UTF8SMTPSA id q16-20020a170902eb9000b00161b50c3db4sm131915plg.94.2022.05.20.12.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 12:48:46 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: Enable keyboard backlight for villager
Date:   Fri, 20 May 2022 12:48:40 -0700
Message-Id: <20220520124834.1.I7c51c6255bb53086a82c5b3f4fafffcc5ccbc4ae@changeid>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Villager has a backlit keyboard, enable support for the backlight.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi            | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
index d3d6ffad4eff..b6a6a1454883 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
@@ -58,6 +58,10 @@ &ap_sar_sensor1 {
 	status = "okay";
 };
 
+&keyboard_backlight {
+	status = "okay";
+};
+
 &mdss_edp {
 	status = "okay";
 };
@@ -76,6 +80,10 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pwmleds {
+	status = "okay";
+};
+
 /* For eMMC */
 &sdhc_1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 9cb1bc8ed6b5..4b8bdcd6d9f4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -295,7 +295,7 @@ pp1200_wf_cam: pp1200-wf-cam-regulator {
 
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
 
-	pwmleds {
+	pwmleds: pwmleds {
 		compatible = "pwm-leds";
 		status = "disabled";
 		keyboard_backlight: keyboard-backlight {
-- 
2.36.1.124.g0e6072fb45-goog

