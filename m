Return-Path: <linux-arm-msm+bounces-84198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBBC9EB7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 11:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0813A7546
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 10:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EAE2EFD8A;
	Wed,  3 Dec 2025 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xscw3QVW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlSZv4+H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2B2EC56F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764757940; cv=none; b=hl12R6ix/NEQiNnRHkK8uUCzrTTWsr86LLTR35Cssjouv+6dNO3r/gcu2u2DpBMJq20sDbNgIwiXW7OI065G01OscspQuQNVwfw5xiv3Hpt4VeB+T7SYJymB7g3bUW7Vp7dRqB6cIqHJfKtiX47ynhcoqivx+kere6Nw0FX2+qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764757940; c=relaxed/simple;
	bh=t6ojKAJRe5gc/C10JlkUQRjUJgW7yOHaKBNTfKRlhuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ss+Wv6BIeTZ8yD5JG4YRknB/a+7Ffwrxvtf6staRzT43utRnMO1rsrQ3x/oCm/kq/MTy4npGhz+tg4e0OsTCdN7IZPYxR5QXN7JNgnhi8piyyQhbNMRCmd3aNZd4A6+gjfFLmRgsoLO7QRNqyikLLrG9Us7VpOzy5XbJh5mccxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xscw3QVW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlSZv4+H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37W0V84011463
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 10:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ubvg3Utdp+RqIiDzx58hQS
	Mht2/N2N+4vCGVCGK+fvI=; b=Xscw3QVWjuDGnPvWUGs/UJNkWW1dPJfJ+ZBSsp
	fNHrbDmL4mE9KY6ho8M6oi0NY9stqZZ4+MRsAyoEMuj1vgMNzYXn3PSLmkYQ7iiQ
	Uai60J+INSOVsz7jErt2ZPE+SeAiH7Nc7+LUTsqwLNFXDUyNKNX5ISm53oShtz+N
	QVrT/6Dl6vbTFTqH6j3LSUw0q6WASgvsyRzBJyw6rBCYRVeAUyjTRBy5uGieDoDN
	/OXS6MMCo363LoQ7t0M963ouAVVoB+f0wmDwNukEx/1oe0F1SmK+xO1kpudljMiB
	hVo54OZUWnagarzpl5fRXKUN1OQek0WNNIvZ/rpSqVODcsTw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8d9j77v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 10:32:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dfae179bso136274505ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 02:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764757937; x=1765362737; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ubvg3Utdp+RqIiDzx58hQSMht2/N2N+4vCGVCGK+fvI=;
        b=XlSZv4+HElOUuV0bHc6jO9i4MKn4BC47FOFmoz17O9bZ4A2lim1nporucnB0JVth23
         eMcvTwrmHnAyzbYyQKucuZ8nKGAFtjT74bqL84fTPDSUg+w5m9Ra2vFYtklySODOqRTO
         Qwzqwhvhz4lLQ7lew4f1MLh+dPJKJ42CD7fkX6LgLL+KY4KfTSkTp3V9tJnGadYZWLGS
         SajRf3vTUSBlcEu3gUwnXe21oKYQHYRWAi0E91zWbQPcH5nxS0g2roASK/Yvr3cBCnFu
         yW+l9buo3I1rp9N9JNwsiD64f8tpimrWUIJcdUE7uIH/XOa81m06m2NLJXAIZZ8FzzAQ
         EB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764757937; x=1765362737;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ubvg3Utdp+RqIiDzx58hQSMht2/N2N+4vCGVCGK+fvI=;
        b=fRwyFv+D4V1qoHV69c3msgRNUSz9Urga/Zi8KmcQf9UOizBeiJ+Xt5pmXZj9vJuwyG
         nBQkv2ZwIgqvjrU6PjrCVA2ohERORUd6aQba2+1RnN8e7RnIpeaMNRXAnnQOUtL09vma
         dYVfTEiF+dZOzFZ0Yf0yoTRTXp7OgFNTEbQMQ1cZmdz0RCTqVaIxWKciwvBmhmPDUR/p
         HDNylSS+C0sawKFD+DJHn73po5QsThY/geuHQwwQ+ZZ0yQMO0Ci75xPt8LwA96tTmXnd
         DNxt+dkNBpOCtQPtk4vQyz/5+ZJMVeqtT3Gednyqr0b+/CWlRYGJscrcf5BVobWi/Myi
         15tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhxwtfVH06MXI9KNM3w9YNVlIpZBJoeCd1oqwDFVrhHkCO9FH+HRc+QfgEtHGcWd7p+8i/QhBGcVMRgyjq@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7oPyce/tNTnaa1mwyu0y7KpyVFOvIp4R4BfOE8gm0LDZkDtB
	3wRLyoiIxpdQTM/uJ5KUBODi0ZusZyEx/nx0HrLTA9UnuJYaPbUL+Ng/MC/oRuma4bhpDRyIwzB
	U7ORwZw6fVvviNFGmZVQ3cZ+xKd1AalOGSYfPrXluklW0ENJkLECurWXEMpYXeiAWs5Mo
