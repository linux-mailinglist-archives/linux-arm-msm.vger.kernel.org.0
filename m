Return-Path: <linux-arm-msm+bounces-3399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D79C80464A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 607A61C20C94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757468F62;
	Tue,  5 Dec 2023 03:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDgdc/xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E50FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 19:26:04 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso28533371fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 19:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701746762; x=1702351562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W8X0Xiz1rA5PuHrR5WvXZZqhPL6WYEsL1snRk/kwzg=;
        b=GDgdc/xh94NY6bNAOfsBWgCzEfPKoqFLnzeYRIiPyT0VjxEfgg75ihMV37TnfIfo6/
         g8E0fLQcXMENEfGxEy+e1e6wBBXXCxXLhR04xk+n74d7SnDZHGleMyey4ZZt6nDOoiuS
         wfbMBjaJyRzdbJOhjfbykSMJOmObUD70eU/C7+n1tS18uYz4ws0NPtXnkZZivcPmfq+B
         B4KEMmpWkA1Ds4PisDJVniWGP1vMZmfB+rM/HulKqf1xj2CyisAoOcZdSEN94o6PgP3N
         3/AcO+8KqpDJuj2OgBCxrh8QMDUoP0IU2lvpB6iwKKP5nkWGIffMMVRSqLtbX6M1QNXi
         M/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701746762; x=1702351562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W8X0Xiz1rA5PuHrR5WvXZZqhPL6WYEsL1snRk/kwzg=;
        b=kpoZInkj45c2Np8bnRaCLN7I58QBLZXECiYXdL+hVkmHL4faYuLqX7stQBVLU6eU9U
         fIiNu07hpTsf282d3djITfpe3vaplS7vcgrWozVUgWeUpqybmB59YGZ8FkQS/7aZ/jzk
         jDml0QNOZ593VdFcQDtBTw5dTg0MYyb+zbRn2xhgaFUPXvU3ZgfmxMQ2zU/NbEpeyntG
         zPlzsRmZQTp1DzxW/i9UEAU8ciDzppB7rQKf6IkD/5PbkofWGl8kFvrIniTCrXWwv6xD
         +3UVbfzCYmY7Q7Utmw+SeN3HYpd+BZ1wI7aD8UhZtpyQ5bKjVbioudxMRi7yYChdV+hM
         c/8Q==
X-Gm-Message-State: AOJu0Yx73s+rV1J5tLhoz8sJpvQFQfRqnYXQlpZachGc6nEGQSXdQamL
	cZTD96X7zBxQS/qHXRCBthGl5w==
X-Google-Smtp-Source: AGHT+IG7Sa2ycH3+D2e5Ym67hXWBh8DjHLnN4QQMy8yRJTycCpKTHca7Op95ckMRZ+Xd+lTH3G1qKQ==
X-Received: by 2002:a2e:818a:0:b0:2c9:fece:5bf9 with SMTP id e10-20020a2e818a000000b002c9fece5bf9mr671206ljg.88.1701746762422;
        Mon, 04 Dec 2023 19:26:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c04d000b002ca12be2b63sm127277lji.18.2023.12.04.19.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 19:26:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 9/9] arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings
Date: Tue,  5 Dec 2023 06:25:52 +0300
Message-Id: <20231205032552.1583336-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
References: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 12e55a0c7417..972d8de22182 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -754,9 +754,9 @@ gcc: clock-controller@100000 {
 				 <&pcie0_phy>,
 				 <&pcie1_phy>,
 				 <0>,
-				 <&ufs_mem_phy_lanes 0>,
-				 <&ufs_mem_phy_lanes 1>,
-				 <&ufs_mem_phy_lanes 2>,
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 			clock-names = "bi_tcxo",
 				      "sleep_clk",
@@ -4127,7 +4127,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -4176,10 +4176,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8450-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref", "ref_aux", "qref";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
@@ -4187,17 +4185,11 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		ice: crypto@1d88000 {
-- 
2.39.2


