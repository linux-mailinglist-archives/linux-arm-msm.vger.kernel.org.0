Return-Path: <linux-arm-msm+bounces-21324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F43A8D6718
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91E441F25A53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2634158D78;
	Fri, 31 May 2024 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="da0K0Pyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D422135B;
	Fri, 31 May 2024 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173946; cv=none; b=dNSWiMWn1a2PQhLxX4yJbXpwtOKytCFtxX+wwPqKCOJ2oTcpjBEgLER6C++T61FCq4jbKE0qWGIKQSI9Qfv4PULdWzX8+atcaZFwZUaWAipTi1fV8fnAz1TGLyAUb5pQj5z7sQC1oZZuCJvyUnY6tC7kQEuS3gtuXQuDuuZtnmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173946; c=relaxed/simple;
	bh=9ZGyYiqIe9YBKccu9aVX7tFCEevFRWtYp/GVAzLQ7eE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PI0E+b8HE/88E4bdcxQZQpNOzlPDnlx4h5jJeC0TMDZn1qxb9Fk8EcfC63A0kq8UnkkModxytGRf81EFRIeVNayXxRSbDJdgQydapRK8yAikBaVHN2N4Gke3VduSlAX9MeYhOavlJCJ6xzmmsKsaEoyEHf2gUDcIqkfkeJJ3doY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=da0K0Pyo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9pLYm002217;
	Fri, 31 May 2024 16:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SxcHMvjlVyGvXa+aKGe+oOvQ+0ImX/B+Xhu
	V6t49JaU=; b=da0K0Pyow5EDGX1PonsKfxeQcTqzC00VVETH9nIUD8TkT9k2cum
	qdR99u0aZSeE7ovISNLtZhooPoBLDO5TzW1jCwW63yKs7ULAbHuAlOXiGawoRdTl
	yGAtfju0k7ztV6z/o4oxVNE7uALPhP2UOhiNz2M9bJli6gaTBaZL0RnBfmCH8GIV
	Dl0FFwiJGRf4qSEEqEgeqwap1IszPTBWtVL6rRs/rAhbzfDG+MV0svqqSr5/23dJ
	2idN/wBuHbDBpJ8bKAo5N8bTKMTTcLPbYGVDdlA6tBr5LrUmLY3ovVV/WNRJC2GS
	90XFNa5vFCwBIZAK8YpEBi9p3wqwCkTbxxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfc9nh128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:40 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44VGfCpP026789;
	Fri, 31 May 2024 16:45:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3yfd4ta3an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:39 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VGgLOx027988;
	Fri, 31 May 2024 16:45:39 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 44VGjcbw000483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:39 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 49D0A658; Fri, 31 May 2024 09:45:38 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: [PATCH v6 0/5] LLCC: Support for Broadcast_AND region
Date: Fri, 31 May 2024 09:45:23 -0700
Message-Id: <cover.1717014052.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JHled-lritcTTLGDqSS0DcgTXmptPPOT
X-Proofpoint-GUID: JHled-lritcTTLGDqSS0DcgTXmptPPOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=796 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310127

This series adds:
1. Device tree register mapping for Broadcast_AND region in SM8450,
SM8550, SM8650.
2. LLCC driver updates to reflect addition of Broadcast_AND regmap.

To support CSR programming, a broadcast interface is used to program all
channels in a single command. Until SM8450 there was only one broadcast
region (Broadcast_OR) used to broadcast write and check for status bit
0. From SM8450 onwards another broadcast region (Broadcast_AND) has been
added which checks for status bit 1.

This series updates the device trees from SM8450 onwards to have a
mapping to this Broadcast_AND region. It also updates the llcc_drv_data
structure with a regmap for Broadcast_AND region and corrects the
broadcast region used to check for status bit 1.

Changes in v6:
- Update commit message of driver code patch to include problem statement.

Changes in v5:
- Add additional check to remove warning from devres.c on older
chipsets.
- Carried over Bjorn's and Krzysztof's R-b tags from v4.

Changes in v4:
- Updated Devicetree patches' commit messages to make problem statement
clearer
- Resolved Konrad's comments on driver code patch
- Updated v3 changelog to include dropped R-b tag

Changes in v3:
- Removed new example in dt-bindings patch and ran 'make
DT_CHECKER_FLAGS=-m dt_binding_check'
- Dropped Krzysztof's R-b tag on dt-bindings patch
- Use of ternary operator in llcc_update_act_ctrl()
- Add comment before initialization of Broadcast_AND regmap in probe
- Move DeviceTree patches to the end

Changes in v2:
- Added an additional check in the case old DT files are used for
above mentioned chipsets for backwards compatibility
- Moved addition of if check in llcc_update_act_ctrl() to a separate
"Fixes" patch; not part of this series

Link to v5: https://lore.kernel.org/all/cover.1716228054.git.quic_uchalich@quicinc.com/
Link to v4: https://lore.kernel.org/all/20240329-llcc-broadcast-and-v4-0-107c76fd8ceb@quicinc.com/
Link to v3: https://lore.kernel.org/all/cover.1708551850.git.quic_uchalich@quicinc.com/
Link to v2: https://lore.kernel.org/all/cover.1707202761.git.quic_uchalich@quicinc.com/
Link to v1: https://lore.kernel.org/all/cover.1706296015.git.quic_uchalich@quicinc.com/

Unnathi Chalicheemala (5):
  dt-bindings: arm: msm: Add llcc Broadcast_AND register
  soc: qcom: llcc: Add regmap for Broadcast_AND region
  arm64: dts: qcom: sm8450: Add Broadcast_AND register in LLCC block
  arm64: dts: qcom: sm8550: Add Broadcast_AND register in LLCC block
  arm64: dts: qcom: sm8650: Add Broadcast_AND register in LLCC block

 .../devicetree/bindings/cache/qcom,llcc.yaml  | 27 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  5 ++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  6 +++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  6 +++--
 drivers/soc/qcom/llcc-qcom.c                  | 16 ++++++++++-
 include/linux/soc/qcom/llcc-qcom.h            |  4 ++-
 6 files changed, 55 insertions(+), 9 deletions(-)

-- 
2.34.1


