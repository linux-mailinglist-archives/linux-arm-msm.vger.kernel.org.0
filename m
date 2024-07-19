Return-Path: <linux-arm-msm+bounces-26612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB8937569
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3353E1F2221B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 08:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805495F876;
	Fri, 19 Jul 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cjOYfvea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AE7D095;
	Fri, 19 Jul 2024 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721379450; cv=none; b=pAHA1NxnCheB3cFnM8GAFE1GnBDh3XyQbcjz2Lpi/AJQgxbJbiu6LlVBfbnw0zbWt/MZfN6xLxv1L7GyXGEzy1xjbQe6JCmo5JNTxGVmFljVOjs4pZivZ/lw2ZNeMvv/zqXaWcxTLhVWqLjETxwUrgn75Ak8inEwgm2bWPavWRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721379450; c=relaxed/simple;
	bh=fm9TEPUA1U2cVfHoKPsMeHb1ZfnnnkWgq5jAwDFl2bM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gjHW3Vzmp98A17WDzdv7S0o5GosLaO17LlxjRCFLmbxiGOp7V28IjtMtX4MKZcDERnKfLtBeR/xUu6zKOzxuK13GV6h7rs6ggJHxL42ttynkF67Y9m4wp2+BRcNsrxAk2ZB9c6jvcoEZN0sENOCNGGBdtC9J9A9ADaaZ5H35CVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cjOYfvea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J0xsLn018981;
	Fri, 19 Jul 2024 08:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P28o/kK9Uj0Z5NKPk0Eu83
	3pifexu8IhZbiAXudPllQ=; b=cjOYfveaXVH029F14kThW55KqzP5es9rnYuRiR
	WgkyTO6VB64iiqGVvzlusSTJcs9RQKLTD3WdulfN1xURnhnlIErSD4e04Xm/q+4g
	XYj71fAyhSmAfR3SmazUCO0spDuRE28JfnSitwMjimeTR4Q172HH+9cNAxuAzCwo
	i4FKm11Qx/wWH0sa+dG5ji2Qe48SQLY4rUC1C776wJV5hPA3R+41mDsnt6JiGWgx
	yCJn8rTHX9NODeTLR+iT03HxtR/E/gXj2p1nbpzlPiuzCiYQmL62qJDhtD5sbuaR
	0P99rH+D6IDrPqLP0x3CwOCIclDMq8r8JzByArPXZcwKfAKg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe350u09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 08:57:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46J8vJQM029738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 08:57:19 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 19 Jul 2024 01:57:16 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
Subject: [PATCH v4] misc: fastrpc: Increase unsigned PD initmem size
Date: Fri, 19 Jul 2024 14:27:08 +0530
Message-ID: <20240719085708.1764952-1-quic_ekangupt@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 30eN70_7MhCOiJu8psYENwLWUp9T2pSx
X-Proofpoint-ORIG-GUID: 30eN70_7MhCOiJu8psYENwLWUp9T2pSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_05,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407190069

For user PD initialization, initmem is allocated and sent to DSP for
initial memory requirements like shell loading. This size is the shell
size that is  passed by user space and is checked against a max size.
For unsigned PD offloading requirement, additional memory is required
because of additional static heap initialization. Without this
additional memory, PD initialization would fail. Increase the initmem
size by 2MB for unsigned PD initmem buffer allocation. Any additional
memory sent to DSP during PD init is used as the PD heap.

Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
Changes in v2:
  - Modified commit text.
  - Removed size check instead of updating max file size.
Changes in v3:
  - Added bound check again with a higher max size definition.
  - Modified commit text accordingly.
Changes in v4:
  - Defined new initmem specific MACROs.
  - Adding extra memory for unsigned PD.
  - Added comment suggesting the reason for this change.
  - Modified commit text.

 drivers/misc/fastrpc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a7a2bcedb37e..18668b020a87 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -39,6 +39,8 @@
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
+#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
+#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
@@ -1410,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 			goto err;
 	}
 
-	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
+	/* Allocate buffer in kernel for donating to remote process.
+	 * Unsigned PD requires additional memory because of the
+	 * additional static heap initialized within the process.
+	 */
+	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
 		       1024 * 1024);
+	if (unsigned_module)
+		memlen += FASTRPC_STATIC_HEAP_LEN;
 	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
 				&imem);
 	if (err)
-- 
2.34.1


