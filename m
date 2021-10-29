Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC50440573
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 00:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhJ2WaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 18:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbhJ2WaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 18:30:19 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531A9C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 15:27:50 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id n23so487320pgh.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 15:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8p+7yp48w7//WEs7Ji/brBBMvp8OpaoSralsz2SZ1rQ=;
        b=hOdKuoyb/kTIYG3+Aimk41yC5VZLTMT9+gJASOR6FGE9iMV23NyGIqMRLjJMPr2Cih
         4fmeKDUOYqplEoMVe14eVFcURaPSmirM8dfmWYUVN87OVal5ZxgTQv1jAlpCdFmhtX/c
         ApfjOlpTyWHoApvNBQfveWmGahrcb6Ez06LWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8p+7yp48w7//WEs7Ji/brBBMvp8OpaoSralsz2SZ1rQ=;
        b=N569y/I4ugiCILs71o6Jpfpq2Q+il+Dnm0y3jBnjE5s+2F8SoiYuWhZYugsM5FuZgT
         wlsXglAoev/J433ASCbNjrTO6bm9ZEHAxMNn2cnSxz5vWilfIyuQiH5r74+3AETJnxkG
         USs3sm8/uVi+lekUhD/ZQV+l/Uc1oGAKZBA8o3wj/m8gflV/PkRGHyTCgxtN4sm6zEee
         4wbtI4Ti3FC7CPLO9rYNxrRkbAdFKVPWH9rP542bgfeRKIv2G0OJ4ux6+wOOWuSfJiEk
         M3AhpJHK3qQ756lWw/o85DatIgww3FyRHQrPJX0Ocb4Ij/wEVgmYE2cq4hf2vzrRHYMA
         wkYA==
X-Gm-Message-State: AOAM533eiybULuBxFvpv+uwWMCykGWbWt1j+qQsY4HZG6UxkZ3U/xpr2
        zvFQmVqm7Yhncad//JNqWBpx7g==
X-Google-Smtp-Source: ABdhPJxnzZSyIvS4cPeOnXvq/PbcoYEMgbjFgjqr7TNr9LSSaEZ7Ci2Tr6ySneYvz3lBsDdSQLpIlA==
X-Received: by 2002:a05:6a00:ac1:b0:44c:4dc6:b897 with SMTP id c1-20020a056a000ac100b0044c4dc6b897mr13921865pfl.25.1635546469875;
        Fri, 29 Oct 2021 15:27:49 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:e956:ddc4:6e27:e270])
        by smtp.gmail.com with ESMTPSA id v14sm7756660pff.199.2021.10.29.15.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 15:27:49 -0700 (PDT)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/4] arm64: dts: sc7180: Specify "data-lanes" for DSI host output
Date:   Fri, 29 Oct 2021 15:27:41 -0700
Message-Id: <20211029152647.v3.2.If23c83a786fc4d318a1986f43803f22b4b1d82cd@changeid>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
In-Reply-To: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
References: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM DSI host driver actually parses "data-lanes" in DT and compare
it with the number of DSI lanes the bridge driver sets for
mipi_dsi_device. So we need to always specify "data-lanes" for the
DSI host output. As of now, "data-lanes" is added to ti-sn65dsi86 dts
fragment, but missing in parade-ps8640 dts fragment, which requires
a fixup.

Since we'll do 4-lane DSI regardless of which bridge chip is used,
instead of adding "data-lanes" to parade-ps8640 dts fragment, let's
just move "data-lanes" from the bridge dts to sc7180-trogdor.dtsi.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi              | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
index 6dbf413e4e5b..f869e6a343c1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
@@ -9,7 +9,6 @@
 
 &dsi0_out {
 	remote-endpoint = <&sn65dsi86_in>;
-	data-lanes = <0 1 2 3>;
 };
 
 edp_brij_i2c: &i2c2 {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index d4f4441179fc..bd5909ffb3dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -603,6 +603,10 @@ &dsi0 {
 	vdda-supply = <&vdda_mipi_dsi0_1p2>;
 };
 
+&dsi0_out {
+	data-lanes = <0 1 2 3>;
+};
+
 &dsi_phy {
 	status = "okay";
 	vdds-supply = <&vdda_mipi_dsi0_pll>;
-- 
2.33.1.1089.g2158813163f-goog

