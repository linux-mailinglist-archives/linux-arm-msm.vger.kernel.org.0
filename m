Return-Path: <linux-arm-msm+bounces-56035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F15AA0431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0A3B1A855FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADEC275878;
	Tue, 29 Apr 2025 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DMpTmpM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5B1F6694;
	Tue, 29 Apr 2025 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911147; cv=none; b=ft6RwJ0nuGfRcnF3/ar72L65hNesE2piPg4W6e2LBAlpMJnmx8KeS9Wi6wcQrWdjY0mmsqfvPFa2fnKxVGKGmVAZJdaP4k/EhiPJclhwm1Nw21WNKn4ri7REO74IjS1UJzuD3VlzLCAg8Otb6j05MTLotvcjwjaIJZQOsbgxhws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911147; c=relaxed/simple;
	bh=WGsrAAY6+9Enrae+rtfbkLrFdSWE/XhncKtP2rfP6fk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hzeqeQW+0xCZ+JWp+7R2c0/pxyJosvjS+4fuJONbbfPtr7ioin/TS3fd6Xb0VYKc1IXtwiuZhD8edTfm6xSR50Arwx3drR5x+EpioEFj863sGjplXbZ0DG4DHgoeYohTI+3/MYnITqv0M0DLJ+5rNGbN5ZIo8q0jq4cfqnyLWCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DMpTmpM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqIF4025620;
	Tue, 29 Apr 2025 07:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aoGzH4QjgLcKToCB9Hw+Ob
	YgReyc16FZAAig/lxN6OQ=; b=DMpTmpM49a+vKSzFIadDMDvt3OEeccJ4Mc5uvW
	1Acbw8mbl/MolztRcfS0WvBwjd4R2pd61MYtfwzJlTexd6ps24u+9wV7UMLYC2UP
	KWKM5gQ1VRBKWAIk9+GevcfiKHdGneOOr33sgqCrjGmsHs1j+sYtQx/22zw70hIk
	53xR6gDs1Fk1UA7rYY5fopAAPLmyKx9e4uI+G7OnUV6HNfoHbYaEbkLoIzLpePL4
	F5BvQgfnZbNQgrc0d3axvGAHsr5vWaT0ro7wkv/sM/gyzW7krFsgvhH5U6yYbcEt
	GEEC0Y4JhT/dQ/KZXa3hHmFe1RybLIU0G6daWKgCowz6jOyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqktn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 07:18:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T7IqGW007045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 07:18:52 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Apr 2025 00:18:52 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
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
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 0/2] Add Qualcomm extended CTI support
Date: Tue, 29 Apr 2025 00:18:39 -0700
Message-ID: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1NCBTYWx0ZWRfXyM/5xamKtjF8 SguNJEMGCzP19PJyfsNEyTpPJQIlzmUVxR/6xu0/zqRNx7FaaW03hjB79K2dPcASB2Dbs6hokwA JOgxYmRsCoCLM557oTpw8C0z+Jov778IuKWKEvEt+Zzo/V4v40Tpcj3BdyNbjph5MjP9a6Ppqr2
 23e7DaqTWsCOp311HKydV7MnZ0S1lWJ8BaJst4uVMDiamCBSezaDs5RnxrM1aCeKCSJR1xDUUtr jDjyNRRENhuODBu4NYrdOp1whhU0Q2r5HnR9MFfmgF9XKp/B1UNFrtyy+MDwtU0H/ohOHGRBv1d 7bjuBIh6yUlokxTR9dLiT6h2UgunDEBbhie2aQX7xqEUCZqY84a7KfMrzvurXur8cbZolEpXFNq
 645cp4DRln8aJjGC1bddoMFC2n9p1D8WTTyVWXRWCr5O75Xe+ZiW/7MknCqarMBN+Bv/PQ+N
X-Proofpoint-GUID: 4OFxk86Jss1NoNFQwer_mu8keip1_4FL
X-Proofpoint-ORIG-GUID: 4OFxk86Jss1NoNFQwer_mu8keip1_4FL
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68107d5d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VDLssO2nRW9oqwq64HgA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290054

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Changes in V2:
1. Add enum for compatible items.
2. Move offset arraies to coresight-cti-core

Mao Jinlong (2):
  dt-bindings: arm: Add Qualcomm extended CTI
  coresight: cti: Add Qualcomm extended CTI support

 .../bindings/arm/arm,coresight-cti.yaml       |   4 +-
 .../hwtracing/coresight/coresight-cti-core.c  | 127 ++++++++++++++----
 .../coresight/coresight-cti-platform.c        |  16 ++-
 .../hwtracing/coresight/coresight-cti-sysfs.c | 124 +++++++++++++----
 drivers/hwtracing/coresight/coresight-cti.h   |  72 +++++-----
 5 files changed, 243 insertions(+), 100 deletions(-)

-- 
2.25.1


