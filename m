Return-Path: <linux-arm-msm+bounces-33227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E247991EA5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40BC3281B49
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 13:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C917FEACD;
	Sun,  6 Oct 2024 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cj9Hztmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ADFC125;
	Sun,  6 Oct 2024 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728222940; cv=none; b=rUjA/llaogscud9AD+P580Lih3GZE4DGx4NXHVG6ZVrEtcwk58Aqv65giuBcB0lIjRnny9UYGIZgLguWWoVe+zAZhyy+lM+uzB7KKNdVIfrLbaXF4D2rh3tSi2EX6u8gEKl3JMs8DkAF2u9rNBQ0NzxWVbyyWxzmqrWoai45mLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728222940; c=relaxed/simple;
	bh=HAdrsEY6YlkWBS7ysRiXV9/WdgVSWOyATYuYjcqzqU0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=gJXAvU2hM71S+SFRv/lsn7RXQt+APagXKx9vop7h+MTMPFgP+Tgme+02qae52E3olTHp4de0NQWD3ck1OvF880xP6Qf6YFhSaMDSQ8GK5oJdb4oE+5SU4MEq+x57bj3rqXPDDpAP7g+77NPAnr79poXrLSI+yKq8MZGGw8TuwvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cj9Hztmy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 496BGx6r019907;
	Sun, 6 Oct 2024 13:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=jfCNoTHOpxQs
	dhAMW7Ej4NZ+kmH7a26ExQ8nsR4Za8g=; b=cj9Hztmy4nvLQXXNULVfjSrtDR2m
	oSu7LAddoqDDus8omAQCpqHUI4fXN/OdIuezs6qTqJgymOasQeqe8izU4e6mxNDz
	55UpPywbJSUNXvdnGOic9ALRbKDTyZd1EzbfG9U9VHcuBBlDk0xioyIX/GNj+oQm
	BUKXvJVvyYt6gI6w6P+CghaF78vnlmaQKNDLPllOZNvihdP5UZV3MM1kp63dq3aL
	lwpTMBYCeuOeA+CBB4oM1V8Gmw4pchZblVime0E7CPNncbrlyng96vgezuSOF/am
	bniUgjcuCavoANGOWzcwKBPdOkT5s3IaCqNs+36MG/A7w964kYBMpfcQ0g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5j2cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Oct 2024 13:55:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 496DtV9t015203;
	Sun, 6 Oct 2024 13:55:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 422xhkgnns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 06 Oct 2024 13:55:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 496DtV6F015188;
	Sun, 6 Oct 2024 13:55:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 496DtVJM015184;
	Sun, 06 Oct 2024 13:55:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 9AB4E600B71; Sun,  6 Oct 2024 19:25:30 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_neersoni@quicinc.com,
        quic_gaurkash@quicinc.com, quic_spuppala@quicinc.com
Subject: [PATCH RFC 0/2] Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Sun,  6 Oct 2024 19:25:28 +0530
Message-Id: <20241006135530.17363-1-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6ANqrEGjwaNJuvmo9WyiiqY5Y8M8mgeA
X-Proofpoint-ORIG-GUID: 6ANqrEGjwaNJuvmo9WyiiqY5Y8M8mgeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=531 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410060101
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Crypto reprogram all keys is called for each MMC runtime
suspend/resume in current upstream design. If this is implemented
as a non-interruptible call to TEE for security, the cpu core is
blocked for execution while this call executes although the crypto
engine already has the keys. For example, glitches in audio/video
streaming applications have been observed due to this. Add mmc_host_ops
hook to control reprogramming keys to crypto engine for socs which dont
require this feature.

This patch addresses the following:
- Adds vendor hook to control reprogram all keys.
- Avoids reprogram of keys for Qualcomm SOCs only.

Seshu Madhavi Puppala (2):
  mmc: core: Add vendor hook to control reprogram keys to Crypto Engine
  mmc: host: sdhci-msm: Avoid reprogram keys for QCOM socs

 drivers/mmc/core/crypto.c    | 8 +++++---
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 drivers/mmc/host/sdhci.c     | 6 ++++++
 include/linux/mmc/host.h     | 7 +++++++
 4 files changed, 24 insertions(+), 3 deletions(-)

-- 
2.17.1


