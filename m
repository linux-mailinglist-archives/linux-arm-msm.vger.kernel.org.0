Return-Path: <linux-arm-msm+bounces-69094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F397BB258B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 03:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71E499A256E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E38617C21C;
	Thu, 14 Aug 2025 01:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIrtdiQt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887219E97C;
	Thu, 14 Aug 2025 01:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755133218; cv=none; b=SaHV2AygsEl6yEp2Z48O5F76scRfMPWYRaNh4HwQFzSkd6e6/rRiwjGQHi76twxsiDgOnSWmRe6uTSek65zFwrz9I6WI/J/MuUnUDg54aersZBG79AEz2gkNoL/kneN6NGDyCSlT15t/2kx3bdiZqJuakDFn1Sk0dxR2LxA/5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755133218; c=relaxed/simple;
	bh=tALAK8xqaH8y1+EPvZKslVpqf2BWQ3XZPDqnYG1nZss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZiehl9AEJWQvQtg4DXHwGRBl7NYJncxZct8h/x5vlkY7pVwEnwdzlLoS6hef5LK98Wg3pN0CvHDP5+Vf+bd6uXEEYEft9B8XORFt3ainVCr2cke8DBaQUfqZmVjDKrNa5R76D4wXQC+a1oahE7Nm2/LINH/jLyzno8UfFtVLw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIrtdiQt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2e89bebaso363029b3a.1;
        Wed, 13 Aug 2025 18:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755133215; x=1755738015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VkS0f72EnaqiMcIZjME5kwPlMnOQ+cNlZJhtfFnKns=;
        b=BIrtdiQt62MHuZSm44mg56pjrGsR5N6rrzbdj7XsxfCF/CCS9zGxHUTRG6n/tgSfLy
         o4IbVS62JYtRf9BHPvn7TrGv/twi+Wr8ppVQQVFgxKXW8mkEBxp0vfVyy6en9Jn62Y8P
         DszP6YRggyqJsFl/7ALckNuz7DZU7ojrjfeox+WQpl+2dkg4CFRvCurtFSy8UISC3WbD
         L7Pr6EuhyYZg6/+WJzzybMnst7B0OxMlWBEYlKKIQtrsKadAfjxp45p7URZuz70BNBpK
         dGLn2Lfh6FrQGTWuaZMzhlP7oeqnEE5P3BjWD9lfw4EVCAC2rjVJM0akMd357FeR+G1d
         cdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755133215; x=1755738015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VkS0f72EnaqiMcIZjME5kwPlMnOQ+cNlZJhtfFnKns=;
        b=naaEFEutPjLJt300c7cn3vWrzYElf2ZvXUGKlC5AxSpbuFY3ctp5xrWquat5Cnpxpy
         ZoJbYdK9apS+tIe3FnIEtEJrO+CrsrdddgBUWfQcTZ5RKYeVSPTr+00/axRpjku/qZUZ
         to+PCYhchHX5S3Vx0+upqEM5SOPo5cJl0lUcTAFrbPUGGqXyWY+pAOe6jkppBDlswe3V
         h6tISF4BNUi34XSORlo4XoMp/D66kAr3jb+oBU1fFvJEESdWJw9PjU7YCBjo1cC8Qc6D
         Isb4eeUEVdRZ9AAF3bQHiYNyjmN+ctm18L9FPEV6X3bPbcJTuew8n8QJw4OfNwZ+LltT
         iKEg==
