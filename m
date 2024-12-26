Return-Path: <linux-arm-msm+bounces-43358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB869FCA5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 11:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9DB7162E8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 10:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92771D54C0;
	Thu, 26 Dec 2024 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NUMgSKts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC621D5176;
	Thu, 26 Dec 2024 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735209947; cv=none; b=YpmpLH1hr5XlsdjPtHNfgzZYJSo+z03LKmnqwu9ZBBoXZ1o6UDjNafXrGq8LTCMk+CEKUr/t+qH3eYJB1iN3/baPO8LfNYEbQNDHv6SF401poWkL6xKam06xWbJeybyR9DQdJ07l7sLPDIuF4DCTNM/iYKad7ZrH55dWezbYjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735209947; c=relaxed/simple;
	bh=uEmlkNSJO1vXovv36Wf5yHhyYzb0wQGYpLIx/QXKYwg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=o8it+U4muErf8sl0UDw7XsHglasTL2RWqNgw+sfgsSSF7tgUU8rSPkk021d93LA6bnvpmUgOXOMNcEiNkyBffIH7iZ49SwInWM/9sQ2qkY1+MWv994+re84evDY1iZVnij/YsqRTkfXvm4/SWP0vwOrDv5FW3lLTEW9MksCMn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NUMgSKts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ83hfj022928;
	Thu, 26 Dec 2024 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TYwtxJkrlzAa+M1HCwssnP
	AAThIV5UwWZR1f5sHPs2M=; b=NUMgSKtsarbJtgq3sIKCMqPvlNWcM/+lt8Xyea
	G/jLptG4chJ/mKZKwCPC30LEHQPdODyCDLZsFbzol1XIukeM6oaiJWlIzmYg4DPu
	IYzGGTVYo698SUU6pNTQ4ohgBzY7re7MN61V/LjJQ8xtTrab+73G3++Z8eWSUEk5
	0AqSXF/EFwOuqnEs2gAIZgED+E2uSKennMyCe6nZd1WyeJRi1eX4y+Gm5mF0floA
	8AwoDj84dERjeLI8cpi2c4hDx+O2+4oWzkUDyVCVoy4nJRDGpEqd1pGcVeLUM+zW
	NkbMT8yMN+FkebAEEcApgOLNt9etnxEW8P07rHApysFxz66A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s3a49gyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 10:45:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQAjfnl030882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 10:45:41 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 02:45:38 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v2 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Date: Thu, 26 Dec 2024 18:43:51 +0800
Message-ID: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgzbWcC/43SzW7bMAwA4FcJdB4Hifp1MAx9j6IwZIpqhMZ2a
 nnGhiLvPtXZhgLdIQcdSEgfKZBvovJSuIrj4U0svJVa5qkF+OUg6BSnZ4aSWixQolGIFtJa+1e
 qQUsJJhnsOum8lk60F5eFc/m5a49Pt3jh1x8NXW9JMXKtcUePh283U2r44/VlKmuJ577VKLAZQ
 EieOqtNMO3qQ5OoTPSV5vH7e7nPmJLuLwbjCJe40okrbBokZKdUDDn4rOw9lDIfKaL28xsImwI
 FPnbeWBnIa3cH1w4kzjRPuTz3NQbv7aWn80wvfUuuy3w+89JaxWbHjhWlyMmHe1pFdDCmWtP6b
 zKNkRBpiDINVmviT8wQK0MLxrIeD0FZOxjO2jiXJWPoOGSijh07zDqbRMyRULxP9VTqOi+/9pX
 ZcB/rf7dj70GhjQMqjz4MH3sQT9fr9TftIF21fgIAAA==
X-Change-ID: 20241225-dts_qcs8300-4d4299067306
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735209935; l=3210;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=uEmlkNSJO1vXovv36Wf5yHhyYzb0wQGYpLIx/QXKYwg=;
 b=GQtrkmRXOw3XZamqdjMPwR8/JBLidC6xnwQa4Ueb36Zj113n5neaoLREDkci8ErVd+jIlVt0i
 8kI002HXWleCsPMwmKdXkACSDdT96KQBU499v9tG+CYUbc4f1zawiZL
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: biC9LvnvCe-Ep13h92iMiKEl67WadGHi
X-Proofpoint-ORIG-GUID: biC9LvnvCe-Ep13h92iMiKEl67WadGHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=627
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260095

This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
It also enables Display Port on Qualcomm QCS8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This series depends on following series:
https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com/
https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/
https://lore.kernel.org/all/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com/
---
Changes in v2:Fixed review comments from Konrad, Dmitry and Krzysztof.
- Reuse eDP PHY and DPU of SA8775 Platform.[Dmitry][Krzysztof]
- Reuse DisplayPort controller of SM8650.[Dmitry]
- Correct the regs length, format issues and power-domains.[Konrad]
- Integrate the dt changes of DPU and DP together.
- Link to v1: https://lore.kernel.org/all/20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com/
~

---
Yongxing Mou (2):
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
      arm64: dts: qcom: qcs8300-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 204 +++++++++++++++++++++++++++++-
 2 files changed, 247 insertions(+), 1 deletion(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241225-dts_qcs8300-4d4299067306
prerequisite-message-id: <20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com>
prerequisite-patch-id: 33f2488a8eb133431f200e17aac743598508dcf3
prerequisite-patch-id: 7b653ebeaf1ca3f87620ccf7d876e3d1fe496c4a
prerequisite-patch-id: e1b60af8a64332e5f0ecbd3a4ea2b6e090bd97cf
prerequisite-patch-id: b823d744d2fb302e2496eaf0cf0c9c66312dcf2a
prerequisite-message-id: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
prerequisite-patch-id: 367d9c742fe5087cfa6fb8e7b05ebe9bc78d68f3
prerequisite-patch-id: ee0513c070ab96e63766d235b38ee53ca9b19181
prerequisite-patch-id: 970974160bcdc837ccbe5ea3b5dcac582e90bc0d
prerequisite-patch-id: 5b2bd9cc44a529b0b9e5d73128dca5d2ff9f2f44
prerequisite-patch-id: 6a0a81242e1d0f051e3102533bf0191615c6e96b
prerequisite-patch-id: 322540ce6d45c32f813ecef50e5135c6f08d9019
prerequisite-message-id: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
prerequisite-message-id: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
prerequisite-patch-id: 81378ec66ab6e569bd828401c43c4f5af55db32c
prerequisite-message-id: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
prerequisite-patch-id: b798711c6a9bd9c4f0b692835865235e78cd2adb
prerequisite-patch-id: 146c61567c42bf5268d1005f8e9b307ea2af93d9
prerequisite-patch-id: 3ce5246ad3470d7392df23a52b3c8b8bd1662db6
prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
prerequisite-patch-id: e81de8a09467a49eaeb4af73a0e197e4156ce202

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


