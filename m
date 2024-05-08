Return-Path: <linux-arm-msm+bounces-19463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD18BF5A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 07:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E43A28579F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 05:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DD62836D;
	Wed,  8 May 2024 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eyxBZ5yB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F81863E;
	Wed,  8 May 2024 05:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715146992; cv=none; b=rPw35cW4kGkBYLbc/ZCX/uKZr13q3EPJCfric+vS41PXNbVuzu22yGeydWZbcnxOf7+BvHAVnEVpDyxUMO5e+00vllzgMuFB+TvK5lfzuQUz0nZmyMODGWQEw52r3OdkFnvyGqOVY2QFy6Hm0Yeabljyx8NO5V2cV9Hxc9o3yk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715146992; c=relaxed/simple;
	bh=L1EbBUnfXZsYfCW/dceWiLBhQiJEghwVH+Sw8eG/6TE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eDWyMwCicDHzoY2gCHbBax4sJUrzhrbq3AZDgNMZ2p8wY0XH2YtNAFn6tTJWFkh83VjpEuJcdxQyruUj5JkTXuTvDeHk07t0sKnZc9UqQox7IRwSj8Ya574vQELdH+hnKoUsUIl/LrML9pOReRsiXqeSiYfjc48HR4SVOmlnzPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eyxBZ5yB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4484fYeh005831;
	Wed, 8 May 2024 05:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=qyKvfKi1CO9c1UZt+r0JjNANtXywg6SUk1SVrXYBqN8=; b=ey
	xBZ5yBLRN+nb6bczHWcw+OTBV9Ps7RdNYz8aKT9hCrS/7drF4WYp5iS3gGFRWhNc
	XQhcgsjM2TA6qWhWnIkC70n5bDalqC87ENfqr4u4remxVck62yrqa3eMGnSBJDKV
	PfAJbdQ5kthgM2bFWkNYNmZcbv2MZ1uewPf8n+Isdo3W+stQyktOp2LdXQ7Q5vUc
	Oy9aVSWUOe8KLxU0slRg0yHKLuxuJxSiFGT6sVmL+yMllMwvxftEja5eEBmkn6Qe
	LqxuY3U2fn1YG4pnLaC5bMzL5syb83G5xCnYvfhX2xCHqVEE5MszWjpFwop8bTW+
	Ux00Q3TMLQ/5yZnrnGcg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyspms0an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 05:43:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4485h6xw012775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 05:43:06 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 22:43:04 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/5] misc: fastrpc: Restrict untrusted apk to spawn
Date: Wed, 8 May 2024 11:12:46 +0530
Message-ID: <20240508054250.2922-4-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508054250.2922-1-quic_ekangupt@quicinc.com>
References: <20240508054250.2922-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: 8Cn5aCKbikDBick950D97F75VpvmR4U4
X-Proofpoint-ORIG-GUID: 8Cn5aCKbikDBick950D97F75VpvmR4U4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxlogscore=724 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080040

Untrusted application can attach to guestOS and staticPD if it can
make root PD, sensors PD or audio PD attach request. This is a
potential security issue as the untrusted application can crash
rootPD or staticPD. Restrict attach to guestOS or staticPD request
if request is being made using non-secure device node.

Also for untrusted dynamic processes, DSP HAL process opens the
device node on behalf of the application. Add a check to restrict
such untrusted applications from offloading to signed PD.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 258f2b9da039..1f85ce3eb2e2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -303,6 +303,7 @@ struct fastrpc_user {
 	int pd;
 	bool is_secure_dev;
 	bool is_unsigned_pd;
+	bool untrusted_process;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -1208,20 +1209,24 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
 static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_request)
 {
-	/* Check if the device node is non-secure and channel is secure*/
+	/* Check if the device node is non-secure and channel is secure */
 	if (!fl->is_secure_dev && fl->cctx->secure) {
 		/*
 		 * Allow untrusted applications to offload only to Unsigned PD when
 		 * channel is configured as secure and block untrusted apps on channel
 		 * that does not support unsigned PD offload
 		 */
-		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
-			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD");
-			return true;
-		}
+		if (!fl->cctx->unsigned_support || !unsigned_pd_request)
+			goto reject_session;
 	}
+	/* Check if untrusted process is trying to offload to signed PD */
+	if (fl->untrusted_process && !unsigned_pd_request)
+		goto reject_session;
 
 	return false;
+reject_session:
+	dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD");
+	return true;
 }
 
 static int fastrpc_mmap_remove_ssr(struct fastrpc_channel_ctx *cctx)
@@ -1274,6 +1279,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	} inbuf;
 	u32 sc;
 
+	if (!fl->is_secure_dev) {
+		dev_err(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
+		return -EACCES;
+	}
+
 	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
@@ -1420,11 +1430,19 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
+	/*
+	 * Third-party apps don't have permission to open the fastrpc device, so
+	 * it is opened on their behalf by DSP HAL. This is detected by
+	 * comparing current PID with the one stored during device open.
+	 */
+	if (current->tgid != fl->tgid)
+		fl->untrusted_process = true;
+
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
 		fl->is_unsigned_pd = true;
 
 	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
-		err = -ECONNREFUSED;
+		err = -EACCES;
 		goto err;
 	}
 
@@ -1688,6 +1706,11 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 	int tgid = fl->tgid;
 	u32 sc;
 
+	if (!fl->is_secure_dev) {
+		dev_err(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
+		return -EACCES;
+	}
+
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
-- 
2.43.0


