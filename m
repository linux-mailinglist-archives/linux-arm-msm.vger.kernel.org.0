Return-Path: <linux-arm-msm+bounces-60455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF15ACFF1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA38D3B171F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 09:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00735286435;
	Fri,  6 Jun 2025 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FciFhVUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E32857CC;
	Fri,  6 Jun 2025 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201589; cv=none; b=VBxlVuJXRW7vreWPyf62JiNx8y6VdF6ElzGHJuUaHdJj+jAkfcxekLbnC+3rz3kRmf+fY7qBQsOG5N0+VHUNPA2cVumwSuvdiJNa9LyptH1u7oxoecaUjm8vjmviP4oBFiVrDMumiFLA+RDHmxmF1Iw/DvzqDUCicnW5Rb/qefU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201589; c=relaxed/simple;
	bh=HCdZXkJVdFAD/787OHeh5y7XaFGKJ1apVCd0Ow6+kLA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nfPBU5tg+mKYBVfZEq+LiJJzYDrDIdsoVX472d468B06NsOZ95HkNsmlJzCqqoKjKt5hCJ+tKeCaLmDnoWjGdcIPZLz5sBj9eNr3jKhJ5BwXnbAzNHwlEUqYHgSm10Ax878Bvv3izBxeo20Gxup5bzKctE1wQ31Hin5Ypa/pIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FciFhVUQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55669mgH000728;
	Fri, 6 Jun 2025 09:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2uvokoWhArahra63UIONt
	eoCvhcb0KNHvpujTov/kw=; b=FciFhVUQxIs+I8Av54H7ttcS2mv2kVyqvBRLTm
	4AZEhzXZMJFPrN/wlzzDHen9WkhU6tvz9GuUUgj3u6c5ZD0GiZPsNMnxD6n4kwq9
	0wGn6bNuaEgcVlxj9q9tssbfbD+efOSNcbtrwv/p1LrHJSkJFH25XB1mv3ARr4Xb
	C0u6cWGsFwX2mTQFt7DstD0Y1GVeFFEHRzqyH2RvwrNo1Bo1Frc+oOTqJci5vayH
	rI8v5MqCVMJa+zhB+AUKoW/gVq3ZLQMBZkVsRRr8vV/sgRZ+FEe0DVERf3KEK8gL
	/sOJ/XZ+vfI8+wEC1FnvAx8u6YNp9KwOI8HduASTmauqICNA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qc529-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 09:19:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5569JWIF003365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 09:19:32 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 02:19:29 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v8 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Fri, 6 Jun 2025 17:18:55 +0800
Message-ID: <20250606-trace-noc-v8-0-833f94712c57@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH+yQmgC/3WSy07DMBBFf6XyukZ+28OK/0As/JihXpCUpESgq
 v+OW4EISbO8I597RrbPbMSh4sged2c24FTH2ncthP2O5UPsXpHX0jJTQllhhOanIWbkXZ85BRV
 c0m0akLXzxwGpft66nl9aPtTx1A9ft+pJXqfMOGe0CMBTCIUbKJknFJb7RCIlJSkY//T+UXPt8
 kPu39i1Z9I39mcDP9tg0lxwaxJQUbFEgn/s/ndrKZeMJAmlkHcAae0zmz7TWAjORMra+BQ2fHb
 FeAAdCAuVsPbZTZ9trPbktcxkMOFdn5VqyZBCEl6kiGjXPjf3hTnrrvepXHYyKuHJ3fcptWTIR
 kg5IgjEtc//+aya/6DJN7Y4iyXFpAAWb3+5XL4B4xqJMKACAAA=
