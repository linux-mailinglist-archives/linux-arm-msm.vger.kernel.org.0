Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 866C3150F99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 19:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729851AbgBCScS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 13:32:18 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54153 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729831AbgBCScR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 13:32:17 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so126584pjc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 10:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dnHettLd109wANxmdLuXyjYbhCkrWo2MBVjX008Rwpo=;
        b=KArXZabhSftb0nm4KAEC8Kh1eRvQA9bTbTyctAjK4VDpavX5woENwIipPOLRK7mNTO
         FYyPfsFYmEThLjIMpcQkGmKCgkjXAY7tSdFE/YOz7ZCV6BJWt5DWPurXYVPhTRckrZFo
         kBkNttwnUMA05tTj+bQqGlZvOA380ZD3Oo5Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnHettLd109wANxmdLuXyjYbhCkrWo2MBVjX008Rwpo=;
        b=BlFYP41DJUyWR6Bi316oPEtD+B2TZrdE0i++JeJ0GeVoLk6lsJU3GIdlghmUrOnsaP
         5F8XJpZSeMcJFh/TFWDiGHcOTBkD+Yj9H3/BisBpBHIL7KdrQZ97rfJjysjGt9kkIn/r
         10VaRL5H74fjWkHeBRSrNrPMP5p4KyaDoFQcd6TANkKW49sfbjTdPA09ykJaQBTbZgaY
         pA2hRWkaIghDahB29Ld8i8K8Dr/jH7Rh7WrJPrgIOOAf5Sox2uqwkImcvi4jVJi9qnQ7
         /pwsw2mXrOm7tAl30stzx1KawhDD+lhGEOCfEjumgsQ3KldyRoRh5OkFJC6jg0wiQv6p
         I2Hw==
X-Gm-Message-State: APjAAAWG/R6m1aTvstF2JHTIDDuqd8F3AmC12r+2jk4roCp42SSd5Ycj
        oTJ/rVjQlFGg3XZE75WKBCBwhnQso+E=
X-Google-Smtp-Source: APXvYqzupddr0m+0FM3AlZBJi/XgpMRn2ETFD6Sx9S1ysEUvEJeqNWIF5FlGp7vm535awanJb+BeJg==
X-Received: by 2002:a17:90a:35e6:: with SMTP id r93mr448876pjb.44.1580754736620;
        Mon, 03 Feb 2020 10:32:16 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:16 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 03/15] arm64: dts: qcom: sdm845: Add the missing clocks on the dispcc
Date:   Mon,  3 Feb 2020 10:31:36 -0800
Message-Id: <20200203103049.v4.3.Ie80fa74e1774f4317d80d70d30ef4b78f16cc8df@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We're transitioning over to requiring the Qualcomm Display Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

NOTES:
- Until the Linux driver for sdm845's dispcc is updated, these clocks
  will not actually be used in Linux.  It will continue to use global
  clock names to match things up.
- Although the clocks from the DP PHY are required, the DP PHY isn't
  represented in the dts yet.  Apparently the magic for this is just
  to use <0>.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
- Newly discovered gcc_disp_gpll0_div_clk_src added.
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...dispcc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..0985813fee50 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2933,6 +2933,24 @@ opp-200000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sdm845-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <&dsi0_phy 0>,
+				 <&dsi0_phy 1>,
+				 <&dsi1_phy 0>,
+				 <&dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_link_clk_divsel_ten",
+				      "dp_vco_divided_clk_src_mux";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

