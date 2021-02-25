Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3C3325951
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbhBYWOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbhBYWOT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:14:19 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2948FC061788
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:39 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id u12so4184146pjr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jxci9NB9PoDi1kBNkXRYrYZzM4CQpeK7H6k3GMylSl0=;
        b=WhcFciKo3SxlUUF7CBiZeGofPWnKIlIdEDekP+ZF8izCJclNv3ecxg9DdGXAMxV0/X
         cjN36Xwws892QSRBoB3bMx6ffB2foE7ozdyStOr2r+fWSM0RDYjggnYoPIGQSuP0T4YO
         7We4ZQXpch1eqSB0seaxyZFxA0z4oNDDrVHO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jxci9NB9PoDi1kBNkXRYrYZzM4CQpeK7H6k3GMylSl0=;
        b=swfPwybVWdlAqEwWLGKrZjVeUJ/X68upCtKuMRf8CeCOWQHB+QXgFFVPN6e+ZQVr6X
         DTjv+1u/wZmO1AGzsHxznsGjMjZfUYR1RUCtjhgohs8xV7ZKHYF5srj+pfWQ84hTANNy
         lT0eK6ijHQzyW+1mqOj8rldO+GwAcDCfDgXkkOBKQPHFI69dj8Ec19zVhZoXk0C3E6yt
         r8RDzVltHlJoU1O7FJvmPdPVeYhvot920amZm+i2hp/XZRi5Ibex4X3ZKtv0hm0EVrth
         HHL/VcoJfD5Mx+7lWD+LiKqN22YURJSe7xIKQiRPwDgu0khEgRXALEXBeKEerBYj6g6y
         EueQ==
X-Gm-Message-State: AOAM533MHl/sx5CP9XH/ANvs3mH92G+42h2wptlRHdiszOl0gmUPuWu6
        hfUY3PNcysxvIY3W0qYpUcqPIw==
X-Google-Smtp-Source: ABdhPJzUuWgsnRO9H3H/Fh9A2mdLkg/7tJEbTcK/d39TyDZGRPoN0EcxSpoaUVsDnBuxcSBhQYFzIw==
X-Received: by 2002:a17:90a:d149:: with SMTP id t9mr31892pjw.43.1614291218709;
        Thu, 25 Feb 2021 14:13:38 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:8414:45a5:94c4:d35d])
        by smtp.gmail.com with ESMTPSA id jt21sm6713301pjb.51.2021.02.25.14.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:13:38 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] arm64: dts: qcom: sc7180: Update dts for DP phy inside QMP phy
Date:   Thu, 25 Feb 2021 14:12:58 -0800
Message-Id: <20210225141022.1.Iad06142ceb8426ce5492737bf3d9162ed0dd2b55@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210225221310.1939599-1-dianders@chromium.org>
References: <20210225221310.1939599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

Drop the old node and add the new one in its place.

Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
[dianders: Adjusted due to DP not itself not in upstream dts yet]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 1ea3344ab62c..60248a6757d8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2770,12 +2770,11 @@ usb_1_hsphy: phy@88e3000 {
 		};
 
 		usb_1_qmpphy: phy-wrapper@88e9000 {
-			compatible = "qcom,sc7180-qmp-usb3-phy";
+			compatible = "qcom,sc7180-qmp-usb3-dp-phy";
 			reg = <0 0x088e9000 0 0x18c>,
-			      <0 0x088e8000 0 0x38>;
-			reg-names = "reg-base", "dp_com";
+			      <0 0x088e8000 0 0x38>,
+			      <0 0x088ea000 0 0x40>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -2790,7 +2789,7 @@ usb_1_qmpphy: phy-wrapper@88e9000 {
 				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: phy@88e9200 {
+			usb_1_ssphy: usb3-phy@88e9200 {
 				reg = <0 0x088e9200 0 0x128>,
 				      <0 0x088e9400 0 0x200>,
 				      <0 0x088e9c00 0 0x218>,
@@ -2803,6 +2802,16 @@ usb_1_ssphy: phy@88e9200 {
 				clock-names = "pipe0";
 				clock-output-names = "usb3_phy_pipe_clk_src";
 			};
+
+			dp_phy: dp-phy@88ea200 {
+				reg = <0 0x088ea200 0 0x200>,
+				      <0 0x088ea400 0 0x200>,
+				      <0 0x088eaa00 0 0x200>,
+				      <0 0x088ea600 0 0x200>,
+				      <0 0x088ea800 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
 		};
 
 		dc_noc: interconnect@9160000 {
@@ -3166,8 +3175,8 @@ dispcc: clock-controller@af00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&dsi_phy 0>,
 				 <&dsi_phy 1>,
-				 <0>,
-				 <0>;
+				 <&dp_phy 0>,
+				 <&dp_phy 1>;
 			clock-names = "bi_tcxo",
 				      "gcc_disp_gpll0_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-- 
2.30.1.766.gb4fecdf3b7-goog

