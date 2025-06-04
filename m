Return-Path: <linux-arm-msm+bounces-60241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C57ACDF69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E188162BBA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5101128ECF3;
	Wed,  4 Jun 2025 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuTOCbF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5191C5D62
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044434; cv=none; b=BCbxd1sCnG7jqxMjAL80GzW4qHVjeJFqfyRhP8adkofxF1Qkj6gzXanN80xuep3dMfn3y9btRG+UWQqbG1UlGi+Gw1LOWYWgiS9Pg6EqWhS31Y+kQScR2hwsOa8n/lg8k281KqqeUo3BjmlHVr97TxIFaAIJ/qCzv7lLm4d8lDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044434; c=relaxed/simple;
	bh=Qjb7+tpwfSVqwbR+01+vMBlCKspqono/piLqhjhXs30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P3S3XyVvQE2t+eE9IxIFkwX79IxETJjhWClhuvR/cK7qjs2jgq0WSJk5bwFTtdGu5cCys9BoGo5oBCtGVEcOitRr/BWk8CB62Jfw4QedzVnd2C39GkalW5NZt10e5+H8IlCgQ2DOkUiqx4xXGyvDQVIpb5o4QJE9IQKEe5MBQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuTOCbF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547t26o032469
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YxxLPwj1UiNyXkoEDKvafX
	Ll3rBkfGqCX7S59SAmyQQ=; b=MuTOCbF9DUju3iBBezNEdfXWhVDkNyVvjtIIi8
	7jYvQNp4W033lsZMdSoTZOR5uw7WwC2BZBaApswYPT8Aik+i6PtDDnMMV+YsVdEa
	GJyZs5khuWGu+whU0nMgs3pkmIylQ6o+uBJWBYbDEzB8s1hS1C06P/qa0ugc2/BX
	9Vi1O+cP1RBwaqdK8ZWvnB6marBObsK4/JqzylhSDAZQYBxRsvha2gRuKNcfFFM6
	4O6ejiTDzR5WDPbpHAdbgioN2pSDEmDTzFiHQ1TT24FL/708K4F+KLsyzzyEsT0W
	y0mk+mktIfZx98DWl8/NTBH5eBeiNd5tPhX5zxF/c9cU0ZVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuw1y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:40:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caef20a527so1742220085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044430; x=1749649230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxxLPwj1UiNyXkoEDKvafXLl3rBkfGqCX7S59SAmyQQ=;
        b=OnuPEfTwdnMjEfUqfiMbLfA3Xw4sORVL673ALC87nZXT/HnMKI4UWL4VHheNujNxjm
         MLx/x3VSBZHxQCvoLFEOSHjXMxofCJcJOuHXnkwYO+19kodKcvC8h14jOCTXZJyMLvzN
         bfn56LpwHXMt2UMmZwz96ZDFWFUQdNepruMTntZ6B6V++GoUrDbkBoPS5Y6bLqaHsg+L
         OL7bUJ5M8JQ3N4Wi/PZ0SYrjXrgWvjFiqPs0T6eRXcgnLGPeuXFojKQbCMuSRJHiguCr
         yaJUfCG/iFB9bRlP9P+615r8KzZybI3NrH36QOarXUINZ+IiBxfeNhNGT2YKtYVnXEkx
         xq4g==
X-Gm-Message-State: AOJu0YxGw42c6P6brBTNdExE4fbRYAGisld/QZzosRFZcH26R/9Np+C6
	Q4cx6OIhpA4XdfFmE2yHRbcq9gvfz+SG6nBvy0dHZSQOjZj9OXHrbxK8SCH1l/TZag+ro+IvXzW
	Btgncap+b5VRcdzJ45rc6G7bKicgvf/mPf9d6vc9fzct8/xRS6xpf1R4s3Os23/BODISoJCO45I
	jsPTo=
X-Gm-Gg: ASbGnctff+vbMrIX7uwJ2HgoH4Q3139mieP6fpMw9Oy59LmX5HYoNF9ywo3ZrjuUnOx
	7scz4XNEyPO8P9RTVLo5lPk9OFNUFc8uhCX0Jtucfrl8BHiGgGbsednPl521pWYFNBZi98IiUGa
	DSHdEjrKRE3VO6SJpg5Xhkm2wAPdN+MabyMJ2lf5XHuVAbB/qfKJCvTqvNSWa1xm3W4E6sRPDHT
	ZVcHuvWh2QdRaSCjkb23eLv5su0/ASXFamn1xGkl/xERkz8kpwegu882nbyrlGBrLX8B9TdQlS3
	WtLONrKYvLvx6AElDDkbslKOKymqdpfCEhP2rfK5R68HwISlnx0ZJ5mzOx0r1P2BiHRs0hXnaci
	irIqn+cOrW61v3xoGfyMvaWslgzN1lzS0A24=
