Return-Path: <linux-arm-msm+bounces-74730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5235FB9C8A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 872453AC549
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9250629D28B;
	Wed, 24 Sep 2025 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJrX8zTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3DA296BB3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756304; cv=none; b=ho37MKfZ40XtOu3vPWx1E6b0yPTmdLw22Gu8c+dwbZinzwxeDEtPgWm9i3DxoSljXEfxjrmt+DvnQGoFxO3p1FEpMFZg02FufsMmnjiSFFzYT3mxVzWh7Dti3z/VjVTt9b5kgPOkCyvBVkBYaRQTEfY6TxuIHOrchad1WqZU9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756304; c=relaxed/simple;
	bh=1jSNN7nG1Jx/FaYwu3aqqljrHb7gvNyiukhR06RJUMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArrJiSllqpG6aaqApJhhj3H0a+O4F+EvEhg4K2XZ/ZhS4up6i0qNk2MfhDQYU2pfoFN+0BudtUc4bdz2yRVBmbRMH+jrwaoqXpBfHLa8Fv/Y53GQt9qSAqn4r8Aub4Lm4rl/g4GCjr7zISqL/LN2xNY5xRcBdPpQgHFLzUUZUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJrX8zTo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCx2o2016659
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nuP8d2NZYxMa/1aXrVOCmz2l5Nad9HOjeULbPqe/3U4=; b=aJrX8zToOl8EEmTa
	nM0b9iH/mbaTQHR8SxACJAtyXwWiUAY97ZOLdgyEMJYBs2dzszIF1s3f9+fK4Ukj
	jWDJkvTJcS+a4aAztwi4aN0i+7Ohq+QR/EWADwAQI8KwCUYfs/dPLkm/NiXw9sh8
	meIAei/x87/u3rCOMAD1PXJGl0uK6yX1FlvUDUOQG+GFpJWPYDexylvXuKYasDlY
	T0E4/uzrdi2cb6PpJvkw2vXxLhF5kAaId+QWs7KOdzFRcjxXv0hs8NieCG5t0Z5q
	aXtTuQgeb/CFpxQg+jsQ9cfPhJRzSZTVvWiAuBJSS4YPOK3pK3JiMv9eQOue3ONe
	71Syww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhude-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:25:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26985173d8eso4983405ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756301; x=1759361101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuP8d2NZYxMa/1aXrVOCmz2l5Nad9HOjeULbPqe/3U4=;
        b=mZKTfETumUpaIlQUaXjs1fSkSqqRGXpI+H0fqrkK9XzatLSinvYF06QBocubPmsmnM
         nIBMxmoxruPJTHfheXu1/nI15zsMT5npk+NDu194mMgrHeoQk1FLztIuW8VHwQuBgIQt
         dnZfXf7SUWi2TkxoRGzsDkoD4SdIGcvDOeiuhaXk1sXzopuqSRlveMFtA/xdLB1zIGEo
         UiGS86UajSk4yxXmcaaXUupLyf/9PMOqk1fIhR2MS4UxRaqyXPNDy1gieo4trfPZF3Xf
         Kokoy5YtdpSeZgBljLL8YO74eyCBUokR6Js+QeG2S+u9B+BOciLjZ+w5/r4nRQJZa0Mr
         74EA==
X-Gm-Message-State: AOJu0YwU20h0Pcip4QLzgBS7kSYz+EO3wudVmcJ+V+sUIfd9lwDcOwvY
	a+8785m0ULS8NRHtwXcYVKx5t1q31OfhzsVAEQtxWDRuf663Dnx31hxAKGYJ7ca/F4rzdy/Zv7T
	UcLWgCnh7CBUmC1cxk78YiaC9+vxO0K0yWwEYOj2lpITJJjoaPE7teEZKTHfrzbbSVR9B
