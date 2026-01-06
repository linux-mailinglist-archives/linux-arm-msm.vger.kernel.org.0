Return-Path: <linux-arm-msm+bounces-87715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13372CF92A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 16:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BA883008C97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 15:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93F133F8B9;
	Tue,  6 Jan 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyytB+uV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNvaF3MB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF4133985A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714160; cv=none; b=R8wL+uDj3kOtyVcbfOLwQtBm2H4sdciRlMqwF64i75roHTvyNsVm+ZGTeefx+RG2CgUh/F/J5IQRtlCtUTsMV0puLsbsx30GpcLxdjPnrvIxYMqAOkg8HBIL3AH8Q+TM7SMqN2kbOisSxbP1FlvM827FMucXruDj4GsaBUQqHr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714160; c=relaxed/simple;
	bh=1VvOuhWjvj71xqQt5RYWXApfWEIxQvtC71cwobnVVu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bvwle4mcTMaFZT4zKiVLQdoEl6CDm3lv0qf5yYVvBIXyfXc2BCs57B7iSjyGLVihT/PolnRK/RPJEgDkUoluRDl+FHZHsa9wKiArXj/oMjaYVk5ngAvcmfARM/LtgEZnctpYFRHEvSAC0yMCSpv+8IXtXSKFFnAy+gzm/ISqnrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyytB+uV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNvaF3MB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069W8Ot4090717
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 15:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLIJ2bjx/wd
	klJkhrSWUlgRRBVAS9xQIXwyJjqZ7yCo=; b=eyytB+uVPnyJa9vFr/B8gLZaHT+
	T2qtPt5JgWioJOE0XxNRhDo4py8MOIifY0zujjXIZPo2va/iG9lZN5bH9lWgZJBV
	3/00mULF3N28foRaYxPUSrioP6UWDRG+QmrMcrcJC57JQCdfdfwfdtMRuSCH6Cyk
	1kqKAoRLnQRPGjQeBf35f+WgswbK0bgKN3Dx45u7cFSumANDFCpnYYTDxGdXFj7H
	NLKdsNn5H572jjyjPN1f3EnXOaXEzd09p/Qu7//Rbabchrtp0ze1m2B6FlUfzao9
	zUGKYIkZcMOnIjItolyrmmFicjvf4PgbQDdPs638atr/8x+rIt0XTpG9ztA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun906p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 15:42:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f177f4d02so24135945ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767714154; x=1768318954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLIJ2bjx/wdklJkhrSWUlgRRBVAS9xQIXwyJjqZ7yCo=;
        b=TNvaF3MB4zN6oq+BROHVhGfVlc+ZpcthKUsoaO6Sts9UytjFZod/Ueh18baoqix2hV
         evhRHiChDM+zl94AkiZ4W0fS3T3aVuuwZCBG6cC3G1HegwZpv8YGskkGLOSMFNXcJwEy
         8og+PfCl7Li8lfRHRCix5CFCDeGpoJSFSq+Si2l6wmLQjkWQ2bGFOh5sSjKlAvCYgH14
         a8s3tCbGeeRNLlghnr8DGBwSe1kQ1JS0p1QwyI580Nbf+xsywVpT+METFCsyMgFthhAk
         QhAJ98AKw8UI2VxOI8CEvbWCOVmmOAbqpjOs+JH+RI4ju/BMoYxwhTkTy4dze1CsE0eI
         MdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714154; x=1768318954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLIJ2bjx/wdklJkhrSWUlgRRBVAS9xQIXwyJjqZ7yCo=;
        b=fuA/wq/ST+eAk/nYENm+9sadcA67RUylew5BtcMeS1Rxv8urHaDGDwVjXU42A4d646
         vj+yATFcV8/MVaYsTfsE4hTXpgN11TLZm68B/NUu8jVSGDfvLv2W/qKWQzKIHLqSl0i5
         j6x7vQJGlbz02481TgV9luGdbRykDlUAQNsgTnj9zrXzka3rg1Jd0beoczUPM7Rdasc+
         /hhwBLRihq7rpereDAP+VKCFnT55XriSjXjqXeZ4f59ZOD3hn07HM1SoiQhyQxVUJnUm
         CIA0x8eqsKt6HMpNQ+C/4OrPgq8SaHWKbVcKVKfi2ldsGOO9pNk4vlGvbVW6EG1eAwg/
         OQ8Q==
