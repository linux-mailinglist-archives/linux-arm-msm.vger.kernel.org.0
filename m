Return-Path: <linux-arm-msm+bounces-49394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5578A4535A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 03:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7C11895364
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 02:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5683A21CC47;
	Wed, 26 Feb 2025 02:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mGFogO3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69CDEAFA;
	Wed, 26 Feb 2025 02:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537849; cv=none; b=loS9hTA51T925T0INvn0gi9PyV+y43CC4aqXU4GaWT/v7fVZCgbYqSxaRBdM1yTQU328SfPyZJYyD2rWqhEJY7bOKae8vKLSEqyUBzppJOQih+bvk2nFc7CgsHbsyWyMwkpEIdg9OylQS0wX2SWDCEO4RRyLuVCuHe/x8I2vyjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537849; c=relaxed/simple;
	bh=lPk7dpXyiNrE/vbhSnByAi74MBWNVIRlxH2Cjc/aom0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B/dHL1le5FTLcYHtNjqwSL0pFYsMRy7SWD9K2HjCxbCrm1L31Klqmz5kRLiVdtfsYJk/DPbYqLc7DKMJvuaV3Q8SkeF2r6PWXl8X3TzCTb4mFbFAOapB8/Jdu2lDUGgshGqFdQJ2gQbLojdG6tPXyc3JXhZaeHh6TGyYyoNH78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mGFogO3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMXWlk025583;
	Wed, 26 Feb 2025 02:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lxbrvWqdSdg0QKIuWS/73q
	E193+doTJ8U/0htqu4vUw=; b=mGFogO3Dd/wHg1kJYNPvC70YLiT0gQd/h/jzak
	MuCm6M+aROhVLnU1+NMiHznzlJh83KphbWezOcTb1zsB/a5GFKUm2d3XT1dwYkxt
	oLc6blyxwynbaP6qenAt7x2ZcLjKJRmPez6QubTu+OlP6PkMkkkyTHW0hUkYN93G
	IBbU00w0cRTBI/BnpIv5XYEobva+VKBmLJ5VSEW7hTlcvXEGVI09cubj7fYHXi1s
	u7MXnCJRDoz25RAt1de7W5oAGsonEdUcL4VRKy6jwYMfeWle84+ro/zwkGDXNgmF
	EPuW5Rz5eULAhFOyJShAsQEHbxcB8GQ8wduJZVzYLn2hJ/eQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmgfqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:43:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q2huK7021541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:43:56 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 18:43:52 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <johan@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <konradybcio@kernel.org>
Subject: [RFC V6 0/2] firmware: arm_scmi: Misc Fixes
Date: Wed, 26 Feb 2025 08:13:36 +0530
Message-ID: <20250226024338.3994701-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7QsxKzOob-IwZtMBRjVQxkDAwdRUNRXI
X-Proofpoint-ORIG-GUID: 7QsxKzOob-IwZtMBRjVQxkDAwdRUNRXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260019

The series addresses the kernel warnings reported by Johan at [1] and are
are required to X1E cpufreq device tree changes to land. It also proposes
addition of quirks to bypass a fw bug on X1E devices.

[1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/

Duplicate levels:
arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15

^^ exist because SCP reports duplicate values for the highest sustainable
freq for perf domains 1 and 2. These are the only freqs that appear as
duplicates and will be fixed with a firmware update. FWIW the warnings
that we are addressing in this series will also get fixed by a firmware
update but they still have to land for devices already out in the wild.

V5:
* Drop all the patches that have already landed upstream and mark the
  series as RFC to get feedback on adding quirk support for the perf
  protocol.

V4:
* Rework debugfs node creation patch [Ulf/Dmitry]
* Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
* Add cc stable and err logs to patch 1 commit message [Johan]

V3:
* Pick up R-b, T-b from the list.
* Pick up the updated patch from Cristian for skipping opps.
* Update device names only when a name collision occurs [Dmitry/Ulf]
* Drop Johan's T-b from "fix debugfs node creation failure"
* Move scmi_protocol_msg_check to the top [Sudeep]

V2:
* Include the fix for do_xfer timeout
* Include the fix debugfs node creation failure
* Include Cristian's fix for skipping opp duplication

V1:
* add missing MSG_SUPPORTS_FASTCHANNEL definition.

base: next-20250225

Sibi Sankar (2):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel
  firmware: arm_scmi: Add quirk to bypass SCP fw bug

 drivers/firmware/arm_scmi/driver.c    | 75 +++++++++++++++------------
 drivers/firmware/arm_scmi/perf.c      | 30 ++++++++---
 drivers/firmware/arm_scmi/powercap.c  |  8 +--
 drivers/firmware/arm_scmi/protocols.h |  4 +-
 4 files changed, 72 insertions(+), 45 deletions(-)

-- 
2.34.1


