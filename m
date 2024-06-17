Return-Path: <linux-arm-msm+bounces-22815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0282B90A8C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 10:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73B7EB21961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61E254918;
	Mon, 17 Jun 2024 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hsjKArLq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C779EEC3;
	Mon, 17 Jun 2024 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614275; cv=none; b=cBHvgrnArAvgvrOqrRBegqgXtvFWGk071eVm5Q5k73iDxSyb/diP1xzOe5fkUtRKDmYHYHCf1El2B7i+DDh3oAhJILm/pyGIij6FVSuC2BwQG3/PTtlDplOHGK4m18LzL1ucqNn9ZAXwDc7zdUyPTmC3r8Y5cNZGVdN5u/+Aies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614275; c=relaxed/simple;
	bh=yWk1f5RDguOyR7Gg3nSVJwE4d+GpJeHhRsijXvBsBqk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c90440gbux7dr0avPE/I7BGfph3q10s/j8TuEg3oE7BcU4PNf0hLUH6v6LRLX+lXCIrLnLbyfHr4ft4R7nCzBfo/ttZf0C+TwkLcPV3cSZ+Qtp9nb94ljS7nFq7eOGN2lz5V0BnR97EFlSYNGbH8J4VahDLfjNWQmnJ+Qf/UDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hsjKArLq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H0eMFL003342;
	Mon, 17 Jun 2024 08:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/QgBAmFIwBYhNduTNsLR1o
	U7XZNdLd530ancVu2h5VE=; b=hsjKArLq2NvGY5njhGaGAa7xprzgXvd7Upbg4P
	QJ3pxsKr/8+37Qjl2qgQGg2rleUulhum5CphGMLdC9G3Ok10gwbhMK9kiethBEam
	LjPl0Ypvz4fwinvdImLxls3xc9BWXnas7okmDhUIzcRaGVyJKhPkFWYkzYRPRGNf
	JZAcQOk4lKKIj6j7A7c0gsV2hrcdN6oc+v1HPagRHuOZ/GmcEIHac8XlyueMK9AR
	tIv1bhM9EDwKcZYXd8Koh0P/IgQxrzSMLwUQtnLXJEgdExsun3qZVI/bLgbRPjpU
	GOz3AWBmijVcaVwHFDN7/plXgIbeDSqRKpQzvwrQcBCMbSbQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys31u34vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 08:51:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H8p2J8015201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 08:51:03 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 01:50:59 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v1] misc: fastrpc: Increase user PD initmem size
Date: Mon, 17 Jun 2024 14:20:50 +0530
Message-ID: <20240617085051.28534-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
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
X-Proofpoint-GUID: lySQ3wJjgvnoUMYCkcVs4WM_2bizqwCB
X-Proofpoint-ORIG-GUID: lySQ3wJjgvnoUMYCkcVs4WM_2bizqwCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_07,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=856 bulkscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406170068

For user PD initialization, initmem is allocated and sent to DSP for
initial memory requirements like shell loading. For unsigned PD
offloading, current memory size is not sufficient which would
result in PD initialization failures. Increase initial memory size
to 5MB.

Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5204fda51da3..11a230af0b10 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_CTXID_MASK (0xFF0)
-#define INIT_FILELEN_MAX (2 * 1024 * 1024)
+#define INIT_FILELEN_MAX (5 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
-- 
2.43.0


