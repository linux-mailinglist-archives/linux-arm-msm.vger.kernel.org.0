Return-Path: <linux-arm-msm+bounces-80787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D649BC40647
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 15:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E7023A3C31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 14:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C25E3203BA;
	Fri,  7 Nov 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xq/Y91pH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKcHvrmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F752E040D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525956; cv=none; b=UkvFguO+1kg6+O+uzYQW0J2tErVqlBZeyGbvZ0dObgXGdnpNZW+DqhD/yix9TVPHPkHp4FzlSVCEqihBjjKyuzFTQ1wwGoK6SKA/dA6IQI6/NW37nmDZNryo3CvkRN7NP7/uG9bt/qPVnJ6pXu3IH2vVIHR84Pz4TFyzJsZkpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525956; c=relaxed/simple;
	bh=osQ5V3k9MyVWMr3c0R3flOz7cjip8jS0q6rHio3zx6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fltR+adAoO4a7yrmwQswspl35jHEwlfuwULXppc0L7vQ20AW9hMqFrPtwfXiep0+tMRIT5crIg2ZzSHdMA0HhlGvOEkEoARJlU4H45rDxsjtOKOsklYUM3gDrVi4HmBW0v8DlGgOy6vth8Z2ZenEp8s90LXaXy0m13qr6BKAPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xq/Y91pH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKcHvrmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A797wf81709849
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 14:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XLfDB2h4cT1/AoMhwltC2v
	4M/bE/q/WuRsSYyya74tA=; b=Xq/Y91pHOkDe3gVj+wtM7D8qZ5p2BK8nVFB11S
	U4PZurBFRGQPoqvRLPbUWdcYlLAkUGcHdUI1rucccOLI9yMTugN/PHaZ3HEWBj/5
	juTEoGhDpLM0L93tFGVe2HdcNKImfrz4mkkXL6b5vxg/BtoDvgRsKsVDzxlMcGQi
	g5baHXYQRYWC64+Wc7OBnUU82Q5tVo0E5Dfv6Sj8sLNKbhXXOqGqJgZNs8NDU9vh
	B7RfTZlXA++cwD228QmF37aIiv9EUzl7ZX8HFvOklHGdSrGsL6ZPZXNz1PA4SEF5
	qV4FzQ3qy67Jt1vJD/El0ibaue+g8bZn7d9aLGFX9kn7lEbw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue245h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 14:32:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a4c4eeeef2so1611258b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 06:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762525952; x=1763130752; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLfDB2h4cT1/AoMhwltC2v4M/bE/q/WuRsSYyya74tA=;
        b=YKcHvrmWENRRWDWzZE1CL0uOyY8kIspJgvLQYDta2uFG2fKes9Ga6fQXOmRlVNbLrK
         dv6ELQ8XisRBc/NDJ+fhvs22mg9L95AAIqDdZUqM79ind85ur385DBj9fYsbMik6s7wj
         axwvUj+cGS5eBq63zu0zXlcniSm3JKJeG1vOZDyJZENkuY0UeBqaeMc39rLe1hQt81ES
         PuBq0IyagxxL2jeSGyijstB0RW7Q3N5jFGXmFf7GsGUyYlYTh325E1W4y2qscv9vI4Jo
         YYahuE2+qVH3Ds5A2QWcDqp/fXxIeOIjtUI7POg1LZpI+Cpsd7qqKwGM8BGalHg2K4DY
         sCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525952; x=1763130752;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLfDB2h4cT1/AoMhwltC2v4M/bE/q/WuRsSYyya74tA=;
        b=W2M5qp65eAdNmkPQrLJ/2Suj06b7uihPTNdmihD2OhSbhyqFGeV2kwyjs+42ZHcCbk
         VJ9j8nUjmnJQMCjfPRsf4XmSd4U3G6wtjmX+71Ml2YVfHOzBruR+0/IB+2CoOcuMjtEx
         OFtv21Gzbb5t8qaFshy1s+ygyD8tFewYzjfSVz3BpU+MBs0ZIsvnTJM5DZZ3dMLc5LyH
         5eMcLxtpY0S5F2DPVBkLphXFrgezq0Go+m2VL7nx2P+GWk6ABUDXZQWTTCQEh8FWcmOr
         Tc6SbEWrKkv5fsnVx0y2If5YrCzHL7NrY8kCCK5NukESw35+54Re22pOPdyEcAvj43Fc
         2Fvg==
