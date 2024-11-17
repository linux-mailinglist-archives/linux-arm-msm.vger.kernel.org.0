Return-Path: <linux-arm-msm+bounces-38137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8929D05D2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 21:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A45FBB21116
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 20:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A8513C3F6;
	Sun, 17 Nov 2024 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fEJ7LOpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7F9433A0
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 20:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731875228; cv=none; b=GpHrdDZ4eNunChY8oj6hyo+CZVzX/BVohrhOLzVzq/FEnV8jRdhZx03X2WQA8UWeUWum6tuQlcMD3QrUB2OB6cbF6Df9nLEyIsDOYHf++fZqaSasMUPYC8TK1JWBgxwxCX2UbBZYcocMXDMpogPVb3acn2r6oZquQY3/2s5uqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731875228; c=relaxed/simple;
	bh=l9gN02DdPB9hZBI0fVC6+LeSDXNQ/p3MKcN+esN2RN4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KITdqcrnDGHNE49WXE2GEdgSMQOzgPc0TeL/Hsq0kmVgpdS0uD75NudckyTbF4VRwH2nVpQ+mWhSEJZP2nyr8geDr4tSrzzTq3KNs1C8z6sSWt8wUKHy1QgfFNRq3iqcjWz6R8mKCogKC9k8KRwNL62lxKUN7AykpypN67VtQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fEJ7LOpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AHHqV9x000648;
	Sun, 17 Nov 2024 20:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ILBk2Uy4S8c/0L9p/WBwOY
	okg05oaY0JWJgBaggctXk=; b=fEJ7LOpHvUrF24jriIPcSLFuNAM2EXMIG2RtxU
	HLHnhsFDaoT+5OmmzXvg4zvaSYitzisreKvPCLz9QuYU634pn/LdndplyGCvKcyh
	nTZGt6RBeeI+Jbj0a3yptT2erLCe1nFAKMHe35WVzjRhBhJtH4o4XtuECSoPS5tg
	zRBl/1qFsZqeMOq+r8qI8sqZIZxxRMxWQ4WdGxXX9BAbQh+XmG9YolJnQ8KgRVe2
	BWb4/hJV11Imle7LkTxbKmyHlcla5HVWC2/R6L7dMU7zHtL2AbdPZMcvaDpDVTJQ
	wsx7ZWFgwweUdKfKygVQCurfhs0Cj7GSUeEz9StjVJWzsa9Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkt9tsja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 20:26:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AHKQoM1029337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 20:26:50 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 12:26:50 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <andersson@kernel.org>,
        <quic_yabdulra@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] accel/qaic: Drop redundant vfree() null check in sahara
Date: Sun, 17 Nov 2024 13:26:29 -0700
Message-ID: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X7WvY2cZxFw3xc5B3egTM4XPmNNlgBiP
X-Proofpoint-ORIG-GUID: X7WvY2cZxFw3xc5B3egTM4XPmNNlgBiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1011 adultscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411170183

The documentation for vfree() says that passing in NULL is ok. Therefore
we can drop the null check as redundant.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410301732.abF5Md4e-lkp@intel.com/
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/sahara.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 6d772143d612..21d58aed0deb 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -772,8 +772,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 	cancel_work_sync(&context->fw_work);
 	cancel_work_sync(&context->dump_work);
-	if (context->mem_dump)
-		vfree(context->mem_dump);
+	vfree(context->mem_dump);
 	sahara_release_image(context);
 	mhi_unprepare_from_transfer(mhi_dev);
 }
-- 
2.34.1


