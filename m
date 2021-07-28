Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D436B3D98B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhG1W1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:27:08 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:36899 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233127AbhG1W0h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:37 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 609D02006C;
        Thu, 29 Jul 2021 00:26:31 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 35/39] arm64: dts: qcom: sdm630-nile: Specify ADSP firmware name
Date:   Thu, 29 Jul 2021 00:25:38 +0200
Message-Id: <20210728222542.54269-36-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index e589b6c0b78e..848c2cbca8f9 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -158,6 +158,10 @@ extcon_usb: extcon-usb {
 	};
 };
 
+&adsp_pil {
+	firmware-name = "adsp.mdt";
+};
+
 &blsp_i2c1 {
 	status = "okay";
 
-- 
2.32.0

