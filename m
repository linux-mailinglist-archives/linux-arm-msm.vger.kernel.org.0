Return-Path: <linux-arm-msm+bounces-19464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C78BF5AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 07:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4DE4285C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 05:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFF129D11;
	Wed,  8 May 2024 05:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aZ5XOD49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490F2837E;
	Wed,  8 May 2024 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715146993; cv=none; b=IILNzxr2L1MHJUDLQ6wc+8siQxf+bqyqIwRHNd6yxWIRTyrLACxYgrotF1hIgoMhDT07pC4Ud5+4o9rHhGjLIGk37TrM4x5msXeDAZsfvK2RhRa6aBmsG52IghtzhJYC4bAW3bQuSnnYziDOClBENqEeMKr0SGXiBYp9wDK8Rng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715146993; c=relaxed/simple;
	bh=qlqrwuwIUq33n/dV1KcypGJZaBrd9yZGauAjgrPi8cY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hvagijiQ5B+gdz1nswAb4Q1SFLE8l1uFLUJkOGdZFJvbseXt54mlJVEWPX5JoI5dTN33b9rv2Rlb8t2RldBh+m04WbhZrtSZVLKg/lN9iy++sHbXMD2HZ9yuUwtxK4eENm+BZelnorYjMNUjG5ZDTit3fUDoMKGtEvJW5KltULE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aZ5XOD49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44850CwG009359;
	Wed, 8 May 2024 05:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=IVKQWttB4IuF61zrGfLJSscf1DyDgg1TuqN2gsMKDTA=; b=aZ
	5XOD49wH6gjBVOCg1qXM+6/0xlMxTCqGonKpYVEH7zFIgBR4JS9vyma0KmfUhntJ
	khQTAUYHCBSQK1BGBt8Zc2omVL/XhKQB2MNu5r6RYePm4D+grzXFMzw8Mq2LZL/a
	W7MH8hiITb4MsgxnKwpX6J3iFe1pDtVheTH7Dxq6nOBqEFjMwNJE0ni6bM3/BPXP
	/Z3xSNfrqhG+eixgXxtepHMwTmuDnEFjzTxaj/M7xJ8CG4Ry21FxQzdH0BwEnfma
	sFL6v6ZzTmc4Q0YUqjHdpSSpduyF4m4BhsMuy2ig4bLT5i3XdQZu8cXZJysb26VL
	66lhDNBAQ9NRWgVJPXUw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg8s1yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 05:43:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4485h87x004214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 05:43:08 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 22:43:06 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 4/5] misc: fastrpc: Add system unsigned PD support
Date: Wed, 8 May 2024 11:12:47 +0530
Message-ID: <20240508054250.2922-5-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: cAHvD8oOBXeP5xMLqOnjAhfM_TixUFLG
X-Proofpoint-ORIG-GUID: cAHvD8oOBXeP5xMLqOnjAhfM_TixUFLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080040

Trusted CPU applications currently offload to signed PDs on CDSP to
gain some additional services provided by root PD. Unsigned PDs have
access to limited root PD services that may not be sufficient for
all use-cases. Signed PDs have a higher dynamic loading latency
which impacts the performance of applications. Limited root PD
services could be opened up for unsigned PDs but that should be
restricted for untrusted processes. For this requirement, System
unsigned PD is introduced which will be same as Unsigned PD for
most part but will have access to more root PD services. Add
changes to offload trusted applications to System unsigned PD
when unsigned offload is requested.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c      | 7 +++++++
 include/uapi/misc/fastrpc.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1f85ce3eb2e2..4d4dace17ad3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1441,11 +1441,18 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
 		fl->is_unsigned_pd = true;
 
+	/* Disregard any system unsigned PD attribute from userspace */
+	init.attrs &= (~FASTRPC_MODE_SYSTEM_UNSIGNED_PD);
+
 	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
 		err = -EACCES;
 		goto err;
 	}
 
+	/* Trusted apps will be launched as system unsigned PDs */
+	if (!fl->untrusted_process && fl->is_unsigned_pd)
+		init.attrs |= FASTRPC_MODE_SYSTEM_UNSIGNED_PD;
+
 	if (init.filelen > INIT_FILELEN_MAX) {
 		err = -EINVAL;
 		goto err;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..3b3279bb2cf9 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -62,6 +62,8 @@ enum fastrpc_proc_attr {
 	FASTRPC_MODE_SYSTEM_PROCESS	= (1 << 5),
 	/* Macro for Prvileged Process */
 	FASTRPC_MODE_PRIVILEGED		= (1 << 6),
+	/* Macro for system unsigned PD */
+	FASTRPC_MODE_SYSTEM_UNSIGNED_PD	= (1 << 17),
 };
 
 /* Fastrpc attribute for memory protection of buffers */
-- 
2.43.0


