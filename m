Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238DC121B99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 22:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfLPVQP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 16:16:15 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42159 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfLPVQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 16:16:15 -0500
Received: by mail-pg1-f194.google.com with SMTP id s64so4417341pgb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntIgBb0h13t3tiR4TtlPN2L5O6wmrHO06lZ+oHUf8jg=;
        b=mK9Rsz2FG+xHhtlleO+mSKzlJaUzEhUpfDP+f8RpwE8RGJj8s36XnKe2YV/pJ4dMlg
         TtJCOA4sp7pApewLPjig+hXm66+TlZ4njx0f6CMDhiP11IzlPni3VhRXwIiOLwcynNc6
         uSQs5ZI0f2A7hLAkrD1u7FtzNhB+7CNDncNw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntIgBb0h13t3tiR4TtlPN2L5O6wmrHO06lZ+oHUf8jg=;
        b=i+khAYfQlpcuPW/TgGkgcZx0k5KO0lvXw9bUWAnsKUUMxkqObHKqw7vJ5iuRfMXxW/
         02pzlidvsGKmuWh9ct3J8MUiyvbPttz21Y0OpZRCdNiyTRPjBlybPMix75+968AMlZzm
         pOovWtt6BvyxxezOUHLR7dOvKlEzew0oH9zzfaKDMbv4OYDZLt+eyVPD8Py77PurrzQl
         v5GhjfkUNBeXzVFPM0H9YXYMByrwDy/ccQwiZzNBWrXP9lxvp29PhLRapwlljlNgn1PZ
         GFhKDykqcheJQPf3cuGrglSjykFj1Gd63OaA9HeXJ/UUR132N88FhKkiAKr3hhOs9Z2V
         YWCA==
X-Gm-Message-State: APjAAAXrowpUqUbvvPq9/SbIKUwpmGG7ST/MpL6Z2CBrj4dGFyMTE3qH
        McESfzPnpLKJTiaF8DnBYEXMu6DOU3DrnA==
X-Google-Smtp-Source: APXvYqzLTVkJMbv7KH10k65m6pZQ57AvlakAYffc8EeqPonvZK2AHxjNlhqFhI8Tiyyz3hEaVF+UuQ==
X-Received: by 2002:a63:1908:: with SMTP id z8mr20937416pgl.350.1576530974281;
        Mon, 16 Dec 2019 13:16:14 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 81sm23402797pfx.73.2019.12.16.13.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 13:16:13 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-cheza: Add cr50 spi node
Date:   Mon, 16 Dec 2019 13:16:13 -0800
Message-Id: <20191216211613.131275-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the cr50 device to the spi controller it is attached to. This
enables /dev/tpm0 and some login things on Cheza.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9a4ff57fc877..f6683460dc82 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -651,6 +651,20 @@ &spi0 {
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+
+	cr50@0 {
+		compatible = "google,cr50";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&h1_ap_int_odl>;
+		spi-max-frequency = <800000>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <129 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
 &spi10 {
 	status = "okay";
 
-- 
Sent by a computer, using git, on the internet

