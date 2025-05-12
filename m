Return-Path: <linux-arm-msm+bounces-57602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D1AB35A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 13:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61E2172B82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 11:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FED26FDAC;
	Mon, 12 May 2025 11:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gikR/UgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989CB2550B8;
	Mon, 12 May 2025 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048304; cv=none; b=AOLjt+r53+2Vf3x8U7gZ8Tx9sIbEve/mCPSmfvqxJDpIlWeCN8ub3h1bb1MWYzyONnhoKxVKZ5gT73JJ6cJPlzzZPvefOGM872nMytYTi7/ngoxy2bNjujdw5qyuesxKQl3h53WenTFgegOvFHlm0fEgflbRWs0VpRYgc3rZSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048304; c=relaxed/simple;
	bh=FI4fHXTigwGwniHI+YHv/YtmYhKfZ1v6wbRpBi5fe/g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=fZNYY3rJTbsjM1p3PRNge6+ViNOZiPLFTL2r9SKTyWnDyhBlkYufI65/j/aXFTeW/Nn48qYvFNuwKFENbw5tSUgv5t/XzyLCA9MOKhzjAvg1LVAdzN4kgVxj7Cn90Hbsxf/I+uzKst7tFr23icPDMOduohZedSY/fTXNnW3WCUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gikR/UgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9SR2u028882;
	Mon, 12 May 2025 11:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w8l+QaBTlwmrF3HXfFvnB+
	cP65SG0RGLM+MaZqPRFmU=; b=gikR/UgWyG9fY/+t9zHJR/4fm604Yk8qPsn9DM
	L4t7jEPW+6dEtcIUMffcf2ElsPa2KemKXNyqrAc2qtQu0QpPUWLGEwLiwSQPcgpy
	Xi4eoFCmsVChskhbj5Ajm24MngVp2ggEsu3J8KXfX773A4oX/fWk2a/YyLVfBmve
	HXKbr2BmFY3dXtLOHt5iVPyA4cg+ld5YuizkhSDRG7GmQ/kVH9RehbX6BH/fNajP
	9dBbK8UdAafpPzKz6Vi1JdhdnxAwoxSraX08re4wgdHRP9US9+TTiSHxv9wAaFTf
	keVazUtoU4a/YKAl5SBMuor6Umo8afm3YqWeZ/fUhfk5p5KQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qcce8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:11:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54CBBLSI029673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:11:21 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 May 2025 04:11:18 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v5 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Mon, 12 May 2025 19:10:36 +0800
Message-ID: <20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzXIWgC/3WQS07EMBBErzLyeoz8adttVtwDsfCvGS9IIBki0
 Ch3x4lAyhBlWS2/eiXf2FiGWkb2eLqxoUx1rH3XgjmfWLqE7rXwmltmSigjQGh+HUIqvOsTJ1R
 oo25XLKy9fx8K1a+16/ml5Usdr/3wvVZPcrkysBa0QM8jYubgc+KxCMNdJBGjkoTgnj4+a6pde
 kj9G1t6Jr2yvwvcZsGkueAGoqesQg7k79jz32op/zOSpM+ZnPU+7n1w6IPGerQQKGlwEQ98Zsc
 47zVSyZRx7zOHPtNY7chpmQhKLHvWblncsnb5G2WTlUEJR/aenef5B8EUVrf8AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747048277; l=2245;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=FI4fHXTigwGwniHI+YHv/YtmYhKfZ1v6wbRpBi5fe/g=;
 b=pylPWcizTRa6hQalcFc+aJb/xN9YqSjzSpXyERI4qBUSexrpy1EcDVE7toX7slseZh2bqSGCQ
 kRS1/84DXsQCQuiCenNj+MJ4T3i9ZrqZqOjMJxExxuRTIChHivOLe6F
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=6821d75a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=mTvmQVt1wvC56TrAcpsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _DDEcYGFIHsEbDcbK5G5GK19OWpfwbNU
X-Proofpoint-GUID: _DDEcYGFIHsEbDcbK5G5GK19OWpfwbNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDExNyBTYWx0ZWRfX52KGBtdRCcnU
 QCJXAdhZhddWsDWa+RunrY9BsJHRFq9hGT9wR3UC9EgGlFuzeKJWGsz18JyAH7UeeGju4BeaY/1
 qt8CHYACh1VrFsL5z1ItlTa2HxKffoHf/ip7sGgzAcRo05jGPQuuSMwJKOhgORu4sohf7XxycBA
 fBZAbdFL+RCY6bhGO0uyxS3+Fbjf+/4Fz10ffg0l2D2g4U34uvqCnJHF7SGKa9ngt7V5wOHJ8B+
 s2K9iVU8dQzIMNUFA/b2PxYCDs4Z57M+ET69kFY2ZFetVbqY0Li4jT9asQBRRiyRPmt/0hQ+7ij
 6NoXT6mRPRYI2/f5viZkadCP2bUyp8nalEeaICpes4cqkJg+QWY9ZNKFbYydv0XD0v3/s7oFvaK
 tThSmXkyfAruYQrNjvJVkmdfwlV+Oa+CJ78rBciRMbtUP/KDb6+5emlyl0aTtmZ/Qxh1E9Re
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120117

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

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 ++++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 191 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h       |  34 ++++
 5 files changed, 350 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


