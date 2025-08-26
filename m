Return-Path: <linux-arm-msm+bounces-70804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B640B353B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B261C1734C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 06:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7782F4A0F;
	Tue, 26 Aug 2025 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AF71+VjF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CC2F3C3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756188191; cv=none; b=AgRfK8XtUHmDMZglMXo2U1/7xOCYbOVMs0Kvt5XZtClraRWIn1YzKXPebA6QYWnF98QCaOuZ7eBio8MJvr/JIPfleQUk6i/T3Y3c6tc/FZnYU6vdZsXmEZUpi7ciEoL5IwUf9tuLXBGF18VGOGtx/G4LcaqU69ZUIjyE330NzzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756188191; c=relaxed/simple;
	bh=bK7IjrY7RIF7sDIzpn8NtOwFgdMSpX3iA8qa1hyDEWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEBFbsCQmwx3vHJtJRmHZT2cWGlCmwVq2sivmzUN3vmh2GaUb2cptQfBTLHY/ESvHwd74Txx2SZdUKEhgTdveS6BQuIGIAsRBkzYIA6Mv37bhAKGM9bmncOau//sA6t1n8LgcBhMFpVp8vSDMzgAvg5VRDmdJMdig7+2q94PR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AF71+VjF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4k8uv026003
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7vY6EzZz6OX3dW8SAYR/iSAmvLfxB0jaIKM7TBpzz0=; b=AF71+VjFxN7xHoaz
	Lz2GeGUquY7+D1RICUB/r8FvWNlKFs50iPVcTTXCnwYK2272zd2dWYgvKlhvlkje
	gIcZg629Kuj3qw1CMYuwjnsCj1865MDeAVqadSV6vpKgE7BeqHMv6OSsTtJYcI/w
	yG8keS4q7YGQ7D+fWnZp2ZmG2gX/1J8OJ2hkcjTqAerUFilP/vo1xTcl3UEUEN9Q
	9QaqAmoKUhnEMcQqyMvdRrrJV0wYiITOIpD6cayecKeAIvPI7bpaOmQox0h892qo
	u+jjuRX/BrJ9lHsxh9kt0eebdXgRlrqOpchnBupz4Pi8rPNMQg4lqAU2ufOargNL
	TQ/j6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x87nup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24636484391so41514785ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 23:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756188188; x=1756792988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7vY6EzZz6OX3dW8SAYR/iSAmvLfxB0jaIKM7TBpzz0=;
        b=dnZG7tBRkQIFsRefBHXUm1VvVZKUaiDd/pMuiiujgwxx8e1tQ6F2HMVaO6+mefgw2g
         imPsqQTrLZMOpfcATxu6EZO+q8Cze17pJ2dIoqhwp5gvA72dc9RxetuO9XprSz1mHQ7U
         Xjnf019r7YP4BRN0eSPi0BJ9N9eKhnjLCjIxRb9kW4VMTVQ9zpdzegUY3wJQbUfIG3W7
         BzCCGF2WFhVX+cPnR/3CS9zkXxp6Ys75MGITp6kIR8YtBGzBHQyeiMcgbcOkexbW03VG
         1M2CRolBIG8fSgAMi7jnMlgQpa6qa4aWYDx4+o89PnwWvNypYJUka5T+smvGJeZ83EfI
         VeRg==
X-Gm-Message-State: AOJu0YzBVWtrChLabR7epHaff61Ii5F5nS/wWAO7cNAj/bvCl7jcD+19
	tt5vZcXsGFt0Co08vVuw4Za9XSwGSS7u1VYmdQlGW3MAv6VBbKoDpJ2OsREyta/ZnHqYrGW3Ccq
	EIXeZlGxNS8wcicgIVTaCrLWvQv+A6Fq6Ezr7gpln8yz+s3EzVPSvJItWY6TDSLiJT+7eqcYZ2t
	jm8txF+Q==
X-Gm-Gg: ASbGncvvBRrN/YkmXzhTW5j1XsQbRt3P0XKzjTguOLp5dbldBCBIgTOE95a99HLbOBk
	HtDVIi3U0aFn8LIkGFBjLzeG/HeBPmT5xjy4wPZb1LG+6SB3LKiwP9Yr0iMWLwrzBUaJwFJiwMM
	1ExoFX4gIcUMGPGtGAc9Yu9kisQDoF4w77J8p/iqDYDJVXKzde0nln2pPxRLPxLMb1l3cRy8lTw
	vd44FsdZHkjjj6IKzv2+yAePk2MvwLNtp8EiLWq6ra6W1x+Z73E+WJsHqxycfrsAz4jdxNcYgL8
	OGG+hLRHEWfs53/419uv+4f+EjTngP8NxlMkK6i+ki2Nm6aKZU2QJ7EuRHuwcZ0aUFSwl17LK5L
	hzY4FbalxgTDE3VY=
X-Received: by 2002:a17:903:1af0:b0:242:460f:e4a2 with SMTP id d9443c01a7336-2462ee54a58mr173688285ad.23.1756188187836;
        Mon, 25 Aug 2025 23:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm4pbzLBk/0e4mduEsQN/9isTON0Dv+q5J0zKrA/VOOs5zXfa7ktJR6RMVvs1bvXxEGMj10A==
X-Received: by 2002:a17:903:1af0:b0:242:460f:e4a2 with SMTP id d9443c01a7336-2462ee54a58mr173687795ad.23.1756188187330;
        Mon, 25 Aug 2025 23:03:07 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668864431sm84989705ad.93.2025.08.25.23.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 23:03:06 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:01:47 -0700
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the Glymur QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur_pcie5-v3-1-5c1d1730c16f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756188184; l=1643;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=oxNK7rpfuxJFlxeq6m4yP+Aq+2bgn1813OA7/GzY/5Q=;
 b=MZ8ddF79PBfDlVHSJattDrGGBwdp99PB0M+w5COnVmkky0eJV2DGL/c2eFVLP5DdTGOrbvOOY
 8oF5DsRhWCFA7Plr5/q1FeyT9puSqYtWLsZ6O9oWeFKcFVYFh5a14aj
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-ORIG-GUID: WYRjFlb2s3dS_Iin3LNgtx7GUxRoXDou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX7nKCjmhZ20tu
 0OFbfSuQlUMXNsWFMlVHs17+U0I3eCOSENOPtb1rRn0TbxzIDvCCqQ4uchGOCsnvobI9QCYdWZ6
 vCSxBD70ApH+seGAyHi1Ij5ijba54qpib/53/usnrQ9z33/JpG3epGToZdmk0qo4rwui4mjt186
 BcArVPq15cPnsXQnh7jE46Zc5K/SJirGQ6cxjVm5RKfJ4L8Kp+FbTNI4/sNsCbpoyaRLzBTWAcJ
 cnWAI+cpZogRTXCTfOrYJNfCuZysMCdSqjL+hMsPoUAmz8ApxjJhTdXk5Zw/Aerk9NwLHSdI98q
 itU53svTvR6qnHiCIEWu14PuO4ETp1iq8V+n6JvBUxPO52s4Ax1C2O8lpPah5hd5cbSqcLoWsZ1
 Z8+nLl/+
X-Proofpoint-GUID: WYRjFlb2s3dS_Iin3LNgtx7GUxRoXDou
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ad4e1d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=prgL3jgsdPShhDvlN2UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The fifth PCIe instance on Glymur has a Gen5 4-lane PHY. Document it as a
separate compatible.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


