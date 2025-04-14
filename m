Return-Path: <linux-arm-msm+bounces-54244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06890A8813C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 15:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8223A6AD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD85F268FDE;
	Mon, 14 Apr 2025 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMPqQeZw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366E92D1F44
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636286; cv=none; b=HV+Y3mwEzskUwLowijpEgvxCOycg70UEACxAJ5vbAgcO1Nv6gbk3khgXm71HvkL0ynjFbNwK7MMKACF4QSOp4zZxIAxQ0EEiVD+h526Y+6wayonSN+rhisVexlLJw3X3RxQNqPumfrV11fArbThG2LWAm2Uxolq1CboX8ISIOS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636286; c=relaxed/simple;
	bh=8dlfgO/nT9QDeuTKJLT4YPhW3/iNCTuCfVdLXDV4TfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C0E4kWKmD6sCb6loCW9O2lpFP0TLGb4Wj9NVc3RNC1AFeLh7Q+L3WvMhQsQYGbYRIz0cE5QVrVbFZptncmGRftAZc4+4LUmRPZViFCh1wCHI/y1hRCghnNXIBJLq7Xoj8pTD7lY/JHN1/NVGfRzRAlRJH4T64qfKoUr0uQWQ81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMPqQeZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99q26030628
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nG9q4ZWCsXY
	pQ+C5Bf/n5D3rrnTWdldgAj3/oQTZUe0=; b=FMPqQeZwhvTIYr/ZtR1l6DssYxu
	9mkDVhuozzhMMpuB1a4E3W9+EOVcidBh8odPksGGdnoD73nIP8akIbmWYhzxhOW1
	hksI2+R+81a1Iw0I8RD2hulykOlSiJ5U/j3GikrEm7CzS5YnsThn8YJ405/wOgp8
	HcIxnOXcpH9QJNwMTWDVNBv69F30okIeEJl+MvgF8JumSofCVmTeC6HeY2leoRSd
	CzlqRz3reSpj1N6ku2qEaW9G5WtvzvNNvANXplc+dV7twRo4QPoCE8HdimRf5ek/
	PdBQRc5O1ltI1pWKmeB5f1eEVQGngPWikG2b+37LlPaOlISwZKovB2Fvfdg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj4tp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:11:24 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72bc3351885so4005853a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 06:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636283; x=1745241083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG9q4ZWCsXYpQ+C5Bf/n5D3rrnTWdldgAj3/oQTZUe0=;
        b=XUvoirx9W4Pz6JpMMCutvq6AOi7OpmSenvT4JoH8VJvkJr9AAy/IOb4+sT1KyyULST
         WsYVeQphLPNnWp6nQGohJGM77RqlwVM62/YBhgd4Wc1vonOsAdojXSM8OHFk+GSQWW+1
         sFh7vGOAP1fjpn06thoAVsWe/D4pYwwtt/Ogpt4mBfwdN//E5yRshu2IGTrz68zCP6US
         FkV76myw4fDy5eDGyXZCuPQU3pJ0L6kUT1IH8cZBhanLLUJpyGIzJ8NsrdsZUbLCmaYb
         rqRV54WLBfMWuFFaYwtDyA8zRCDpxJ1XjXlkBWnTGf8TRLNK8NP/JjyoFt0hqIx9Qds2
         38wA==
X-Gm-Message-State: AOJu0Yww6UG4Py474eah45mCIKTjcgTzG6g9mL3XfMrZVIOOOrDizaZF
	/b2C/CbvlBkS4Fh9jxDuDI2MCtXMsw27R3DusIgAoJIkGtkJ0DAhbVRVrrB2pHmYSRgsK11xQPU
	VVH3+q3dy4tWl7MpwLanw62+7BTB0qAREhOIPtZZI0W+GrWarrHUVWAr1rAe30IFk
X-Gm-Gg: ASbGncvgjVbLpJlYPp39EeeSfvdM4Kp2PoCtsXBmEHqPxPoVAyFcJhn3IApSz5mD4ws
	T2wd0WivJZmasz4EhzWL30JMfrQ1pQXHibgpsfxC33hB81jWm47FR/xsd8Z/j1lxem5OearFFkM
	MJ+8f2w9Dg+yf+jzDKWskpunsP2qop8f7BjyXb+tLlw8Z2lbr9vDpaNV8dyu/vicNilG98YiHdn
	Opt8bzt7+BfYb//D8twJ2gLiSjqgfxF3xeubGVncX7RYF9uM5AM6F+uIERWcTBp9lVDqkB7vofy
	Vs05sx4ZS0YmD6oCW8DHeIaRtbzwARzY3IlVwtmAIY6MtbZ68/Tu7XwDAop4cxJ89n3nS4MXZpL
	2
X-Received: by 2002:a05:6830:6306:b0:72c:3289:827d with SMTP id 46e09a7af769-72e863c17d5mr7044374a34.18.1744636283129;
        Mon, 14 Apr 2025 06:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6xesVJcOTA2uYzPP7/HWqZvfBm4vsbqS8nuq1uRD+DYxic8pCMANkNX8xi6eFWrGD6pNgZg==
X-Received: by 2002:a05:6830:6306:b0:72c:3289:827d with SMTP id 46e09a7af769-72e863c17d5mr7044354a34.18.1744636282681;
        Mon, 14 Apr 2025 06:11:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm181921375e9.9.2025.04.14.06.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 06:11:22 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: qcm2290: Add CCI node
Date: Mon, 14 Apr 2025 15:11:15 +0200
Message-Id: <20250414131115.2968232-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414131115.2968232-1-loic.poulain@oss.qualcomm.com>
References: <20250414131115.2968232-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fd097c cx=c_pps a=+3WqYijBVYhDct2f5Fivkw==:117 a=MDeckJw97qnk8wCBExTehA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7004nz7suiqLHAzt4fYA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: XdgS-pQJkYs07oTo9JRnaYI2WrGuQMm1
X-Proofpoint-ORIG-GUID: XdgS-pQJkYs07oTo9JRnaYI2WrGuQMm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140097

Add Camera Control Interface (CCI), supporting two I2C masters.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 v2: Reorder commits; Update dts properties order and style
 v3: No change for this patch
 v4: change AHB clock name from camss_top_ahb to ahb

 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7fb5de92bc4c..4f071cb25c5c 100644
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
+			clock-names = "ahb", "cci";
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


