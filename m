Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70ED30F944
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 18:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238314AbhBDRNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 12:13:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:57128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238344AbhBDRMG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 12:12:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A71A164F76;
        Thu,  4 Feb 2021 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612458573;
        bh=moLH7O3aPLeWeYHvK8JnDz0bw/lDVlhdHDFhU17tFB8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RFLVlEe9qr5yIsioQY0+U/XfTDdYhYH5Y/PlSVSi/sM9124WY4jw1NejH6XhnrtQG
         e+krMAeIdhXCAO6WQh/+2HicZScaXCKvnpMqTcbfMJLmf2nonCQGHa9gEtRujfSVb2
         7W1ghJ8DS8mOUw+8pd9eJgf8a92W7FwAccEcSPCK9KT9TWWEhAHZXB/+QrWfemGoqv
         gMat04vRp0uweR1pWYIhNnEOwbAFkg4iMTAetuIEFzo7ma66HahkNUqGACr+i5izOo
         vm8rpqcmNBGtxeJbo0ZW1W2MnG/dZNd4fzZ7lX85PxVc9XoTFuu396aQFgOncCszM7
         dHBDJQw2ucyoA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm8350-mtp: add regulator names
Date:   Thu,  4 Feb 2021 22:39:07 +0530
Message-Id: <20210204170907.63545-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204170907.63545-1-vkoul@kernel.org>
References: <20210204170907.63545-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the property "regulator-names" to the regulators as given in
schematics so that it is easier to understand the regulators being used

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 2675afbbd75e..e544fe6b421f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -57,57 +57,67 @@ pm8350-rpmh-regulators {
 		vdd-l8-supply = <&vreg_s2c_0p8>;
 
 		vreg_s10b_1p8: smps10 {
+			regulator-name = "vreg_s10b_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
 
 		vreg_s11b_0p95: smps11 {
+			regulator-name = "vreg_s11b_0p95";
 			regulator-min-microvolt = <752000>;
 			regulator-max-microvolt = <1000000>;
 		};
 
 		vreg_s12b_1p25: smps12 {
+			regulator-name = "vreg_s12b_1p25";
 			regulator-min-microvolt = <1224000>;
 			regulator-max-microvolt = <1360000>;
 		};
 
 		vreg_l1b_0p88: ldo1 {
+			regulator-name = "vreg_l1b_0p88";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <920000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l2b_3p07: ldo2 {
+			regulator-name = "vreg_l2b_3p07";
 			regulator-min-microvolt = <3072000>;
 			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l3b_0p9: ldo3 {
+			regulator-name = "vreg_l3b_0p9";
 			regulator-min-microvolt = <904000>;
 			regulator-max-microvolt = <904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l5b_0p88: ldo5 {
+			regulator-name = "vreg_l3b_0p9";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <888000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l6b_1p2: ldo6 {
+			regulator-name = "vreg_l6b_1p2";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1208000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7b_2p96: ldo7 {
+			regulator-name = "vreg_l7b_2p96";
 			regulator-min-microvolt = <2400000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l9b_1p2: ldo9 {
+			regulator-name = "vreg_l9b_1p2";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -138,99 +148,116 @@ pm8350c-rpmh-regulators {
 		vdd-bob-supply = <&vph_pwr>;
 
 		vreg_s1c_1p86: smps1 {
+			regulator-name = "vreg_s1c_1p86";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1952000>;
 		};
 
 		vreg_s2c_0p8: smps2 {
+			regulator-name = "vreg_s2c_0p8";
 			regulator-min-microvolt = <640000>;
 			regulator-max-microvolt = <1000000>;
 		};
 
 		vreg_s10c_1p05: smps10 {
+			regulator-name = "vreg_s10c_1p05";
 			regulator-min-microvolt = <1048000>;
 			regulator-max-microvolt = <1128000>;
 		};
 
 		vreg_bob: bob {
+			regulator-name = "vreg_bob";
 			regulator-min-microvolt = <3008000>;
 			regulator-max-microvolt = <3960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 		};
 
 		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l2c_1p8: ldo2 {
+			regulator-name = "vreg_l2c_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l3c_3p0: ldo3 {
+			regulator-name = "vreg_l3c_3p0";
 			regulator-min-microvolt = <3008000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l4c_uim1: ldo4 {
+			regulator-name = "vreg_l4c_uim1";
 			regulator-min-microvolt = <1704000>;
 			regulator-max-microvolt = <3000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l5c_uim2: ldo5 {
+			regulator-name = "vreg_l5c_uim2";
 			regulator-min-microvolt = <1704000>;
 			regulator-max-microvolt = <3000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l6c_1p8: ldo6 {
+			regulator-name = "vreg_l6c_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7c_3p0: ldo7 {
+			regulator-name = "vreg_l7c_3p0";
 			regulator-min-microvolt = <3008000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l9c_2p96: ldo9 {
+			regulator-name = "vreg_l9c_2p96";
 			regulator-min-microvolt = <2960000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10c_1p2: ldo10 {
+			regulator-name = "vreg_l10c_1p2";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l11c_2p96: ldo11 {
+			regulator-name = "vreg_l11c_2p96";
 			regulator-min-microvolt = <2400000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l12c_1p8: ldo12 {
+			regulator-name = "vreg_l12c_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l13c_3p0: ldo13 {
+			regulator-name = "vreg_l13c_3p0";
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-- 
2.26.2