X-Gm-Gg: ASbGncuqujUY3sESOlW+qmCn55x75pi8+ZdP3+z6YeEMT8j7iM2U6qJQ3Xu5fYwm+Ym
	8LQEkmnToLQUgOZudGo4Z/sgNMBeSD56TMkD1HYWd0vRy3huCpocEiQIGanzN0OFJi+HqZ0ulqD
	++PH3HA87Si6+7JRKi7xc0PbAWGZWxs75nYmuniZdEXKq/eDFcdetU3j/cMcZZI7h5o+jlnu6ak
	o4fL01PSW03krRJ0Smwc00dJMy4Yk6AkIBMzOs3d/Y5jwlHsxjnT4X/OJCUzdAWfNwqWaltM5Dn
	954P3Wu+I8+a8WXKF+7s9FFQq+aYVp6XsNQcQRudzGut8eIOWPGAle9VUyeuBM4M/0YJBbbbYOk
	qdCzbFrKNAVg2ZPM=
X-Received: by 2002:a17:902:f707:b0:267:9e3d:9b6e with SMTP id d9443c01a7336-27ed4a653cbmr12739355ad.51.1758756301542;
        Wed, 24 Sep 2025 16:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKd5YW7RIAyNymwkxq9WJ11sgacuX1IvLBuMSes+opRF6AMzkG9E2A93BBbxb6gc7otKLwag==
X-Received: by 2002:a17:902:f707:b0:267:9e3d:9b6e with SMTP id d9443c01a7336-27ed4a653cbmr12739205ad.51.1758756301157;
        Wed, 24 Sep 2025 16:25:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821ebsm3981745ad.84.2025.09.24.16.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:25:00 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:24:54 -0700
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document the Kaanapali
 LLCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-llcc-v1-1-ae6a016e5138@oss.qualcomm.com>
References: <20250924-knp-llcc-v1-0-ae6a016e5138@oss.qualcomm.com>
In-Reply-To: <20250924-knp-llcc-v1-0-ae6a016e5138@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756298; l=972;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=1jSNN7nG1Jx/FaYwu3aqqljrHb7gvNyiukhR06RJUMY=;
 b=R1wSI/Rc251P5StZYdCEIKzxhN06cYkYBagmtA1sgGuXNAEl0/noeivlX0HJ4uTDWxAG3ft7S
 4h/YzTHSBbvBknpsH+vBY1dWTX4tbNF3W03lFu9DcCOfBBTN+0Jd7Sl
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d47dce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sCV_76e64iQtlowYmxsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: b0Mkw0aehOC6JlfSTRvgOZFL3_a5iEvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX/D5bqvprLLtF
 Md+hEnuGjkH0RMXJte/UHSoF6UM81SvVSR9nlBaOOLD8WvjPjZdi+ONv+aieblI2UBD0MZF9nk5
 D+SQoRg/PUaXsa5tcxsNRm1ZqfYmIdMZheKaRoDxVrZic6XHyOKPvUQCKzjHlSNE0ZMK2tcb88H
 3bpzAy5BAyxS61q29psWINQoPcyJJeUh1xtt2B3ZVzdwpXAmp/i3gLT1oXEddXIWLqVQCUV6lf3
 7Zf2gcahP2+8r/8xABIuwYm9MwgDes3I/s6IiXGneXC8m7jN9RuD4gQi9l9UOVp44H0vip6kkH3
 DLoOO21A130xDMEm6gQPZ0qrRTEqwUvly2QRyFoBtR3albULeJx7mUzjpS2YD1T3v9yUD5t4gp+
 QntnPNgh
X-Proofpoint-ORIG-GUID: b0Mkw0aehOC6JlfSTRvgOZFL3_a5iEvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Document the Last Level Cache Controller on Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 37e3ebd55487..a620a2ff5c56 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5424-llcc
+      - qcom,kaanapali-llcc
       - qcom,qcs615-llcc
       - qcom,qcs8300-llcc
       - qcom,qdu1000-llcc
@@ -272,6 +273,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-llcc
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc

-- 
2.25.1


