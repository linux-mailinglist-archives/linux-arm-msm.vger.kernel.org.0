Return-Path: <linux-arm-msm+bounces-60928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD57AD4F3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 11:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A47F3A8B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 09:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF4A2949E5;
	Wed, 11 Jun 2025 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oBoLnv6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B16293443;
	Wed, 11 Jun 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632448; cv=none; b=cjXDhV/NGIpt2F/sGVggdw4Qlk5L9HoamZnSEYgKydgVIm9B67BQPqMiU/xeVVwIXBC/YmbBY8j5nwGdcRaD6WUu2Jsbw0zjueMPvogUvaNGCyQVRW5s4p85wptnR4wXMbS8ZrFyPxTqiF5PotgnJSca8z7QNpANm8Ghl/QFNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632448; c=relaxed/simple;
	bh=akM+M+oPQt1HA0jM4drJhZdXjLtVHf+La9CDawh1sVI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VpAcIJxUdFdLJaMcd4nIj6LTWUHkj/n1ZqSZashq6oQeGvqWylvsLXtVz2Fr/W2lzu3YIOOMnn5usSYAAH7NlgM7mwN244xkGoV/J2E557/Vx7J1c1zXWy4D9sJRQ5Cy+qLiKKqFL2ER6bI3zpFaW+a5qBlQdoWxFkwx7qfpUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oBoLnv6K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B89M8r022355;
	Wed, 11 Jun 2025 09:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NcLkPFlCCgEjf/9frLpBnT
	l/E+oAWzqavoBgfIcs71I=; b=oBoLnv6KlbQ0sG8PZDPFFdUL18Vp0Nq+ofOdmf
	evT5nkMMJKtK5eKdqwjzek3HM1k2Se1CLCjfQ7XXJIjlyYRPbtosgovl6uKuSGEb
	1XcGi8DOOF8p7ITFVgYuiCpx6ZGk1Fk7xQwKNb9gsTyLg3b2ogRBNeeJLZ2VR4tv
	hh8cseB2N6OR3AC+S5OSUETaX1ldhLDuQfIR+QzZQ34bq32Z16LhUrvnlV4YJF5x
	BjeDIbWPTTrPKWkvAD75KsSZImxYarHiXV9YNsDH3zO7lLSQg1NB746tmGDVSs+Y
	IAEvn77BKTw8r2MbZyC1X/HWq50QJzZxKQUV1Zq/p5DzASug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpv0sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:00:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B90XGE010920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:00:33 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Jun 2025 02:00:29 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v9 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Wed, 11 Jun 2025 16:59:45 +0800
Message-ID: <20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIFFSWgC/3WSy07DMBBFf6XyukZ+28OK/0As/JihXpBAUiJQl
 X/HrUANSbu8I597RrZPbMSh4sgedyc24FTH2nctwH7H8iF2r8hraZkpoawwQvPjEDPyrs+cggo
 u6TYNyNr59wGpfl26nl9aPtTx2A/fl+pJnqfMOGe0CMBTCIUbKJknFJb7RCIlJSkY//TxWXPt8
 kPu39i5Z9IX9ncDv9hg0lxwaxJQUbFEgn/s/m9rKdeMJAmlkHcAaeszd32msRCciZS18Snc8dk
 N4wF0ICxUwtZn7/psY7Unr2Umgwlv+qxUa4YUkvAiRUS79bmlLyxZd75P5bKTUQlP7rZPqTVDN
 kLKEUEgbn3+6rNq+YMm39jiLJYUkwK48fbhyjrhlmxobNCawHipsl2x8zz/ADWXE9/cAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749632429; l=3002;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=akM+M+oPQt1HA0jM4drJhZdXjLtVHf+La9CDawh1sVI=;
 b=3y6MlUrvYqRAQMJLSLhxMGC2e5Pgceh7ggaVvyN/D2WcceroCo3ymtWa2dw28DBHTon7jNjPm
 G7Ql7YWxS9VCM7dcOCuxOX5/fpm28byXfPbPcLU6EJFH/d6lWtmGU/P
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684945b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=mTvmQVt1wvC56TrAcpsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA3NyBTYWx0ZWRfX2nZ/n7sPP6rR
 2+Rh2I7W+UN6y3lm9WSeHtr44FuQVX0tQzZI5wwC8orwTYp9QWgk22N/7KC/N0IZIazLmcuNv35
 ThkSNk3c+8mhUX8Y6ELEX6OFLXXG+hdMJG5SKJOiS7FX2GQ3j1zTH7UDYZhZnAW9jF6GquSZVxH
 iUWZWqNXm/Fbi4l1LuuY0cZZvzQ7a9sQUIHCDxKh5y3l4+20+GhdslRwqylrME9dyFHsxPil+ul
 azGJS4DVlK3vpIE0VAqEerX6j5mPjD5ToCCPTuijMOFH3QzH7K1fW7HB1JgMRO/ATT7Epv3m//q
 YAH+rhpYRAmAN5q5i7LazgqrXUODsSmRoZgPtQ++A1IBkTykw9WZwUvRQLJYHPoHS3SwOmfkYS3
 7/flwQm4xtdDDJ0tiIDpS+rmHnG+TDWhYvJ500GOeN/vb7chv7OpYdKa9DHNzdtS6CD2RJ1Y
X-Proofpoint-GUID: Mue1ykSMt5nhkcmOsdE3y8uRlzdRZ7cp
X-Proofpoint-ORIG-GUID: Mue1ykSMt5nhkcmOsdE3y8uRlzdRZ7cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110077

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
Changes in v9:
- Mention the binding is only for Aggregator TNOC.
- Link to v8: https://lore.kernel.org/r/20250606-trace-noc-v8-0-833f94712c57@quicinc.com

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

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 ++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 242 +++++++++++++++++++++
 4 files changed, 369 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


