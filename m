Return-Path: <linux-arm-msm+bounces-21982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC078FF337
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9021F223BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A1A199EB4;
	Thu,  6 Jun 2024 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cjUgZtMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A0199242;
	Thu,  6 Jun 2024 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693219; cv=none; b=u5uToR2DnB6Bakc+vdADcZhVMHD77Lp147ZRbjxnihVr0tUigKubn5Fj2C9OelU+NECNA8MxUbpJM6vbrruG/pXi6+fpCbhZLlTvPQSVIknnss4JPj0mn+4TLUMtuwOFR8fcjszmqihBj9BFlKI0zblqI9B0eT0Rm71JliIFaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693219; c=relaxed/simple;
	bh=ckAOFjVoBTSuDMQUcYH3DK4pMOHtutA6OqGOpdod39w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RH++fm9vnD8j1vYJjyew+YsP1hTAEzHnAdkJl5RZkSPmh23Z4hOytwFjr8YZzpd2dQwZ1wwXmlnw+B7F+cvDIENnEsrfn4Jo1mOxcf+PgTxwh0qIXqluFesKPFY4KbLWgs0siMYpAEaWngknOdP2WbZ7Efo8ZSB584MzHW4WIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cjUgZtMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45698pC5015586;
	Thu, 6 Jun 2024 17:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/B1SdCFBxkbUljA3W3yI9+Siur4W19u0X8qFXB2PuM=; b=cjUgZtMidChDGWMt
	hiQa7qCLcrJoM4sQNVGA6Fl3HC4ClXX7doIOZhUs21b8KJv0Bn3VyboQ0og7/mMU
	pN5xwyK7q/1PmcDW7bTA60xGmzE7NQRljPBy4X74GIUA9ZrWJBabm9a+FKc36n45
	5vGf8DRe7xLaAvjHNfDNPnHNxqdZjH8FmfQ060IMnOWjxyTuOpJlZdbH6LGIlwZz
	zDAUzlXLbxzSkEhI7e6PIU743wtjH1IM2fdAJgvA9rPXsmH54ZL8wkERqng0PxvV
	EO8jTSxyhHGg88bdd+NWVfxYy6R4zpPWLc+WYtVgWPPGSjdxEGCqzZ3zUEwFnmr4
	fc6CVw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yka7p93be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 17:00:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456H0CF2013763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 17:00:12 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 10:00:09 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v4 08/11] misc: fastrpc: Fix ownership reassignment of remote heap
Date: Thu, 6 Jun 2024 22:29:28 +0530
Message-ID: <20240606165939.12950-9-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: OTMoPzk2B2QAibAY9To_sCEZElSK2k8Y
X-Proofpoint-ORIG-GUID: OTMoPzk2B2QAibAY9To_sCEZElSK2k8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060120

Audio PD daemon will allocate memory for audio PD dynamic loading
usage when it is attaching for the first time to audio PD. As
part of this, the memory ownership is moved to the VM where
audio PD can use it. In case daemon process is killed without any
impact to DSP audio PD, the daemon process will retry to attach to
audio PD and in this case memory won't be reallocated. If the invoke
fails due to any reason, as part of err_invoke, the memory ownership
is getting reassigned to HLOS even when the memory was not allocated.
At this time the audio PD might still be using the memory and an
attemp of ownership reassignment would result in memory issue.

Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 3686b2d34741..68c1595446d5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1334,6 +1334,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	u64 phys = 0, size = 0;
 	char *name;
 	int err;
+	bool scm_done = false;
 	struct {
 		int pgid;
 		u32 namelen;
@@ -1398,6 +1399,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 					phys, size, err);
 				goto err_map;
 			}
+			scm_done = true;
 		}
 	}
 
@@ -1439,7 +1441,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount) {
+	if (fl->cctx->vmcount && scm_done) {
 		u64 src_perms = 0;
 		struct qcom_scm_vmperm dst_perms;
 		u32 i;
-- 
2.43.0


