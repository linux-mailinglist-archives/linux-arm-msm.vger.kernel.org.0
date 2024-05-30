Return-Path: <linux-arm-msm+bounces-21086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B218D4992
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 272621F21957
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406F7183A83;
	Thu, 30 May 2024 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HXmvwukS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B582C183A77;
	Thu, 30 May 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064473; cv=none; b=e5NdA92MKjQ9aUDKPtVIiSIuDcMgpLbCnQILcDHtdISy7dbTYV7hJLpeXfoW65VxEf3KAjCWvmzeUgNJ1XW1V54Hzs7Ryejk+SaDuPwxnj+EtGDY1JFbBbTBF/Qt7/7ne7JIMJipUHd837qlcf6AMV75K+NNn4grOEa0gkZvfbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064473; c=relaxed/simple;
	bh=NDxJxCiSKxhOVyshX2EdcNFHWjKyLjm6Jh3sadTuF3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vAJIrwnccJqvj516Ydmr2pWAKdOK9HLvCL6DaTZmpI41rdkLF9iXRSPBTzMVba5to5FnCIKgSCsMIDoib1rX3Ed1iyFf8qETMaecMev+5mSCH94l8Oj8DbRgFzeQuOmPkKEcB8ect4iVaH0Vkr3JiqeEqGJp7mysgEzdX6dPZic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HXmvwukS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U0gDwO004882;
	Thu, 30 May 2024 10:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSJXg147aTxzjU2gH4ri1vgUqOjpDR0kc/VcrJ30saE=; b=HXmvwukSYAUwT+L+
	2vs74o08L3GbnxdvJ9P1GNMV3weGHA7VoOPf4PtCh+ETUzzul9o7LXyMKfslwVqz
	kKCgqr97PrCP+otGjEHbuC8494kdKMhaKQPOo0/JSZCQdA0K/NMzlZmOM8xjsrAV
	xV2GfRXcS1s5rKx+nG+LsnjsMq07i9eHn0C+HAGJE5XiWLhyGuEGkze/txnoROvG
	TJTM5ycPHvNYj0uyYXtRbXxvPhHBMNOYytb3YzYg5UnKYRwqz7Yxm0DypGWSF9bA
	e+091nlDmXuPrW65/XLdyTPVStgII4mv3SQcAU9r3yH+u+PrPRTYWqCM4O/FpKKG
	jOgaTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0gbu9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:21:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UAL5Va013240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:21:05 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 03:21:02 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v3 8/9] misc: fastrpc: Restrict untrusted app to spawn signed PD
Date: Thu, 30 May 2024 15:50:26 +0530
Message-ID: <20240530102032.27179-9-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: bvj00v421i9rjMI2IRD6LNuWF0BQ76Pe
X-Proofpoint-ORIG-GUID: bvj00v421i9rjMI2IRD6LNuWF0BQ76Pe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300078

Some untrusted applications will not have access to open fastrpc
device nodes and a privileged process can open the device node on
behalf of the application. Add a check to restrict such untrusted
applications from offloading to signed PD.

Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 73fa0e536cf9..32615ccde7ac 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -328,6 +328,7 @@ struct fastrpc_user {
 	int pd;
 	bool is_secure_dev;
 	bool is_unsigned_pd;
+	bool untrusted_process;
 	char *servloc_name;
 	/* Lock for lists */
 	spinlock_t lock;
@@ -1249,13 +1250,17 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
 		 * channel is configured as secure and block untrusted apps on channel
 		 * that does not support unsigned PD offload
 		 */
-		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
-			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
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
+	dev_dbg(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
+	return true;
 }
 
 static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)
@@ -1504,12 +1509,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
+	/*
+	 * Third-party apps don't have permission to open the fastrpc device, so
+	 * it is opened on their behalf by a priveleged process. This is detected
+	 * by comparing current PID with the one stored during device open.
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
 
-- 
2.43.0


