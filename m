Return-Path: <linux-arm-msm+bounces-70805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBA1B353BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F987176AE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 06:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE64A2F549D;
	Tue, 26 Aug 2025 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYl0MsJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6782F49FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756188193; cv=none; b=je4M0ngj2UFXLkSb6ZYA53AJu0JTCLaB5NRGSpVLmI9jUSRAkJ+cexFxC++78B2LTo7KN18l2kYrNEjLrpFHLnlVSqQc/dHg7ETmlepGzV4zTszF2mGlmd79Ll2UsXgckqwKPvJXw32SOyHLx2lyn0zw+bD1y0X+u7JkKa+SYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756188193; c=relaxed/simple;
	bh=Z59JyNXY1bhJzhN5VigUElth0S2Utp0rRQ8o37kZbzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzJXsV8XRt5pNkFoCcyg83L5vTbU84AbZVCqC7u0ZFCg6474QB6kJPdjD5/ly+wUrk41i4rUqfYXqmsZpr7sdiS+TSAMTbOL8ljxa6AOF8U97ye5EFMzmf3B7OyyZbhD+2xS9ijA2mDEtvUr+BAWoLM0Q9sdbHiy93dxBpwSUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYl0MsJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q0V6JQ026003
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3aPHP/ZvWkk9g17nfgyfPgB0CX4dTinxdGvwP60Nou0=; b=iYl0MsJp27Kknz6t
	hyobAzDkq4KAVMfkfhD6iCLryJM6MjakS+co+iGgfu2hDjeIaEYmV//fwJSdDrzf
	zXzk5xpCyY5EI+rP3tDAFnT3et3vPPcvJzGGyUcED5qZ7lXuzqly3afDn4yVgaIe
	Pddld/uzSAjJNPaRhTuldP1Fq0I+799qPElFbmS1H5VpIpJDXhhz+ifqLDzsQZW0
	c+5dHOce8IlzY0/xvGdWGG+s6lRkzzFLC2FYU9eWPp+dYBeMJ3dTKD9M3EEebJzU
	YikDY0Xjz3bDX6efPskkPeDBryyND3cLkPV8MLl4u4fAJV1cD8IGWP6a5U/veBN5
	NEScwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48s2eugref-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-246f49067bdso15440725ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 23:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756188189; x=1756792989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aPHP/ZvWkk9g17nfgyfPgB0CX4dTinxdGvwP60Nou0=;
        b=ozmczS/iwNh8RRrseOChp7Kjk1ydRLcJvq4/a0HvSO4Y0K1lckd0c0+oZvgyxOj92F
         +Z+yYphtNSgO08pedXEW7KNxir+kXgOQpRUZqZVYOco+Hq58OE0754oFhCTvPYMPQDjM
         fXMryBXf50EPJZuyW8RJmLKm2PAE5il7ohRktBzmvn+GDIo/cZlCHErj0qhw8TMiH3j3
         8Oza66oiT7QMH5jEh0A3tLwH1g5eoMsJX1S47mCSthXrX7FRrhHJVg+FoG4oIZBrT7bQ
         3MmvB13nK7Z/LAy0EryNQ6CfOXn2l7gGnA3uVDFfOuLKwBcwcoPAJIotm8aBMhrko+aU
         Vg9w==
X-Gm-Message-State: AOJu0YylFsbtxUC3hYZp5dvgn276ZptEgMQrLoi/mnc2x0Su3uebTBNo
	/aeAtxSRDKOy9k+kR+vbzqqdtGyvVecHElYDMGGcWhBXf/rgTm51NVYFwWJq+FI9n5S1mD39zzB
	pVlY8pXKASDmpqcV0ZeHGJTi0sGllWMYFOq4Zc/IAOhBVRUhsD6yjAbV3VK65o707Tt0l
