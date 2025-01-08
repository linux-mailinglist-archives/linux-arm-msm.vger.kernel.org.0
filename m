Return-Path: <linux-arm-msm+bounces-44304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B36CA05255
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28171889911
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE56193436;
	Wed,  8 Jan 2025 04:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PERRbEet"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB1155327;
	Wed,  8 Jan 2025 04:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311719; cv=none; b=rvMfv48D3tAdfNfXV0ssk5/J7Xqem3i4JAHUhgshU/fHHYYe+5z6S1ONl5vDxfpxMMK3QVpkJhUT9Nm+EV8MwX8ooFWRQFRw3gtSvWKUnnPEQ3ADV9ySNGX84BYS004qSYEeQdWaqRNaxMCk6mt+hPW+Be5WdiuC5ZeRLogHOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311719; c=relaxed/simple;
	bh=bXe2VrQ2aD4azjyOkS3D5/Lq2IoEBZOwYrt9+/4AtcE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uIuFZVorh8OGZX5GNr0grdfavY41fa9VnIXxjpGpiqxAgNbnDOEdD3C24Z6/aRoPod9sI1nbrxMXTZppaZKM9NSEdvJOrHofzbusH0yTje1OSCttsFIero9s6ZMq+fIUZsR2zP3fvOBO0Z8qwyDotENE6CyYbmtaMM7hScVnY9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PERRbEet; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507KG4KG029142;
	Wed, 8 Jan 2025 04:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YA1TZQ1QJ2O6CROrHQWhWU
	KB1vh7qq1IzNZPfuIjbRE=; b=PERRbEetpOObzvLureLkM3B7UXxcIpmCdlPn3t
	Noa5TCfe5q/Bg2+CQ3RodmpRSkO63lzfMH/B6uqLWunrxUWbjPbBAg8FzhIdY/z4
	lt8BmUGzKlkt/qEJXQtoWryRbMuhnlo5WhrDRhcrBHmd2CDwhERllZL5UoLcRa8J
	SqHcQivhoBXa6+Z1Kh3780OMu3VLx0phpw86f7CwoiX3oIFoLfqWxPwFUUt9jG2p
	aBWuZi/7rAicix+IcAOj2QonpvfgBWpL7iSGKuTR4eB9XmVjV05ysoQgk7dF20X3
	wcwBeSCgZ4DLPq47teW/MnmJjJJfCK9PmueE0QU3hbhZ4neA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441b588xrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 04:48:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5084mW5M012587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 04:48:32 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 20:48:29 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <amahesh@qti.qualcomm.com>,
        <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH] misc: fastrpc: Fix race condition in MUNMAP
Date: Wed, 8 Jan 2025 10:18:02 +0530
Message-ID: <20250108044802.3829060-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R_kVIKju3ECdlEMzHyT1c2oCHbqIVOzB
X-Proofpoint-GUID: R_kVIKju3ECdlEMzHyT1c2oCHbqIVOzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=918
 clxscore=1011 lowpriorityscore=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080036

fastrpc_req_munmap involves two steps to unmap memory, first to locates
a matching fastrpc buf in the list and second is to send request to DSP
to unmap. There is a potential race condition between two operations
which can lead to user-after-free scenario.
Lock unmap request to avoid use-after-free.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..9ad092d3a705 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2117,7 +2117,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 		err = fastrpc_req_mmap(fl, argp);
 		break;
 	case FASTRPC_IOCTL_MUNMAP:
+		mutex_lock(&fl->mutex);
 		err = fastrpc_req_munmap(fl, argp);
+		mutex_unlock(&fl->mutex);
 		break;
 	case FASTRPC_IOCTL_MEM_MAP:
 		err = fastrpc_req_mem_map(fl, argp);
-- 
2.34.1


