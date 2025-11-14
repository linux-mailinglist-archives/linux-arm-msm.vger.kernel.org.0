Return-Path: <linux-arm-msm+bounces-81798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE27C5BE84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDBB23AD515
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EC82F9DB1;
	Fri, 14 Nov 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYlfnBjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2A2F9C39;
	Fri, 14 Nov 2025 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108002; cv=none; b=NGU3Vz9EPM6xjWb0dCqsNocHEzibo+ODksnb8wCK8RyGuVidY8/uvJBhVBMiJlrPbLEL/94o6oSDbVVjitgShtzj9Tj0Un7Xuuzaet1IlKDVryLO5/QIFd02kKIefr3D9iXjmaRb/VEQllEPTXrWR7BkrtEH0H7IJ6bB2v6o2tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108002; c=relaxed/simple;
	bh=MT7P5gGCdQwUvwOnQhIvVEIaafKO7NNdMsTHr/FwL2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LXeHU3jEhn6rzjLr3tCIpguRmZgnkGu0FdowI+h1PqAteLssXxH481gisiyrwOWjF7J4R3q4TZ3JzZGnPCkngT1MQgSW5FVMUZeNmT07zqjZkGfuXXGEexcT2Bj/ckHhOwQv4inLFt6K5CaT9T0+3Gz4xTzbxgqP3UXGc3KXXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hu-tingguoc-lv.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYlfnBjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hu-tingguoc-lv.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb6oJ1620299;
	Fri, 14 Nov 2025 08:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V/OHxco0sg710DrR5iaoLb
	kaaqSIsqlrdkqQC6u+S3A=; b=ZYlfnBjnzlQsyT/roRmjkfaQDXo2AuMa1YCmtd
	wiml4kM10FaJoWgGaH6wxcECp7OURin4VNpjQcLyyCO2T6r13iIFRTXtmb1zkcwi
	vOdcesZTTaylPwJ0ynctV+RAtP/068qOBilqof38OMnyeBeSiRe1tVGouWJyU1jT
	o0DkOGHOPFkzBm3ZmFogQVlX3//gNIOi3W66mMaK6AtZM1QeJXS8F2JyVYdN2H/Y
	np47S3YRrZhCKGeur9vNAuet+uym4ZcLng+PYx1Hun/21RK9q6vydumxOb57uWiu
	BUIDZ6s+l6YVSokqFgImzgt9+Ir6SvYk4yhhZDFQEXKEbiiw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h1bpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:13:14 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8DDgZ015571;
	Fri, 14 Nov 2025 08:13:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4adrg3mkjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:13:13 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8DDSM015563;
	Fri, 14 Nov 2025 08:13:13 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-tingguoc-lv.qualcomm.com [10.81.95.108])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 5AE8DDTV015557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:13:13 +0000
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 2370279)
	id 4CC5A2165A; Fri, 14 Nov 2025 00:13:13 -0800 (PST)
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
Subject: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: enable pwm rg leds
Date: Fri, 14 Nov 2025 00:13:03 -0800
Message-ID: <20251114-add-rgb-led-for-hamoa-iot-evk-v3-1-5df1fcd68374@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251017-add-rgb-led-for-hamoa-iot-evk-43ed6bda73a5
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763107620; l=1981; i=tingguo.cheng@oss.qualcomm.com; s=20240917; h=from:subject:message-id; bh=VKdTx7NziG/yqzRPbDsdPLSr+JzTIqFEkATqs2LtGKA=; b=ROoiEglHHFSMkXmDJeoWEQguARaI4VQse64Vz+d1fNbfn1mMswaQPyDGfvM3r/WpjlXiF9Rb9 40TekrL8nfDAC/Kro03tdVJYs/m6tANE7mN5vHftFvez1z9gfKf/rbD
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519; pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lLshMMSgc7w7BRmLB09IZ48XZXhsFQPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2MyBTYWx0ZWRfXxS5Krm9H6dzu
 U10PjcFLe9Inf94u8KmDIpaXDaoOOz53NoDiebfhBQl8Ngq/I/8t9OdIf+LKyL6FRw29V69CMiu
 E66jy0P/FbTTHZUyJPyJ3UqHLcVuhJPaN7uhEATitgy+bFCT6sRZla+X/CBkcPkJlERwdjXc/cy
 Vrp+gp8baECEbB1tD8F1Ls82ZVP9vojpQvAINVr7HR7myflEFwrYWT3+nQKjYduNy1LLzcVKD82
 BEVjJn6/FB2iWWWjcLZNBHVMUyzsXERqAUGgyUfWycDKgztSONHBET/JwoEAoRVFTUS+6vD4rkE
 BpqeUYr2DKv7nBJ+GaFOfUA8Fe/xzv3roruRYyYipoqh0TGFOCTxKEcQrtbUDQVtxq/niX06CPd
 3WOr+EtCIqUzAC0whUkfhOj5AQuBKw==
X-Proofpoint-GUID: lLshMMSgc7w7BRmLB09IZ48XZXhsFQPH
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=6916e49b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F6_ufdXwtoZMk_li76YA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1034
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140063

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add RED and GREEN LED channels for the RGB device connected to PMC8380C
PWM-LED pins. Omit BLUE channel to match default hardware setup where
it's tied to EDL indicator.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20251113.
- Validated the function based on the patch "[PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI".
- Link to v2: https://lore.kernel.org/r/20251030-add-rgb-led-for-hamoa-iot-evk-v2-1-3b3326784d7b@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251030.
- Remove BLUE led channel to align with the default hardware configuration.
- Link to v1: https://lore.kernel.org/r/20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..e0d427b7a207c097a19f454ec3d7d6c3edc8f79f 100644
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
+		color = <LED_COLOR_ID_MULTI>;
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
base-commit: ce649144bbb174abb260a3f9d77f480d8d56e813
change-id: 20251017-add-rgb-led-for-hamoa-iot-evk-43ed6bda73a5

Best regards,
-- 
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>


