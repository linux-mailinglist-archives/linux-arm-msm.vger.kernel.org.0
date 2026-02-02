Return-Path: <linux-arm-msm+bounces-91438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBUpOvtTgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87102C9357
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E08130067B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05081298CA3;
	Mon,  2 Feb 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEhCe1Xs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXL48i1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9829D29F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017769; cv=none; b=D3vprLmG7dLcIqOKvEkgovxIHQ4h0OEY46/u6MGL7UG5jkGeKgerCUv8EVvcwHZcBwOyv/k5aVn7Rb8IV4AMNSeZEgAPrh+vwxCVzfU3dJoxaOYvwS5Gy+mFnCrKOQDJGKSdE0h9QtkkNmBIMUYsOkSVJ/763i3KcS1xQvW8Yh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017769; c=relaxed/simple;
	bh=ZGnhUIeWCKOW/ZxXOlZNc3meOOOdd+ILkA/TJ747+Mw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d10dBFuMbhQlp0D2/HEiQzLnbZgLJ5PhmLPyUZp4Q9NFGnhj6NywQ/uYAKguwX5DisGNJs8QrWwprrLJGSTVROcl+VZ/qtYnQB2IFKWVqIFIzDNuhL0K1uSpcVZcnJuIkdZZJMnEHCA31Ha2WhLS2WdOQnsraF0Y5nvuY2U/Lcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEhCe1Xs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXL48i1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127Ph0w899595
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhWvwYxJWWaETVD2M+S5icN9locUXAAjNm18qBWk4TE=; b=nEhCe1Xs8yS3g3ek
	Vl/YCNAYhlrTMzxteL/BSpfOu0W8NgOQ1YtV3gsuKc3j0lhGSvsb/xHg+UgmGJKH
	vNwEhnTfDfRX4ybJY2BnH14Gl+9vNbn5BcT9V9dii7fcmNlGKMeph3HF/mI2eRZ6
	LEoEc5PwRv0atPaVzrsCR9wUNGC5qDSW/ynNUAHidVAG3KI+bEkbjV6LupJDYGDs
	37wjMcPQC9bwDSJWzVuLSVZsjMJpBtM0jrvxcDjCOCIiRdcMNHmz6O+DTK6HC/5F
	XCn6frSMEr9TPo9IyNxpI5OP7p3M5zIL1DDLyIumVTlo7GsAFQPkGiWirgTwwexc
	1e/W5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnvebw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:36:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c213419f5so3450466a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017766; x=1770622566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhWvwYxJWWaETVD2M+S5icN9locUXAAjNm18qBWk4TE=;
        b=VXL48i1CkzhGN+ILAeiFIPp7EAdEU03aHwID7fAdTOgNdyquizbGnueDQQlHyB0WDc
         ok6V/cP72NX9V7O8n0taJXPkyN5fzFEESPbMaFkkr+f8sCEbuabqNuijP7+AFUygM1Rv
         RlLXkfSpWwjw0Wltz5k7YwDGdPAX70tbJrBfsRJ5mc04IxvvOlnJqvkDd1l9t7jJCCYX
         3/ZOKdCxnGff0C+5NEiLi44qZHLS6Xv/AsDvJz421zlZOHQG5+CdNWwgngI6y0CMT2qe
         F/il3jyg854MwW0LQxD+QsjBNGXxyxXPFAZTfwO+gn82Fjj9OR8NQDxPW+VQGEHKkltz
         X8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017766; x=1770622566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhWvwYxJWWaETVD2M+S5icN9locUXAAjNm18qBWk4TE=;
        b=ZJFfggS18969ft3V4xObZseZ5VUB5WPo4DqVbXtSMM7/eVJxwG9aWngBvsjwX0R1FP
         Led2FhO+sCZsmgRVFuHaDSclXLujcpOTnDRkOM4sy4P/xYlX0CyR5ySQH2MhNdetl0y4
         7qyhpljzZT5o9UT9NCucqkTUou7EQmeqb0iUaefsmF4vXXHqz7MTHZ9Gftu1hneeDoQG
         WsfgXY4EIjxhCJA7c4KBAZOLYoMTvw1QhbwTU43YGIrWNTGbzfINiHTUKxuYIOTc0zPy
         mbdjpy93vdf60e0BrzA5Aob44yxhAWRbHBgiIVqm1BsHaL5oaeNmOmAIBdExOG+ulP+R
         9esw==
