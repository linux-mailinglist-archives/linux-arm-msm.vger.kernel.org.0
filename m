Return-Path: <linux-arm-msm+bounces-65284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD5B0797E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A57E07BB0A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8521B2641F9;
	Wed, 16 Jul 2025 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd3dqEwa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38A2EF9CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679236; cv=none; b=QoGv1DQ8i/G7TJV9YgUXnKRy5us6YasHDjcBZUbOXr4+IJPFVQGc2ZEGXQ5102yUzgR6CfVfVMRj7TQOAX6zcXFMLTApIffYAMmvAPkT6fZAv8tOGPCcBHwcRo/e6XFi1VVJKPWhs0fhaLs5tsPK2TthFqJYSW7IKGce3QD5OGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679236; c=relaxed/simple;
	bh=chDPFM/gKsIkCz2uGNvcZOhIr1MQ7Z5mLou4364bH0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BoICkVvVWBl+cC9IV6qNhxI5QTas1+CjPO7PStFSyXeB86cuIdx2JSRN28VHaEQzucTGruFOTP825d1yVD3BZh7PCpZNh07hpZ7Q2qmLgiT5zw7PjtWyFJCYUdYQj/LAtJnZFJv5mezbUhgyMKNhMgSeweARTKQWQ/zWLHyA5nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dd3dqEwa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GE5j4x026165
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7kAuUkf6gQb
	DezV71kriyxf9UqTXCD2n6sjYNZXCI88=; b=Dd3dqEwalwMaSVaOto17nsBIFoH
	6ebpDriaGWfzFfbkizbWCF2szhaSXCssVvz4e1Wu3A0fxnoVKIexgQQ0bqsS2N9w
	4lxUhw8UOiFpRM9oqNPQIS4HahBudi1UPwTjn52gEzB56FCR6FAirmiAN97IKSnL
	21aIOpBf4SW9uYAwpk65WIale+14rpyTkg7HCohYie7WQkH2Br6w8A9EtL1/m1bX
	DFiIKcOT2I+CoSyw57emozIqUVi8vNrgKhOMn8W6XmyFzMKQ29HE//XI32qQtGJb
	F54UXcoNvSINmemrsiBah+R51igZmYuGkl+79EcR/l+kgzTgczX8u2tLSZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca5pcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74b29ee4f8bso27716b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679232; x=1753284032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kAuUkf6gQbDezV71kriyxf9UqTXCD2n6sjYNZXCI88=;
        b=iiQKzl0DaZWi+WbrIxLwvsKkKWfVYt4WzFDcq3DdWlYN2PGoSoBDVV+Hc+D20v86np
         RgNbbHvu477w6KHt/sPTFP2z1SuQWUQC+wMW3YAt609T6Ko3QeF80THGd1gIQRL3L53D
         Qve3Hi4LJGmkFjvEDqSVgaUZsJHyaWXeRpcQ8wqzBVrMHVqj3uDH3T4qS784GTbO0AvY
         UMAVg7z9DyyoRbtB+24mdSwKpU3w8OrFyqLkLVA4NHL/J7AZs6WgBEGEfvQF1M7jiDIJ
         q3v+IkJMtrHJZl6ePiW8AhjYvvt4lPF4GDRPOm3yYty3GptxgW0vMIEKpH+XsYs3Y13G
         UmWw==
X-Forwarded-Encrypted: i=1; AJvYcCXlyQp9yEKNeHBdjkJxlzN9f8/hQwptHxdUSWZ4aYhn9wUhqmHjW9OkL3rcDUeYvsySv/dfXZXPUhSKhsL4@vger.kernel.org
X-Gm-Message-State: AOJu0YwlRJnd2LkIJfLKc2n1gtKUw7dJ6PeCpHqfAkqKCzL2RUUzri0i
	7MQRT6SmLTp/kjtmUVzQV1dAm2LbYxDrm59dXZ9otQ0+F/WYIjeTvaX28oVPE56Kl7eH6ehVCFs
	RHgRrjleRDy/gJUrQDZTxSejg9UA7GTnS+8Wucrfy+D2A4CYWthDomQ9VXhiWT5lZR3Jf
X-Gm-Gg: ASbGncvazd+VoIdcnY3DBwGaTEcT9+zIF9ix3AWABXhE5Z7vOLZw9G3LGWbP36EpWJG
	41/LSbggXmE7S59jTcWqgZiA/ilmxEu/RWs0Xnf5go3N8xEJbMmIEaw+hFDqdlUoiRd+50P93pM
	8VwG79259v5DvB3DkmCAo1mHpRKqAHsWUtQ4SyHmw24sH+35JcfVxFFkHisnWWvLpXEnGpECwgh
	sqKTWIN/yhJKsqF9Pbp+1I/jeGVG1n69wD9hpUAV2Sez19ZjY1xPFBLQDaopMNCfEzgNyt2+4Jg
	84/EhYx2t3KcIKM0a+clk8umBdIheibufmi9mcjm/iH4t4fQvEcpLKKr+76NrX431ju71umO0X1
	J4rn9d/8BoS2yjD6VKZXOQSybS02OIDCDVz279sei10t04JJKi8c52FAZPTlk
X-Received: by 2002:a05:6a20:2588:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23814269fa7mr6035101637.31.1752679232435;
        Wed, 16 Jul 2025 08:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhWL+P4EBROycejWOKigF482qtWta4UpPGPsaG5+brLj9Rnoju1DZYfQKmw4BL4DfeSQ5H4Q==
X-Received: by 2002:a05:6a20:2588:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23814269fa7mr6035032637.31.1752679231921;
        Wed, 16 Jul 2025 08:20:31 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:31 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
Date: Wed, 16 Jul 2025 20:50:11 +0530
Message-Id: <20250716152017.4070029-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX43jSF9BrENFx
 VckOVCpxtMSksFFS2uBg3Sa0dqL0YSK5y3sUschFuvXdR0NPHPKiAU3TmthDwh8U6xNIAIgSmjA
 0kHURgwqBas4tYFu3MYT/GUmcyUsdsy1eIrTuHoOK378rIPgBSaGByma7lPr19+cBofAyrle+EG
 LCuVYm2Flo37WZBTn5DeR28YEOV8BW9wjEnbYl6nkft4+4x6THyIPBJG9U5ILEhZYGEQEHFCLzT
 L31ooLk/5+T5FUmPQ4j+PMWrj3JI4iFUnCPdgLhIWX/dGLVfG0EuPEhDejtewbtur9EIOt21O1K
 WOVn2YXZ/4Ax32YYhHFX0QPAkYoKTkVT8Gs4vNGRG/LpZE8+6S5mNB060V0+KYyjUQab4OVPQ4+
 D2fJSWfHZ2zIWAqutH5F0v2/iIis52e3/XNj0CaGLW0qBI0X6+9FQx+7wTxe6bCMQB08wwlv
X-Proofpoint-GUID: RWF9W4peuXcUTQDDxAaI6tXi-dx5KLi4
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6877c341 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RYbyPGwfGPyvG-E-d-UA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RWF9W4peuXcUTQDDxAaI6tXi-dx5KLi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add devicetree binding for Glymur SoC RPMHCC

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e..27307e7bcfbc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
-- 
2.34.1


