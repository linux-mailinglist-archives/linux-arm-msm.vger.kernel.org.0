Return-Path: <linux-arm-msm+bounces-52878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25008A76627
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 14:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1703ACC73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 12:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC421E51F1;
	Mon, 31 Mar 2025 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PthI0wqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689F51E7C02
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424613; cv=none; b=czup/DYP/gysi4iY7fWoTg1HeiKebEJRENq4G5x5x8adk2IJAaPfIstoyC3gKUDQP5rEdIZQp0apEpQqT54kWFLi0fhKmmHSRBMNZBqLGcKDCg9oHx2I1MMH8uDq/2TQlxKbLdfsdjCdtqfVbqeppUwnrd60T83m6EyXPn/yxfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424613; c=relaxed/simple;
	bh=Dzr0qnc8JnT7dQ0k6PPSFu0ZcdJBOIL5xzMBM7cAgAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ftv/3Ok6D8I8LeIOqC//0re3SyZe5Ial+Uc1JW58NIMNE1yFhyFsPJWnYGMJvsosNoH+JT9aP0YqG2eygX2oL+jCIhz9NSj+jUwmG2zjDM0COjIsphNy7kZdkAjndA0urviUazNuO0FyzsqPnBfEmlAQfrozr3gAJthJpNDMNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PthI0wqO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kgpo007325
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 12:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k30iMLwMo/0+DM3hlaLHBR1SnIbtHyncTdb
	CRrXmPYw=; b=PthI0wqOpQ3eMLKZKLYE9bcemFqe1I3gcqmiI9GVckdcP/DcMSe
	JxPHwrnk1OZvEisLdsbNUALSL5PcWIL8kPZ7HLO1V16wjxtKJlrr6/lMawatudOO
	THd7RGNyVZwuD+nMGHZBxoz1YKMhomCh3u6N2hQUL+p9OrAHlQqHFXhJZ3rsnz8h
	XsiMtWp5N/H9qZjTzvlqBj3RL6fWj4XZFWcqTn3pLf5mvtznqzt6FS+4TUaGBw6F
	Bjd+iQfjXHraNRbKRLIaH5srfEhgxKR9n+CglT1pA1e/pmLn2idRLbS1qq9K4QJ6
	FfDsUtooIYmu8mYdd5nB7PnR0BGlXiWmMZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9894hku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 12:36:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2255ae39f8fso99302425ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 05:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743424608; x=1744029408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k30iMLwMo/0+DM3hlaLHBR1SnIbtHyncTdbCRrXmPYw=;
        b=uBbRsu8ZUfjMVSbdUuU0aIWMXCCBokoFaRozT+hAv16/mDVIFlk3gKSOm+uNrthAaG
         lcPfbvDmGEQJIf8KxzVmEoywFfaE0ThRkldT2/4DYK0Zw5Vfkb4oM/5klmlJuf/HkAqH
         TL9OIgGCqassodKg/jP9ZA0WipZrG/GjWLS7zg7WEEISFq9/JsFrsfETLmQYVeYEh9hU
         8uIqVygS2pAhZcZHwIUjWfRypo9+wzywM0NDgQQz293WtPgng+TA1bQDt46sMTlwVfHk
         JTkOq3D/+ONohBMMPlNjW2fMfnDKZYd1EUGBAOW+G5YETOyuL+P+hibZntFfmPtH0wqr
         6qOA==
X-Forwarded-Encrypted: i=1; AJvYcCUdvrWh3dVL5AMwQMP9ry8PrEnVnrEu56cOA7WXjin+xKN09O6U3TaRLr3OY1hd4D8rBq+J/HwwwZcVdvOO@vger.kernel.org
X-Gm-Message-State: AOJu0YwNSKJotO1gLi66ZTdFPjaSIgTjQ0OgzszljTTJzE8pQFABd5rT
	FKP1ffoGkojUqv3VftX+dH/Nx2IpAGNNOpJdDRkgsTMWSuJXuSTKtSagHidcI7AphSbNHzYvaNa
	jF32ORm+sq1/pjliIvJqkrXBBNx7WT1JnwBKarsokrnKOsfKgDh2krBpkf4mdpCShVJDLR8eI
X-Gm-Gg: ASbGncuhJCXNQlRlfpZIlo33EVaGfo2tywuedw+0oJFKu2E4Ji6at2hEIgweYthA1cN
	0A5RNQPMADCaoLPjk3wwpnHLf3CGbfPEHtznOTwTWhqKAoiqZglo3KnQn/SN6rK4XnvR26FsHdr
	3aQYVeYdxS6ahti/9ARNQxTFNc1OQdlRhW61YCX75AJu0dpVKY0jBtVYLyqaK0U4lhPhwJzA5iY
	2j6otFI14Vz2ZuXiBAxcdT2PuDfXySHNW89jV5sFG24UZ7agPP/Hn9bjOAjmdXKXy4Phii5aBt2
	SD8FSNv0zjXHlHGCoqjXVilSFbrtW4sa+uHBm5bBcYaRz7I+WCw=
X-Received: by 2002:a05:6a00:2918:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-7397271aadcmr22782807b3a.8.1743424608518;
        Mon, 31 Mar 2025 05:36:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZxMEVJhJiLGBFhY3aqJCMzujglTRVwBu58pzjXyLueJ6bzwy0y3NfyslAst606fXCgJzpxQ==
X-Received: by 2002:a05:6a00:2918:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-7397271aadcmr22782763b3a.8.1743424608048;
        Mon, 31 Mar 2025 05:36:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:74fa:12d3:5d67:6ddd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2aed9sm6845782b3a.72.2025.03.31.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:36:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: qcm2290: Add crypto engine
Date: Mon, 31 Mar 2025 14:36:41 +0200
Message-Id: <20250331123641.1590573-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67ea8c62 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=nC9IKnKkp6U5ZcZjd6UA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TteqjXizU_qbYq39I4qQmnAUYsmpOZL9
X-Proofpoint-ORIG-GUID: TteqjXizU_qbYq39I4qQmnAUYsmpOZL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310090

Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 v2: Remove redundant iommu streams already covered by the SMR masks
 v3: dtbscheck: Add qcom,ipq4019-qce compat; Change dma to dma-controller.

 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..7fb5de92bc4c 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -749,6 +749,30 @@ config_noc: interconnect@1900000 {
 			#interconnect-cells = <2>;
 		};
 
+		cryptobam: dma-controller@1b04000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x01b04000 0x0 0x24000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x0084 0x11>,
+				 <&apps_smmu 0x0086 0x11>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,qcm2290-qce", "qcom,ipq4019-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x0084 0x11>,
+				 <&apps_smmu 0x0086 0x11>;
+		};
+
 		qfprom@1b44000 {
 			compatible = "qcom,qcm2290-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b44000 0x0 0x3000>;
-- 
2.34.1


