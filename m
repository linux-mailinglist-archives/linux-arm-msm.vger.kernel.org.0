Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D5B319DBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhBLL6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:58:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:48106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230489AbhBLL5j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:57:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A08C564E8D;
        Fri, 12 Feb 2021 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130956;
        bh=BZbq1M5bjr9QYOvOIsPom3qEPjAu2wT+b3Bsb7DCFGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hza/tt5t/m79EaoZbAKdPu4uMZ2KyhfzD4+5aQfX+UFDlPkWpja6KCXvO9xNgiPAj
         fDaH1fX667jJYYjqEBsreF3XRv68+DjqbKECCShQqZPNGaHJoOzyb/R6tDZFQthyJZ
         iku52+8kRcKinip2mYyiNueJiSL+tTF8+ugLgOWKTvya+VAn4CqeCDD3vt4/hNC9b2
         CZPpuq5UqMYBW+4/E7+QOHpEKRLmCTYPCqlaEYSmvDdtx+0wSUXYlpuVWVy0v9w6Ji
         fFBRsMV525U68muSHdSc+nWgMyRF/O+bRu9IuwaR+vwR2xwF0iBslBuI2IxIvnnLje
         rNksGULoNZVrw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: qcom: sm8350-mtp: Enable remoteprocs
Date:   Fri, 12 Feb 2021 17:25:31 +0530
Message-Id: <20210212115532.1339942-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-1-vkoul@kernel.org>
References: <20210212115532.1339942-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enabled the four remoteprocs found in SM8350, audio, compute, modem
and sensor for MTP platform and adds firmware for them.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index e544fe6b421f..98a517edd442 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -32,6 +32,11 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8350/adsp.mbn";
+};
+
 &apps_rsc {
 	pm8350-rpmh-regulators {
 		compatible = "qcom,pm8350-rpmh-regulators";
@@ -265,10 +270,25 @@ vreg_l13c_3p0: ldo13 {
 	};
 };
 
+&cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8350/cdsp.mbn";
+};
+
+&mpss {
+	status = "okay";
+	firmware-name = "qcom/sm8350/modem.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&slpi {
+	status = "okay";
+	firmware-name = "qcom/sm8350/slpi.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <52 8>;
 };
-- 
2.26.2