X-Gm-Gg: ASbGncvn6SKElvHZ+kO4DAXrSTIkQ/GdmcydZzfQqu8CQeWV4TkjpkGDSnC3cGpTer3
	sWn0FzgySbwINefdmRssF5NaTgw2cs1cE4JS7pW9Jrfzucf2s9ZhC+UMnnOxAujJhmLpSDLYPx/
	BQOfCGiLMOBFUib5Tk12udBvxrJ/5B0eRat4XdaHNy+7zy0Qt4MSiN44/maIe4euGZJK2tDquLq
	hzK9SaxtOTFyelOwgvvVjePeuLC/h2i2XAdVNEIjHWojFi3uHV8StbxqSn0j6eC/q2fyae7SIZi
	t+cxhZ5s6LH4FFEgYXVTDS4dUi78Q8KbCdNNIUq5P3bMhUkp8/xjYWfHSCBRAnKD/3Z/7ati/Po
	HE8ICaz50S7MhMIcW+ZaWopLUnHx3MgAYNA==
X-Received: by 2002:a17:903:984:b0:297:fec4:1557 with SMTP id d9443c01a7336-29d684c565cmr20261285ad.60.1764757937073;
        Wed, 03 Dec 2025 02:32:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0CxCXg/Sxp/Z8h5NWHvJ8e0rC9JWByoh3jci/8E+MG08d++VdGQiHvygk+uTPLlNPNp/bwA==
X-Received: by 2002:a17:903:984:b0:297:fec4:1557 with SMTP id d9443c01a7336-29d684c565cmr20260905ad.60.1764757936436;
        Wed, 03 Dec 2025 02:32:16 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce441afdsm183531775ad.31.2025.12.03.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 02:32:15 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 16:02:07 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: Add camera clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKYRMGkC/x3MTQqAIBBA4avErBP8wZSuEhGiU81CC40IpLsnL
 b/FexUKZsICY1ch402FjtQg+g787tKGjEIzSC61kFyxEq3RfPEuer+EiynNnQ1SGGUGaNWZcaX
 nP07z+34dzLLiYQAAAA==
X-Change-ID: 20251203-sm8750_camcc_dt-350a8d217376
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4MyBTYWx0ZWRfXz44/BMcNZbvB
 jIzHNcnWDqyHVbNKWZ2ndt4erfh+djwrh5wuH+4LS6+mBee6B+GRDsBGbFcHH+W3kB81Fy82oQh
 T6EKDPjRIPRxFBrmQ6DazpiACMc3ePCJvg31JqPwHirNS3kcSZ0BYV9N3SuMGO5BTw2XTrmkTCw
 bO1hujMTnx7BkdFcc7As5iW9k25+53iVzca4CEDDGbIg/HBvHwdu579bY1J3SD00cadrHkZfh86
 kZ7q0bkyc5KH1UnXE5In7x4vy2f22bsMH7TbWv/UPjGaYWeXWcH+1S8NTR2vVcAoReQFwBRs3OR
 ZpSwgfcikzVnyMW+l9jDGxMxF5EJCnhgkT5Al0SscDfecn1TNSyDCxcjV4WNEEh7xhj3VjwFaAD
 vlLQhLUft++cM1RPn81qITw3/GOVWQ==
X-Authority-Analysis: v=2.4 cv=A7th/qWG c=1 sm=1 tr=0 ts=693011b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Tv7FWnznUHrVCKwkyLMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: OQXdYyeyA6bp6U1im9OHAhp1gYPMwZa9
X-Proofpoint-GUID: OQXdYyeyA6bp6U1im9OHAhp1gYPMwZa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030083

Add the camcc clock controller device node for SM8750 SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..f09cec6358806f21827e68e365b492e563c0689a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2,7 +2,8 @@
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
-
+#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,sm8750-camcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
@@ -2046,6 +2047,22 @@ aggre2_noc: interconnect@1700000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+		       compatible = "qcom,sm8750-cambistmclkcc";
+		       reg = <0x0 0x1760000 0x0 0x6000>;
+		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK> ,
+				<&bi_tcxo_div2>,
+				<&bi_tcxo_ao_div2>,
+				<&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,sm8750-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2740,6 +2757,22 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8750-camcc";
+			reg = <0x0 0xade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-sm8750_camcc_dt-350a8d217376

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


