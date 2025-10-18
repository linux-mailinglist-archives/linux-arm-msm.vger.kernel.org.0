Return-Path: <linux-arm-msm+bounces-77852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB8BEC3B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 03:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15AEA425F35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 01:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B3420487E;
	Sat, 18 Oct 2025 01:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsMNkZE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E41F3B9E
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760751231; cv=none; b=h55T2Ldo5cAnf4Kr5R6l30OcSxzrsd0qM+37Gr2UqrHKv8E2aKeRBL/hRXSuJYN8uyKzQJLOsRfp0D1BS0cF1GUk8sNcH7jFd/vUGcBwuZMKye2Dguhpxb+vr9CCu2vHzO2OTPcknGmYIZodM3Akc9Wq5ROj0U8rx7/CD2Q986w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760751231; c=relaxed/simple;
	bh=JjTidZQB/64meRBY72wsiS5dDWqoy5vboHdQPrUMssk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDbn8d7mKY3ieTTnXxnYZi7QMLAzdCJUV3wPPP8ZJpimzJ5sTYe+Yjj4wQUt93Ckw1jX6fC9ZdLUaB9I8hc3bp6/jXc+pWbRJl0hzS/s6VyrU9ZQeUYW7OsCTA04UeHvvA+7SosNz+3lRzsa+uQowoeV2vCbxL1WIyYRwLAqoU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsMNkZE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJGO36007004
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yL7Iw1H1yxY1RKY9O3NOo5NRWkBTocM3EwLCw3QQ0Xg=; b=jsMNkZE1AyDKc34D
	7f9nENu6iufATV1LGrWEQhTnNa9FIDfrd9wDwnGUJsG6qP2DSVv3gz9kGpm9udkn
	tzNTO1UaW2P9JjTJTkvsbZsVUkZyo+YiCcoXjenXcCqdgYhsFonSQImAsKqhN596
	NQlJrMqTplXEFbjM5ga+Z9K2wYeyQw1N1LJ/sW2B6CFiaPcIuVGAeRj3SqSt0t4u
	rsMzxDWlH0YPh+BM1DCi91T0QirrlqAULlEHNIWKmiP7kZEjym1+2YQmBNAZ8yOd
	+1T+JlwHxu7kqViaFTrfihKfUqzyG2aveaY1ri7kdlzpCTwVRw74fKtdPi8Le/M2
	WI37Vw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff1649w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-272b7bdf41fso32843105ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760751227; x=1761356027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yL7Iw1H1yxY1RKY9O3NOo5NRWkBTocM3EwLCw3QQ0Xg=;
        b=u75dIHvqrxLW/M8waaHVm1NYyDW0dJcg9F8nAEhf1t3Bd1S8lddbh619L9C/oIjoil
         3WkNDS/hHB7XyhY4yTlPOEyxJAJfgul4qdFlg3xbALqVijZcI/GyT73qvpJVEaHWcZ3C
         NVARTYt7Boe8AxgXEoaaJwokXzGG1dd9p7yVcONHYp6RreZkSGfEwAJUil0Vt/oBDJ9d
         2cTmCbFAM5cb9KY4ynek6Mm8g3m5JuLqqtHzzN4KPG6VjuilKpheV4lSx/kM9dFOTpC2
         V4Qm4kEomZ9AHpypZuM8Z9AOviLdJau7IZAvnPlWDpfwhvY2ZNhP6b18mbU3y4ieYBFQ
         tQDA==
X-Gm-Message-State: AOJu0YyW8v6CigYFP4TExKs6CyQCJIguOoJ6i/klLTwm/m8yVKufiCdu
	hEJVWP0+b/g89ScV0bISEwid3JaCJhLFKjIisgVHRx+139NOCdvi+/rxsTln+5tR/HxVByShsTi
	TqIow+Tt8AvyYEteSSjZSrFoqV/vdfu57a1TqYIlPPSt+Fe/igzxD04iZ7vVWBjbi5jbW
