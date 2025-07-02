Return-Path: <linux-arm-msm+bounces-63357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F6AF117C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEEA2165206
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E015625522D;
	Wed,  2 Jul 2025 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5ORfg3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D87253F2D
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451470; cv=none; b=SFozThs9lQOxC9FxI0nBh1twWqqVnSUJaVlWn7evPW4VCuP7QXautZVgpigS5eVS08fBnxtPxSu+Ajdm0JT+gxNpVPAogyRO1Atr8WA9wbkY+7wY9N5SZeUZaNqv/pbunghV9dGV21M8mwkTqm6AoB64FWVumk+gqZhOGmZ5ly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451470; c=relaxed/simple;
	bh=J03UIyk3++cZuCipvWPcyyiE30k0tNvp34iP4Z7aGPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4O0udBZdbbA+VUHB2YGf4JEQ/WmTWF2qx4WyJPgSQLTgJK3TGTSbyW/Y1HeBpwZVLCEGpDUSYr3BG0ns2/X9Cno+gi0TxskpRRruKJoYv6hIkP0kWt3sNR3CAzwl7Y5YCc1Ubfrw+Hp5wQAJ79lRV7wZwRO82SVEn+izCQGvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5ORfg3C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562A0xG3020529
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZI9sC05cm/3qX1MoV4H5KL3qK5OGAwku7Dmvoj6xDsg=; b=F5ORfg3CyCOJD9tP
	m+EsBNKM9A4ljp9R8RSmGn2Z4E9qgBJtGyriqrRNg0lHUsVq9uuRvPTliTyUMs8c
	dlwHxOGSbylN9qMboN3J8hrkFqvpy8um1tDU6g2zYTiIBleOnb60S39OFlM0DpcK
	ywmq0Ii6UIV8vfxo+EYO6LCfd43zA5ZtKGan3aK/9RtiDXi1M1pdrX4aBnljl5UR
	c7x/JTdyKWIdR4h6oD7mZlFmSrEYnEDcDERTT/uhOdNNlHKHHtY6OmUzhkOgZz2d
	LyIUH8uY7vZK/P881OUIyJbog/1a9pzUqS5xAurw525VpByHX+MN/uqFlK1zHLyv
	spvkEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2w51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:17:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74913a4f606so3749884b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451467; x=1752056267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI9sC05cm/3qX1MoV4H5KL3qK5OGAwku7Dmvoj6xDsg=;
        b=VLewPDZhd7Rw3p1DR5jvdJrEggN9u8/IafCCWowyQd7rLW4YJBu2xB+ACaMMRzFfCd
         xZ1AFjuDGQ6n6OJ4Zx0/MHhOKdaEh6skPeTWJGPfQkH491aYCNMJ++q9YgCLrSNn4Udw
         Oed/5+rv6HNpIFwnKIXqg6+xv7EmccMg9ZfS2QyahjO6Yk+kZwFw27x40clRg+37HieU
         HGMbiqCM17wcVszklCk9NnlczwSWji9RXxqaRue2yzunqudhWVDjaS6b3BHXx+yO2By4
         VfORi1gPYpqVzXKsmMxkoLV13aV4Vv8J0XlC/nkEGugqDq6rNjNGosN76O9NzJVLfauc
         xl4w==
X-Gm-Message-State: AOJu0Yw0OpqIsjoAvWrHt6fCVBq+AKZ9NlG4MZrWPdsOiQH37uXWr7Gi
	fB4qL3dzeREcqlr2NIy4n9HG+9AgWR1pTl+3hbVpjhmklXznDKg1Vfrv1dXOqhIrkzh3t0XoN96
	t8RHn0ZK+oMEsNAIiAxGzMdVDJWEFV3Ostilta+u9GqVJrb3tRC3BZoJei6+S1rY5wxGX
X-Gm-Gg: ASbGnctkK9G3ANS2YfsIDvXoNSWFXGsBPeGb1Zkz1c+A3J9ARidnVp9N0/b1D6aJLzp
	DEVZgjyvWJwNNCy8LBVJA+Bw0x+uOrKGIkhml4rjQsRx6CVGFTAn1poPEJTJOifvAx+vW2pIHeo
	QXQC1h8S5ed2yDNNx8ODwuAoog/Ws9F9cSy7kMgAFH5mzuF2MMIUW5oYSHi1HMVhhdpM2/xrmMY
	5vg4y4alDFgK5V+ptA2a87W1TSzdClDPAh4fgUCAwHLYaa5FuGc5PTeHr3Up6x7vzFYWplHTNtO
	+A8CCWkqAvs0pfR+bJ70KnJV3TYL8hM6yCt1DZ5oxiwW7HotHe7zE4i4x0oIUqxGmZW9qeFvRCR
	AT1zt/LYxecz8BhpMUgUAq5o4o8RJMgKgsmiRGgR2aEyCuq35ocGj2VGxdw==
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3001849b3a.22.1751451466944;
        Wed, 02 Jul 2025 03:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEowJELbiCa1g27aMvRwnyFZkhJX67qGkXj/+6sgoDLFdi9mlUc8OJntYXysxWDvCkzYUt4+A==
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3001798b3a.22.1751451466524;
        Wed, 02 Jul 2025 03:17:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:46 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:33 +0530
Subject: [PATCH 1/7] dt-bindings: sram: qcom,imem: Document Qualcomm IPQ
 SoC's IMEM compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-1-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1004;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=J03UIyk3++cZuCipvWPcyyiE30k0tNvp34iP4Z7aGPA=;
 b=Vc29Gf3HfisCRIVy+1KVgmb2V83MeMBwc4+kqNklsHihBbbaMNbppKo9HGwaPNNxpDWOoYSAH
 9wc8RYEX7dCCuT9Ezm0G2udLa90G0ubvyS9PiI2V447O6L1knkHpmwE
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfXyVcIXNRfxSr0
 QPI88BFfzvh/y9TbawXOZUUOgXF2f2LQ2k7NuPBr3mDBQ5Hr6q5jkxRuwZy/z9AhXCMDBwOVWKE
 Ec3buifP5N0R3d3gL0PP2TVDXZiARA9Np/TRWld+UOwTSvNlI7ncr/gdEE+B4W9xyUNOR0p/Oeh
 eYLkSFgJ88RWi47v4rK4V3SVABnfdUYlkp3m7r9f4H8I1TECEqMoPFgCDmfHddNXkNIghsICEck
 c1YZvzdH4PPSbRBkANyzdT7ze6kkJ1xToPuyx6u2Dj+nPMBtRWcKUiUwB9GA4tb1JAtbDfMynVQ
 AzA/zZ/s4XmkT2rOYK+JnGKgv+REr7rGPyvasCLDo52280mrBpxtS3gXffPKOVlivCISFaihvr8
 0wYy7j4TfXY8B+xChf34LNmMokOPLZ8ccVxejfV+7yDxjT9qDyp95NIkz0qdAmDFtrn562cT
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865074c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VpYCf0uwatFdRcK0hfIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: RcPuRSVfNkzTFdu8cg8kX_gUfIThcKKE
X-Proofpoint-GUID: RcPuRSVfNkzTFdu8cg8kX_gUfIThcKKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=825 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

IMEM is present in the Qualcomm's IPQ SoCs as well. Document the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,12 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq8074-imem
+          - qcom,ipq6018-imem
+          - qcom,ipq5018-imem
+          - qcom,ipq9574-imem
+          - qcom,ipq5332-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1


