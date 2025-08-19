Return-Path: <linux-arm-msm+bounces-69710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA0B2BE28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D06D687B3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57653321425;
	Tue, 19 Aug 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1gd3tfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E7B31E0F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597172; cv=none; b=sqZNoAl7Q2yt3ztxA/pHcbIxqQXfQ2HoRKpmJ5KbP6itH07KzVROkmB8d2eKBGAA9Bfqt1MF+Ppnv14moqnoqIMzK589p6LMIq3kWw06QvV/7uYpJ2dD4ETkHWhj9uhAi3xDRP5QJAloJw/NXvIbS8XarGMiCMLhETKReU3JXWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597172; c=relaxed/simple;
	bh=ekdA9CVOTz1DmJofPhYI0+HcBHPnLV+Txm+2ENdkrHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JT4pZplI6owEGPiXIlRcdHUagD7grYxjn9x5GlYltPweshVjtkJpReVUOpyLhZXrtJW8fAdkuXWq4hTDT9GPEX7zPGVAkDtRV7NOEuYGtXWqgv62PbXVvHqpiR8xb2ivzD0b2k33FmpqZ/nMNK5DW+c8lnBZofY0ZwlPctnLu2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1gd3tfW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Zw2001506
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/mJfVjavIoqW9T/ceCVgzgHEhxIAMs4Ha+bWe4V2mM=; b=n1gd3tfWgh4Lple2
	RUP0TcqfCejGVxtXIvYyxDgViyFw0n5gKq1/3QvburWZ0byEhkv0siASr08gQUJL
	8y+juCf9hO4kCtDML0dDO7bIc/ZXYY8W3URSt1G8SWGLWjR9wkwn8EwX/PQpKsbQ
	tVSy9QpSUovsa4Cr8Whfl2Vd4LPXmeLIIcwnbUJM7q//+9itjZOuEU1Qhn0rJTOa
	2FZbqFQoD+obABmuddnvgHf0qRyRfPPFmK93mx5oLv3kpfnCW9BxuA1GJhVmOjXn
	nhpbxfhdClpqYmWjPh3oDVtk4UkMv6Z4fDfStqeEyVJCwnspE1Yktmu7RjoZCqLu
	OXxGww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh0782pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2eac5c63so4458934b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597168; x=1756201968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/mJfVjavIoqW9T/ceCVgzgHEhxIAMs4Ha+bWe4V2mM=;
        b=VAWHiKWBRWzXJ8IiuoPJDW6PcpIYdnImdvetB2l4CyBNf8n0vbp1ScMFUje0STRTNx
         A1p1Fi0+kyZjVmY/WNg/3zORfy7p6nOxofixWcow7yewhyL6N185pZzBaatRctw2Kuqv
         rSUzzVYbYdmZmZ3Gq33G/40rPt7obgD1ls3cJPIeYDaBRCS9P3cuHNcrXgvRTvlSplYg
         TgwNtKZD2NX3DH+gl5XMEAVzv93Is/4YtQXCo3F9+Y+SlP/MCU4E6ZacXu6syqtTMnpE
         SvrvCX1Af5w//7RYMheyoOG2mvSIl3Uif2Z4k4MFrG8elOpCl31NCARsWnI8F4sK+HGb
         KSAg==
X-Gm-Message-State: AOJu0YzCvaqaqVxzWbyLMqXMG5lPv1TFBRFXmzmJxSi/v5mQDg9Yi6xJ
	OiDDOWCN2ZMrHJe1alc4oSltxyrHA5PiS1ljfWCpfBYNLVixWVtJkucevuoicXFZeCeOeeWRqcj
	ff3HlwOjOOHD4ue6MK9Lhx5xqYxKkkkdYryKtUgIpFVFZUVZhhW9o/zTu7Savsfng5QJnr/bb/Y
	yWSC4=
X-Gm-Gg: ASbGnct5/+s7BYaXdxAYYTCPMx4Kt3URhIbJtIbWwz+w6hMLVQSQPFPJcJ0kM45Wcp3
	YT5Hz3HGbJ+ujNeD8pvP6PdhHSa94PB9Jbn9CcBmwS7lxBOgOp7Oh3m7JkWsKFeb+ojSmI9xmcu
	NRYHLZPfK7IYnsSiwDccGHJ5EeL9Bob+PJyfKzya5YRWeakTAyHOyZUjCYe03B8EhgmEdWkoDDi
	vbYNvq9OdSbZuFHpQ1fS+E997qZDZsOuACEetJzG3F777jWtru0ANDdLl/hT6WhmuqVnFrw4QgO
	wPlUyulIMazMbL3CNA2wybT1G5WF75mUs4/L2lh7UVYL050AoR5WswdhepwhNN9Qb1n21+IDvwF
	4eKr9CWUBv7PxSKw=
X-Received: by 2002:a05:6a00:238c:b0:76b:f0ac:e798 with SMTP id d2e1a72fcca58-76e80ec16cbmr2675708b3a.7.1755597168024;
        Tue, 19 Aug 2025 02:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENz0VJ98WADN+joIk0/P7w0o0p+4hmpEs1o6oCjBWcA7BvrTOLvz8FOh4tQnOd04eMjoXMVQ==
X-Received: by 2002:a05:6a00:238c:b0:76b:f0ac:e798 with SMTP id d2e1a72fcca58-76e80ec16cbmr2675678b3a.7.1755597167592;
        Tue, 19 Aug 2025 02:52:47 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f7cf7sm1998291b3a.69.2025.08.19.02.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:52:47 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 02:52:06 -0700
Subject: [PATCH 2/4] dt-bindings: PCI: qcom: Document the Glymur PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-glymur_pcie5-v1-2-2ea09f83cbb0@oss.qualcomm.com>
References: <20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com>
In-Reply-To: <20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755597163; l=1172;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=jt6UG6eiIFzDb1oeF0pFhVGf3jfLG0hsOnnZ5HuEIJI=;
 b=aLluycJkcVAxmTz5cJvmmczoB2nQCBmt5en2PL/z+GQMXGS1yuhRxxt+knyE5tfFmYvmM1uZ3
 3TxgHk0HhLTAUMfkAk+qLqJLStjDeG3lHUrH6iLe1j1Pj7Ojlp56vIp
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-ORIG-GUID: kGAxIAVZMwRc5pSCDqYnG89uhKucv_Wl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX60G80NmlQnzT
 jPVHUieP7QoJt94bcka2u4lb0ZAqJrp22dMgEXgchJnldBC9MhN7PuZSJG3BAvbIA6zFJ6tuoYl
 PHdaEPdxYqjbQ0NwScRaEaVZTLZZrvNSzahu+ZYDNApmUGQnmLX959CrUQ5zKH8MojGazsgT7N8
 F/Cn/m+n+DgKmmcx+4sHykDnq1AgZ/6DH0qWbPT7JkhU8v02um4GUXx0osjbLfLexv7Prd/9u5W
 MwM/8uR2oqI+XfTzL8M1ahG0zKBPYvSi2LpSt9argXoKmpe1udq22IqlAfvDl/15yIvm83Bn+Ge
 PugcgZXIhk1qMV8RQKRNNEO9LBqycU0J740SewKblmSpYdyvRt8xl88seIwSrw1c3xLGXoAR4G4
 lunKugpn
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a44971 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WgZgizuZlwTqGGW0kXsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kGAxIAVZMwRc5pSCDqYnG89uhKucv_Wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

On the Qualcomm Glymur platform the PCIe host is compatible with the DWC
controller present on the X1E80100 platform. So document the PCIe
controllers found on Glymur and use the X1E80100 compatible string as a
fallback in the schema.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
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


