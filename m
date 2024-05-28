Return-Path: <linux-arm-msm+bounces-20720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D303B8D197A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600CF287128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C80F16D31E;
	Tue, 28 May 2024 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UaYpx5bp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBBA16C872;
	Tue, 28 May 2024 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895831; cv=none; b=p0hzwI0ahLp0jimyAkXCTrjcw6Yy6mWl7ICRZnrnz5vFxX4s3GtfTdAPgpIpQdHie7wn9nSPn/yeX7iVtALzCSfjUfPwNApd33qcz9i2ldf8dx5ywQKM/+AHwp6cxQDR0qpK0PALP7MyRv2svo702aK+BseC/dzBF0Y3B4aPyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895831; c=relaxed/simple;
	bh=NPlw+UgRXFCYW39MQ5raA1QAH3Z8ZdFUTg6r3oIjN3A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vt1AnVWxem4qBj6bc/MUOqyEqXprZ1nauALZn+3kpSsvxr/y3QKlHeCvY1UIe49l7Gz2WVr/wBinhzgaZ37emLtecfZ0q+sh6dwMCLuilT8/u1UYJHAltDLoxLY+zjo+kxPR98FJ/BFxhkF+3hGf3/RPKlbA0KtO0q5Fz5EusO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UaYpx5bp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SBAa46016293;
	Tue, 28 May 2024 11:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90rs+1NhWIyzHw7JC+KSKG0OGHUhEX+N4aq6NhYEOqI=; b=UaYpx5bpE2r3qwdp
	O4dHFbIG5XlNxRxLjotiMOGDzDIXtCP2vebQ17LjDo+JxhGjaEUFeTEUBdCj7yk2
	5w1Hm61pRMfl9/2wHKZVe98FykUOczTncafBaSG5a+24n0Sr1ImFE4xN/XaVzsHW
	jzjnZmYHY53RT3Oyq8/6xBaFJfTF9gzIX6aszNVfaLmA+pYWWo/f+YQ5+RWsfKCV
	tUAj6qSAzAB+CR5pzNk+bWAQQ3nYt0ycdGpPDa8vnJCMozyxR+Q89xxBiYMaEj0Q
	bzw48oxMY/S72PvG+GQOKqgUi5664AKjVSLKIm3qiAFyZexZEpRIwsK7HHLnsPFN
	R3ZlRA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2mwtx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBUP7d028042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:25 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:23 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v2 7/8] misc: fastrpc: Restrict untrusted apk to spawn
Date: Tue, 28 May 2024 16:59:53 +0530
Message-ID: <20240528112956.5979-8-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: mfm0Nlufys3XcnQoCa3N8ZvEWrHhcLU4
X-Proofpoint-ORIG-GUID: mfm0Nlufys3XcnQoCa3N8ZvEWrHhcLU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=790 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

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
index 23dd20c22f6d..7f81a18b8aea 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -332,6 +332,7 @@ struct fastrpc_user {
 	int pd;
 	bool is_secure_dev;
 	enum fastrpc_userpd_type userpd_type;
+	bool untrusted_process;
 	char *servloc_name;
 	/* Lock for lists */
 	spinlock_t lock;
@@ -1274,20 +1275,24 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
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
+	dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
+	return true;
 }
 
 static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)
@@ -1376,6 +1381,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
@@ -1531,12 +1541,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
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
 		fl->userpd_type = UNSIGNED_PD;
 
 
 	if (is_session_rejected(fl, !(fl->userpd_type == SIGNED_PD))) {
-		err = -ECONNREFUSED;
+		err = -EACCES;
 		goto err;
 	}
 
@@ -1818,6 +1836,11 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
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


