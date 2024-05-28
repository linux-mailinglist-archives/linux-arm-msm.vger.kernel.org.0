Return-Path: <linux-arm-msm+bounces-20722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144858D1980
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464371C22601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1FC16D4CB;
	Tue, 28 May 2024 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FcQ8iV/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426A16D4D8;
	Tue, 28 May 2024 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895834; cv=none; b=ojc6R0DEHnmYTCj+PB8gnxWNSFjDnVLAUrg+d6e68JtXfyk5KLdcYxtROh5MexL5ta+5VwV87SQK/mInQZwTMyAZVWIX8OPtsfM1Jci1S9jhLIzNb/klUxzIbbDfWOP6Dnf/NeHZnpKuLMSgGlG/bTIJdBkS+SNFLcbtAAgaLB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895834; c=relaxed/simple;
	bh=ItLh038yTXkpBO2JVPmLDXhnSPBcMqCuu4HfftVx0pc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+MJdJ7JLYwacsfIF/bnbcomizeBk+eiMOsefIa6VAipvkR72r+8Y4HRhZxgH4pUQmHuHggAqmqtzbef812NEsLmNCAS+8M9BaBuU2uAN+MXhEKGwV+NYJzJ+8NPFqMV8mLRAFq5KTnwNo/3mdeEtvXQBEg29RE/0GaGmzz+748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FcQ8iV/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SAXhWa021501;
	Tue, 28 May 2024 11:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FQ8GTcx+lE1HArNnPtx3PNwM1Jn9g53NbtM9+mUJoE=; b=FcQ8iV/lgjHnyoZk
	nWAbQ8itxT7dYo/95TpjM4PV7/acyycN34ObVBweQeI17ivrh1Pj6MbSu7hZvU5+
	mIGr0HbH5KLgsJXLnVyDV87wHWKQJogAqNYSPmPMW1nOTfmE8T2G8TIp2BrbhEgr
	ncA30G1X9sBiqzWQ999BHB/32mUp/rgIQfu9+GaF5WRTm5EpvqFK6Veo0CNsohvk
	OkbLckTdXCtwEYHhfbiO/3UCaDSxe7x8G6WA9fzYWJo2z2TAh5ZMeT1mkULe1J6H
	hIlU6/W7BXiorQy5jxBw2QltqP3iLhR6VEfmgvLPpjdElKd/zemsNYH6w/nn9RYT
	8eiJqQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pnud1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBUSf8002254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:28 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:25 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v2 8/8] misc: fastrpc: Add system unsigned PD support
Date: Tue, 28 May 2024 16:59:54 +0530
Message-ID: <20240528112956.5979-9-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pGNstejnuWe-R7xw3aKQgXzHi7T7UM3u
X-Proofpoint-GUID: pGNstejnuWe-R7xw3aKQgXzHi7T7UM3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

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
 drivers/misc/fastrpc.c      | 9 +++++++++
 include/uapi/misc/fastrpc.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7f81a18b8aea..ebe20915392f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -122,6 +122,7 @@
 enum fastrpc_userpd_type {
 	SIGNED_PD			= 1,
 	UNSIGNED_PD			= 2,
+	SYSTEM_UNSIGNED_PD	= 3,
 };
 
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
@@ -1552,12 +1553,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
 		fl->userpd_type = UNSIGNED_PD;
 
+	/* Disregard any system unsigned PD attribute from userspace */
+	init.attrs &= (~FASTRPC_MODE_SYSTEM_UNSIGNED_PD);
 
 	if (is_session_rejected(fl, !(fl->userpd_type == SIGNED_PD))) {
 		err = -EACCES;
 		goto err;
 	}
 
+	/* Trusted apps will be launched as system unsigned PDs */
+	if (!fl->untrusted_process && (fl->userpd_type != SIGNED_PD)) {
+		fl->userpd_type = SYSTEM_UNSIGNED_PD;
+		init.attrs |= FASTRPC_MODE_SYSTEM_UNSIGNED_PD;
+	}
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


