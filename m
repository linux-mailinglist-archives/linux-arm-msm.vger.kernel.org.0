Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BF1319DB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbhBLL47 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:56:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:47798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230515AbhBLL4b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:56:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F051864E89;
        Fri, 12 Feb 2021 11:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130945;
        bh=+ksclk1VuPRdokZ1JA/IoRHQrZPGa+MYaPpavLQzyR0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YSjvTPsKwrvqD/5Txof71gk3+AjkpfGrmAKWy4bk4ZPbG9Vp4eh3A7BvDbIAo/tAB
         CIpsoLGaf9bpUbf9+Wk+dk8ns3zLv6L0D9bNL+RCbi5Dc+aMgq3SslRvsGsk9JZfu6
         3T+vnkPbC7a7yehId+eCPryI5lJ/j4nDSa12U4x8DIoTzGy6qN5vaC7u85UeSo5/ET
         w4syXS3BjycRoHbTltTYLMYQDl1szrNW9pAOCyz40bQWum7L5wjQPLt72V5IVrJS5j
         gfUPU2bv1obJmGS2zdxSaeH3weQtNYCWspOFUk2RWmZKyT+hlC/nonm1ntfD4/ugf4
         Kh0OZgwGtCLGg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] arm64: dts: qcom: sm8350: Add rpmhpd node
Date:   Fri, 12 Feb 2021 17:25:27 +0530
Message-Id: <20210212115532.1339942-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-1-vkoul@kernel.org>
References: <20210212115532.1339942-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds RPMH power domain found in SM8350 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b53744618102..0bf5cec3a2aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -591,6 +591,55 @@ rpmhcc: clock-controller {
 				clocks = <&xo_board>;
 			};
 
+			rpmhpd: power-controller {
+				compatible = "qcom,sm8350-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
 		};
 
 		ufs_mem_hc: ufshc@1d84000 {
-- 
2.26.2

