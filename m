Return-Path: <linux-arm-msm+bounces-40056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE39E1780
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05DB316550B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0CC1DF275;
	Tue,  3 Dec 2024 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VoZzCYFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA481E0DB1;
	Tue,  3 Dec 2024 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218069; cv=none; b=La+lzvlCdr4wvjWPog/5mN7+HXwq8Up338O9GtU77cJ/s7kbDCmujzXH76w2UvUijmyGLXfgP49a5cC1kjgWW7sC/Ub6qsJmoCWNM6joyWxuYT13k3gWG5rDJhO+O/Ab//BwKATElplsJNhJK8C1rDNdxPQ+u28GbtCjbxW4yEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218069; c=relaxed/simple;
	bh=T96BcuoR6g93Ngo3aMuJXGBNQ20OEsJzQg4Jmbm8yA8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VIA3+orw0dH8PqNvBjupCg+lI1GlB0voFlDWXgf86Ifj/HlKIhNDhzzjgsWwp3OfZoC84sMmbR5hMBZzWxvNy35NqUmH/ZqIwsMr5q4SHMQC/HrcusamPu6YGbzMRAMEbE4VTfxiQ2RHn/BxjP+cXYDI0rAdDc+miJ/2hLqhePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VoZzCYFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B362axI027818;
	Tue, 3 Dec 2024 09:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q2RBkO3nvuxlv2gjSgJxbO
	Xgxf5FYdpDETzUvFONTeQ=; b=VoZzCYFppgIvu7pYsHDbWVK3NzkyiOO4YEgb5c
	gRA1mMfulOFXStZ4awltJdmqMdFHjB5NyDyVfBbm45gfJ9+aSwbxMuHXEPIZaQlp
	rgxU/xP5MhtQ38ANoyK1UGb6bweZO/JeBpjFwfAIJEyKbbsKzkRhM079MrVxWuH6
	0FsSbbZSaiNRi9CfpA7djGuOWvLbxqiflfiqpDi07czrbuTwbK/gn2+cGVsE3FIX
	tapaacGrZYZCqoUHI/NjvAjAEuq3wczZyvct25BCpi9UEttxFqDmpklsvQSm9BR1
	6CkFU0ZVMFAi0iWUivlaaoKgTaYpJRpZqQ/F+DOJ+17Vyjdg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vceghp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:27:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B39RdTr014991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:27:39 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Dec 2024 01:27:35 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v4 0/4] Add initial support for QCS8300 SoC and QCS8300
 RIDE board
Date: Tue, 3 Dec 2024 17:27:11 +0800
Message-ID: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/OTmcC/3XP0U7DMAwF0F+Z8kyQnYQm2RP/gdDkOgmzxFrWl
 Ao07d/JOgmBYI/Xlo91T6rmSXJV281JTXmRKuPQgrvbKN7T8JK1pJaVAeMQTdBHrsEC7GSQWeh
 1l+YqmpItGC1nTF6107cpF/lY2afnlvdS53H6XL8seJmuIERw/4MLatAJMkUqiQH84/FdWAa+5
 /GgLuRifjDm4QZjGuOiYweFDDnzl7HfzO16i22M6YgCYeciut/M+dp4ym1aZb7WVj3VrNv+IPN
 2U1zoOFA77wN6Uzrbp8QeEDsCDtGTL7aAadj5C8dzOc+UAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733218055; l=2910;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=T96BcuoR6g93Ngo3aMuJXGBNQ20OEsJzQg4Jmbm8yA8=;
 b=hpZHCYEtZXoBsGltYPA15q+LLQXi9gwAfMaRJ6Zca9sDD2vtK7F7k6qE/KNDhJJk7YV7vj5gP
 EKSBfgo/3bkCH0Z7LVGFZXBXWOeJBVQ4TfOx1k8xddT0N/taCSQem5c
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TuKrq-KOtN24SrnUSjVF73LsKhO6_b3o
X-Proofpoint-ORIG-GUID: TuKrq-KOtN24SrnUSjVF73LsKhO6_b3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030081

Introduce the Device Tree for the QCS8300 platform.

Features added and enabled:
- CPUs with PSCI idle states
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC and RPMHCC
- TLMM
- Interconnect
- QuP with uart
- SMMU
- QFPROM
- Rpmhpd power controller
- UFS
- Inter-Processor Communication Controller
- SRAM
- Remoteprocs including ADSP,CDSP and GPDSP
- BWMONs

binding dependencies:
- remoteproc: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com/ - Reviewed
- qfprom: https://lore.kernel.org/all/20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com/ - Reviewed
- pdc: https://lore.kernel.org/all/20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com/ - Reviewed

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v4:
- fixup typo in Makefile(Andrew & Krzysztof)
- add board name in the commit message of the defconfig change(Dmitry)
- separate cpus into 2 clusters in cpu-map(Konrad)
- use QCOM_ICC_TAG_ALWAYS instead of "0" for interconnect nodes(Konrad)
- Remove unused labels and drop redundant comments(Konrad)
- Move clocks to the dtsi file(Dmitry)
- drop reviewed-by tag for dts patch for the code change
- Link to v3: https://lore.kernel.org/r/20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com

Changes in v3:
- Update title and cleanup signed-off-by tag(Bjorn)
- fix the INTID of EL2 non-secure physical timer(Cong)
- add reviewed-by tag(except for the dtsi patch for the code change)
- code rebase
- Link to v2: https://lore.kernel.org/r/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com

Changes in v2:
- decoupled from the original series
- Drop compatible for QCS8275
- fix property order and add line breaks
- move sleep_clk node to qcs8300-ride.dts
- move l3-cache nodes out of l2-cache nodes and remove cluster1/cluster2
- add BWMON nodes
- commit-msg update
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com

---
Jingyi Wang (4):
      dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300
      arm64: dts: qcom: add QCS8300 platform
      arm64: dts: qcom: add base QCS8300 RIDE board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts       |  235 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi           | 1405 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                    |    3 +
 5 files changed, 1650 insertions(+)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241128-qcs8300_initial_dtsi-ad3f193ce1d7

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


