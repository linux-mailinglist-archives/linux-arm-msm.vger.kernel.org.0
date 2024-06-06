Return-Path: <linux-arm-msm+bounces-21975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD738FF326
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2DCD2926EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865F6198A16;
	Thu,  6 Jun 2024 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="he4tNRxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001D17BC9;
	Thu,  6 Jun 2024 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693195; cv=none; b=RuR0Mk7ZUdFLLa2xS7uMJaZusHi5Rl6VUcQWhr/LsBiILIeCN5hU022GSqT5TK+k1kT290SF+BHP+vcIHcX3SqEnhfxG+vCkX8hCJi61IgUHBAGs/Mq6lGPJcdi3LtEWunYgVzxOo2NPj9hCQnL/eTvrsqTkx9SWHInFE2KvvVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693195; c=relaxed/simple;
	bh=D4/sJ7G579ATfdpKyIQhqkiqbzrwiBfBbEjEgztDuto=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EmzQ8ceCxw7bQZY9cEMcHryuZeDXOGujmiqHufEfgqY71YOElJa+kLXE/ChlWoOTGm6r06vQVsap+xAlpe21mGfKZxA3GOodrQGSMafn86w0Jxt7Xqv40s65ALC6fUr/9HiFFMlAamM5/w3sIMhj0uDAAm/X/0pAULT0xZUUBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=he4tNRxK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456995eW015810;
	Thu, 6 Jun 2024 16:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/qrU+GuE1okq3wtihZllgU
	nZf/gejM7uP6FOIwJ0O4A=; b=he4tNRxK+/3NAnFAWMwmcWMAh3oMjBGEWA5d3J
	hjKCcQuXR+DUhJ0o6t735HFPSPbALdKZGaw9q7m7qa2FYKJzmDGr9XE4pskG4ML0
	kO0NDIn6Qzn0UeRkYeCGQJ3g/PblGbEdlSF5tp3IYtqi6lZLPXs+5b0ivjUh6qky
	eyEKKnxvacvvu3K/5tbbqYyhzIvXLXNN8y07FTOJVQAFGOIDPbKWYe5rF9xh3yaj
	syj76oRtDTFQd1n2QZr9yc26mw4kUB1QKh6mySXeJpcfe6M/3ebBsxewFwWdIawA
	QDsGGlsUeHqpDpcdzuGJL3RBOqazjxMjG3v9Ga7N+zlbG/MQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yka7p939w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 16:59:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456Gxotg005966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 16:59:50 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 09:59:47 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v4 00/11] Add missing features to FastRPC driver
Date: Thu, 6 Jun 2024 22:29:20 +0530
Message-ID: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RxXvF9gBkk74CquWFlmVughuB-pj7vFF
X-Proofpoint-ORIG-GUID: RxXvF9gBkk74CquWFlmVughuB-pj7vFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=772 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060120

This patch series adds the listed features that have been missing
in upstream fastRPC driver.
- Add missing bug fixes.
- Add static PD restart support for audio and sensors PD using
  PDR framework.
- Redesign and improve remote heap management.
- Add fixes for unsigned PD. Unsigned PD can be enabled
  using userspace API:
  https://git.codelinaro.org/linaro/qcomlt/fastrpc/-/blob/master/src/fastrpc_apps_user.c?ref_type=heads#L1173

Changes in v2:
- Added separate patch to add newlines in dev_err.
- Added a bug fix in fastrpc capability function.
- Added a new patch to save and restore interrupted context.
- Fixed config dependency for PDR support.

Changes in v3:
- Dropped interrupted context patch.
- Splitted few of the bug fix patches.
- Added Fixes tag wherever applicable.
- Updated proper commit message for few of the patches.

Changes in v4:
- Dropped untrusted process and system unsigned PD patches.
- Updated proper commit message for few of the patches.
- Splitted patches in more meaningful way.
- Added helped functions for fastrpc_req_mmap.

Ekansh Gupta (11):
  misc: fastrpc: Add missing dev_err newlines
  misc: fastrpc: Fix DSP capabilities request
  misc: fastrpc: Copy the complete capability structure to user
  misc: fastrpc: Avoid updating PD type for capability request
  misc: fastrpc: Add static PD restart support
  misc: fastrpc: Fix memory leak in audio daemon attach operation
  misc: fastrpc: Redesign remote heap management
  misc: fastrpc: Fix ownership reassignment of remote heap
  misc: fastrpc: Fix remote heap alloc and free user request
  misc: fastrpc: Fix unsigned PD support
  misc: fastrpc: Restrict untrusted app to attach to privileged PD

 drivers/misc/Kconfig        |   2 +
 drivers/misc/fastrpc.c      | 635 +++++++++++++++++++++++++++++-------
 include/uapi/misc/fastrpc.h |   3 +
 3 files changed, 527 insertions(+), 113 deletions(-)

-- 
2.43.0


