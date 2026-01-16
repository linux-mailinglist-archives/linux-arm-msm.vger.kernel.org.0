Return-Path: <linux-arm-msm+bounces-89375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29931D2FB4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88DF630128E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA5F35FF46;
	Fri, 16 Jan 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+vsve5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYgEZ3dL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7973612F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560111; cv=none; b=tmCxaMtyPYDeWj3OMCHeYvT93iWgG11n0KvSeATY5PaPq4LM/urMTgvXRtX3NTCAl9pKftZTw3x0QgCcSU5CO/Afg0/A8ffVD/Gt6J1JFomsLrgfYW53eXluznsxMF/oH9djzzrEIYXjlebUMe4xrEL2v4w6Xv1LOFbDZiDWq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560111; c=relaxed/simple;
	bh=O8FU32FkBAciOl2oRzFV+HCHGNf0bjtI10/1QWem5aQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8j2poSlGPWfOWf9IjA9F+wyQoiJo7W78fX9iBSsb46Q9g56VGS4HFn+JoGGL2K8NOclYMi1MfktIRs88e8MFoBUsD6aTfBdu1kYIM8iXGWcIK2nyE9u0GzRG0FhWZzfxxrVwo/Db/Xls86QARLLeBM1DpeHfHzE3jFzVhIzH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+vsve5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYgEZ3dL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G85xo03597147
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWlURl9YK/eYseoveAaKtXBZQlK2aafXh27y40DE+q8=; b=L+vsve5Hzzd9Fme0
	xXSQeqApEaz63H3KIFzTGLNsC3nbw7nlDM7e+BFnZ1TpYVJnNmttNJ8spfUdXBd/
	mPG947w7TIVpJgcHnVZQDMvBPr5WBrgCzLLnbodmfm2xLytstqIun+cFGhX8g1ko
	xtcpBC8jYDEJiIR0N3iIdiLriL+TewSwpED4e+OTM5BAWB2Yjf1dSMaOlTxNJWKy
	wMH8sytGcw0f/vVbN4CxgMqXH6sXbjmYW2lN/Bbx3U8xvFf7i1n6aC5FvR3CzEUH
	ubZvhe6lRCRVtN9Fimlwjf8+feLcEf3KesqCAMH5K0xAnWuzlUanLfaj+0QVA9bY
	QlKw0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rsu4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a089575ab3so17435785ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768560107; x=1769164907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWlURl9YK/eYseoveAaKtXBZQlK2aafXh27y40DE+q8=;
        b=cYgEZ3dL54viIssRe1FHjCJJQe3UUBDqC7XVTkcGQlwXKZ3FdpoOjyXoG/q8QXcQBU
         0M5KkiqAsrd8QdKcpyELV4XATbNzLx3qdnRr9q4G2fdqwKDbqSdLHT0RadHX9wmJhaiD
         ztoOX8CMM/C3jeFWASdXQAIy6AZLbQuqV3AxYamO4xv+A0Km3LdG8v9Z10tBPC2dbeNn
         rG7TuY36vvOPk/oc8haP6+YqcQvRB8C/r/gMJx/NQt+5vcPb0ZK1B4uNPmjX4EjsiuCv
         uBPxCVjYBN4+cWPpbOFg8depHrRxMPf1JcxrgVKB2oiHcNep/xXkM+JoGjIObsfASZye
         QRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560107; x=1769164907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWlURl9YK/eYseoveAaKtXBZQlK2aafXh27y40DE+q8=;
        b=uZhsJfgQWqWrwk52vqozBpQ0ucDo683GqMpCoG/K2xJcgN2S/agl7dmj5NfvGef/6U
         B9VriFavyqQ8/BvmovxoPUJgoP0JW5USfJt81hvdBprp1S4FBZZgfx4Wi52TPBvrKFou
         5rtZb9JXi1M1c+jLwkedF2XYhRo0p4eeBhDV/S/uoTcdlBoLp0bhSQ/DgUgXQ3y2DMWk
         dpjnoBqhP2MYh8e4hLTaUbuj6F7JTHqAI7EUZijLp8mfkGcZKm/KTwL1WyMcHIeY1cZx
         2U0OYLHO+UP98ZhTnLx0g1oUmkwKB5N6SbTXv/6LaCIZQNtTUTekOtAfn8OFWbRvWusA
         PlnA==