X-Received: by 2002:a05:620a:480e:b0:7c7:b5e9:6428 with SMTP id af79cd13be357-7d219892888mr467187485a.22.1749044430654;
        Wed, 04 Jun 2025 06:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgJ/37/ZNeU7HPTqk6ukQbtmVMJRA9O3OkbH6dEHt1cdzVkbB5M/nPhHoPPto2ePyW7sAyKA==
X-Received: by 2002:a05:620a:480e:b0:7c7:b5e9:6428 with SMTP id af79cd13be357-7d219892888mr467184685a.22.1749044430334;
        Wed, 04 Jun 2025 06:40:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d376sm2311966e87.28.2025.06.04.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: arm: qcom: document relationship between
 SM6150 and QCS615
Date: Wed, 04 Jun 2025 16:40:27 +0300
Message-Id: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtMQGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwMT3cLkYjNDU93iXCBpoGtpbmhoYmlsbm5inqQE1FNQlJqWWQE2Lzq
 2thYAtNmsw18AAAA=
X-Change-ID: 20250604-qcs615-sm6150-97114937747b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=830;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qjb7+tpwfSVqwbR+01+vMBlCKspqono/piLqhjhXs30=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4aDz5lZq3037umzPt7EZeNR3TlRWZz9iHRS18QdXPNOa
 4n4K8l1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAix6w4GPp93krYPSoSvb5s
 0i+P6W2dWtffPXFkblbW53JofMnzYV+Gfe9vsQlikSybv3bZb+Jn38zU6dm0Qp5teoMox5QkR5G
 zs6VvNc9nS13B4fE/5laX7E2zgqP+chLGsptXJgSffsUgHcuYxNX1PHT5tE+FLMGnK3KiYtO39b
 bvYSuyO68RXjRfMLhLhs8iRnfhn1vmtS7dvg9t0nfdeX67yKGE+4Rct9ijLUe/rTrtc1ho14lra
 ctu2h9Yvevnirvex2dbGul0NmVemHZlVT/34dUpmtJz/zYyZXq8cFvcyKvrzipSdctmOXPlxE/7
 lCf87FVZLcOxb+WM9Ve61tg+XrRX5eHz3sn7q9S0Oe1kAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68404ccf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Kp08XIzUypDThVJKgkcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RvH3NRYqbiKNTz3F1W7R1Q3mPkI90MJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwNCBTYWx0ZWRfX6bnd89d5KIel
 U9L8/bXVGEnMa+XDYcQsnckN5cRxpM+fyzzsTxBk2VNyTiSoCBPwYTFZ44Ij1mOOd5FCjSq6Hzm
 jRl6oy9c3aCAEpp0bY+qesZLIMbJRiSIMKSOFN0mt8zT/Yxfq8+SMAg4cRNf/EkYfwDLWpe8td6
 xqgKmpa3fNK2eG+41iPftbsd4U/5A9k5e5gQlqZ0ye7JdrDnN2d2PNmlf8HetSW5SGY3+6l7DxB
 ry/uFrt0S1tEOZp1DYYSSInJuh9MISCl+inPieOF2f8KmxS0MIdFCPjtsmIoE/D7fCcsrRers9H
 QsrkoNiY0gdc4mdRK0hC3j8r1TN6Tn3uU34wheNBzBmNOilcu5e0Z2/arGLvvcupvtUzaKdf+uZ
 YnlmlnNK+2mLpuH8iUfZo/hGExdA57T7+gLLXLo+VR5M29NRccKT49ve4MLXRFpYEnJZ16ZB
X-Proofpoint-GUID: RvH3NRYqbiKNTz3F1W7R1Q3mPkI90MJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=709 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040104

QCS615 SoC is based on the earlier mobile chip SM6150. Add corresponding
compatible string to follow established practice for IoT chips. Rename
dtsi file accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: arm: qcom: add qcom,sm6150 fallback compatible to QCS615
      arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi

 Documentation/devicetree/bindings/arm/qcom.yaml       | 2 ++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/{qcs615.dtsi => sm6150.dtsi} | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250604-qcs615-sm6150-97114937747b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