X-Gm-Message-State: AOJu0Yz6PHyZAVZXas87qTdZ62YYMUt56Pd+LysUvouciwp4py985pQj
	ruo6vTKxAzkbn1lWdfEiJNC8KQUosExmjuPt8ct3K9A6J2g55IRpN4qj2/YgHFEhcpFiTjUJreS
	6KKzQNm9o+LJZ+BD+BSHmwpR/3qK9hsSyTofjsjilqY36MgfqiF8xZ6Mk3l7qhBAfj9cX
X-Gm-Gg: AY/fxX60YBC2JnF+qUZiOLVQg8EjMrtto72lFFRH/wJbD55zUwWHWYCMlGHvcB8vFVA
	FVAZZIg/sKSD8EAgqUdnZyyMWsX7GG5zsHjX6WhTAM7smY9Uot7zRqFgx1wX4fJWJr0BXA289ks
	ly3hLF5hRbZFXER7QFnVRoPOq3yU9B8ZEmf9BSrR3djNBLz5FbOaRrX4ZpUxCacuqrzKhT9TQbH
	8L8NG+yEnJaAfi5ODqx6YwnQ5E1A+o9sr6Li5sFac5NP777YoCNetrnf6PQozzVpbhccFOiepo/
	ec9AhleI9Ca/eG2GmQc+mQUBLUsINL/p0pNLN+DXCEEto/QAxYA/LgpADh/yI5q9/soKsk1lDGV
	eThNV0elYLdgm3ytQ3j4406gO77WWH9At2w1SRM/c3hwSwhfDat3E
X-Received: by 2002:a17:903:28d:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a3e2d50ee6mr31548945ad.50.1767714154448;
        Tue, 06 Jan 2026 07:42:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8z5h8zFxPhnIGTIfe++GibD1jOODn/FGkyxORNyREEj+xu/75UvgF1cMqHKzdEKJIebZ7MA==
X-Received: by 2002:a17:903:28d:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a3e2d50ee6mr31548735ad.50.1767714153970;
        Tue, 06 Jan 2026 07:42:33 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd492esm26606395ad.98.2026.01.06.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:42:33 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH V4 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
Date: Tue,  6 Jan 2026 21:12:06 +0530
Message-Id: <20260106154207.1871487-4-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEzNiBTYWx0ZWRfX+BDHt2C0+aUy
 0uBWmyz2I5CBBdER+auQUUJukE4ysPwD3+0Si1LAapNVTIq0dKedO/GXTe+ahb0OScI4hX6WPnH
 v0SejYgyJdkGgMr0f4up1KEcpkijP8GQKzbTS5DulydcVDxW4gd3XFQ0TPrpYleNaSPY+V6na/m
 2O97l16zigu1segwVtFL8G73KoPcl0cAJ5pONdETnDIeasaJ80DqxdlBISQHKGfUm2hO/PpDILQ
 pJusRkxF+jsNjo2vMviM2bfen4sZUf4kxQfUUnn97y1aQo5bpjM7uAsvZCGg23ZSYchJcLX4yoJ
 E/JOPpTVh0yXxFX4RPkKl2JBvnDnqvLEsKv+BakxFp0vtJh8J/QzA51uk7Lj+tcXhDkTcjO0YC8
 aHySv8AhAJD8kcUi3QH2vRahMqQZ9ko6r3Zpl8OqpaPrFePz4Z3cWHdUlQtBWhEM77CRvp0ueQR
 MkGd29aJpKZEG5Xv53w==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d2d6b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-wAyGzpI3j0i2zLxvnIA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: klk_f8lxLHLd1YSryo0PAG5dZtslIO3b
X-Proofpoint-ORIG-GUID: klk_f8lxLHLd1YSryo0PAG5dZtslIO3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060136

Add UFS host controller and PHY nodes for x1e80100 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 122 +++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index f7d71793bc77..25c838102280 100644
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
@@ -3848,6 +3848,122 @@ pcie4_phy: phy@1c0e000 {
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
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,x1e80100-ufshc",
+				     "qcom,sm8550-ufshc",
+				     "qcom,ufshc";
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