X-Gm-Message-State: AOJu0YyrZjQ/uSGdW9yP3IbV20r/PSU0RcxuhvJoEiAnbf0k2ANdoQHF
	ykbcx9AubiYmGb6KqDbKIVKHiJxrSymH8nNkvxQLXTciDWW+cXNu6JgfmmKZWVnBNr9Wy6wYAQn
	jyl4hVWen6egwD50UbZhm7x/NIahWxvbQsb0Us6hnv0djFKofXa1GsN6+0c/m8+kHViEK
X-Gm-Gg: AY/fxX6SJhA+tMz/68mIkwoWtuRB10zBvyvJ6NrWJbKeHhUiIr/t9buHcuolpfdP7Yg
	D3riADwJ82P0+/sUsbrtMh4TDQWrDMTiWbZRI0GYLcmtex5tGM+R3iUo9V4NtIDDmCErjw0ZHSy
	5mb8T6DUqUpGKbmZXU6c+QxRGuKKNndbpdxYu7QLhvviSP6VpnNCNleRnQKrJ8MH7Xd/V1racxd
	akNTcI6oR5oWiENvJsEAbfCx0rPi3ospfbQPzUUGJJO4NpryENMGH6WXSHjTZ+X3dQkRXLZ/1rG
	hYM+vm5RZkX00f1UkkJ6B5eRRGekIYjGUFoaT+mnUDR9VkqHVtl8+urydnq9b3OMYfhJOp42XMV
	dn5OXHeydao/uGQfxEb2TfO5JyGaE4Scrp1Cu3K4dDNGF5HLOZE8bm0phACZhhP7iLlTfhSlyGV
	k=
X-Received: by 2002:a17:902:ea03:b0:29e:c283:39fb with SMTP id d9443c01a7336-2a7177cf550mr23627405ad.52.1768560106609;
        Fri, 16 Jan 2026 02:41:46 -0800 (PST)
X-Received: by 2002:a17:902:ea03:b0:29e:c283:39fb with SMTP id d9443c01a7336-2a7177cf550mr23627245ad.52.1768560106159;
        Fri, 16 Jan 2026 02:41:46 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa340sm18009215ad.3.2026.01.16.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:41:45 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com
Subject: [PATCH v4 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Date: Fri, 16 Jan 2026 18:41:29 +0800
Message-Id: <20260116104136.2922032-3-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3OSBTYWx0ZWRfX8W5v41XZkHZ7
 i5cq3NXvCRwN5enVgg2yMCrzO2ErTMkjP3e1e8GDljgn4w8gQxdtvEuQIrhZYCNn7ePhPaMzkYC
 p0krQrspfYR67jillUDs7cJoKOahktSh7rYqDZR7p1kFWAhHzdPJ5CanF/u9jOKTq3yViCRHdkU
 Yp6yFVD4/ntIsQ0kzkkEMv4F+08SKS4QZoaFEh91ElVO9iaYCgyRAPOXClTJqbqGGIj9XBOi7r9
 E5Ph1vN0XrPfTm+eCGW1o5yqKNac4nfDzLYgQ/Giq+74zlRwJD6cUTiUdmmidCpZMSXaEeFR3Sa
 WJxJFZEzu7qtPWy8Rr4QiK8XJeEi9B3LeTNwtmNsk9hJSdfftpvJ4rtFtHi48jaa9mKs6TMw/1a
 dODOKquzajOTHt9MkwdlHpy8G62ss5+V6Xtnjcb2dK/4GghMxXMBtoxWfocEcjLlK1DnvW1fihy
 RwSY6yOUoswIIvJQLTQ==
X-Proofpoint-ORIG-GUID: sq9Zz0atYF-q_TIdpxKmD3W-pvDV_I1t
X-Proofpoint-GUID: sq9Zz0atYF-q_TIdpxKmD3W-pvDV_I1t
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=696a15eb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=93V5M4jBH0hLqW-x8QsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160079

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

The PURWA-IOT-SOM is a compact computing module that integrates a System
on Chip (SoC) — specifically the x1p42100 — along with essential
components optimized for IoT applications. It is designed to be mounted on
carrier boards, enabling the development of complete embedded systems.

Purwa uses a slightly different Iris HW revision (8.1.2 on Hamoa, 8.1.11 on
Purwa). Support will be added later.

Make the following peripherals on the SOM enabled:
- Regulators on the SOM
- Reserved memory regions
- PCIe3, PCIe4, PCIe5, PCIe6a
- USB0 through USB6 and their PHYs
- ADSP, CDSP
- Graphic

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 .../qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index b8e3e04a6fbd..fb90beb1096f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -3,11 +3,14 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "hamoa.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
 / {
 	reserved-memory {
 		linux,cma {
@@ -378,16 +381,12 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
-&iris {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
 &pcie3 {
-- 
2.34.1


