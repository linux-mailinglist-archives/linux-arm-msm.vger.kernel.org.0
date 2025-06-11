Return-Path: <linux-arm-msm+bounces-60942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54595AD5248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 12:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5909A7A1E4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE418267715;
	Wed, 11 Jun 2025 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kU4clNMt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB223F404;
	Wed, 11 Jun 2025 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638593; cv=none; b=hJSUJojSdQSlDHwVPHXdLiqGv5Qa+f5YqGuzmXJfua7pUH0F5wmwz1sR9IvDPa3ZdfNI+h1PfcjNqj7+MqUxAYChUOIlwXguCTRLh8ZE8adatbQyHJ6Xn/taVoaRhFPdpiOJl01YMT+QqFDWy/azjBEBh+M4t8cbgcJ6JNSGJZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638593; c=relaxed/simple;
	bh=+Lh2WA+mCURa50Xk69lFYbFMRgESdfHw3F5dmtdL/mM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XMAQQljCJ5I2OKCvMagvBXQZe5bEItj02/ZtjlpPKJMkCYBwnsjey1UJ2P0fSULgZH/9OYSYGHC+xU8WmM/uRt3/9VfR2c3Bjy2+PNDX1EFyzOTwBKpIGhlxIWkeLNEDadQRFjvX4aghzya+JHKZK1VU5dw82esJTLdvhP7sMKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kU4clNMt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFqo010996;
	Wed, 11 Jun 2025 10:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p97Ev2RuE3rrH3D62Y1GwR
	SKc2IQC0Xeb8OQTZxtX3U=; b=kU4clNMtesU1mUmqm05Iqb6JRy9hKe0Iaijz+Q
	66v9oBxM7kk3TjFXydIfjF28K9XB+efNFvYQxCHZsERM8/QCaz8plHav1L0FnG9L
	m9jABMRhSHEsJiJ1l/F/l9PkuU6cN94WRfCd/ky9CMKzhUTRGwgwi8I4bfHcIX8Q
	nZa3zswFkD2zQEA0vWi1O+x2kPpCPn5RNwIdtOE77R6qebaHMKVwtsFkD+O58iAQ
	JUn1tl2nCqHHgqM6WQHaj6DKTdvWzAqC4uyuy3Yjp7/d5dOkvdHjI1wVAGI9GsW7
	M+LITMZYJlLbodXGsIRDnQzLLC9juopZIE6RtRqJ6/MXIGog==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpvaqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:43:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BAgxP8019392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:42:59 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Jun 2025 03:42:55 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v10 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Wed, 11 Jun 2025 18:42:20 +0800
Message-ID: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIxdSWgC/3WSy07DMBBFf6XyGiO/7WHFfyAWfsxQL0ggKRGo6
 r/jVqCmSbqckc+c0fge2YhDxZE97Y5swKmOte9aIcXDjuV97N6Q19IaTAllhRGaH4aYkXd95hR
 UcEm3bkDW3n8MSPX7MuzltdX7Oh764ecye5LnLjPOGS0C8BRC4QZK5gmF5T6RSElJCsY/f37VX
 Lv8mPt3dp4z6Qv7t4GfbTBpLrg1CaioWCLBDfvwv7WUS0aShFLIO4C09pm7PtNYCM5Eytr4FO7
 47IrxADoQFiph7bN3fbax2pPXMpPBhJs+K9WSIYUkvEgR0a59bu4Lc9ad76lcdjIq4clt+5RaM
 mQjpBwRBOLa568+q+YJmnxji7NYUkwKYOPvw5V1ws3Z0NigNYHxUmW7wcKMvc0ANNZopYrJFMg
 sMnA6nX4Bn06nLhkDAAA=
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
	<krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749638575; l=3146;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=+Lh2WA+mCURa50Xk69lFYbFMRgESdfHw3F5dmtdL/mM=;
 b=PacmEHCiEXb333LVmuEvEBgl6fsP09DG/Sh4Sxl2tIuwwT6VZJTf1GFZvuDPuWK44EMLIxZ4A
 NAlPIpA/2p1Cp2+snVIQJrLUSyu4YQjCqFmIgHg2k5A916DHBFxNOQ9
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68495db4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=9Mfdxx16wSnRITkP5VIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MCBTYWx0ZWRfX+93Mt520xwtU
 xF1LZrkjsgzTRV0dn8sHHtL+ocekN7K7hKCt0K0GyMP1PHioYggJTNpubijZaHqmL+7aWGAk54j
 MwlBnki8QeCq2/Ax+QmePF8SL+yx4blNKo+yjG1yqxfLroMTihDnGtlG31iRU6MASQLFywT+osw
 h0maj4DxX6QqPvuQ8+2rbvJz9rbp73oXdsW7eIp4ylzDzcASbDBqSBUPHhYMJrH7hgPCep18YAh
 vgxG9ojEAhoTWeBAcax6f7OJRnWsswfqC2JQwUw34h6bqUPYiIO6SD1wYJWWDPLtK5eIomHvpUv
 nUv3R5AEPdWv4ETuoq0CWx+dg2KWXLjgD2EkZ4D4B7G1s1FVdOkH2YhMfEvBB1BRKTTcuzEgKov
 aMXpHAwdguVyf+M4q4yjaqcjInz6IPounO5SofLlpuCehbkYWCpoAYh92oYg/2kyeBQ/oq8W
X-Proofpoint-GUID: JFkXi9ndG10OiwhqPKx34ka1hLfP_xCR
X-Proofpoint-ORIG-GUID: JFkXi9ndG10OiwhqPKx34ka1hLfP_xCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110090

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
Changes in v10:
- Rebase to coresight/next branch.
- Link to v9: https://lore.kernel.org/r/20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com

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
 drivers/hwtracing/coresight/Kconfig                |  12 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 242 +++++++++++++++++++++
 4 files changed, 368 insertions(+)
---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


