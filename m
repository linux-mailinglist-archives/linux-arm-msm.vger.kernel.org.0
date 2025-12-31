Return-Path: <linux-arm-msm+bounces-87090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 979D1CEBC82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD406305A2EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4B9275AE4;
	Wed, 31 Dec 2025 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PljmhoSi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvnbZFVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD55184540
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176468; cv=none; b=kZmZLulaJ6GIbThisKywp2CQbdHLQdhnJAatQfQZo0hFBGI3bxXuASk6wWwjtCQpkBMvVykCwhY8Cx0mhaGHy/Tm8ZXG5qaOK1uIr8J2VHMvrteuzQrzbOV9wYpWzPHNs5DekWEa/Vqr38LMLvNA/k6BnM1++lkceOlZV8tret4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176468; c=relaxed/simple;
	bh=DChnZ1yeSzwmLeOIvBY+Ieih50FRBwTtV90FenSJu0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iiDo4M8QYC3/W6ter9+3GGL6GdIGYI/G22nJQgfj6zGPhpMt5yvR3ds3WPHf0S5QcyuLTNqTJy8mGIhDai/hlHlC9wV6B1gf0gJgjHDqIa2rDIleQZeDE4OuTIJKzdk/PlpV+7ylFVE9ohTjemEMDzrw2iWtF5OxHqNZ4Dzr+1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PljmhoSi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvnbZFVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV039ka2550982
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CjJ/9Ca8Asz
	CWwY+bHi0v9FGw9X5NdekDNCSIdTJLpg=; b=PljmhoSi68Y/c1ES+jx15Z5QgRW
	JjluJY69qP5jjKZdbbLXa4NTi0EC0YS5k26HyUlq6AwFMkT8NGlNGjaCS9HTE8lD
	vXnpez478bmsaZTvHpeWnFiFgM53tzA4NXSN1l4x4/AegiPYDtdVpDf3Dxx8ikLA
	0OqzArsgQKGLF693ZcvKj3sJArq3gcyzMLavfz3lAgoZ7N+Gw43aZ1kjI74VJ15Y
	IUX6uEtFWfIqLG3UnE0ZpxgyE4sUJ0Sn46oyTkXG4bLtiuxMOMO2ahEf4NAlJ8rA
	KnS9m8c10JuYedZhk25xkijJfubsVPFlW8kL5gHAg2mzYcebYipE2X+dOtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skm46t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:21:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso21068096a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767176464; x=1767781264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjJ/9Ca8AszCWwY+bHi0v9FGw9X5NdekDNCSIdTJLpg=;
        b=WvnbZFVtRDGsb/K7QW+wo3sGEgKLi5jiqLLu49dWF76UrbHHvfziNkOFde6vaFqmsq
         wFOYpo9J+LrEfhIjKY3axNA99ALkDtlO8hPwq8BqnlK3BmESYM5h25U7x1H0eF29QOgC
         boIgMM1P/Xel3Ix4M2YWC5+uGn8NaRe0h2wGixB1zy48JK1jdomaX/cRk6OeqMnnmpe8
         aiOmGqBxtWrX4KP9o3QYXMRZc+GtbtKpPGoVkzk4jaJSFf7ugUetY3mEWESwSZCO7K+P
         OLWJuzu8NDTOgYhbIQQ1QuSl+xNjH0Wt9OOwNRhTr3t91osJkrB8Hyl8Y15n/0t5IARh
         0O+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176464; x=1767781264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CjJ/9Ca8AszCWwY+bHi0v9FGw9X5NdekDNCSIdTJLpg=;
        b=rL+xHgdoCyXU5N/hWMGDtF/NiSNdwlNPK8Kofk3QR06RpQu+tskrZF5FMdH3drZI8h
         ZQj5lpeyviGKHS/8ZeDWfssmw0cmIkYOKLdVALKzfhRRdz4EprCZdbHTFrmO272rTgrd
         EVccJ/a7MQZn3k5YVu+fs5Hl31OtYKjjmCqV5S81nMiUrQKR4KLll7BXxM0jhTI/QJXa
         jvG1CJ7cCUeM2afDtXSRLDf5akBFrgyE/Brizq7m3IPlrwbpM8ZuTKXpPTgmiBajkaDM
         2swrAZtE2ME/7hnmnI+SK77Y8nV6Q1tEFycSdwlxUeDakNTkVd03KTYpbA2MUAaB1yex
         1t7A==
