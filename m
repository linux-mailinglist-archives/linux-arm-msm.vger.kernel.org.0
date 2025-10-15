Return-Path: <linux-arm-msm+bounces-77356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1BDBDDFC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2420419C2627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5880931D726;
	Wed, 15 Oct 2025 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiiM9jbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3296331D36D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524071; cv=none; b=XSBqWBnFw3+gb+h3FOqeezLL/DYTFfFlgj5Zp0x1JIZ+n0XPG86BlI+0x/rtCPc4flcHd2CSg+7W/BbcZWrLyvpBy7JaSWXK2RPEWQ7VS0Na8fmSceQMSWD9j17seTHEL7080VpMaxLhvZsVKiBRbOuoYFgmgbR6196RH9l0pUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524071; c=relaxed/simple;
	bh=VPVFV+qu0aJDwF/BGABycXVuxxH/BpzJrdbWSDyC0FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNXBcEB5QgVX80IePylslaLKYRdV4qS9P2P8gd/OjZUgokPHtzAQPQxP2PZwSJmj49k87qTBb1kJWyMrvvLAksGbnkek9zQi36mP/lM7cxSK0Dk0eFbmIljuE0H372fm0q/8qW7mj7mt4d8BtfrhfQVLZqY/qNNY4aNWw6kZF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiiM9jbA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FARHQ7005331
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzlpRyA3eGYUHs3zByL6o8kdScATL/4OhlJTdAgnfN0=; b=PiiM9jbA9KBX2e1z
	pQjb5fyBUQm7mFH2ofRTViRGCvHOln4y6S0ZP5LvF4fGfR7RNgjCH8KAGRP/xLAb
	IauAvx4Bl8PPwTUSBQ66igrFNFDD9t0/ebzt2H9rHXduYcGxCNEcvyVcmm9mvETZ
	awssP2WVKoVPW4RVk1xUggVRgjsm63/TcbACBaSPJgELzwQzASRBksbxspAjtZkh
	g9QXyNCECfGEW32iqcq4fUjOyIqhnEdjIwm2Ml9vBym3OThUjB+5YlgXqK762NlI
	KQJ58pScXOI37AESBNd217/TV7gqyj0WXyQV87eyOWZ368FZB719hKimMn/EuGnd
	a0Ud5w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1agbrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33274f8ff7cso14544239a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524068; x=1761128868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzlpRyA3eGYUHs3zByL6o8kdScATL/4OhlJTdAgnfN0=;
        b=oWK3rBTHQCRyn+fDsA0EN7BHX0HHined/w0jHDujBu9bM7eGtrtGx/jD9XWAjUUOND
         +Zf8I7H6mTUPMJBjNryzoD6+cP/gxRqYWmzBKQry1NE2Cx0ZXq3kr7nWcwiSAxYHNhFI
         Ahvh9l/BRPASAsCkP0we3CIkU/ymS5EhnYLW9Mhn2owSIUOryPk/7CG5Abhc6kO9zLs+
         2Com6K9Ho1qlNTTj4WRP/qHosztT3arhB0SeaEaZ6jMQo993b9xqeCyT/WZMun7ZJmj4
         shOJM6pWOOBIgTLq9ybVOjXIBD0esakLEh600h5fUfNdgYoqZ3J2Qmb7/QigA+wvlIfv
         4pQQ==
X-Gm-Message-State: AOJu0YzMo0MIqsK+Oomh2j3HhH2cRsGrLmyxkw5tCara8Vgt1QIvhnoA
	O6qOLrVGk67kEkSWtGAeihPJev/aInqPXRP7Zg+3nZP29XnjUCfk8tG4dZwL2f1xVk+cGL+EqLP
	TeNfBRVsV1Zdlgv3aMTSG6r608gSNxLOnfCN/P8X804CSbRzO8dNBk24OHFxBg1IEKm9O
