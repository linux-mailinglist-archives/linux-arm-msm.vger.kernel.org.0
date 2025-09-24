Return-Path: <linux-arm-msm+bounces-74750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 333D1B9C993
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 347A31BC4329
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9282C0F91;
	Wed, 24 Sep 2025 23:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRfSLRFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5786D2C028C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756810; cv=none; b=cPgyTBxJZfDTBsPuPCbdlDf9t+UAHyWIk+3xAEWG7gNyEj+YYQiA+Ny+C8NhM8WEWu9F0lcOg3Cgw3jko8c1Wn/1tMt4Kb7tl1ef4yPKtzspGJeOucTJ7bCM6nlZjoUQGssv2nA/mBOKRKtkCT/MIYMpueFEaHusaFuv6HIYG+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756810; c=relaxed/simple;
	bh=O/HsehNhbUKU+HifRVasrfQoP2B7YYk5FbQ/Y3t9EKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gaxt0DZbl8vT51p/D1d+6vewgF8x2u6+lBV1qHGvHYd5yQRic/aIOYxm2doPaFqTFaM0Ac5K6LmK0FDPLAvphggi23V2vGxdM5ZU4pZF2bB5dWoNJpLDylTe4jQ9+LmeKcioisVGIwsImyXt5nMKMXpfo/r8DDSLoakyEMbDKxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRfSLRFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD3c1g028188
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZ7mTakONhQ5MdNM3TgNyHD/Jxj33wLx1vuBQG2ozxs=; b=bRfSLRFd8+s0STCy
	GHxlzxIuhN5Hogkfl/ff5dz9WBUwp3sv5lJ0isd72tyWT4nNOQ0Fog+0H4MZ+pyf
	AZA8foW55TGdkucu4CmYwpK6O4mAxIhX0H7IHz9x/hbsLqJXPslkUl1p412efYz6
	2z7y7Xjb5y9y0gzXZ7eqIspdri23Q5RELHJKT3FIPq31cHJ+xEyEMeRB7DGfktGo
	FEjD6PgmrJadc78QQ6wTkmjFFy36c4dUf3xPTCNuwUbWETUPNOCZZ1NtyoSFPy2V
	0ZoSmgFU848OReIA1TIHon6dBaPtpdevWLnTT0PCNSaFd7Wy74JRmK6Zmu9Uw4Qr
	asaKLg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxcx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5527f0d39bso456502a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756807; x=1759361607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZ7mTakONhQ5MdNM3TgNyHD/Jxj33wLx1vuBQG2ozxs=;
        b=LYWCZ2YrYJYXyQThzhD3KTKxljyy02Pd4kKtVOZQvxdDuSlNAahzOBnp7pCI0BSOXG
         lx2gecluj028eEeRqYEG7dmU0/kPFmSxiRhZal1Z2hrK5W5dfLVrdz2FMupYUxuXf1D6
         z5LtDi6QBllqxDuR/AnQ9WX3GI6AKKb8NQ4AhbAvaqaxX2TWvhflsgHuyo2dA4TAfUlT
         CGfIRduvgwOpril2HRmcJVgJWm5NsUztxb9Q/MFpo/0PEX3+WwikfVUiZ1s8K37bcFZJ
         b5hwO2dxnhGbEx5jiQaEjogkOQQMXx9JcT3r4Om243pDCGsO2oxlOcpPoG+74G0Orj+5
         X95w==
X-Gm-Message-State: AOJu0YxygkiU9KOXK3OfC9EBVZKyTsSR129Mi4T9LpSk75JFY6Q2j8t2
	py6armlek3YlN2DBJwHioBPzx+vPoh6A0g7VW8iOCzA01/Ac2yQA7YTPcriG3WnWnEwI2xZkJ6Z
	e1FXTFhLvpfGWJNMvZamocb0Na0IZuo/05kPyR1bgv1dQBjj3mztc7m3Ijmz8Nilfuq6A
X-Gm-Gg: ASbGncufI6gT1VQcPFj0T7C+Mf3vXGemTYHkF2+uHyh1FT076baNIPpEFs2Cp/j1jA9
	pClNurdYWY8f32RYaCPIjAkCy8Y4ee9SWIVWeD3nyGxGS43jiJlVBwn1o3yYgdvAEN+lMypEAI2
	TM8/8vd+DUN+LOC5tGGyJG2ZKOAQ6YkeHQrMbxbf0iOBES/lqzEuxTPWmFRPkbwasWt9uMubfr1
	nplDfCfzmxZqzCX7rZ81qIwVFwJEKDzucTmEbze29eB07i9L6lyjvRILboCjs7id+E6xXbBhkZY
	W5CGTEYTMZXmGXdhpbzvaUBfPrrt7vEavCy5CRQSNnk+3Y6ZqPfHIfaCzOFT+ZJ+M1ZzPNTEDmq
	ah5GI2mdR6q5gGKY=
X-Received: by 2002:a05:6a20:244e:b0:24e:84c9:e986 with SMTP id adf61e73a8af0-2e7c79c5ac6mr1705019637.15.1758756806976;
        Wed, 24 Sep 2025 16:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEShs+t11pe4EXtyJY7eq7SxJOc0SFTQM620l2aSx6ms55iEGfKttzOhfcvzJfsawotCzSxCw==
X-Received: by 2002:a05:6a20:244e:b0:24e:84c9:e986 with SMTP id adf61e73a8af0-2e7c79c5ac6mr1704997637.15.1758756806571;
        Wed, 24 Sep 2025 16:33:26 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53ca107sm392911a12.13.2025.09.24.16.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:33:26 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:33:18 -0700
Subject: [PATCH 2/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pcie-v1-2-5fb59e398b83@oss.qualcomm.com>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756801; l=1501;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=VBW0kDv69D5tBQeRfHdrmnRiouQM+MGW2Y5Yg0f+6nA=;
 b=NL8BNAGHotEw5Z8jTwt29kGlC7TPmvyCyt7uA2v5QZBwSr1NNNbXHgBi0hJ1RrPRJppICeJ6H
 tnVxRt4czLHAAovxAHOk2m22FOAjgZP97+p/XohA8ec3N6cNZtU7gUc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d47fc8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZHoeG76OixanZ4sGZTsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 4RZWGqh5X8wiZo9QDsgIWsS84C7wKfE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX7TWQLhhu0VQV
 1/IpFWtiyW/LzuJE30qoUtnGtG+o6qvBWzbta6eD9MY340LSniIALkUlsWUkwhKaCfJhD8HN7NO
 kLw1Lz3olR8eJu5Td3JuBYeqYlbmI8M+afxDzSFtCezxrpZ+RsZeHkCz1FzzoaC2c6UIQnec0qR
 BrKoSrgM2oJIndYdjfV9J8aY6T8kT+Uk+oLH3KzS4T3YTkZh4zrjNK4MgqMNxKtzRLq4cIsJ3Zy
 u5sRS/q81kprJL34vb6WKzCDqshwbiyJAHTIMjh/prXq2Q4H52tBPg9Wf7PtyW3ojmgbBPSYyWL
 CSoxy/AXgzgjPfSwOl8AM86g2b0wkuAVGxrh9Q5qXA2jbTjck2nx4fGO2wIKX5RlZWXB2hZmxap
 91qcNTi9
X-Proofpoint-GUID: 4RZWGqh5X8wiZo9QDsgIWsS84C7wKfE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Document compatible for the QMP PCIe PHY on Kaanapali platform.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 119b4ff36dbd..9f7a276a84ad 100644
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
2.25.1


