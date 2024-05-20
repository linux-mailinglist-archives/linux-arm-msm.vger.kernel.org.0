Return-Path: <linux-arm-msm+bounces-20085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC38CA392
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 23:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95535B21EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 21:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C29B139CFC;
	Mon, 20 May 2024 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Uc8iRJ8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF301D531;
	Mon, 20 May 2024 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716238829; cv=none; b=W7DS3Kb12nxlc8VmY//MNEe09nT7hzsEFPpRz5qHbjzdQhmhOanf0WQIvdJ9pzqyolx9LxLznIfUZgXwBpAx2zYh7zwLwduegS0rI9lRSotZnxq+hSDg3K9ZNmQ/+52+NiFQqF/UYTqU6SGSH6ArcY0cyNfKh2w8tZFcCvJI6KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716238829; c=relaxed/simple;
	bh=VSvQmWvyt6XRwDpuefCejKD5GszkJU4qsziRsiQDp+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q33+LRvapFasCCoudyrchUYjFfLn1O0idUlz5wUEPW3fspkSyKUw/fdSJh8NHm6HZq7kgn5bguupDTe4Mr27K3vJjxT2tA++xEig3uDe+QU/6YQCyK5lqG8qupxo/dP8Ydqe/B/OD/XGOeAhAMpJXcRe/MvjSwRiMpF50c4810s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Uc8iRJ8f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KBCSrG017683;
	Mon, 20 May 2024 21:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=h9HCd7VW5BcLUkkHGNpV
	29+KjvbETXmbZebEgbqw8Gw=; b=Uc8iRJ8f6TSThg1mkOzNOz8P1AFxwsMcFs5d
	nZ3YZTRaA24qD51q2IdiO0GTfI9nP8BrOGd254n/m2dwTlkByTfukGoHn0W9bl5p
	NfOjgn0qZ0Re52gy9+hap7iwDIs3CZnLiV9yy9RGTcnFgK+llLayBbVKv+PZtYUT
	UH5sl1q8EjmDoSN8lUrhmZpuqoopTxWRi0mjfEcU8bneUVghC+j28JHerzNjNfsB
	4MBVGprh/CICWsjz7Ir01nJE+NDjh7wXgCoCi3oNDWHMLmbwmB8K4dURymD41f4l
	SgdysXAguX+Clqm5wfjvsoIkUerHqY6KdsABC1kk+XV+4QCUAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3tcs0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:21 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44KKrfMF021080;
	Mon, 20 May 2024 21:00:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3y6ndkhevx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:20 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44KL0K17029567;
	Mon, 20 May 2024 21:00:20 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 44KL0KbB029548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:20 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 2D055641; Mon, 20 May 2024 14:00:19 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: [PATCH v5 0/5] LLCC: Support for Broadcast_AND region
Date: Mon, 20 May 2024 14:00:12 -0700
Message-Id: <cover.1716228054.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-GUID: dIZyef9vWObOtM2uykA6U2Dltx6wyM01
X-Proofpoint-ORIG-GUID: dIZyef9vWObOtM2uykA6U2Dltx6wyM01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_11,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=808
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200167

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


