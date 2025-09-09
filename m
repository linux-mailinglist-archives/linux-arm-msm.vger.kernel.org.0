Return-Path: <linux-arm-msm+bounces-72669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14248B4A063
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 05:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD281B25ADC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 03:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CAF2D4B7F;
	Tue,  9 Sep 2025 03:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQfAQCcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7B22BE7AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757390231; cv=none; b=ftnUdDLVoyRrtixoHnR7lN4mEEGVf0X8cbyi2801ptC5bXVFXcatfHhmJ6C3prrA467P7fR9Bm4I+Lbu1MZG5BoQcNz9wJ9xavD0jFUKYOXe+t3Vc/5yCdh/LW1iOaELRFmt48FdkQBPFndK8W2voj9hsCSnHZ4sfcE297fI9ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757390231; c=relaxed/simple;
	bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUNmYuV1sMZmY/AHNe93rM0y+8sUOLv25pmeaUL3faHc38VAyMudpggyiaGwsgteg+9E7c7DoNTAMpfZiPcMJbzpxMHpZaZ0uoqfA6VtvIPyQxe8ZR9SUJlF5Lf/gNnbN9eqJHt39IrfxiK8mnlN3fNshPDiqO2b6ob5JC3Vx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQfAQCcp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5892ETFb010456
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 03:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=; b=PQfAQCcpNv25AGdC
	k3zF9v6fO0zsF9XGLndD94Yks/e8iodqIHUDBzc4GKiHTYMBHsbtKpDVZRMuCW5V
	2hFSZh7yDHiB7AschATHXhLT1QW5NDBwvzsLtEG9Kize/YEG7nJItsYsyI+JNF9p
	7qhhbszG8ftkBfbwab7khyGPHQshnO0uUqjBqddw067I4crnzI31wk+E5gDQhG3J
	1gaTUu+8LuSYI7buD1cRLKYGdq6KtXxnYaxp9zR1LmVrWHWI+A7Dam5fiNCsWTY/
	y0JCluF8AFr7mQ3MivV+pj6bFXNEsYpL7X9F938MtnNARqOoPvYsX/JTzZvWACU9
	EYdcFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a6p0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 03:57:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25177b75e38so31333365ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 20:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757390228; x=1757995028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=;
        b=nzGuDJFsrQw4yMCbjmj+wRvP2zd6Gem9QxbMSag0ouUCWaF8rLCau59oicYRWrjEd3
         5fJtaV7ahGTMz5f7OvzeqFSwNxDsJMfCBMJrARA3dj7x9gbvTuF9mOwCgEMYI4/jewKf
         FWipZpNs5zfUfxXSC1Nh+sscIFeYl6QCFCYoi5q1hLgx6voVQNV+n584XFGvljIzTZW4
         oKGA/FSeQdsAQx7eEFkThMz3VUkSbyA5LHSp1NrqP7+BjKRLS54ZCS6OKyretl89Xfin
         wQ8HDmWJ64sk7dEtfDtQ/5fXXxaGcBL6j74YxBPPD4qOepXg6BXX1TyFa4ngiAiJU1oW
         C5Ew==
X-Gm-Message-State: AOJu0YzMNY8pDu+1yFUcriP7DomuI07GXkeyQwqFmj5DpfqTGsrRt6pu
	5BGAP9ltSCrU5V1cHBKPqXbNOWXs9fbLGZm4+H8x/lwme2ZroRZY//MoL3XZ4O8kapFbHtuUM42
	McAPMmG3rU03swK5vt8Gp+HpdUq2DvaTQFonRZSQa1uo4opxdlJe90Zt4niS6i8Cdescp
X-Gm-Gg: ASbGncsEd9MdzkNkkZXG8vuf/LCWAUmKHEVWh7Tuv1NIksP/6ELa4MSRDNnxIKwU1P6
	DE6fZo6uKYBV4FcZIxSHRW4hgoMF+lGsji+yWoDcrtW9XVINOq6gIZiCl2pRW3MqUeZCJnebS9b
	IlNlXx4jNnrsMZBZnejKUEyecaEVfX0gStfN6JISOPNiahBMKxz8I7V1wOCBjrrrj1tsIoDA68D
	+jHgfQZlGI9xG32YoiwR91s5ZTvF5t36iLPRAnXg2e0NWGRs3B1PirQ0zEL1wmmi2iswdEf+g0F
	xEZ68PlbzaeVcao1yirnOaHCbPxfsSeiPSpkAB1u4iODsub+VRSUiI8br2QP27g/IwFExgJThk7
	i7HolS2jU0sogNhwD6Q2I12B7c2U6eitjmw==
X-Received: by 2002:a17:903:2341:b0:24b:25f:5f7f with SMTP id d9443c01a7336-2517301ce47mr117389675ad.60.1757390228114;
        Mon, 08 Sep 2025 20:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7mb8A5aGCoWDkFtmq3zKoivGwv/NkrXlnqXNe0qaHkpZDB9o4nPth81JCgbpm1rdwKkhG2A==
X-Received: by 2002:a17:903:2341:b0:24b:25f:5f7f with SMTP id d9443c01a7336-2517301ce47mr117389405ad.60.1757390227655;
        Mon, 08 Sep 2025 20:57:07 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903724b94sm295614705ad.35.2025.09.08.20.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 20:57:07 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 11:56:02 +0800
Subject: [PATCH v10 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-hamoa_initial-v10-1-ec10057ffcd2@oss.qualcomm.com>
References: <20250909-hamoa_initial-v10-0-ec10057ffcd2@oss.qualcomm.com>
In-Reply-To: <20250909-hamoa_initial-v10-0-ec10057ffcd2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757390219; l=1177;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
 b=t+MQ2tj2DlUWTMPD319N41fItYvc6WlBPuP6qjvqrM7LQti3yXgplmhvKWC/kkods3Q1hCVUJ
 4brEley0ODPBDkBxjFhpIGlu2um47HL1e6y2kAgPoK0SWvVvnxbmJSW
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bfa595 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uJsp6y_rJXaj5Vf6T-H7jdepJAnesgLE
X-Proofpoint-ORIG-GUID: uJsp6y_rJXaj5Vf6T-H7jdepJAnesgLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXx0mhlFJhXjrY
 4esgKGekMmfJ+eaopK1WBDZJ54pyBQvAWFxvaEY6Ov/dFO2BWaRZiBnxjKg5nFIuIL1rNEIaqAs
 goTLtdS//MW2fVYGQv/ssGFOcEU49eWSHmXFjZuB1zBRBm/9ZAm7MgPdU8yZvqv4oXXLCUpSoaz
 OP8dH0jgeRaS8Q/PFNzcZyDxh4f5C+qk8Rrlo0d8Eyur6AdhnuMTZ78cVu7kVhf6TDh3kwlwPg1
 xX1ARiKZVpIc4mJsolt5+8r742fxn1fK9PMApPytK5IFha5moXLFsBr0Gy3Wk1El+31IlYKBGdH
 gNqK24s2oUizDZS/2Cqao8BC9Tr4ywN9rGDRvYscrAhh39RuMwSyjzT8Xee2ll/fR49elneFYwQ
 E4PHJ548
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55e5eb75af89..6b6503181ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1069,6 +1069,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


