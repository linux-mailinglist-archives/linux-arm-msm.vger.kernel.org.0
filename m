Return-Path: <linux-arm-msm+bounces-70803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C93B353B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21196832A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 06:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB872F49E7;
	Tue, 26 Aug 2025 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKpsrFNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548A2E228D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756188189; cv=none; b=AE4yLKpK2D0e6oLYdxtmgzNRz7CuZls1xLsHeCvECBwaF7PBYdf9Jum0ARzI1vkvh8BBmLSncxw+IB3qY0LAUMNmuJ3NlLwvdxCDJ4xBpXS5YKOC7LlWJQ5jzzzVdytnwwEWOxkjHFQrtbdY4Df0brciLRgT/Zk7Rbs10hl8l0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756188189; c=relaxed/simple;
	bh=NMvu6tjTeXh3gl/g/huT9wGas8Pnxc/WPB+nobZ03RQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G8waaVZTvro/+OFtR+6WRfHC44PAnv4pT+vyN7oVmwLyGTAV0fnLcCbe7r0/KM6ksYQrrTsr1PlcsLMpl9xJOmAe12Ngk7ofxh7nD06VroATR6LqaV6UOxSXoAx2EQUyiiRw8bnYgJdRdkuMbM8vhMfABPUNfzkQHQZGQTYdckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKpsrFNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q3FMGH018802
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lEftv+FACOPDXFccinKHuv
	dGuhyZZ2/i2kFzrCdq/HU=; b=VKpsrFNtY4a27z1SxEYC76HosUbyWYVw2qp/cd
	U7pIbhtxdNjJbrimgLDz7kTUf9uM/x+EzFeOSS/BC0Akeu94rT+4CO5lt/ZkuuBG
	Kf+i5Gg9kDIfJOgooTgFJQvJYBSVLbW6NO+2YVY90+VlbeyrlqC1Ff+XNeiXgMNF
	a/+v9GUsYhLwoihVMdbRNjCSqBLeGddGMU+sp5NHNjKwJu58+qcrZWAD3gaoBkpE
	975CyLwRLqRUOCIOVLe+AcPCFaZZ0M9cuu4Pk/IC3LgyHXunmSnCNB7xixV7abJI
	qzSpVSRPA1wwSVSzeSh9XGASrolnGqkJ/vViIE7hqVdmGUAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpqs33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24696a89d6dso48106625ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 23:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756188186; x=1756792986;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEftv+FACOPDXFccinKHuvdGuhyZZ2/i2kFzrCdq/HU=;
        b=sCFXm/WqWJK9LNYAJliSL1lgeET2sc3eja0Lzk6CEPvOPaUpTWSlEr4Y2KDUGA5n7I
         pW+1HvUqpFhWdKQcp8Ei0qoOoLN0U1wBEKjA/UyYbSPfwML6QBL+lKkUuHxqSpgvPGVW
         DOmbalCmm+eHdZZvORzWjhFukomOgSoQwH2nuNIhE2ieilh2Cl/0mBNpw3h2jH+uvzJw
         MRqerXLShKyVhMiqGrgWukM/qbLtmcovdHjy6x51bWgkvZYwUh4KP2AcpKt88j2pXBLb
         4oRsdM5Lb9XktDEVCYGARqCoawdIcsZHXLA3D4csfWGjYBr44u9biu/0cZtcihAri5Nb
         4/gw==
X-Gm-Message-State: AOJu0YwZT1p261JH3r752iL7lxAJgvxYCdCAujUKgRwexw7SBI88GoK9
	eMOazeLevKLr/vTeOb9y+adDwMKQIHUHyi27J6bWM0GEbbh04d6tAmqJzyB7JWbvQLf7712m0qZ
	itGs6nF3EC0W3yoOVAjeqlXurKLeBMp0POqrkw4iWlEFUmxVWGYl7RvCwDgHC14byPz6Z
X-Gm-Gg: ASbGncsHome6vO4kga//4SmfmcV3+RZXUYUfJ0H9+9w0eqEFuOnVq3EOaltmKRMbPGW
	Ox5Hm3AHl2he3E3Vf9Lu7jVTPrmSdYGAaA0ZcUh+UUPZNddn9O8TmRwQG5hqI5ikTarjrhOhfaD
	QT3YGiKMCC0zx5YaIL6m9Kj0nIESc0kjJj7pDZxyS2LyZ/cz3lLP7o8itVRoHV3YEk6zs/tKew5
	yWAq0TWMouPkXsyTc7GzlGWGBtjz2+3wVy3oepQhoMwRz92lCQf8grutJFyCByoQ20Eo9qZGB5O
	oj+EZz/ciI5GEJBWvQwqoyXc/k5BmwRHn1FKiSPceAMavq9XHX7Aa63SGG+6PRMajsr6FLLgTJb
	V2yN1SEYqosWClvM=