X-Gm-Gg: ASbGncsiEtOAU/y/Fk3oM9nucM4fXTs5F406ngFnhkZH+fPwmysIVD7cj84V+xykPCn
	fk2FTd6w1BEweKZAHoaxWBBygqL/LzVSfKuqrL/8HiiJzTFSad4TGdYJOuy7MS9sJFuYKnlEMwv
	jKjNkRSG+c3684gp7BMh5n8u0MIjizEnORS8qzN+uCEYqANpGFHgygvgohdeGkraI+4yinaCnNG
	gPMsHmPi2kIbsXdlqjayW4RbqqnYKe6KCEqzxCwueB90trX6rvuVH/pUGGUgR9aDM/cl52fVh9z
	1ya0uRmUGi02B7Gipjy+jCylkjcoPrYV1bp/zZ23lzoontzRNqevzzoVQdMkbkRWKo2E83Do324
	xUdgh8SQjXW9+M1hWYfa0NEx/zfNLJx/t/7qFZugAg7piEA==
X-Received: by 2002:a17:902:f78b:b0:290:ab61:6a4f with SMTP id d9443c01a7336-290c9cb367fmr58341815ad.15.1760751227378;
        Fri, 17 Oct 2025 18:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9hDmHjEaPzyblYMvIXbWGcSrq2rVVNWtCtuBRPfBhjjoQkGpW+JgacHko1My72hwjOFIDGg==
X-Received: by 2002:a17:902:f78b:b0:290:ab61:6a4f with SMTP id d9443c01a7336-290c9cb367fmr58341445ad.15.1760751226941;
        Fri, 17 Oct 2025 18:33:46 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5ddf16bcsm791695a91.4.2025.10.17.18.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 18:33:46 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 18:33:40 -0700
Subject: [PATCH v5 3/6] dt-bindings: PCI: qcom: Document the Glymur PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-glymur_pcie-v5-3-82d0c4bd402b@oss.qualcomm.com>
References: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
In-Reply-To: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760751221; l=1272;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HOWusfNTWzHipvZF7Qt0wgwXwhNMDSpIrgzW11n9LBY=;
 b=8pimNyDGXNzEl9GUpN7Z7wb3o2a3g+9Fung2WFtYQIGnL7Kk5LNNsPZGGf4IeLUil+4UCHuX9
 65P3erQLPnkAJHXTPIo3PfSQ08IYzKF9rHQm7V7C/JPhAyowoiw8Kki
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXymCEVBCVFjC4
 rVgPmYfwuArUeezFR4zl3X6r/C9H0AD8Kg3dTXU23FodW1LkF+qtEQMPLUKEx4mW0VoHegwPE7n
 zBczXSp2qp3NaDt1V2FhUAbLC6MUEjRk0i/sltnTlnR22N1gDG8MxASMb9SEBFUmaiKX6E2HtRg
 8shK9f0C3S6niGEwuppZAfZ0yROipCNX5Ouz1N+STcQMtBrCbnlKfafVMAEpAgc0QFZ0DxtsSTY
 Yw1bx5YuZH06B8pinAJsbY0YGjolT/w/Ehcpdgly3CafWeOGuIrwcMtvFGCEfG6c0awvWgc3jqM
 OYZwoq4RsfK+QhtxPvHUtu2oBNzkHwv4ePVzJwwJA==
X-Proofpoint-GUID: hAggNUmUzJD0EIeD2tEkbn4AujITuLcY
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f2ee7d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eBPcRD9z0Nary0_f1DAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hAggNUmUzJD0EIeD2tEkbn4AujITuLcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

On the Qualcomm Glymur platform the PCIe host is compatible with the DWC
controller present on the X1E80100 platform. So document the PCIe
controllers found on Glymur and use the X1E80100 compatible string as a
fallback in the schema.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
index 61581ffbfb2481959344490e54daea001aaa4ca3..59be6c66b39b5e78418194ea4d8686956303c8f1 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
@@ -16,7 +16,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pcie-x1e80100
+    oneOf:
+      - const: qcom,pcie-x1e80100
+      - items:
+          - enum:
+              - qcom,glymur-pcie
+          - const: qcom,pcie-x1e80100
 
   reg:
     minItems: 6

-- 
2.34.1