X-Gm-Gg: ASbGncuMaw5wOHxJbVtotYoAJMAvbgJwZXgmboNHNhvxMdMkt5/2riseVM+V1y+NVId
	JCY3WtLdUl7ZxMn03n/2BqgFoQ+l6NTMTRxEJEARmeHF0MfUot/Bbcg939+EVcRtIJcD9TPlUHe
	AWKnPVu3QYbzaSHyM+LNta7hGMybbf9gBCwHkQqNLQ/anLcA44mEGTvWnfIIgaFbu2Rbps3X/KD
	fy1raUp0hd793SWF/rJT3NTWx7CvKEKgwilhv6lEB8BdnWU0a1X2LS5AY2EWhvV3A0N7Qc66BA7
	176Zs+tHs6Lr8nq/x8SyiiN9krnbUXWM74jLST7eCPrd2m1d0jmHJMJnBQCjY6Rh5f8BbqdCa/w
	Mii4EIN+wAzE=
X-Received: by 2002:a17:90b:388e:b0:33b:6c1f:4d25 with SMTP id 98e67ed59e1d1-33b6c1f5256mr22073726a91.16.1760524067590;
        Wed, 15 Oct 2025 03:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+D1rBOUBrT97sPb6p/Z4zWKTgshtRDcFAgDXfnHqIFIHXjIFB0HEIzDtAHWj2QuWYcTW2ag==
X-Received: by 2002:a17:90b:388e:b0:33b:6c1f:4d25 with SMTP id 98e67ed59e1d1-33b6c1f5256mr22073663a91.16.1760524067015;
        Wed, 15 Oct 2025 03:27:47 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787a1a7sm1993574a91.18.2025.10.15.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:27:46 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 03:27:32 -0700
Subject: [PATCH v2 2/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-kaanapali-pcie-upstream-v2-2-84fa7ea638a1@oss.qualcomm.com>
References: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
In-Reply-To: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760524063; l=1557;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=VPVFV+qu0aJDwF/BGABycXVuxxH/BpzJrdbWSDyC0FI=;
 b=Otezu43DwHlgJ/x1TVecF/6XNvXp8kqdlVGHqsZ5IEoyYH56lqF5M21nlBT3cDfjJrHraJ3M7
 1VHEDq74JZNASXBjQZORo5giYEtOD9vEXrQ0ob9Q7miQN5VioCl4BO2
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef7724 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=A6CI9_SKnrlR1hncxxMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 2arXXHsDxjsvY9Yo-oWbpqk57rA90_qV
X-Proofpoint-ORIG-GUID: 2arXXHsDxjsvY9Yo-oWbpqk57rA90_qV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX+6KDO1cPw7aN
 m0amHgrl0pEHA3RH7I6FBlSs9Kvi4D0w3se0uBLdsjOx+pvtTG7J597JVEM5Nikp8Xig0eUiyrV
 4+/3lR2n0bNpQODcj0bgoaXeDO9M2m1o0e1hoGhVEKSo1mP+PYKToVR503WVLrvOijtd3T4rRWN
 ctWa2cjo7Bpo6/suTHlKPuj7KraFihQc3IpPQheCsdtK3Hw2d56nBe/Hqlfvwr6jE4lx1qvPY23
 uXE73jschl0NZOPisjy3TOy2w1sQftiq8TRdiQTOGJ7w0yv+ikkDKbLbIeKWJLOoaUjt+pBJL+m
 jtiUOD1rZBYCa+dAm4yh8URiORiex8Zs/R2RfSjKmk1RqLIsupBxxqCAwLfFUSsQYQBz8IxgWyr
 Pptf2/Usked2qMQBzzBjEoSvfFssnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Document compatible for the QMP PCIe PHY on Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 119b4ff36dbd66fe59d91c377449d27d2f69e080..9f7a276a84ad1e4ec0101c4cedc25230f509fa82 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -146,6 +147,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,qcs615-qmp-gen3x1-pcie-phy
               - qcom,sar2130p-qmp-gen3x2-pcie-phy
               - qcom,sc8180x-qmp-pcie-phy
@@ -213,6 +215,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy

-- 
2.34.1


