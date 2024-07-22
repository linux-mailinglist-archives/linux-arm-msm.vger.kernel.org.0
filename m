Return-Path: <linux-arm-msm+bounces-26719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAC9938AA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD08A1F21940
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC2A38DE4;
	Mon, 22 Jul 2024 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YC01+ABD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53936282FE;
	Mon, 22 Jul 2024 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721635349; cv=none; b=sgCbqvx04eyRTqSgIdD51FadXgeqVzO50PjO8PC989eBMd3+KLMjjuj5SdhrQGC65J8Trnz9ZirSzxV1VDgtgX/JgWdG58T/IP7QrRI3P2GOMbOEM9IwEfd9iKikGRZP1+uUf6G1SfN7QqDA327ZxTGfUX9+Bdl6rbb9UMN0/O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721635349; c=relaxed/simple;
	bh=QoDp8B79aB0QCr7pceizv7MEMUy3CC9Ljxczhl9yHOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bN+BEY8LhzGeEIuu3JAvPjDF6BKwo7uLBVLlpdzRrJO1GCUGL8rhL74Tty+NvwKrfL6VOJ+n5U9fzD3UztjtwtKXmROlcAKlcOfBk6XgVClZ7TNYBOzVmRqdPTF5xYAKJw8V+4cmArkXIaPgZ4vfUq/xTOCnmmv0iuIXvB7Aiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YC01+ABD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LMeEEu024250;
	Mon, 22 Jul 2024 08:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w21bLn/sM//2yqBSdEO7pBEmdqCH3Ao4IzhOqtksR/Q=; b=YC01+ABDicPBT5gU
	EjWNqWvHEBrDLa9KbojeLrShPrM61dZaW5HIV8BhOSIG/HhqwMmnnHgjd4OEBuAC
	TN/nSQZMEkb2s6wUKc2ZZdV24r/Cx176+aW3HedX0f0vnumZB06ywNPmrwbErD6p
	7EqngomuVyKVbs0Kd0SImsyIskafc6zSNA2annBpA6eeODZWd6J5xjTsbQnxX2Us
	3MOtuR2dvMZpqGNQYAytEFQuhI5e9S6Ri2BwkKVLxnlLK2qFZllmKWT4ieBdjf94
	ShDdXnp0QtF0hZZt6jsN1cREvZUw6hSIJ83JWSd3iKsIb9PUKLQacA9D2aK/BOIn
	/1s4bg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487b29c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 08:02:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M82FZd027414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 08:02:15 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Jul 2024 01:02:12 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
Subject: [PATCH v6 1/2] misc: fastrpc: Define a new initmem size for user PD
Date: Mon, 22 Jul 2024 13:31:59 +0530
Message-ID: <20240722080200.3530850-2-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tYWglpIH9Ny2Ow6LJDuFGV7vCLQIZhO3
X-Proofpoint-GUID: tYWglpIH9Ny2Ow6LJDuFGV7vCLQIZhO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407220061

For user PD initialization, initmem is allocated and sent to DSP for
initial memory requirements like shell loading. The size of this memory
is decided based on the shell size that is passed by the user space.
With the current implementation, a minimum of 2MB is always allocated
for initmem even if the size passed by user is less than that. For this
a MACRO is being used which is intended for shell size bound check.
This minimum size of 2MB is not recommended as the PD will have very
less memory for heap and will have to request HLOS again for memory.
Define a new macro for initmem minimum length of 3MB.

Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a7a2bcedb37e..a3a5b745936e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -39,6 +39,7 @@
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
+#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
@@ -1410,7 +1411,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 			goto err;
 	}
 
-	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
+	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
 		       1024 * 1024);
 	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
 				&imem);
-- 
2.34.1


