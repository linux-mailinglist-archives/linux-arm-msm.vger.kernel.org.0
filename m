Return-Path: <linux-arm-msm+bounces-87400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8739CF2FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 11:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 468D13081E3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 10:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36252316193;
	Mon,  5 Jan 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMP8SNg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7Hz3RDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1A3148A6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608737; cv=none; b=Pcl0h8FjNVKov2vnlA4OA60i7ZDWh1nqItbTBm7MBjRlj4QrPGbo35B/CHeppeADfYcl29cMfazZ4clt2eV6kWRqiU31Z9FwtSVQ7pkmRGiqc4WtDc+D/au7NYFNlVsaxjn8/SIep3CxR4+u4jHW+l9cJBv/guRkOpgahpHH9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608737; c=relaxed/simple;
	bh=YOl5IJYif0jvNCP8fDY4Aqzn0EQDbtyZnbogarZf4kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MgJQCRQDx2D8JlwjRCplLUL0EH5XDiVRlEvBny+EGLMM+VLg0nm+sbboyZlJ8Hv+WS8PM0OyxDkVVi6gOrXDGiwyx8P+O5uoAZ9r3sgfJNXVymuq2ibofArRVCyEP+lOfLRbTZOyfY6JPWGZIpU5wkVqJKkr3ySxzZh+fbFBM0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMP8SNg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7Hz3RDI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6055a91m4032740
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 10:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wzf72Er3Ym6fe9r1fKm0ko
	zgdGdwUYBIgbsgNNSDvzM=; b=FMP8SNg6pOIE6Vv4Ig/SgdzrO0Eqwpy1SDYJE7
	H3oBzduDW2DqtMThkXFjmswQ+h3qGvFB/nuBn6YvMxM/wtgbrAPadCZCstTmq/DC
	InQrE5/3WKu4dx76g1BGpkwhxKUgaJk9eyBENd7ROBfTzs+KPvrIl/vg/hp13qic
	RQxvAWBG2Dx3YJsU9ZBJGl//a4nE36fLE0M6mGApLbHnHCpv6BDS7QMLswFHUmJP
	DPY/yHQ5h58U0Y83Ql4d4gDLLE3aE1tECznuH3i2kjogGgOD8Ze7Y1s6JLqLxdC1
	NPDZye0RZmFdD0tA1mQn4/+99wgu79KNlSqIImKqR5/002ew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nguy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 10:25:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ec823527eso20550921a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 02:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767608731; x=1768213531; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wzf72Er3Ym6fe9r1fKm0kozgdGdwUYBIgbsgNNSDvzM=;
        b=P7Hz3RDIrnt2zLNMMJXXgLTJ5d+++tINZXi/c4Li/z5hCm8kqrt6ahVrHTxg37f+I0
         2ZodwFEnj8r/8qZczJtjPzifv1rI3a6FE3SyyXo2fWR8USOuMxHHchzGI1aysjOMxmV0
         U0DBa9cyIRIag2NzmVlipxbdOOfsH/VZpjCCFVkDDXot8rJXBlb0VnwvkG0YWPPlk7RQ
         q5FpxtbMEdRdGA/JDSBxuYXPbhARlFHwE9Xfy8WuElsYQvr7VNna6QQNHC2BQObb7azJ
         EFalNjqDUb0Dg/0UC81pfEpvqumGL1KXI38jg/OS9IBOrdGkSuSXGr2dAX9aHZLA1Hct
         TQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608731; x=1768213531;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wzf72Er3Ym6fe9r1fKm0kozgdGdwUYBIgbsgNNSDvzM=;
        b=IgC4sh0bR0/xe0VyqshTZLmjziBnx7VI/qyYergaTdF20+JkVT6msQLDD47dKcs1mZ
         UTlv7dxS+sotTxcbZ9i2Uw4/o8vA73rX8Y+Zkf7P+kvmEja/2EAa0ldHzhaXr52P5pVo
         d6gvk+sAyod7AKa+rookxL9oVHKcqbmlIHwWFpz1GkjfGxUlUblsemJ/Ii+QOI7NeFdZ
         ch0znT/SMqECLIb08mLqXXClpoV2zG7MBzldAKxwyVfwiwRHsXZ6hsKY6k16RcunWkWl
         QC8okAEYcK2W/xa6LLwZ8ET6TFD2HgKsU8QSWUFogg8972mNwPEzrzXy8cZpz1AHw6kc
         Ticg==
X-Gm-Message-State: AOJu0YzeWVFb4g7g47VsloS+090+t9+Gh42v85ykl+9r0gvKStgvcyLd
	XM8iM3hC3ILgLbqrKll0HDHuHdHdsA+Dd9bGgWnUCSS0C8M8RLLAjMF1ATIxv3QglE5KCsOttZO
	Ul5sVqr8t5toR1BlUmYPW7kGkFUUo+Znr+AGsYpdrGlI0E4c14keKZmisG6XEDkPEBmlG