X-Forwarded-Encrypted: i=1; AJvYcCUij3owipRDDrlT60YvmDNpkNXtDRNj059J349INPiHEtmpQqg1ClAJ8IgqCJ+CSWGCX1tVNEXHf4UNhQ==@vger.kernel.org, AJvYcCVwWrQCTVEuUcONjzv1i1hQLqiLuoK8N+DBsB5Wsomwi7rSMBTdvQVGnvkwpK9eA3eQH49zqdeKSvmD@vger.kernel.org, AJvYcCWfnVTP3Mw7bOUZ7Y8uPswzAqKJPXopRHjHJYvKhR+JFsv/mn7Q8EBt7YqLuWnJ42x7or1Dp4NWSGVa4ScR@vger.kernel.org, AJvYcCWhq10s7we+NKIHiW5YWK98i9QftL6pXiMpqZi9pgPjtpZ6lJsoyXnUbzsguncA6QgDR7VUkU2HZ9Dv0WLgQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kR2dINORoPpK1TsuA0chaYCQawvbemuY1aGz7Js0VXBo3ot9
	P+tgFq0LnKZpIkFIIZjuQ3WepNlfmEqCGiy84DA9j+AxFLLjBemVwH07
X-Gm-Gg: ASbGnctHPmcGW8T3WYWEfexAcjCATI2eg0cPo7gZuHsL4bSS1VYHLl44jyQGfBJKkt4
	B3lsE+jRYRxPm0H7Piwnh2+rhoQ6EZr9izhR2phE8Zc75FkknaGjlFaNusgeXdfGaxtCPRkCUaC
	vq2W+A2P13AIdIcw5IntBN2MaUavAU6DcLCVQdhYO/+eOiYnp1sstvCnwrsV5XXn3H9oR/AP5ff
	Ikr7Hvbt0S0jk831tx97ulJyEYcbAEVipkSM7qoBJox1aSjReyHVrQ4o4Fs6VClSDTUz9kXBD1I
	5Qn8QNDHiS28zx5V+OnL5lzzEdfRbHn2XjiqW2E+g1RR8U9ZmmrZBSKzd00vA4MJCx3Gt7oTmEw
	MT1/foaUMJ/lLp/R+v2WFWvsrnM5e1BPk3UITjvPA43cV/VUaooJkpYD9MEUAeI30nPL2mZjV4T
	ZhJa2tCDFIU3cE24voSNz+4/4b+9uBR+Tc
X-Google-Smtp-Source: AGHT+IEodCVdxdACkatFb9yR9vBUxSKBbYFsKdRI8HyvoJW/occz78XqVQVb7+h+2Ld7qrl4V57YzQ==
X-Received: by 2002:a05:6a00:3d4d:b0:76b:e16f:ca91 with SMTP id d2e1a72fcca58-76e31eb967emr1104856b3a.1.1755133214668;
        Wed, 13 Aug 2025 18:00:14 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([101.178.35.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143983sm28875783b3a.1.2025.08.13.18.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:00:13 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: marcus@nazgul.ch,
	kirill@korins.ky,
	vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mani@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	andersson@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH 3/3] dts: describe x1e80100 ufs
Date: Thu, 14 Aug 2025 10:59:04 +1000
Message-ID: <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe device tree entry for x1e80100 ufs device
Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 91 ++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a9a7bb676c6f..effa776e3dd0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2819,6 +2819,97 @@ tsens3: thermal-sensor@c274000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+
+		ufs_mem_hc: ufs@1d84000 {
+			compatible = "qcom,x1e80100-ufshc",
+			"qcom,ufshc", "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;     
+			
+			
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			lanes-per-direction = <2>;
+
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+
+			reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+			reset-names = "rst";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			iommus = <&apps_smmu 0x1a0 0x0>;
+
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+
+			freq-table-hz = <100000000 403000000>,
+					<0 0>,
+					<0 0>,
+					<100000000 403000000>,
+					<100000000 403000000>,
+					<0 0>,
+					<0 0>,
+					<0 0>;
+
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ufs-ddr", "cpu-ufs";
+
+			qcom,ice = <&ice>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,x1e80100-qmp-ufs-phy";
+			reg = <0 0x01d80000 0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ice: crypto@1d90000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0 0x1d88000 0 0x8000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		usb_1_ss0_hsphy: phy@fd3000 {
 			compatible = "qcom,x1e80100-snps-eusb2-phy",
 				     "qcom,sm8550-snps-eusb2-phy";
-- 
2.48.1


