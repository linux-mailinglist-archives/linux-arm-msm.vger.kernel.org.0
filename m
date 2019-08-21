Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2076A98366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 20:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfHUSoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 14:44:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:40298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727685AbfHUSoh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 14:44:37 -0400
Received: from localhost.localdomain (unknown [106.201.100.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59DC22339F;
        Wed, 21 Aug 2019 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566413076;
        bh=y/Rn9ZOSdhG+NlJg8Bx3uv57nMWzTa0ZJ0fC6X6mBQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QQUbXIlCwyszTMsD9FVH21EnF7gFnoijgwrLAoFsjv5sNP39BWEo8aaUttM4ICoez
         b1UIU9l4sKx14/F7QKH5cJM3V9e8mx+08smSic/2+SrkQL7CRJITqzsvpiAdkYY+k0
         dPUD4MWj0paVujKe9th80oFdqzgXwP8euPmCsgXM=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v4 7/8] arm64: dts: qcom: sm8150: Add reserved-memory regions
Date:   Thu, 22 Aug 2019 00:12:38 +0530
Message-Id: <20190821184239.12364-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821184239.12364-1-vkoul@kernel.org>
References: <20190821184239.12364-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the reserved memory regions in SM8150

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 111 +++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 417b21d1897c..c739b4647db9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -155,6 +155,117 @@
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: memory@85700000 {
+			reg = <0x0 0x85700000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_mem: memory@85d00000 {
+			reg = <0x0 0x85d00000 0x0 0x140000>;
+			no-map;
+		};
+
+		aop_mem: memory@85f00000 {
+			reg = <0x0 0x85f00000 0x0 0x20000>;
+			no-map;
+		};
+
+		aop_cmd_db: memory@85f20000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x85f20000 0x0 0x20000>;
+			no-map;
+		};
+
+		smem_mem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x200000>;
+			no-map;
+		};
+
+		tz_mem: memory@86200000 {
+			reg = <0x0 0x86200000 0x0 0x3900000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@89b00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x89b00000 0x0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		camera_mem: memory@8b700000 {
+			reg = <0x0 0x8b700000 0x0 0x500000>;
+			no-map;
+		};
+
+		wlan_mem: memory@8bc00000 {
+			reg = <0x0 0x8bc00000 0x0 0x180000>;
+			no-map;
+		};
+
+		npu_mem: memory@8bd80000 {
+			reg = <0x0 0x8bd80000 0x0 0x80000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8be00000 {
+			reg = <0x0 0x8be00000 0x0 0x1a00000>;
+			no-map;
+		};
+
+		mpss_mem: memory@8d800000 {
+			reg = <0x0 0x8d800000 0x0 0x9600000>;
+			no-map;
+		};
+
+		venus_mem: memory@96e00000 {
+			reg = <0x0 0x96e00000 0x0 0x500000>;
+			no-map;
+		};
+
+		slpi_mem: memory@97300000 {
+			reg = <0x0 0x97300000 0x0 0x1400000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@98700000 {
+			reg = <0x0 0x98700000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@98710000 {
+			reg = <0x0 0x98710000 0x0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@98715000 {
+			reg = <0x0 0x98715000 0x0 0x2000>;
+			no-map;
+		};
+
+		spss_mem: memory@98800000 {
+			reg = <0x0 0x98800000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@98900000 {
+			reg = <0x0 0x98900000 0x0 0x1400000>;
+			no-map;
+		};
+
+		qseecom_mem: memory@9e400000 {
+			reg = <0x0 0x9e400000 0x0 0x1400000>;
+			no-map;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.20.1

