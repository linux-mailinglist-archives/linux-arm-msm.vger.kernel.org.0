Return-Path: <linux-arm-msm+bounces-21084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 152CA8D498E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B6C1C2105F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7A91822E8;
	Thu, 30 May 2024 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fa7F+lr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B81822DD;
	Thu, 30 May 2024 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064468; cv=none; b=m92CxhUH6MjGR+mq+4AsdurVSXAr8PB9dWLSTklG1NT6CiNUnRuVdK5qGlANZM1yRKOpPGOayyb1Brc4f0T9GkdowBvdHhWmrF8W+11pTFtx0RtqTqEFSS0aBrB8DGMOkuZnLrAl/HMUPNs7HOI8dbWoQEdTa5mPsTNxv2e6Kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064468; c=relaxed/simple;
	bh=LERIl4p8XTRTxdG0Sa8lN3ZU7TRE7DybjDBqK5sjvJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=peiXR5Sw4Kg1lGqiwvFbFPODZo10MeZr7cNkd54uCTR0qGiwMo/8R+o9X9FSRdoAEk0Z5VhXrsaiCnahrsMWe41kYwdIHu+xofjnG1RvGA89GU8StroYaf4I4A0gQoxKernf58ShPbrrmPie43wGwScRO50mCpOJ7gwBg43KDXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fa7F+lr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U91fFg001343;
	Thu, 30 May 2024 10:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtkcS7gVxkgsG+XqnCl6qkIkQGTz6Qc14699SEWkJfs=; b=Fa7F+lr82jBnQ61A
	3iIBH6i764R/zsu7AVPXJG0GLM3t8t7Jks8Z7Ll/jy5fcwH7SXWH0sBZuKhm1/Af
	MdGcerZHZ0aS9UsptPwWRDnCJvNC2/jGeEU71pISLs0Uvk9b/uGzfgV3cQuy/M0B
	1zTNFYMyO4s3IHywEk3zYoZX30nzTVv8nQlttjfZARqYVU+61fLzCfudcvKLIETj
	++sYGsfgFofNkNleiKURYWKX8NJuv3qGP+wKNmNjXw5WOepsIlXGAfm/uZkwNajz
	tY2xo9L5VHlFI1GhgbzbJLw7FNl8ixLg+4Yx3QObqGRGNDXtHSDLUf9lLiYHtTHj
	ih1iDg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pufqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:21:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UAL21L013121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:21:02 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 03:20:59 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v3 7/9] misc: fastrpc: Restrict untrusted app to attach to privileged PD
Date: Thu, 30 May 2024 15:50:25 +0530
Message-ID: <20240530102032.27179-8-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: wLO8n3owdA8n2e67guPKwrPTZ2XpJU8E
X-Proofpoint-GUID: wLO8n3owdA8n2e67guPKwrPTZ2XpJU8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=883 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300078

Untrusted application with access to only non-secure fastrpc device
node can attach to root_pd or static PDs if it can make the respective
init request. This can cause problems as the untrusted application
can send bad requests to root_pd or static PDs. Add changes to reject
attach to privileged PDs if the request is being made using non-secure
fastrpc device node.

Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d9d9f889e39e..73fa0e536cf9 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1344,6 +1344,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	} inbuf;
 	u32 sc;
 
+	if (!fl->is_secure_dev) {
+		dev_dbg(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
+		return -EACCES;
+	}
+
 	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
@@ -1769,6 +1774,11 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 	int tgid = fl->tgid;
 	u32 sc;
 
+	if (!fl->is_secure_dev) {
+		dev_dbg(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
+		return -EACCES;
+	}
+
 	args[0].ptr = (u64)(uintptr_t) &tgid;
 	args[0].length = sizeof(tgid);
 	args[0].fd = -1;
-- 
2.43.0


