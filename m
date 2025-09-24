Return-Path: <linux-arm-msm+bounces-74758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50351B9C9EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E51431B246CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456132C0F97;
	Wed, 24 Sep 2025 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF5Jd/xX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AA287269
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756920; cv=none; b=pq6b3NX/+Bn2p4wSiJvzZsf3LkAYzpE3ls8xQ3mEIv0cTonbSXHHY1GPRwVYjDNRjQwYHwJ5142FeRwA8m0QdUVq7aVXt1TWZerK7gODs0KQvZ//xF57bqhxa5JWk1Jx1YQFn1Txl6siXRgUMmLBuH0jB+PKlLy6Andu3l0HXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756920; c=relaxed/simple;
	bh=1bXx4X8K3luI0CC7vMBOPOroIotF0KmdCwUlUnOIjlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trfEgummMTR7hbiY1hAy2WokRy5rn4/Hs5LymcibBJ6Rv+bFv6vv5y1GYsOhxsD8snihb/dyBJMg/wYhxJn7eHtvWTsDlSAKho2/hpRsE5tR42+k09O9cLd5SBK6SsV3Wmkcg/ZXROj/JwMkUXbm++3ZoOy71ZdBjGcp640kUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF5Jd/xX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCcTUQ027779
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsRs8ls5zJtoYnaDklfCGZl0u7nCPvApwl5lvQLG0Yw=; b=ZF5Jd/xX/VX0t8CS
	2PWhZuR/oVUw3EI2nBhXUvDrxzJaDI61R6w5++96N0pk8hpuy/lT+HHB2WAa1cKx
	ScXsbitD5SsGqcHNfKnd7/Hpr/ydo3GUcOLWoZQTHhQTefJcjxzxffDs0fEgHxBO
	4rmDbOJd6jEnsLRf3r9ZXn674S2sUQqeNYB2efXT818iEj29/sFG+fil20dD7skL
	8C9HTnFsoLWhybuM3PVSlIdkTvqdgYKyyoY5PEmySTS37oyBL8O7Gp74MVHqVnMc
	V9WlBQ+QRfro1du33zmH0yi4dDfUuwu5DjNNYOEAqEXB1DfqZ4vyAs8lDuW/H0Sd
	n68w7w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxd47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55443b4114so221155a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756912; x=1759361712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsRs8ls5zJtoYnaDklfCGZl0u7nCPvApwl5lvQLG0Yw=;
        b=KDDsfV5VbMo42PZ5/dEIZJoC0qfZJvarIieY2tZYReXlDmbfOOxMh6ARxeFRJjF+QE
         mff9bH6MP6qtXXDbW0DqKcKus2NVQ6gbydF5YRrX/MiN9/8lAUZmxDbqu9MNUVxvaa7U
         gTM6HepamH5MZ6atrtx/jt9eR4EUDAJABriQEI9p7IRsSclamzhxhseDHCowdqs19KXY
         ngNJPr5v921jppo8z3dxtFW+vECTXwOSdvizGI0BJEEhBbnKjvnja51/FJnaOsOh0J+M
         VAGXZVfg3Nfxu1Rl0KZ2SzDNK+HQeFmNtKxefZsLtK68QvqEBeRIQ/3dXS/0rJRMwYGQ
         sdgQ==
X-Gm-Message-State: AOJu0YwaJyH2z60gi1liYG8FEtCN+z44Y1dD3cMU2bsVk0vtDcrTQEID
	SlxWkwfWPa0JBrpOeRLhpdI/2nVaM0k6kZrqN58Gx9at6K52g8KkHPVOANJHt5gSxgz7aHMOYIX
	/tUQgI3NFkwY56G55VKOsAXCtWZVeRS728EBdswH8UqwxaG2ntcRcTDPyDi5aSzTT06hI
X-Gm-Gg: ASbGncs9x7Af0gxzKKHUlwwDIZDPS/77h3/DA1GpQ/6fkYky/nfpwGsi5kTdp3ug8BL
	Q/7XNvZlvAXkfmGsfvCuo4vKSwEEm5X8FVBBBVJyHV45zFOmP0vzrkeeSnZ/i0rf+2qC5kIkyuk
	ofYK6gowQultwboRJJiU+xjArrUZshvlWnvBTaS0MGR91/I0TW633g/sOYOowhzXF/wkCWGox7h
	HZvYbWkOgdmNFOk5ofPRDm9VEmU85j7D0DTbuLOhdlKpEmpD5jdyBYFHNMvF5sjkBymgwoGMJCa
	HjFbDGOfXUqUQD9Gn1HAk2UefCWiiTsBnyAafQ6YB2NjRpg0vdIRld/+NUpiuDrSSDYqP78CoWR
	27EAP9zHWpcVE9dk=
X-Received: by 2002:a05:6a20:549d:b0:2df:37cb:6b6e with SMTP id adf61e73a8af0-2e7c131dc55mr1576804637.21.1758756912066;
        Wed, 24 Sep 2025 16:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGpAEuz61cvT2XhW4ukIQOiLZa0lY4y1zPa4PxH5HTxcEkQBKtmoEjAu6kkyiQl93f/pSVRg==
X-Received: by 2002:a05:6a20:549d:b0:2df:37cb:6b6e with SMTP id adf61e73a8af0-2e7c131dc55mr1576776637.21.1758756911641;
        Wed, 24 Sep 2025 16:35:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:56 -0700
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-3-48bf9fbcc546@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=1499;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=dp2q1UnWq2Lp4eoHzNa7ZpgQgVJ3NSAs/37jv9/dDmU=;
 b=ZSbenoW+opMmdOZe+iejbQ9oTpdwsntbX+yvALQI42r6ic0SoOqHbqvzWDNjnLh57Jf+Ltcp0
 S9QFXqsfwFzDnFaokXqdCkDODuQH0rbhL0P7RXaNQxN/BdSnF4F9IlA
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d48034 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=c8SvkZ6Bq0hLoSk93noA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: GpeaODCWlUXFoVMjJyJ5f1XnCYVpat4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX3idVnk9xoEe5
 xfLC/YUUHtGdBfYf1IGebojCcwu8pXiJhWJrJrLESuu9NAk2OMbHc76UQIG330udmCxsk/RLn/w
 DaNMayS4KP4EP7hhRdkB2+BDOSNJ+1fLAGYrVtyTaMyYFcnPv/K7uHKNRwL0Bzo8yWBChMiSLQk
 MaHM456ikmXRYAS0YxlNE1hkGKDFh/erYV8QslPt6t849rEy1Q04iucdBwlZwxBb6Sicc5ck3Cy
 hrHtaPzXoMZsZwHeK0QGJdTP+DXEIYsanfadMievXcWgfUgN2sMmbIfY20oe6BMUucvH2ohyH3g
 0bIDU7h5RjjtFIaKKBkf9KTPvefB1NEPUVdN/1kAd/UfTHsgE+yRMiC10AWKgvf7zbKxIUqXQjx
 z/u68Xca
X-Proofpoint-GUID: GpeaODCWlUXFoVMjJyJ5f1XnCYVpat4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Kaanapali uses a single-node USB controller architecture with the Synopsys
DWC3 controller. Add this to the compatibles list to utilize the DWC3 QCOM
and DWC3 core framework.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..88124149142d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,kaanapali-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -199,6 +200,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -476,6 +478,7 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3

-- 
2.25.1


