Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C227D17D1F8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2020 06:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgCHF4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Mar 2020 00:56:19 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37243 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgCHF4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Mar 2020 00:56:17 -0500
Received: by mail-pg1-f194.google.com with SMTP id z12so3182801pgl.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2020 21:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQLcaG4v4iP9SXWeTRwv6UzXT7p+SW2HOZis4ljRrU8=;
        b=r3PrAbngur1I3ac8O7nrPt5vFQcuLshUpHLyjwDgQx5bahchJ4LgeBcyOhQkmB3zZ2
         GlHcgsK5vR6Em9CAKrfI+kNkABaITMonig5UXcFWr09Lk1d3MGepfzrm5T6pHvo+IotW
         zNaYONaMlaBK9Z8ZF0r+qMTauSeo25I2HhhGt/GIMmNVaR/cKQGaFaYldixeQCTnJmBI
         KHU8jMgYR54PPUaSWLL8Ni5TQvr3ewjtlgNf4Vjziu9Rk5ftFrBBszJVG8HSARrqODui
         rVcufxgfteyv5F02a+0gdoF4pqBLurIVs9iul3hAiNZgO0EN5WCqNCQ3Nsmo9I0UAKKb
         CH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQLcaG4v4iP9SXWeTRwv6UzXT7p+SW2HOZis4ljRrU8=;
        b=c6Ag7rHx8yyvrdHXxWbrIh3pk+fuqwF5UF+90kq75dY2Q/kzak5XXi+PKaYqpqMyoe
         4k2X7h9qZUqk/ZUnGh6uO5opvdUX2mTySjPUXKhq8p8zywqDAuk0tKDf90P6CBW4HMkg
         WhFO6AQcHgrYB2GYOjhXZx7a4BDxIB0u7rvRhGRQBUsTGyCnVV6U2rS1F9D6RYC4zQi1
         umtUTufB/tose8cQXmdN6eZDqAU83LoFqhrZG7mY0T1kOQ4rzg75F1nx2IJVvhTbJV1k
         iqZowr7E+phrOZbv+jVoFWuriziTqO7KpIxaFgtaR/qHPt+JN1E147AX8KJPqkOI6l3S
         NMsg==
X-Gm-Message-State: ANhLgQ2/zH04/fYa44PrE3II+8SKu/LI4Vn5B/EXz0BqmQHW+iOqpY7o
        uDAZcGYQ00vc1B13rEeThemofw==
X-Google-Smtp-Source: ADFU+vvtxEJiap8kXC5Tov4FW+UxaNfAA81JqXk07ynGpFMuJ/1wUtQooNds0qI0B70AI7/sw1U1mg==
X-Received: by 2002:aa7:8119:: with SMTP id b25mr8184678pfi.122.1583646974936;
        Sat, 07 Mar 2020 21:56:14 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k72sm14305175pjb.47.2020.03.07.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 21:56:14 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8998-mtp: Disable funnel 4 and 5
Date:   Sat,  7 Mar 2020 21:54:45 -0800
Message-Id: <20200308055445.1992189-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable Coresight funnel 4 and 5, for now, as these causes the MTP to
crash when clock late_initcall disables unused clocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 0e0b9bc12945..8a14b2bf7bca 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -95,11 +95,15 @@ &funnel3 {
 };
 
 &funnel4 {
-	status = "okay";
+	// FIXME: Figure out why clock late_initcall crashes the board with
+	// this enabled.
+	// status = "okay";
 };
 
 &funnel5 {
-	status = "okay";
+	// FIXME: Figure out why clock late_initcall crashes the board with
+	// this enabled.
+	// status = "okay";
 };
 
 &pm8005_lsid1 {
-- 
2.24.0

