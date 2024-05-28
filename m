Return-Path: <linux-arm-msm+bounces-20715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6E8D1970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A70311C22417
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888E216A385;
	Tue, 28 May 2024 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mcKOA1mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE6182B3;
	Tue, 28 May 2024 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895816; cv=none; b=TmkyPWoDvCgLUkl427rkVJPyLfYrT0HpRr2ZuRYcSTCbBd0JX3niRapHV21GcVwubFVc682YiLZ65BTNXTpNgvRhInfB3pN/dBQLUrjnpGsw58hzNXKHbUwKL06Ugeb9PUD5hWGXw/hXb/OLiKd7t1XqDBZIdgNb3VSBebC8BWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895816; c=relaxed/simple;
	bh=RWIsEqPeVlOmF7FXwHF2Q/qHk0T/3X6I1ml83lchXR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKFlnFYqK+p4T2vd4OTJoZKs4Sd9fIDQFOMonDU52M/7ElA4sRTo+VQrZPtgFFijMoBLfuP0TAaUPfMmMrj+ZoAd+USZdktd0cYv6oPgtTdEzZuuf+lHRQE19QkAaq0BXg7M4C160t01+TRGYFGdGTPs6+J9HiVfQiCzoK9a1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mcKOA1mh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SAwQdj022257;
	Tue, 28 May 2024 11:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zar8uZesiyIz13yi/Q7CM/fVi8HkaqVyoZ/iInraejo=; b=mcKOA1mhX8YVQbjh
	dw8DHzJ7wotGuOgxvfiEQjoEHvuMAQO3v3S1w1U/kA/sKbEevbjVDvtZq2B8SyT/
	5tJOZQ2lp1mn4/apbQr198JIXeOgnTuafYtFULAJzS2fAaP/FRr8MrPQEHZnkXda
	bWfyhcYZnthNuHfnNmEr/huzNW3OWpD5woGZaxhWSST5ZX0lk7BEkB1utT29eaiU
	R+B7buUFQ64KBWFE4dBRuwMZ9ILprrW5lWDFsemLLoqE4X0KoIesCV85o1aPVti4
	o0GQL5naejyeq1nnDanQkIkj/EqVSTPvjz509/22QGsgTLXHbxI7gWZedLcfqdBY
	De26ig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba1k5wcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBUAR3007523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:10 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:07 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v2 1/8] misc: fastrpc: Add missing dev_err newlines
Date: Tue, 28 May 2024 16:59:47 +0530
Message-ID: <20240528112956.5979-2-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: zG7c15ugTVzNi9gst-AIW11dVKKW-D9W
X-Proofpoint-GUID: zG7c15ugTVzNi9gst-AIW11dVKKW-D9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

Few dev_err calls are missing newlines. This can result in unrelated
lines getting appended which might make logs difficult to understand.
Add trailing newlines to avoid this.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4c67e2c5a82e..4028cb96bcf2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -325,7 +325,7 @@ static void fastrpc_free_map(struct kref *ref)
 			err = qcom_scm_assign_mem(map->phys, map->size,
 				&src_perms, &perm, 1);
 			if (err) {
-				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
 						map->phys, map->size, err);
 				return;
 			}
@@ -816,7 +816,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		map->attr = attr;
 		err = qcom_scm_assign_mem(map->phys, (u64)map->size, &src_perms, dst_perms, 2);
 		if (err) {
-			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d",
+			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
 					map->phys, map->size, err);
 			goto map_err;
 		}
@@ -1222,7 +1222,7 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
 		 * that does not support unsigned PD offload
 		 */
 		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
-			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD");
+			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
 			return true;
 		}
 	}
@@ -1285,7 +1285,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 							&src_perms,
 							fl->cctx->vmperms, fl->cctx->vmcount);
 			if (err) {
-				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d",
+				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
 					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
 				goto err_map;
 			}
@@ -1337,7 +1337,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 						(u64)fl->cctx->remote_heap->size,
 						&src_perms, &dst_perms, 1);
 		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
 				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
 	}
 err_map:
-- 
2.43.0


