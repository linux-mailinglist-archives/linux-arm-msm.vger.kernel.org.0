Return-Path: <linux-arm-msm+bounces-57823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E6AB6987
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91BA464073
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33BD1C3039;
	Wed, 14 May 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rt8Pti6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E512741A2;
	Wed, 14 May 2025 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221128; cv=none; b=meIR735MI0A7oTIuqFzY3AsLzI4bbph1lM3sgZ/FJ3mMh3MeMRBC444BF496VnrxECAy3xog+iRhvkalrjNrHkZQXKxRHueV/x6qGZv2xewEC/Kg9h0SZjzpbw1gZK+b32cJ+ytx3B02+kyAlHXLP0i5E9VJPQmVZqspqhhimpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221128; c=relaxed/simple;
	bh=qIKsBmMeIRm0mtg4YhqnYMEfOq9crW1n5Z+zB0LXN6c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=r0PR/J7dyi4miShmFKFwZsmhYco00qeI7VY7ewqqKmpgNvYEfiJeo6wYw47G33huc6DsnM2fWny1kUEhyRODUWnGMVNPuIkFVUCgullyg5cKWEwzY5aL2Dl7v3Mt3ro/uCJu7WzZRVvSomzvFjJlItmrG4a+cLVHwGxhVmEJgqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rt8Pti6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAv5NB016097;
	Wed, 14 May 2025 11:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=k8AGjdOxKqPW
	gTcyJDn9vk9FEZMsH7KU7E320Jy37As=; b=Rt8Pti6CCNy/teLcVjL2qgR0EKLa
	1f6CZllC3dFj+sMLT5F9N8VwVD+RIhXvAXwwxkFXQLEyWSxUYaBiclqIjyFT352Z
	6swhBQyawMc2sbjFNlN+GvaR8vKpk0NS58fKo5JRQtIkUJkCf14RDJmgEus7WvhE
	pJfI/UHZPFL68PD5dNFD5pJ7BwjpmuiFOAzz8kdaydUwOUJSYmHxqYZPQyw/K9xy
	w5WFMZYFUMTez4OpR4QlXrNn2eTpAptSe92GV+E/V4Kbmj8ji5rRBtfsRISQzBmF
	1nR0uMRp1u0u6HJyb+56hGpvv8Gasqp/nd2zgeAsJG8tbasLJM9ON16qnQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmtfhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 11:12:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EBC1cm008560;
	Wed, 14 May 2025 11:12:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46hyvm3g42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 14 May 2025 11:12:01 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54EBC1NA008551;
	Wed, 14 May 2025 11:12:01 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 54EBC0CR008550;
	Wed, 14 May 2025 11:12:01 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 172355000C0; Wed, 14 May 2025 16:42:00 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V2 0/2] Introduce new flag to force hardware reset
Date: Wed, 14 May 2025 16:41:53 +0530
Message-Id: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PEYtzUusOrfLQDeYvF_GBUFfeIbu37Yu
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68247a84 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=ljxjnqOaEBNz7oqmFjIA:9
X-Proofpoint-GUID: PEYtzUusOrfLQDeYvF_GBUFfeIbu37Yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5OCBTYWx0ZWRfX4gcVo1OT6WMq
 3e9K+mFRWar20Y1KrB0/c+1/WosRFtMiUAcjB4ii9hxOScbkBwH0fCY4Oj8ri72o2yyx0JVYgh2
 HN66SALUjneP1MHfgNPfaVMSpHpEZ3EpeBtr09d8T/2yj63UOeQHi/CIN9a0TGR1lEITCoeY/Jg
 8dyRB/uHL0T7vK2jGdI4A0LifQ4yCHB4qE4vaWcO3xHI2qXrzEmmFvX8ABZObkTxKTM3eJ3jlec
 PuKnAU/VfecVTh4BeLbyaM8FkYu61vsy1F79XVLNht69zTG/85nX4NouhtiuF2PAWcDQ9nmnHcb
 4aEZHmQkqWZhYVKmjlUpGjA596KbFyBq7RwbdJ76i2I4m1SmK6GPCkO/velIuBZbslmug3gYnIO
 SvVo5+toP4mkAz9bwq52T85wzjnK+Ye1yr13pHowXwWyiS+zKZAs66DMD4D6t9rQOtM025jC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140098
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Introduce new flag cqe_recovery_reset_always in mmc_host to allow
vendors to force hardware reset during cqe recovery as per their
needs.

- Changed from v1
    - Rebase on tip as "mmc: block: Fix CQE recovery reset success"
    is merged.

Sarthak Garg (2):
  mmc: core: Introduce new flag to force hardware reset
  mmc: sdhci-msm: Enable force hw reset during cqe recovery

 drivers/mmc/core/block.c     | 2 +-
 drivers/mmc/host/sdhci-msm.c | 3 +++
 include/linux/mmc/host.h     | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.17.1