X-Received: by 2002:a17:903:2347:b0:246:d743:b0fc with SMTP id d9443c01a7336-246d743bde9mr69827065ad.44.1756188186312;
        Mon, 25 Aug 2025 23:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYhe4dXjLNGhJZGzARNQrnPNogJdMJqZaTMcpoZSngAMDqHiAexd97bFcuHHEUnL/JnUfghw==
X-Received: by 2002:a17:903:2347:b0:246:d743:b0fc with SMTP id d9443c01a7336-246d743bde9mr69826445ad.44.1756188185606;
        Mon, 25 Aug 2025 23:03:05 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668864431sm84989705ad.93.2025.08.25.23.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 23:03:05 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Subject: [PATCH v3 0/4] PCI: qcom: Add support for Glymur PCIe Gen5x4
Date: Mon, 25 Aug 2025 23:01:46 -0700
Message-Id: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpNrWgC/5XQzWoDIRDA8VcJnmvQcf3qqe9RSnHcMRGy2VSbp
 SHsu9cNPYQ0OeQijPD/oXNmlUqmyl5XZ1ZoyjWP+zaolxWL27DfEM99mxkI0MJJxze703Asn4e
 YSfMeO0pCAYFSrCWHQin/XLj3jzZvc/0ey+miT3K5fQBNkgtuPVKyCrWJ3dtY6/rrGHZxHIZ1O
 xb+r/V32mRTECAlok3PtrpLZDwRgsBnW6AgfHIqIor/7bKDCa7+DfLGgGbEXktjXVslPDLUtaF
 vDLW8wxlvZOd0CPqOMc/zLyMOxejrAQAA
X-Change-ID: 20250818-glymur_pcie5-db4ef032e233
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
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756188184; l=1916;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=NMvu6tjTeXh3gl/g/huT9wGas8Pnxc/WPB+nobZ03RQ=;
 b=YIkUZc5qn1Aw090tYWuUOaTqjC0ZXyb3a1sjTjdoAmHUO5INUREbVNsHk+Bw3ggIMk6XAxerR
 daW51x1xUzmDcoBRxrxYxgivfp/YY9HAWFm0vfikTRhAeuTn+hKsrHn
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ad4e1b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=450xJL59MvcON_dSg4wA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Gw953kDO8zHiYYvUh1WmIlWvgePutekM
X-Proofpoint-ORIG-GUID: Gw953kDO8zHiYYvUh1WmIlWvgePutekM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+bJvqOAOrTzH
 FsgKVXMsBxgSOLPDJ1Dgv7Lg1tHiWciwfhMJMSmJKvlIoMFvSMYiFafDbLYoeOtx6OHr7An/3bb
 J5wRSAAY5H5hrfGv2S0X+B4t07lKPLyUCNkAcQOc51XO3dVpMgr5FHMa0Ry+Bqip22VT2QU2KSh
 /i+/sVgcfLxEjTLnPOAVMO6TGipdsQLOCGRWSYFIICDjYXY8sBmHRGobsBi0hniMWZjWRnCy+qH
 f8Uz2zbdLRtgJ4l3wrff5Bqw4daO9bQP5Xh4/UHSatYLwbqhd0XE9LjbiAMm7y5tSFkEzEvQpJ0
 sPeFB810lahZ0SnWt7BTCchTjU991llrcY7QHJTBHFz1HCCx+jgYX6b2v4zOexqan7cI35Fa0V0
 FKd5WOIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Glymur is the next generation compute SoC of Qualcomm. This patch series
aims to add support for the fifth PCIe instance on it. The fifth PCIe
instance on Glymur has a Gen5 4-lane PHY. Patch [1/4] documents PHY as a
separate compatible and Patch [2/4] documents controller as a separate
compatible. Patch [3/4] describles the new PCS offsets in a dedicated
header file. Patch [4/4] adds configuration and compatible for PHY.

The device tree changes and whatever driver patches that are not part of
this patch series will be posted separately after official announcement of
the SOC.

Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
---
Changes in v3:
- Keep qmp_pcie_of_match_table array sorted.
- Drop qref supply for PCIe Gen5x4 PHY.
- Link to v2: https://lore.kernel.org/r/20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com

Changes in v2:
- Add offsets of PLL and TXRXZ register blocks for v8.50 PHY in Patch[4/4].
- Link to v1: https://lore.kernel.org/r/20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com

---
Prudhvi Yarlagadda (4):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the Glymur QMP PCIe PHY
      dt-bindings: PCI: qcom: Document the Glymur PCIe Controller
      phy: qcom-qmp: pcs: Add v8.50 register offsets
      phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen5x4 PHY

 .../bindings/pci/qcom,pcie-x1e80100.yaml           |  7 ++++-
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  3 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 32 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h      | 13 +++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 ++
 5 files changed, 56 insertions(+), 1 deletion(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250818-glymur_pcie5-db4ef032e233

Best regards,
-- 
Wenbin Yao <wenbin.yao@oss.qualcomm.com>


