Return-Path: <linux-arm-msm+bounces-59189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954EAC1F77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 11:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CA1E7BC6A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 09:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDF2224B0D;
	Fri, 23 May 2025 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cRNHWilC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E5522422F;
	Fri, 23 May 2025 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991522; cv=none; b=N/7ZI6hIchbL5QrOVC5ye2nqSISwAD36bQxceMdXhvawkPcwYYiRiips7HVT7PRNqg2oYpgvjhZZDYk2sT7ARlpRhA6hOaspJteIfmKCTaGdJunHnMqk/AL/JfGc58eJN3P0P2klB8xVNp969gAoA1P5tWgrQcY2WKd6bqea3oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991522; c=relaxed/simple;
	bh=FrAy0tJnk7Mak9FAW8lOJLYC1KnvoDrOM/ASKVkcCBU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sGkJN3cxiPvBMA+hau/0OhzwZmkm4sPGQinO7Oa3r/l8WWyON/qRt6DjTvZtVHUA+i+gho1QtQRmF6iwIay82YiGviMgFpAViqutT5vi0koc6qwGEv8vIJPoatRPh0uOZTSG206SjohXU+1hJRSD2UX6frE9x5kSecCLhuQwRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cRNHWilC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5RbwR024810;
	Fri, 23 May 2025 09:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FrfI2bCz88WNHe2cbvArww
	GF45NBgaj4UqSXpU1g/+w=; b=cRNHWilCNYTDFCgT3Olc/4+XosPuiWSgLoYw/K
	icQq0zmUaOoGlrRKuDYW9uBHpQJf4KOADhQDIJyz8tbG21weNBwV/ImeCJn6e4Y4
	PALPgYvapC4yhBiv3sxG0yQPJ1BhVJIDB/JqVkOq4M8zrsNMY+lIy2v/HKDvokTv
	IhEOsR90JfkJrSEmn6EyozBBvfQn8S1lHQ1KJmOKhdz83VndMTafU45TM19HknkJ
	o/ITAUByTBUeK67K8R6Jkkx3jcODJ/piWsHH8/omLbePEbr3w1NDcc6TPK+NAn5K
	HQbirrupS14fTamVNUShxS+syzQup/DSPmC/9SLauki2lNJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf51da4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:11:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54N9Bhxn002477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:11:43 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 May 2025 02:11:40 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v7 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Fri, 23 May 2025 17:10:58 +0800
Message-ID: <20250523-trace-noc-v7-0-d65edbab2997@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKI7MGgC/3WQy07DMBBFf6XyukZ+28OK/0Bd+DFDvSCBpESgq
 v+OG4GUJu3yjnzuufKZjThUHNnz7swGnOpY+64Fv9+xfIzdG/JaWmZKKCuM0Pw0xIy86zOnoIJ
 Lul0Dsvb+Y0Cq33PX66HlYx1P/fAzV0/yemXGOaNFAJ5CKNxAyTyhsNwnEikpScH4l8+vmmuXn
 3L/zq49k57ZvwV+sWDSXHBrElBRsUSCG3b/v1rKNSNJQinkHUDa+sxDn2ksBGciZW18Cg98dsN
 4AB0IC5Ww9dmHPttY7clrmclgwrs+K9WaIYUkvEgR0W59bukLS9Zd/1O57GRUwpO771NqzZCNk
 HJEEHi78XC5XH4BOcbvVGQCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747991500; l=2701;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=FrAy0tJnk7Mak9FAW8lOJLYC1KnvoDrOM/ASKVkcCBU=;
 b=u8gifLWx5l9HotxU2drrqWtRjaby+07t/IWTpGbBdPxgH9/dHeGediWlpFVhlHlDnfaNOX7j0
 AQWD8688O6ABKULc3yYv3hFjZriwVlQiS9Lyo4zdGUDJY4vKkGcQwBc
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HT1w-fQlPVzhydqLoJMZ2yN3cUtdlKlD
X-Proofpoint-ORIG-GUID: HT1w-fQlPVzhydqLoJMZ2yN3cUtdlKlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA4MCBTYWx0ZWRfX4X34X0vGl1wy
 AM/FKciEzAmCQhvbYDqfxn8yC5H96W3/kLdljsaS+bhQK+8f1/Yl+xYmgAmdbFPiyDQ0MoM/JxL
 QGTi+FEdRJEAWFmxrwgbOoI5vnyFKyStUYMDb37xl3b8DgQKHTP2X4km05O/rJ7IIEXcmucawxR
 uCmLiXpj73eGrzhfgaWAXjPRRTOubNPXBtTNk+i/YwdImKZhy8MrBgXZNGubuPrQUdr9E+vYTHE
 6Ix0IIdfYBQmDvrkodAo0xdceugJak4Pv4MdAXiAtx+RQlyoUquUrmmy2dunbqbvrCIRbo5+rSc
 xTRNwQHbOMhObyNi/ZZNwgVtpOAuN8xdoDgaFb4TH6KNbuLzV2N1E2OnFlZhwE1UpIERPyrbm3c
 X6ncpTPOecg7iquIJuSdPn0plmasFz5FUFx8qHadS+0s1oZdAcJr5dhaDh8UJboPDxQx/K2N
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=68303bd1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=mTvmQVt1wvC56TrAcpsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230080

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

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 +++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 216 +++++++++++++++++++++
 4 files changed, 341 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


