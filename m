Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0627830949D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 12:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhA3K6n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 05:58:43 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:50036 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229987AbhA3K6m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 05:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612004271; bh=wj2oq2zyRewkdiSvQn+Y/ENvXMg8crNf80srXhY0iws=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=bYSxIOcGwO6DkCXye3zslEMD7jBp8zSqMjKZFBORQBflbAmSTThASwfGdwU0dmxTQ
         861fxd1J8v4LyFjqGWhKjGISAD46Y56EpztVTFs2fw26JUVKWOkadNwcxoNRPPu2xt
         qU/oI5fFvAbLDjy6/3DiMexmBtmwHqEfKqDeT4sI=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Sat, 30 Jan 2021 11:57:51 +0100 (CET)
X-EA-Auth: zeuDYBeRBxBfSiKiXW11WZIYZ4VMP8fK1b4Hy6+07bkPb8wf/sTopWxiPSwn2Eei4sNSoQwWgP0g6kYlZB3+OE54rmhvborx1ciGTcYqGIQ=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        allen <allen.chen@ite.com.tw>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: qcom: Disable MDSS by default for 8916/8016 devices
Date:   Sat, 30 Jan 2021 11:57:12 +0100
Message-Id: <20210130105717.2628781-4-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
References: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable MDSS (Mobile Display Subsystem) by default in msm8916.dtsi
and only explicitly enable it in devices' DT which actually use it.

This leads to faster boot and cleaner logs for other devices,
which also won't have to explicitly disable MDSS to use framebuffer.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                  | 4 ++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                      | 1 +
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 3a9538e1ec97..6aef0c2e4f0a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -301,6 +301,10 @@ &lpass {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index f1af798abd74..230ba3ce3277 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -132,6 +132,10 @@ &dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 };
 
+&mdss {
+	status = "okay";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 402e891a84ab..8f9a651d3827 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -913,6 +913,7 @@ tcsr: syscon@1937000 {
 		};
 
 		mdss: mdss@1a00000 {
+			status = "disabled";
 			compatible = "qcom,mdss";
 			reg = <0x01a00000 0x1000>,
 			      <0x01ac8000 0x3000>;
-- 
2.29.2



