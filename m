Return-Path: <linux-arm-msm+bounces-21077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9838D4979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 582D71F23BCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3B2176AAE;
	Thu, 30 May 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ja8hHTD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029C169AEC;
	Thu, 30 May 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064449; cv=none; b=tuu85r/j+UZhNmtgvdaD3bUYiLEvyvQTAw/M9EpLmPv7qNajmoxYffkGS0NG1k03Ya+f5uUNInFdjtJnT7I2X03z3eHqney9ClMyjaP88i9om2U5egJhLf9T/K8+Vl9rsVYAJGiw1xbDQdkNYqH5HTpgi/HT9Vn/O/rtMEwXzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064449; c=relaxed/simple;
	bh=X6yULDb5Q4np7YwYvsB5/phufIqg+HnW8U4B/6CiPzU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G3fuoc3uUOaHRTfMayc89Kj0XzUWgrnUGuAvBSWZz8ZBmvmPK7QN/cr/PjVD037Ac7Y/RXjnWUfq2ryf5542/KQY4LecX52I2A0bMtBdED0UP2ScaFrAcDhY86QFj43xl1RppKKwCZo0Z0bvqDeFBNBvD0rI6D8esh5plAt74II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ja8hHTD7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TMuvNX016844;
	Thu, 30 May 2024 10:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ultLYi/rM3daNOi+9Cb0N+
	7i/j8LC6jUNavdEC4qz2Y=; b=ja8hHTD7sevflaXy1GChll6P3qqRJVZGPKWOAr
	p6NxCHWFlDH1GbqF2JtPsvCfc4U+fDrBIvNrTghfk8xJnCdUrgf9wnyPcP3eIdUy
	HlAVO0My+y7bE1obqWSYQUKXyMivrK+AVTtd0K7Dc2bgG5Vv0A80JjhjW6r7mfv3
	KYr8C+QT3+HvmQbV/Y8LtReEjOcx8mkzSpcJx8EubksuMZkUkzfHoC3UbSy8W864
	Qbs6hDM4x5JxLJ/KW77MMd5FPC29ik5/KdigXyJUqLAZ/ENF3Gq5kc+bnw1oHOmp
	Bqz3/ZJzOHkxsqxVT/Vb1Z+FAM2+B2ewCNHtkCJwePuc/qNA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pufpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:20:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UAKhiU004472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:20:43 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 03:20:40 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v3 0/9] Add missing features to FastRPC driver
Date: Thu, 30 May 2024 15:50:18 +0530
Message-ID: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MMgBlNSobccp-vN9zlcGbavbSyvn4D94
X-Proofpoint-GUID: MMgBlNSobccp-vN9zlcGbavbSyvn4D94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=574 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300078

This patch series adds the listed features that have been missing
in upstream fastRPC driver.
- Add missing bug fixes.
- Add static PD restart support for audio and sensors PD using
  PDR framework.
- Redesign and improve remote heap management.
- Add fixes for unsigned PD. Unsigned PD can be enabled
  using userspace API:
  https://git.codelinaro.org/linaro/qcomlt/fastrpc/-/blob/master/src/fastrpc_apps_user.c?ref_type=heads#L1173
- Add check for untrusted applications and allow trusted processed to
  offload to system unsigned PD.
  https://git.codelinaro.org/srinivas.kandagatla/fastrpc-qcom/-/commit/dfd073681d6a02efa080c5066546ff80c609668a

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

Ekansh Gupta (9):
  misc: fastrpc: Add missing dev_err newlines
  misc: fastrpc: Fix DSP capabilities request
  misc: fastrpc: Fix memory corruption in DSP capabilities
  misc: fastrpc: Add static PD restart support
  misc: fastrpc: Redesign remote heap management
  misc: fastrpc: Fix unsigned PD support
  misc: fastrpc: Restrict untrusted app to attach to privileged PD
  misc: fastrpc: Restrict untrusted app to spawn signed PD
  misc: fastrpc: Add system unsigned PD support

 drivers/misc/Kconfig        |   2 +
 drivers/misc/fastrpc.c      | 635 +++++++++++++++++++++++++++++-------
 include/uapi/misc/fastrpc.h |   2 +
 3 files changed, 526 insertions(+), 113 deletions(-)

-- 
2.43.0


