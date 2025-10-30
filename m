Return-Path: <linux-arm-msm+bounces-79589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277CC1ED2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20CC3B4EC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4A0337B8F;
	Thu, 30 Oct 2025 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdz06F7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B284E337B85;
	Thu, 30 Oct 2025 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761810190; cv=none; b=fDmRtIkuqmDgMXx3BRYSaf/QL25QV2g8lXAudz0wtW7x9Hbo6lW782MBmKjTiiesb7SrwzIGsQp9wOHxKguSlHwcxhEjtufnt69z18bsW4WiFpve9Qv5+laE2G/lJditm2BQgHTY7pA9LUNmgJmQHAew5f4BZF1fYKysz/His68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761810190; c=relaxed/simple;
	bh=KGD5nB20HVdhe2mTVoU+xDv/Az5ut52P+4tvJfuK3rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kuAW87PreEPuB+zrfOFIrs9RM6t9o/gr8z1ITRbcTQSUq/acMzez7YcUhxbGMgekd/35BVYenMzmNx9u8QCfyFTKIqQWj91QRnWA6bRB0qapX78kVqKx68GU1b2AHLAlxtzMU6144nlNADqk0FYTyXpAq5iwOpAbaB3wYAdIN3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hu-tingguoc-lv.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdz06F7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hu-tingguoc-lv.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLGhtJ1655543;
	Thu, 30 Oct 2025 07:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxZoxMDbEiIA3AxADME7vRDlDBpKP/DUWYQZ8YPNipA=; b=bdz06F7djvW5oj0q
	Bfra9Nb5AFA0tMCQoUjmXoVhpCmkl19+qiZmJgc3+StYzbnHKTfJFa4QU0gpE8fQ
	E5NN1cv4Z5AYTmDudNLfeMCd483bWX+qlisTEb3MIvnqWOCS6CTZlRNF4PT2cUMk
	+BiRgJQwzUwH4ZzHETr+4wLCs4ne/HdWDoZS409m3t52T5JaalYeOwejZTu2xYmH
	Tox+CLBHMZJ0pBWVse8abhV9xS66kBpa96s3xlcjSxGR5j2xGPTz+0CtbZe8iyqH
	xEUGJ7I8ld90aMVOfKJR5pztKBMLNdAR5/Df1DyyKB8coZP3qC5GnoDgQVnkSAL8
	KiFrGw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptsfsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 07:43:03 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59U7h2S4004586;
	Thu, 30 Oct 2025 07:43:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a42a396uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 07:43:02 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59U7gVFs002508;
	Thu, 30 Oct 2025 07:43:02 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-tingguoc-lv.qualcomm.com [10.81.95.108])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 59U7h2m7004562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 07:43:02 +0000
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 2370279)
	id 0001521805; Thu, 30 Oct 2025 00:43:01 -0700 (PDT)
From: Tingguo Cheng <tingguoc@hu-tingguoc-lv.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: enable pwm rg leds
Date: Thu, 30 Oct 2025 00:42:14 -0700
Message-ID: <20251030-add-rgb-led-for-hamoa-iot-evk-v2-1-3b3326784d7b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <y>
References: <y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251017-add-rgb-led-for-hamoa-iot-evk-43ed6bda73a5
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761809973; l=1710; i=tingguo.cheng@oss.qualcomm.com; s=20240917; h=from:subject:message-id; bh=PAucMdJsakoDIrmnfPwibuCKPBaBNtbeP4z5DbseUYk=; b=AKG59P863Ki6XefEtuBh/XRoaeClb7eJQKU+/PhnbMrAKhRgaYNfLQqKXz1NJBLRSvSa2YL+d Za1DZYrePkJBQwEc8X/FzMKJtJ6ytZSeQECBvbIVE0JZYQ2rU76kzxz
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519; pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MiBTYWx0ZWRfX8xyZOMn7QuxO
 DOWVIBFZjHf0vrQiuQXGaIZ8OMg+0gY54XCk914vlPCG4p8o+tKUF0iM+IJE0mKzxOQjZmGGsPR
 zWHCgaMpyycz0P9mWGlBaO5EcolWqU7hEmjV5cLI+1KkslvLqCFHhWeYlKmv+DcTdGvGocVdzIP
 gF3HDFPV86G+hHyQ19sDs/fKo8mSBdUXle0nkZ63Hax2cGhvp7Tg2R15Hroo1/DrKr2GcQis9ED
 bUXGgOVcOBaKNiPEez8XyBAJuYqNQzXh2TJH5nwrC8VR8fPBtBGysrxtnesnu+B4ysKvShgw093
 jpi0HFtgZRxF2Y5s7VcQ4em5SF0n7gCIDtXDTq8Mb97R9mPDZ6aJS1+7ROxq4StuEDXWPWKm+uE
 yg8mrGukuEDA962JgEwHsPZKL2s+Bg==
X-Proofpoint-GUID: jXljtTkCW2zgUPBPIVakjZCai8cIOGwq
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=69031707 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F6_ufdXwtoZMk_li76YA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: jXljtTkCW2zgUPBPIVakjZCai8cIOGwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1034 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300062

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add RED and GREEN LED channels for the RGB device connected to PMC8380C
PWM-LED pins. Omit BLUE channel to match default hardware setup where
it's tied to EDL indicator.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20251030.
- Remove BLUE led channel to align with the default hardware configuration.
- Link to v1: https://lore.kernel.org/r/20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..ef59e5ff59f2cbe0ee60a020a5d2929c67ad511b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "hamoa-iot-som.dtsi"
 
 / {
@@ -879,6 +880,28 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 	};
 };
 
+&pm8550_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+	};
+};
+
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";

---
base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
change-id: 20251017-add-rgb-led-for-hamoa-iot-evk-43ed6bda73a5

Best regards,
-- 
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>


