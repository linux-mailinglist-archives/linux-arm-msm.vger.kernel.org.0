Return-Path: <linux-arm-msm+bounces-59014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F179FAC069C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 272AA8C7EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 08:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB31262D0B;
	Thu, 22 May 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kEEtRFEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F34262813;
	Thu, 22 May 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901300; cv=none; b=oi7fxV32P7Y6UpU78pCz592PhIO9mnWkpzk9V1akBB6TmzZ69SDuYa5OcHPDKFIoMQ8DxvL5hGZ228fns30TcGb75T3MDDWOSjsZpnhuGlXU8OaBewV0OdY8USGBHH+9rkmLYm4kmn0SeLP7WlrHk/hkhdoyhsRWFtNJMoTQzK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901300; c=relaxed/simple;
	bh=/5orV/XuyQ188kqTJstZ9x3OIt6Qg3KhrCHbf5wtBuw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lUUX+qx+rbR22hXlUESLTEquBo2EKiXyUFZdpgoImlM4rb6fNDVMsIr+5x8yF0tQwaetffGHyn9uBmHj08RsNvq8PQZNGmU+JKSrRsINmCeOiw2GGe8VuklkK80QoFsq4zNwo9ek+Exx7WbLbLaAMrdzqHpCgcEHALdYQtHTTjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kEEtRFEh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7lU6Q013430;
	Thu, 22 May 2025 08:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CFZgUtYdYsycQZXRwHSAC3
	letH7vP1Okh5WWXNbEeuI=; b=kEEtRFEh7l5LRXmA7kEbaoeo8pCY0gmHIFmcn3
	dGGzTPKc4D1Vqtxbmm1yux50wu/M49JPl8oAZZ27RcYFtlU5X7gg3uZC3QGpwXRC
	NK0atyg09GfFM1e4LWCr3IYyHrwD6m/nfUV3U6jY6VEYPyC3x2VzJI2BkT61T9L5
	H5xV+ww48M20QSzzfqlb2UDpcjMvgF9EA9I0adrU5Ci1hIAr0v5xmicr/18Exw6c
	f3lkrIREZuh3y3xR1mCgNTL5HaaFUOUhQE8Uh2CTLdd8oYxinSjjvForpU0OcXGs
	AMXcxcOwAlL9EHgtyn2T/g2YCNVaSfYK2DXneu14gfrqrCpw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5dnx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:08:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M8825r026139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:08:02 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 May 2025 01:07:59 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v6 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Thu, 22 May 2025 16:07:50 +0800
Message-ID: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbbLmgC/3WQy07DMBBFf6XyukZ+e8yK/0As/JihXpBAUiJQl
 X/HiUBqG7K8I597rnxhIw4VR/Z4uLABpzrWvmvBHQ8sn2L3iryWlpkSygojND8PMSPv+swJFLi
 k2xWQtffvA1L9WrueX1o+1fHcD99r9SSXKzPOGS0g8ARQuAkl84TCcp9IpKQkgfFPH5811y4/5
 P6NLT2TXtnfBf5qwaS54NakQEXFEincsMe/1VLeM5JkKIW8CyFtfWbXZxobwJlIWRufYMdnN4w
 PQQNhoQJbn9312cZqT17LTAYT/uuzUt0zpJCEFyki2q3PXfvgmnXLfyqXnYxKeHK37DzPP9OmA
 pMwAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747901278; l=2483;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=/5orV/XuyQ188kqTJstZ9x3OIt6Qg3KhrCHbf5wtBuw=;
 b=eCf3v7aNs5VzvxYjrp+p4yFhmeF7v8QiFrkp05s+DPCQ34q9ELZKRwDW1Ad4OGS5vmhFmUCEc
 erNvc6hkPLRC/PqZ0XVlw6puenQF8DU/0afRIy/NoaxatWqkmsmKQaf
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4MCBTYWx0ZWRfX9YjrcxCyAV07
 ghiZDFs4S9SB8uBFIhyd1dxzfZNm5jpN77TU+GR8VlN8ywPK+kXEwCZHvd3pAi8Exzi80QFuE8M
 WEfg8R9JrelbteK8cEXmGKh1t4Ko2Pw/E9ueaeukQCbfz+29FoVvoCSWeH1altqUqj8tPGTULy0
 oRuYBskONsFC8bHXPn8t2/4tLxyIWo35RbupAP31WdB9U3m3BreVavo3/HafsOVnV59zcTWy8mH
 4CQK7/R8PB/tqV3tr6j4ZYqU26c7xiOaJiCqJUI+byFe/HeqAQ1+ayCPcnFyYRkqrpgxuqt23fF
 ty5COVL69ezMDvfe44dJq2Wb/oyZw3m0Neev4mhV7mbOUs1Ij4ax9dzBrX9nSw3JnZEVATu6uxC
 zR33ApasEFcMNQAxHjFzreeNb6xt7Odel2SbcvXy3MHfudumr5KoNnFjPWMOYSVWUK59Ub5I
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682edb63 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=mTvmQVt1wvC56TrAcpsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: D0sYSUppniMUAg7qrlw2sawb_-KIqV1x
X-Proofpoint-ORIG-GUID: D0sYSUppniMUAg7qrlw2sawb_-KIqV1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220080

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

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 ++++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 192 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h       |  34 ++++
 5 files changed, 351 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