X-Gm-Message-State: AOJu0YwbOOcVU56JUfS14/2pDFmKs3dSRV/TxVjkipiSzcVBpW6z/smt
	vOKXKnvWNYjuD7Il3bRPAfKyHLk2GcArJUuoBTUuFgv131fCSNzYL/3SYZMVa47I9sU2JhUw55h
	eP/WWls2TXK1Z3a9N3xfpWZU3Tz+8vXW+3bkxASc8UMQ/hcQ+z7EbYAWTfP704Oj2ELzX
X-Gm-Gg: ASbGncvOXEprdoH6RkNRriBL2noNhq3tZPUBy0QIf22ELXBzTCWhxwF8gGWpBK97KVp
	1eUlgcm6tDHCT+k/w+BtM492kVutTHt0/mvrmAO6TAXC96R0MX+ELa1i5DndTPMCW/VsFppjMDf
	UN+EsRe6kwdnjj0pngY27mnHiI3di3sSNSmyJ2euvgGexJZghppb7ypVyM/4ESzz8RmEwGG5gTz
	qBTQZC+21e1Kjd7thwBjmu/HZXaB/Q0sXnnH9WcCzntGuh9f0moEnJV5zjeEYhYNibvqjWzdpbS
	tb6VAlJrp03/PbvAxQTaJflX04XQXgacvnatSqjLk4mQKr5iY7wQ6vpZgM/zRevuF+732U5vMbe
	HrPBDhwrT5e3tHmqC
X-Received: by 2002:a05:6a00:1ad4:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7b0bbb0a75fmr5181189b3a.12.1762525952100;
        Fri, 07 Nov 2025 06:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZn7uIdGkx9mTVEde7MvoGMrw/d84Tr5ktpoqQ4mIBh2q0sjsRszANe5El3zmwLHlM/tvagg==
X-Received: by 2002:a05:6a00:1ad4:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7b0bbb0a75fmr5181132b3a.12.1762525951610;
        Fri, 07 Nov 2025 06:32:31 -0800 (PST)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953de38sm3240824b3a.9.2025.11.07.06.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:32:31 -0800 (PST)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 20:02:25 +0530
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on
 SPI11
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPgCDmkC/x3NSwrCMBRG4a2UjP2haawtbkUcxOTWXjQPc0MRS
 vducPhNztmVUGESde12VWhj4RQb9KlTbrXxSWDfrIZ+GLXuJ9gSLmf4Kvi4FLDakCw4VdD2AkX
 7eBOkGoOaA1KEZNYabjaj8dNC80CqtXOhhb//7+1+HD9jf+l+hwAAAA==
X-Change-ID: 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-c8353d7fe82e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762525948; l=1166;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=osQ5V3k9MyVWMr3c0R3flOz7cjip8jS0q6rHio3zx6Q=;
 b=fHRue2pwlGzCS6aDIwUia1Q8cmUilp9BgnjInkTqE5OWk+w44CntiQ+E/Au+QKuibM3/h4BH4
 gXdc/ySbUUlBKxtrm5hUkRGJeNLEe70cY/tcF7rdhPu0xoad++TvG4U
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690e0301 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0o05X4pXTjTZH81ee54A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: CvzSAam4setojW2faxrJnSk8wQgLCMlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDExOSBTYWx0ZWRfX4RBiYPXyEMRp
 w7ON3L8E6gh1wRv2+Ili1MlGb1T8Mv0v+Te9iNV6l9iYCEN5rRTjbA/3E352gNJ/JRyFFvO7Kqk
 2WNO1O71A/P/kL+BJezC6XbMyGCzIfAeK2WA/XJDaohWdXq+wAK+trt12E7ELNg2/squu+C1hqX
 wT1y6fIR98TugasblMiYlGtRItWhQ7NfgYte4IfvrEjBc/gC+oo3ynh7M+sHaQxhhrZJ5Ws64AJ
 2NzsLpsnCMbqL2/k2xe/IFwTzn9hMU3K+5x11o4/Wb8If68lQUScWqHB9vJOLMogYQaySwMKzp6
 lMOIzOx0EBK+xiYJTGVkgLM8z1r7ifZIJiK5fgPOnLnqXcuokESeq1DJHBCh+TuQAyDIP9JYhnb
 SpOHTqAcTLF/sxtVoUyvl7aF8uzDLA==
X-Proofpoint-GUID: CvzSAam4setojW2faxrJnSk8wQgLCMlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070119

Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Testing:
- TPM detected via tpm_tis_spi
- Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)

Thanks for reviewing.
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..08465f761e88 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -917,6 +917,16 @@ &smb2360_2_eusb2_repeater {
 	vdd3-supply = <&vreg_l8b_3p0>;
 };
 
+&spi11 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &swr0 {
 	status = "okay";
 

---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-c8353d7fe82e

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>