X-Gm-Gg: ASbGncvQrHE03AQ7sCXUZVCexruKIJppDtPfLvyksKcmi08mIOHtsme8O4VPgnMNE74
	heZKs3hqR8cXGtbWyYWkY/EXcX0rAKWs93q94rS7saUYY8pGSbI44dZLz4MWiEtD0cArYZ9U1mv
	RB5zSajLPccomNNjTG+fRv+3gRA23AzNtGu09rL6ladDAEdFgbbpRYiblbDlRYml3JlD1o5yPmd
	MWI6EjRkGZxisdc+9pnnDL5m7AYwYf39ss3DEQ407i82GIvXrYlrreHfFSAY4xjpEeiXXD7r46l
	JdIxo8bupyw9PZ/F5LwXKJNH2CjFFIkHc6B1sCurbK0BqlOGJZhxgBaedjNdWaT7k0XEQ46eGbl
	58GVnS3dS3MXoJ0k=
X-Received: by 2002:a17:902:ce01:b0:234:914b:3841 with SMTP id d9443c01a7336-2462ef036c1mr206242245ad.39.1756188189268;
        Mon, 25 Aug 2025 23:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPv084Dt4hnW5Zi6YWCsq9muv/c3TBUeRCKcrebtzv4eUqKfQpl97L7mhcppIGA72kG1DfDw==
X-Received: by 2002:a17:902:ce01:b0:234:914b:3841 with SMTP id d9443c01a7336-2462ef036c1mr206241815ad.39.1756188188802;
        Mon, 25 Aug 2025 23:03:08 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668864431sm84989705ad.93.2025.08.25.23.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 23:03:08 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:01:48 -0700
Subject: [PATCH v3 2/4] dt-bindings: PCI: qcom: Document the Glymur PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur_pcie5-v3-2-5c1d1730c16f@oss.qualcomm.com>
References: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
In-Reply-To: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756188184; l=1219;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=NNqB0T3SwC/nQPPpaZYNgmY4nF2H4V0Dr0y62les5Jc=;
 b=ZDarMZfCReeORTZs5PxdEl4S2aPFqVIxv2EnYj6iaL/AYqteR1RV6Dx6wxWy0mBpmOZZXxiff
 hcewqh4Nz6CC5EfKXz0o2ljqB7nquJPGkQqdIBMLCPirIG861GtVj+H
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-ORIG-GUID: HpCAY_pSKno28VLBgCUWsmSg95u3gKJL
X-Proofpoint-GUID: HpCAY_pSKno28VLBgCUWsmSg95u3gKJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAwMSBTYWx0ZWRfX7Na0iZc3Ugu3
 5w6hcb5WsGO5DW8E73ELW1NBnc/69mSsGSBgj8ja01JuXdaLShZJFhYd+6dUiu6fSeF6DF/hYvT
 IPIk6gPyHUE9NxCwD+TH0expq2Wa/A0IK+QTuQgMISapx0gGbLEhjFOoDlVkhrS5dDHtoKnwSCe
 0njySlEzt8nPwO9Wr4KT5AVNrj1G9SIegM1x2seIeeVZslmjWOHkCoaC1hoeUI5SlMowOPqVD22
 j5kGIYsThiF5/wIFO0TNcUZzdjkkYuHonwCXdZ5e9AFn7+qDSXTyuFNnDeJNy8jraKZkqsJnNs6
 GkO0b9h6cVBc6WKn8id+8i3lQBVBSuD/z/48FatfrdPLXQ3FBTZAdnUfCz1Y1yDnilePT4RZsqn
 Apl3AjqE
X-Authority-Analysis: v=2.4 cv=PJUP+eqC c=1 sm=1 tr=0 ts=68ad4e1e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=WgZgizuZlwTqGGW0kXsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260001

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

On the Qualcomm Glymur platform the PCIe host is compatible with the DWC
controller present on the X1E80100 platform. So document the PCIe
controllers found on Glymur and use the X1E80100 compatible string as a
fallback in the schema.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
index 257068a1826492a7071600d03ca0c99babb75bd9..8600f2c74cb81bcb924fa2035d992c3bd147db31 100644
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


