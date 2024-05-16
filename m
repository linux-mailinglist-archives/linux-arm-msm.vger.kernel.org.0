Return-Path: <linux-arm-msm+bounces-19955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C408C7EA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 01:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C281A1F223D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 23:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7633613E;
	Thu, 16 May 2024 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nJ7FDvr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6C273FC;
	Thu, 16 May 2024 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900386; cv=none; b=dGGNU7HaJgIDgC3x2Md3rhFX070tZnOFeANWvT/ZhCTCrU2+neTSrQsHalWlZsL6WKnYWEoRp9VUAGcvEh+wzyWQXLPolLrRf7t+K2QIG2VgwTq+LLIRg2W7PYKB8e8zyKZoE/YRxSPLqGLhgy1isZAwS2zrWtBBSv8THKzzb0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900386; c=relaxed/simple;
	bh=69uarWmzmHKnkRD1y5e85vm0oq19eeBBvnrV6aoQPlk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rjvr4zm6FOgFK8EY7VAV+UTXOU5Ksc+ANqa5aGGFY5ljZYfUZS8JbunSEofHhzYG59a45dQC2mzrV5p1mARPN1hV3cXUWnReZks+UEVWBi1mgDJRsONT1LAKZB7LrmNNHIAk4rG/MRyVxPJx0kiJyu+sYKw2w2JyPfAgcSggQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nJ7FDvr9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKMUBH017256;
	Thu, 16 May 2024 22:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=tFGkOgQk1CQWak
	kHmlHYIl48bNGXvL5BaBkAJN/8WTo=; b=nJ7FDvr9FKYYcrxKYO2Y2HMMg+FY1q
	6ebpjMozEpFZhAAdxp6UW7JGZ82MEDWl/i4331jYz6OjIE3qnyXZM4ab6mauZMyi
	VwW7f+i9x4F6hA1r6IKe+hDNulWCtoc/X2qS2hQkpBNVzZNPWSNyFmlM+7cAubwX
	rni4bmtaUdI01YGWpGghyhqGvUQpiD9GP9PVzuP7b1sJsSfmI9gTTTHeQcwALVM3
	ANHKDsx7dKASr9BmByB2Th3Ll/8XbbU1hd6NNRYjJGuK2+u6AL7wON3+a1VzBtke
	IdxTyJNHlb6mUI/poI0UlNIeewAshNxGvqRgL5pb0srHiDDKk2DrmFDw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28shxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GMx6Jx012432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:06 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 15:59:04 -0700
From: Chris Lew <quic_clew@quicinc.com>
Subject: [PATCH 0/7] Add support for hwspinlock bust
Date: Thu, 16 May 2024 15:58:18 -0700
Message-ID: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqPRmYC/2WNQQ6CMBBFr0Jmbc20lgCuuIdhUYYqE7XFFlBDu
 LuVuHP5XvLfXyDawDbCMVsg2Jkje5dA7jKg3riLFdwlBoVKY46V6J9xYHfzdBXtFEfR6aowBZI
 0BwNpNQR75tdWPDWJe46jD+/tYFZf+2tJ/GvNSqDIW1OSLlGWXVU/JiZ2tCd/h2Zd1w9WPf8us
 AAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        "Richard
 Maina" <quic_rmaina@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715900345; l=2621;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=69uarWmzmHKnkRD1y5e85vm0oq19eeBBvnrV6aoQPlk=;
 b=1uxRXGnN0jTn6ygeG+GtBtrs/pyZD4LD89c7a4az2b2w+xOzJniXhYV/mGAPSJypgpjobItiA
 yV5hiHcaqUKDB4AaUm/KMvaor/Uz6QFFM7Tyzf7xLX5QkjvFN68hQIU
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BoIJKhdQkUTDNXlkXcvRToDio0vuAlaw
X-Proofpoint-GUID: BoIJKhdQkUTDNXlkXcvRToDio0vuAlaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=912
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160168

hwspinlocks can be acquired by many devices on the SoC. If any of these
devices go into a bad state before the device releases the hwspinlock,
then that hwspinlock may end up in an unusable state.

In the case of smem, each remoteproc takes a hwspinlock before trying to
allocate an smem item. If the remoteproc were to suddenly crash without
releasing this, it would be impossible for other remoteprocs to allocate
any smem items.

We propose a new api to bust a hwspinlock. This functionality is meant
for drivers that manage the lifecycle of a device. The driver can use
the bust api if it detects the device has gone into an error state, thus
allowing other entities in the system to use the hwspinlock.

The bust API implies multiple devices in linux can get a reference to a
hwspinlock. We add the ability for multiple devices to get a reference
to a hwspinlock via hwspin_lock_request_specific().
hwspin_lock_request() will continue to provide the next unused lock.

For the smem example, the hwspinlock will now be referenced by remoteproc
and the smem driver.

These patches were tested on an sm8650 mtp using engineering cdsp
firmware that triggers a watchdog with the smem hwspinlock acquired.

Checked for error in dt-bindings with below.
 - make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=remoteproc/qcom,pas-common.yaml dt_binding_check
 - make qcom/sm8650-mtp.dtb CHECK_DTBS=1

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
Chris Lew (2):
      dt-bindings: remoteproc: qcom,pas: Add hwlocks
      arm64: dts: qcom: sm8650: Add hwlock to remoteproc

Richard Maina (5):
      hwspinlock: Introduce refcount
      hwspinlock: Enable hwspinlock sharing
      hwspinlock: Introduce hwspin_lock_bust()
      hwspinlock: qcom: implement bust operation
      remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++
 Documentation/locking/hwspinlock.rst               | 19 ++++++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  3 ++
 drivers/hwspinlock/hwspinlock_core.c               | 52 ++++++++++++++++------
 drivers/hwspinlock/hwspinlock_internal.h           |  5 +++
 drivers/hwspinlock/qcom_hwspinlock.c               | 25 +++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 28 ++++++++++++
 include/linux/hwspinlock.h                         |  6 +++
 8 files changed, 123 insertions(+), 18 deletions(-)
---
base-commit: e7b4ef8fffaca247809337bb78daceb406659f2d
change-id: 20240509-hwspinlock-bust-d497a70c1a3a

Best regards,
-- 
Chris Lew <quic_clew@quicinc.com>