X-Gm-Gg: AY/fxX6pYeD/gRTgIigcI0Unux1+8zBi/6IKKDl8/FmH69Ibh8gjt73Tzm1a9FfYHFw
	BlXGu3FafO/3OEhg6i4vNXLEe/WV0xhi+JTpXAyg2W6nDX7LGEejK9gpo9OkabxWNYJhK0pmpjB
	YHyiyGjegwRsZqUju1NZrztFKcZ2NP2WE/TtL0F803KXDPz1pcfMfAXmm8Xu+JUn5FkAfc8jsnm
	AK2uT6sOo/pSKvEcSMmP04gLl6J7/ZOhi5Cjo+8nQzcAUlACLrDTpz3gNESWI0SQ0LIikAMQShA
	TvgGXdEfh0U5fM2x4T6S2FRytkcR5TRLmJAwGF+MEDGLvjEpfM0fAbjgS0sUutbS9o2BglPplLN
	OfNJ4e/C2+tAgsRhwo9uBmmCwrfATH478tmQduXXxPzCn
X-Received: by 2002:a05:6a20:a10d:b0:364:14f3:cad7 with SMTP id adf61e73a8af0-376a7af6809mr48307044637.19.1767608731361;
        Mon, 05 Jan 2026 02:25:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWMH1B8BqxuLXxx7sfpI/ZdylfSnF5QPPR9s6BLjVwKvN+41DpHQHQhBn6z2qtNUdDSjO4EQ==
X-Received: by 2002:a05:6a20:a10d:b0:364:14f3:cad7 with SMTP id adf61e73a8af0-376a7af6809mr48307021637.19.1767608730868;
        Mon, 05 Jan 2026 02:25:30 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c530f72sm41078233a12.29.2026.01.05.02.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:25:30 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 15:55:24 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-tc9563-v1-1-642fd1fe7893@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJORW2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNT3ZJkS1MzY10Ds8REI0MjUwujNHMloOKCotS0zAqwQdGxtbUAWQH
 iyVgAAAA=
X-Change-ID: 20260105-tc9563-06aa212582f7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767608727; l=5228;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YOl5IJYif0jvNCP8fDY4Aqzn0EQDbtyZnbogarZf4kI=;
 b=jDzOU1ujNQQogVzykwiJWd9jJnfq71QWMu8YojranLCkVZ+dWhVIIuHSyU0oW+i+j8caMFgoq
 d+RlgSvGGvmDOItNoIHF5MhgxRIY+qbXq9awYv0FZ7vPGFZ31OpKHks
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: BWvpmtMObmfjJ1YpUoPRbqvErwnSGJ0l
X-Proofpoint-ORIG-GUID: BWvpmtMObmfjJ1YpUoPRbqvErwnSGJ0l
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695b919c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=KPzQoFQv1uIig_LGOWsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA5MSBTYWx0ZWRfX/4M7TwKctjWc
 Fq6gSXqEsOLB4RlWYToX0n0woHRev2UrlRn7vn1//dsS20AwY3C7uq7kv4NxBw1bEViUin88oJL
 WT+559tgJlhJYnSBPXNBYoIpoVx6E5OZOKpoBjNxL8VtREpzkbBiCY2gnvg67e+d9YAvhoJ4glQ
 p91Dz5s5b0lc9ZuuKdpNsm8gNN69duNz3jNRCEj6+9/9kDkmRupjQANdYclm3RLVD0AVGXrf5/5
 cdY6pRa5IxgC96JZ8l8G1b9HU9+W22U9xyjIZLUrl0ugYMyVWk6ow0ipbo7pTbfFpU/9IjpeDBP
 wrtyuzkpzzz5GJkhScAN3UklfBLG2aEXdZhKVrPCm9cfsr+vcAaq8IeBdR2xmx7rjwva3olaxQC
 uPbPMEgggp4mpxv0zAo5qzo5m2K3Lu54e/cb88R014ZRHbnWIPqIydsm1eDEVKtiE9YPcKi6Sj8
 LrfMvnQmj4oj///LXRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050091

Add a node for the TC9563 PCIe switch, which has three downstream ports.
Two embedded Ethernet devices are present on one of the downstream ports.
As all these ports are present in the node represent the downstream
ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, controlled by
two GPIOs, which are added as fixed regulators. Configure the TC9563
through I2C.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
The driver & dtbining changes are merged here https://lore.kernel.org/all/20251118184525.GA2583175@bhelgaas/
Sending dtsi patch after rebaseing & fixing a typo(Konrad).
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 128 +++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800cb9927627f991e3d97174cc73c64..076069f14495632fe881090819adb7c6a4e6cbbc 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2424,7 +2424,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288e9ef554ecfff59820ba39bf2cdb1..e3d2f01881ae05f17796f9c97f10b53cea50daff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -262,6 +262,30 @@ active-config0 {
 		};
 	};
 
+	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_0P9";
+		gpio = <&pm8350c_gpios 2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <899400>;
+		regulator-max-microvolt = <899400>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_0p9_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <4300>;
+	};
+
+	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_1P8";
+		gpio = <&pm8350c_gpios 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_1p8_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <10000>;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -803,6 +827,78 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c0 0x77>;
+
+		resx-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
@@ -1081,6 +1177,38 @@ right_spkr: speaker@0,2 {
 	};
 };
 
+&pm8350c_gpios {
+	ntn_0p9_en: ntn-0p9-en-state {
+		pins = "gpio2";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	ntn_1p8_en: ntn-1p8-en-state {
+		pins = "gpio3";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio1";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */

---
base-commit: 3609fa95fb0f2c1b099e69e56634edb8fc03f87c
change-id: 20260105-tc9563-06aa212582f7

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


