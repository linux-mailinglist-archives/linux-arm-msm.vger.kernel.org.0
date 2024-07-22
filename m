Return-Path: <linux-arm-msm+bounces-26685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D9938883
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BCA9B20DA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 05:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719C21799F;
	Mon, 22 Jul 2024 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nQcsZ0xN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08DC17C8D;
	Mon, 22 Jul 2024 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721627708; cv=none; b=GlRIwl8wTEFmSCu41DeWgbLJmWo0HDvilNU8wMvspWjk9R107BdqNYOYbQMY+9FY8cgw4/5ZKi+n5Pl29dBaUvIrHxm+8F9bvcg/WxEDXJvBI6Bj/gtGICugDAyG2FWHZRFuw0Wc5Y1nU5qwU7grSnQC3QOsHLq3mb2Vu3zRqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721627708; c=relaxed/simple;
	bh=yK4tfblfxuTRGSFe9jJevmB338pngkOKswYOXIJAfzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHMpJ9i/0u14FSSftmU+ZoTZ+40/7Wlkquuh65MW9bawA0mphfyxC+aOm4r9P8xnACZjH1TPgq/AwuPlctso+NB759R9wfcUNuxcXVN9X9e87ankpPtBhhzzzXcwSfgFNQFWWyjUUNXbmoZpeV8zv7dh4PYv0FwBjzDEKZ0Igs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nQcsZ0xN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNU2cZ010944;
	Mon, 22 Jul 2024 05:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ger/UAlZQBN/ZfgFXXWGtLgbh6WWK6Ld0Wcp0UW9/E8=; b=nQcsZ0xNAeOOwdN+
	hB3e9mPSXUNwiZt99/EK9W82SwjjsdOUChBgQjo4JtFFl1mz0PicA4fR3U7EIVb7
	32k/nan9znxzf3Ks6meEGhqE0yV77Ct3CERmFPAIUXYx1TBicK27yEw28gBR1Pzs
	WkXktk6QkqJm4erTW5PFfazg8PXIOb9xpHOGCLfK0J89vK5bW/d1zOVJYO9vpi+u
	zXLHN7VV38m1jp453SL/+u2kVzN7s03XojSBYYyAjrZVwhKi7clQUv/3lx+gCqg4
	QYDoYD0Ktwo5/O9/TLknXPsRmusTXOgOwbGhXB2GBYO+3nbUTEZLpnm5CM8r8BUU
	Ox8vpw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgtr8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 05:54:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M5stg6020951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 05:54:55 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 21 Jul 2024 22:54:52 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
Subject: [PATCH v5 2/2] misc: fastrpc: Increase unsigned PD initmem size
Date: Mon, 22 Jul 2024 11:24:37 +0530
Message-ID: <20240722055437.3467900-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: UsDEVLSykPlJjqPm1elhJBB0DczKaIsq
X-Proofpoint-GUID: UsDEVLSykPlJjqPm1elhJBB0DczKaIsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_02,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220044

For unsigned PD offloading requirement, additional memory is required
because of additional static heap initialization. Without this
additional memory, PD initialization would fail. Increase the initmem
size by 2MB for unsigned PD initmem buffer allocation. Any additional
memory sent to DSP during PD init is used as the PD heap.

Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a3a5b745936e..18668b020a87 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -40,6 +40,7 @@
 #define FASTRPC_CTXID_MASK (0xFF0)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
+#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
@@ -1411,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 			goto err;
 	}
 
+	/* Allocate buffer in kernel for donating to remote process.
+	 * Unsigned PD requires additional memory because of the
+	 * additional static heap initialized within the process.
+	 */
 	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
 		       1024 * 1024);
+	if (unsigned_module)
+		memlen += FASTRPC_STATIC_HEAP_LEN;
 	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
 				&imem);
 	if (err)
-- 
2.34.1


