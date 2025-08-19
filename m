Return-Path: <linux-arm-msm+bounces-69709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3859B2BE24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FBFC68786C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDDC320CAF;
	Tue, 19 Aug 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3aZM1X4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA4320390
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597170; cv=none; b=c//Qc+pBlI6yaOJov76SGLWWBVKDiIQEYHr1QQmDEwaLUVETdy3Rme5rm1i8J9iujykO4hPB6ufvOGfSeQzUBm0H95aJYICPEo2xUcYWL6AkF/1TkDFphLqiMULg65zfKw+VDYtE9k7kqLsUuVe+4gFIA28PNUhJuSjMe812c0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597170; c=relaxed/simple;
	bh=OYLGPSROlM94Y8YMfz+cAy5T78h70o72gHxUfKcZJ3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIrS6qD19XJsgcscqlmwf1mvhzOcj4TYZMLuBtzrU0sQBQiTgCb+tQMxqusFuVhg3I0tVhqgdL65PP7DjAaAkRiAaz4XGf3qU2k5Tu/oetyVgpG/Hc23oZNqK/WCK/dbzXFkN1/W4Y94WaQ9C34d9WvqeMqm+7hHRRRBSn8EtXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3aZM1X4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90cZP018098
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HB2uUgg4ObiGLYTjYfuAXBTtDoOjkuI+b7+MZ1F1B4=; b=D3aZM1X4B+HF/L/z
	KdsFIuNEcRM8a/tWk2IWn+TNS7sPwOBYXWwMMnIhoqF4frlheK3Vw8EFA5G3nBfP
	/oTv+FierlwtsDUhX8inf+frGxFiVp0wscVHwuVwBCiI87YcV8mnVHw52R2erMcB
	SgdzCOKpreAXtIDwIjm5QrUQhTYPbj+ynliQIkBOtgSxdVvXMZWAfSSqEp4b5W42
	GBtHFkkPMN1RyHc0b3HrKRDn5cQq/tpf7lOjuTqQBpm1en3qBIDKF4mhm8WD5v05
	6swlUG0cjB6DMOEbOmZfum8jidMEJd5T7ORy+QDDufAzito3Iz7NROtM/82EKs1C
	c/YK4g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah00k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47156acca5so4192519a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597167; x=1756201967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HB2uUgg4ObiGLYTjYfuAXBTtDoOjkuI+b7+MZ1F1B4=;
        b=GjeJn4omtFZND2QW732xNtEXijVJ6c1M8OWmAXpESHDe3jY4hsw88G1y03U6E75To5
         5M3AHAHjgJr3aaYHKGw/KKWOxj35HWCuN1pn7e5783XwU6SCr0UqAdNzw7ObEH9isuDC
         LdRbRM2U8o0oBjc6TWQCYDp+mFRYuHrRYAZSMNg9XsR52LHsbDQWxjQPa4xc3VMbbPyh
         Ge+V1WHA2CUQvipXmjbNusNY5qrhdW4wHpybutYgAwYyT4x1gzeq+sVy2FvoeOhBLB04
         AEDZDLGUgwOzm2ug+ZVxzQgFP92beF++anF06KVGioRoLxHN+44/OkdOIPPPzXbLiRBo
         f+BQ==
X-Gm-Message-State: AOJu0YwYOmNl88y8WM2hS9IXkK3/D6KZfOnnkNYMv3jM5KqNvbU5Qe/Q
	ZU2xI7gqD797NWg82CLxoQ4TpJE4DSkvuJ58QtAINvYPLtY96Sx0qBDVlifgR4RObXrLDdwHn/Q
	Vi8IwduJ3KQ/CnWICCVOfAztTjg/H/tJ9nrdSVX4iMhJgwIh0+1TZ8aHTJQWrI9/X3T2N
X-Gm-Gg: ASbGncsfdVBkXmqT0Z9HXcbrT99788elyzR6GFmb9WLWYldVbuOxa/Xh7InoTgvYjot
	xIoYFSDdFsvGjgIZ1heCQjXS53ZjbTpSypUyEMe1blaWhUgr1fqUSDwD5qgS7v+evcyvxXvO5yD
	wQz8ef8T0c9x87y+sMwU1AqS7oWj/zWfI+nLdlR2oKE2zeSscFpyFI6z8Ikid2C3cXppFrDPyGV
	CMiyYH4ZIb++Kp7FtESaj6Gm4QvJogHo/v4Ei5E53fpSSCXauemQti0YuqPylEbVi95pssKMIEH
	x4TgcUwK/imP/8AAqQcuPfb1VA5nMKjCus2yt7RubABxsQbwcFK9YSXlj1EWcT1F9EFlE9wlYwY
	LjObLFODIM5EgtqA=
X-Received: by 2002:a05:6a20:9143:b0:23d:45b2:8e3c with SMTP id adf61e73a8af0-2430da566bemr2343298637.6.1755597166612;
        Tue, 19 Aug 2025 02:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK98AH04v86DoafQcwelaWJ3iL3gQkWuwwa/UBd5s9Smm42EVUfqRGbSC923jHrqHy28a7HQ==
X-Received: by 2002:a05:6a20:9143:b0:23d:45b2:8e3c with SMTP id adf61e73a8af0-2430da566bemr2343266637.6.1755597166153;
        Tue, 19 Aug 2025 02:52:46 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f7cf7sm1998291b3a.69.2025.08.19.02.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:52:45 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 02:52:05 -0700
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document
 the Glymur QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-glymur_pcie5-v1-1-2ea09f83cbb0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755597163; l=1596;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=5L5bgft0hY3UL+GD99tTktGev1AZdAzNOUPNY/hYCs0=;
 b=iSxkRvwPR0upKVd4VfCSpydV5AIWuhTgF5bNTgzrmAQMKSGHkafm6fwJOSYukO+Z8sRfTNEnN
 zVYCLHdo1m5CkxFG3qY7uMnOpRWEnekdHJPHAK5A2R3t7B4Hbw1jPjd
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a4496f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=prgL3jgsdPShhDvlN2UA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oVqPCH6HgkCVL7jhkFmoSxHe5-LifqU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX+JIiPmgfbeTg
 luTgN7ts0bh4WTIxJUKNW+6DH3qxtwOKLD33uUFVLniqaxl0ETyh1mLf7qWXACYLOyVVme2kQOF
 MgUHC+fgZd7IZEXRysIdJQpufS3vlZSpBtW5o61g1FMlaDZuWAqT7KGM8vcM//4jsyBtZ1humcB
 MTRsMgGVJNAkzz8i8omH2zEv+zlSQ+c8/XZ42/E7Mf8X7KZsNn7liz2L1ARQZbEnDb/GBJ2GC8B
 zFOy6KOhwIrqSfwzGOF8gD3joIgBu6QcrJAHCDuz0yNm+gfaIwO674mh6RMNUwcBK9ToO/6bmO1
 vFkoZOqDw2k8ERov1Yv7YTUzh4YCEXL4gpBW2Z1WobTu/p47A7ripVKVgD39MJa5DUYy2G0Sw3j
 bREVooZr
X-Proofpoint-GUID: oVqPCH6HgkCVL7jhkFmoSxHe5-LifqU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The fifth PCIe instance on Glymur has a Gen5 4-lane PHY. Document it as a
separate compatible.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b6f140bf5b3b2f79b5c96e591ec0edb76cd45fa5..61e0e2f7ec7f9cb08447e4cd9503698c0a2d383a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -176,6 +177,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
@@ -211,6 +213,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy

-- 
2.34.1