X-Gm-Message-State: AOJu0Yy+P6IkWOBTP/lpxUV1rZqlvfKN6zlL/7DYN9R0E7eB8iS0zh5s
	eBWL3m1QT9/E9rbMkh0l2/C4Nsxughnz0rbaQSJ8sS+cynOCZo3D3Wb/cYbsCmaBXsnibu6KpKt
	qiB7VfhZyvjR4gdFw8B6QJ+Q/Sxl0ndfR//09RyRav+NuD4FGDyNbbx3YY+C8izxJJ8af
X-Gm-Gg: AZuq6aL6XV6KAUn9hIQwG3Pyd0AgHHS0qspbDAC4sJ/c3i4cNvBO5dqKtAlUMCjS/2D
	QcgF23aHHtBlGwN+jz29B0RMs/OBMiQTD7nceaykUxJ9op+ZgtsLneP+RfWTuQPtsISYxHNIOTl
	hln2aQ7YMToSi4JsCPp6l+t8mD94NHQ1a3R81vWWpMtaxq6Mz6Rz1ScngsbwMJam5jIGaIq5mLR
	EObJDYOsJVMYlevyyD3rCgSM3Ruc9C6jV02JDcahyOknbXA3d7DX2TaY0jfHNaT5+GN1JS6RcHK
	ZiVtC+LbT7SqE7u7AJWZg36597N765Q4HNZQJJAEaNdQUsupjp+Cb1uwk7pFehwH74RYoHD1xj9
	Jhaci33rTJnRlKyI+ifzLWq9RPrwf69E7EvFepAbIS/Tc3BDL01Rng0+iw1N+OvuYfOMPKu9uUo
	4=
X-Received: by 2002:a17:90b:3849:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3543b2f95a5mr13067510a91.6.1770017766272;
        Sun, 01 Feb 2026 23:36:06 -0800 (PST)
X-Received: by 2002:a17:90b:3849:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3543b2f95a5mr13067487a91.6.1770017765771;
        Sun, 01 Feb 2026 23:36:05 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc71bsm14129847a91.11.2026.02.01.23.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:36:05 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Date: Mon,  2 Feb 2026 15:35:47 +0800
Message-Id: <20260202073555.1345260-3-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=698053e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=93V5M4jBH0hLqW-x8QsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VbPZBCUKLlDSFsvT-N0TcvD-2lENBtje
X-Proofpoint-ORIG-GUID: VbPZBCUKLlDSFsvT-N0TcvD-2lENBtje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2NCBTYWx0ZWRfX0DyRpmKWpL8h
 WNhrlLfY76PnZxA+NRqnkZiT2vvCdadxc/AQz90YvdoBQO2te6Aib6cIUr6kIaXvRQuVpWM/WG7
 EWG7vIAGPsNnEslgtpqKSDhpk1t2OcpyN+BMcAlvBp9u0Vi+9khq2lcbEf2rD8PIzGaBC/hTRsc
 2G1QPWEFe5dMQcu6/N5EgM4vb156xp/v3lI5fwf3XZTXNcYYiDkb9axSlGZjmPQsPxaPucwbrdE
 H6nsoTHF1/Zz8gD4AKAmOgDW+XPpNIad5iBQ7oHE9hYGJMcQb6/yJ3sKx1vPF6jyWmxl42xeaAR
 I2xKy9gPQEJtU3fZhs/ugsRjj1RqGOSL0saf0B+mlIfUM6OcPDpPBI9vMQnQufYabC0DL3E7np5
 pZgf9Z32jgL+YpVsjmQcYUktZWkPb0jsQjce2sGMHftX3fnPqRRMbrWgiSk0Qkmmqp3J85roGrh
 wdqnU2MpSRr9w4fOZGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91438-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87102C9357
X-Rspamd-Action: no action

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