X-Change-ID: 20250403-trace-noc-f8286b30408e
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749201569; l=2842;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=HCdZXkJVdFAD/787OHeh5y7XaFGKJ1apVCd0Ow6+kLA=;
 b=kDO15x5CkKmyKCUMfen9o6/HDXdyNQ4ZEFEaHZeNEGRDFFDisZXh49se3hRz06Ex8IHM8Tx25
 Vx7V4Tej6TgByaxzdUTfKhmgzyfdmlD3g1/nZy/iEfah9CDaIxiq/mP
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nLiWfr9hF0g2ACBS6d2_NNIBJS67AkPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA4NCBTYWx0ZWRfX0HWzfIJll2No
 +u0XoqphwFpFQeKkrz2/tnPiCmd3Hu7kk/lrWY03rGdmJYq9BFZyeh6UaUEo/KluUZdlMirbYNT
 DtixrdOVS1KEtrX3n4EJW2poYeKtXecFHkMul8l/OVBA8ZnrTL3oT7ya/reLCTyP5gCz8iU3OpR
 +4IebS6wgHKryjClxYQ3rs3LVNXMs1qnCONG+PW4DU3wl2SQCTV5AzS2c4+2Hsa1SedRYNcFB45
 Aw7YEKMlOW65ghm6LlePIfc5QII9Bq4IveKzCsn5bGReBLT7cD70DzJg3fvL56nE9sNQSIdl8bH
 rjWL/xpPkRpHvX9baA0b8FMBo9IBBucKXi+ww+vTHE32VtEH/lmndSSuIMjrTemCNxb63/95WjS
 pr3Owr41BihoLaDPt/gRSGTkollfaWQu2ij/8RDOjd+UWRbHd2FtjS5UgU6O6AzcMryefHnr
X-Proofpoint-ORIG-GUID: nLiWfr9hF0g2ACBS6d2_NNIBJS67AkPp
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6842b2a5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=mTvmQVt1wvC56TrAcpsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060084

The Trace Network On Chip (TNOC) is an integration hierarchy which is a
hardware component that integrates the functionalities of TPDA and
funnels. It collects trace from subsystems and transfers it to coresight
sink.

In addition to the generic TNOC mentioned above, there is also a special type
of TNOC called Interconnect TNOC. Unlike the generic TNOC, the Interconnect
TNOC doesn't need ATID. Its primary function is to connect the source of
subsystems to the Aggregator TNOC. Its driver is different from this patch and
will describe it and upstream its driver separately.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Changes in v8:
- Add sysfs node to expose atid.
- Link to v7: https://lore.kernel.org/r/20250523-trace-noc-v7-0-d65edbab2997@quicinc.com

Changes in v7:
- Move the content in header file into coresight-tnoc.c.
- Use scoped_guard() to replace spin_lock().
- Invoke coresight_trace_id_put_system_id() for registration failure.
- Link to v6: https://lore.kernel.org/r/20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com

Changes in v6:
- Add a newline after return statements.
- Use 'x &= foo' to replace 'x = x & foo'.
- Use 'x |= foo' to replace 'x = x | foo'.
- Link to v5: https://lore.kernel.org/r/20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com

Changes in v5:
- update cover-letter to describe the Interconnect TNOC.
- Link to v4: https://lore.kernel.org/r/20250415-trace-noc-v4-0-979938fedfd8@quicinc.com

Changes in v4:
- Fix dt_binding warning.
- update mask of trace_noc amba_id.
- Modify driver comments.
- rename TRACE_NOC_SYN_VAL to TRACE_NOC_SYNC_INTERVAL.
- Link to v3: https://lore.kernel.org/r/20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com

Changes in v3:
- Remove unnecessary sysfs nodes.
- update commit messages.
- Use 'writel' instead of 'write_relaxed' when writing to the register for the last time.
- Add trace_id ops.
- Link to v2: https://lore.kernel.org/r/20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com

Changes in v2:
- Modified the format of DT binging file.
- Fix compile warnings.
- Link to v1: https://lore.kernel.org/r/46643089-b88d-49dc-be05-7bf0bb21f847@quicinc.com

---
Yuanfang Zhang (2):
      dt-bindings: arm: Add device Trace Network On Chip definition
      coresight: add coresight Trace Network On Chip driver

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 ++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 242 +++++++++++++++++++++
 4 files changed, 367 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