X-Gm-Message-State: AOJu0YyJq9JA2oF95LzzM9eefiY/k7Hk9EyFnJiM6mtVlbPJcSY0dFlj
	Mdovz+svNI6rJt7cu0v0upLprtkI10EiJX4gslaZi9fqY3qvcC39tW3iuWdJayRDAhLCaWxi7tl
	iuC7oN51DDKP1igGCEZCvHsT56eEri4ktSvUXdQZL44SVzTTeI0gIGoBxBrpv3wNzLhpf
X-Gm-Gg: AY/fxX484wx1j/mOV8ahSH26yNgRgIah2+75uisE+2Jrgc7kYhwVyJyE3pJZmp3PKTy
	crcTFdJ6veqfvE6xN3GWqIlqD0Z/AWQW4K8Dl3++X5p0dJerUdQeWdVIY/Fr5Ow1oYJhCR6enE6
	VK3MMFaI0AeHVHJMHM4f2S6N2F+AogdDfL+oYjF0i4ocdG/XlyNCW0NPnDgf+OUCyOBnBoEzrgv
	xr3sDqmCqEPchs9yLO6fqL32Yu0RAyKWQ6fWEmk9HVkH4G2mTw69yKC4gaHEToHFZEDfCWWzTn9
	u9QBe2G/pWdxAFcZEkrlKoy/koAdytOiKucsdiGSTJlICmSA81EYFoZchOj9yKO9V3hJTAF9UQ9
	HY5qVsEO2sKXUIeOATPEmVSLdXv7rWvfis1g74lCfUmKD9VcPcQub
X-Received: by 2002:a17:90b:37c3:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-34e9211e556mr26888380a91.5.1767176464310;
        Wed, 31 Dec 2025 02:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZJ/hDlYxya0cqVXGmcQC02sSHhRiMrAWcToJnpayDLGrTdoVYDAVXVJ800qL+pvzDhowI8g==
X-Received: by 2002:a17:90b:37c3:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-34e9211e556mr26888361a91.5.1767176463835;
        Wed, 31 Dec 2025 02:21:03 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223ae29sm32163920a91.16.2025.12.31.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:21:03 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V2 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
Date: Wed, 31 Dec 2025 15:49:50 +0530
Message-Id: <20251231101951.1026163-4-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5MCBTYWx0ZWRfX0hW1D25/RLpC
 WTfRvmDMBvpU0x+gu50aR0ulagMrnuCh7dC9MywgDOvzwxeNLloSeVsBpv+4jLz6juTj7N5z6Dy
 IxB0YhZZOCTF/apTUcnC1pHN0TrcTXhVZz0zP8Kx57bfmMhD2yfr3jWiat3o7JX1dfM3XuwRkEV
 dcRFXvuYYQR0sq3SpfZeD68FOhgJdSWgGsiWE2eeQGHzhpgcQX6zJIkcbQifKYHf0U+8YFeArBI
 aUW2m7AsLUTyeBoJIu9SCh0/0TWjW57P8viqpriuDU+P9Oe27h3hpKK2vlo/QtcBU5KL+qYjBuK
 cKtFGWBqaTDMeuzWzFVzLm1C76L1C9vvOZx2KG7I/uqaDhS02gHU0ZP+dvVDGA5I+raNFy1WMXb
 MfMzlIHaycxPWYXMIdcB+QoJSm2vXsuDLfz2ff636lOT4cyCw0Jw0DzOVXb2FLfQsKiAYfwt/qm
 KoRhS60hTYKGDWmc/pA==
X-Proofpoint-ORIG-GUID: z56QJdrc1cMKohYBg5PuY1BiAytxIoUE
X-Proofpoint-GUID: z56QJdrc1cMKohYBg5PuY1BiAytxIoUE
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6954f911 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=t4k6GlNMiQNeD8J6t2QA:9 a=RCcOOarnl-q3lznF:21
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310090

Add UFS host controller and PHY nodes for x1e80100 SoC.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 123 +++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 21ab6ef61520..cd7e2f130fe2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -835,9 +835,9 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
@@ -3848,6 +3848,123 @@ pcie4_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,x1e80100-qmp-ufs-phy",
+				     "qcom,sm8550-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
+
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufs@1d84000 {
+			compatible = "qcom,x1e80100-ufshc",
+				     "qcom,sm8550-ufshc",
+				     "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_LN_BB_CLK3>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			operating-points-v2 = <&ufs_opp_table>;
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x1a0 0>;
+			dma-coherent;
+
+			lanes-per-direction = <2>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.34.1


