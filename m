Return-Path: <linux-arm-msm+bounces-53040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FDA78EAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77221886944
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC592376E1;
	Wed,  2 Apr 2025 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABITKrGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349341E50B
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597400; cv=none; b=FGKL9k6Fjqu3KV+iUvlxKkdpnaeMrTyszY1v/vHg77Ujl2xbtop309Dqg86/+QF0tadaKQGluo+AHYXuNX7HCjKMFAz6+yZu1nXWR+wcfGvzSKfFzWhUsAp3oD69sBn12AvA/QPTQoDcbl6BgD/WvAucm5HgB0V1X3gwEGW690I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597400; c=relaxed/simple;
	bh=NmjqACQfrJ37s3N6AuU/MT+sQoPHZ/C361eXGCGz4RM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PnSyXjDKiJv7A7Ss++jxdEdjN80vYt6CaiG4cF//KH1hqekqs96bE3XOrqie5Z+YTgGKgcurUHtTl0PRwIHgMsyCBb5obmSfNGUoASukHxpmMiPMiQjh/uYSlXOs/K4ddmoBAgyQDcGbOs1A1GJAGW1Gg5dGsyb2uesCOdww0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABITKrGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532Atvkj022784
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 12:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0bPtfuVNMDp
	Mwtr99Ca6KpjNhFdUmZN/eMQmpw+ZHAA=; b=ABITKrGv/uJeGzhT9bRGWfmEh4E
	wLmkUDX3TEs7bZymIE15YW43xuGD4jrAdn+H4PdtgWzipCIhbm+z5H+OLxDSdBnj
	u12rzVJpvZVNFclb6dR0xZEBs4zMI3yIhrI4Y5NZTKUYlfxtmy+hrGCj+p7tvrWi
	DzXzvIjv0KXJZJEdoSdYEn2Zkaxu8psp9jgXX3K+slNPlB/ZCfp6YHJAmDdO14AU
	O4PN04DAluSZsQMPJ9TTUrmH71Vnch3VB9NbAam5eNsVWGbWHoC7PB5gelPak6nj
	98TvsyXM6EGS9Ak39gSfch7+BPiYhqv8vNY+UFxi07oM5Qwzk3KePCEsnKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadsq9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 12:36:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0b0cf53f3so1008765185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 05:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743597387; x=1744202187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bPtfuVNMDpMwtr99Ca6KpjNhFdUmZN/eMQmpw+ZHAA=;
        b=QQ2RlZsHvBcjxDPYH980HhudDcGzEz862DrVRX3oGy6l0EP1TFdvG534msB9hfAef1
         hVMod4tpT6sE0jwj7pTUxbrzw6Lo2kljLIhPjrEKk0ZXjemy3ixagJKmSFcfhJHKNNE3
         9Bbwrmfvt1ZyAPFqU07ZpamWhAuVt4akKnwx5pyKj0ciPlj3XosM9Vkig1L6Pv9ZELrc
         DUOZjC30MO/b4Si9tB/exuTFJjwACVPKwhFaA01UQ8YXFAG+zJwpW8g4RAX3LTXFrsYM
         N1IJcdiUrg/u1jnF0lC/fSZRFu8XYn9pH/Q0Qp5ep3cPw86WMgczf3fHMPQicBTxJ2Pc
         0QCw==
X-Gm-Message-State: AOJu0Yw2NnTXyuMkgEh+6B0H7NR9HFww4lAPiqjrOK6n59/DOwSlcFzp
	c4YEYORaj7pEjChB+Nhavqt+0ATF5iBgoGXdGlHdqjScuDB5Xxj/hHQrXDrRAwFQfXcFZlXwdWy
	UsHc2TJApACLxeCtRtia4E6xoPQGy5bM+iWSvo3/KPaD/3UxqblXHEIIefkPt7kbL
X-Gm-Gg: ASbGnct5DZhFg3DvHuLVsOkCSl8WP4oeYCqyuaj3oerj/y4bgxV/1M0hasnenwmER/X
	yr0rj0CXDt6ycHvZikm46ykf6obcJ69No53IkeCg39MzjOcnP5aHjlU5ho726kBn9BFfIX4L1Kc
	XgafjoSgGsbpGLJb2Uh6NAV2Zfj+ogtWJPZQ8aHoAmKclnWFSG5WYWCtVEHIUIl2NEatagxdYhc
	8DJpvsutoDB8XO5q41/fdiAvxiakl4ZiJq161Cbt/4ts4H0/vK6puEOOKh0oiFuOvKal4qSMrO2
	9TLdhpZ5VfESigQ3uu42J2fpU56dAVqjbQGCxT+V5IGIqAMLrw==
X-Received: by 2002:a05:620a:4041:b0:7c5:49c9:e4ae with SMTP id af79cd13be357-7c69072f131mr2448520085a.32.1743597387618;
        Wed, 02 Apr 2025 05:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtXQXBQ11b54A1rMlOiGsFCvVN/Cb23GD5YAaRljh7pVcZH/wsAgAlR1FthR3T+tKOcPc8Xw==
X-Received: by 2002:a05:620a:4041:b0:7c5:49c9:e4ae with SMTP id af79cd13be357-7c69072f131mr2448517185a.32.1743597387292;
        Wed, 02 Apr 2025 05:36:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:3450:ba3:21fc:7d2b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719221034sm916438266b.32.2025.04.02.05.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:36:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcm2290: Add CCI node
Date: Wed,  2 Apr 2025 14:36:22 +0200
Message-Id: <20250402123622.11984-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402123622.11984-1-loic.poulain@oss.qualcomm.com>
References: <20250402123622.11984-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ed2f56 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=6k4BM0uUCjRUaVwtoScA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2lfXb2Z-xh7teOiw4mipaS5BZ0INLztf
X-Proofpoint-GUID: 2lfXb2Z-xh7teOiw4mipaS5BZ0INLztf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020080

Add Camera Control Interface (CCI), supporting two I2C masters.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v2: Reorder commits; Update dts properties order and style

 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7fb5de92bc4c..43fcb4f40a8c 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -557,6 +557,20 @@ qup_uart4_default: qup-uart4-default-state {
 				bias-disable;
 			};
 
+			cci0_default: cci0-default-state {
+				pins = "gpio22", "gpio23";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio29", "gpio30";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -1603,6 +1617,42 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x5c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "camss_top_ahb", "cci";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


