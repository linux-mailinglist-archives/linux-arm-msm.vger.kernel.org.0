Return-Path: <linux-arm-msm+bounces-20719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB188D1977
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 817A91C22344
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D1A16C87A;
	Tue, 28 May 2024 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oUWiSxqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75116C849;
	Tue, 28 May 2024 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895830; cv=none; b=Iae+uCvFsy87rzvSV3RfpfWOZT8waYpDsrxxZ2QGe0G6ntDEeen5dGZXnf2j0xr7HTUMYc9CqZofEccQnAsbG8Ra0NKMOXBq2cPkFRkMJ3zcwYba9/mLQj7LbNvpn6BdfOQDyhoxvLtzGuUIzbWYjbSvkq8yM0WwjGazTNxt08E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895830; c=relaxed/simple;
	bh=AcuyhtQ6bvBzy8YUVGc8awBJZuAK8x1nA1LM2fUqigQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+Iws9D8siHdyq+vXdZpxBKB59jBJ9DeByZ63BlMyWYyUtQ8MbPZZ/w5cVtxJkr7oYDh8JBvT5p8HrHokvTajqseanEe1Vm8LEQaKvUy5m6tvcvVHIQMZMVVSXem0dBCrjnLUsVQd5OPyVszWAeYG+gWUknGGdc089k9/SvGaGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oUWiSxqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RN68dH021695;
	Tue, 28 May 2024 11:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQ3IpkA+E/iRPZ2pDpvk41LjQvlXFdoRtybvckLcti0=; b=oUWiSxqGdd/hmKde
	laU2AqFo6uMbVcA9jMcg8amAaz2dnvr/4569vb3LUtrrSSVIG4VkjdfVVhP3Eshr
	0kj/RrwUY/cgt/6sRlAF6qSlwVqp+F6R750nxzZszXoJ0b1u31VqG45waMH1Ctf3
	X2K5A3GQIGwwRTRw4STKeVfF36rFUXWgmzZzKxv4tcbMKLwTFYrK42hpsNulYgx9
	zQZHKGyNXDG8H2/UTY/XA1uW4tdl0zuuqrfqma5QSxZuWZaf/ziQYtgYvVRHZpq1
	IevsEl1NyYvXzeMT+DYJL8avbZ8L9P8k78ekKgvlyYAIgVK9DE5i3ZrxNmtJ+lyv
	VtCaCg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2mwtwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBUD9L027814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:13 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:10 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v2 2/8] misc: fastrpc: Fix DSP capabilities request
Date: Tue, 28 May 2024 16:59:48 +0530
Message-ID: <20240528112956.5979-3-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: FFS_PTCBU34lvcp-2CaavSJPazbqNmsK
X-Proofpoint-ORIG-GUID: FFS_PTCBU34lvcp-2CaavSJPazbqNmsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

Incorrect remote arguments are getting passed when requesting for
capabilities from DSP. Also there is no requirement to update the
PD type as it might cause problems for any PD other than user PD.
In addition to this, the collected capability information is not
getting copied properly to user. Add changes to address these
problems and get correct DSP capabilities.

Also, DSP capabilities request is sending bad size to utilities skel
call which is resulting in memory corruption. Pass proper size to
avoid the corruption.

Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4028cb96bcf2..3e1ab58038ed 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1695,14 +1695,14 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 
 	/* Capability filled in userspace */
 	dsp_attr_buf[0] = 0;
+	dsp_attr_buf_len -= 1;
 
 	args[0].ptr = (u64)(uintptr_t)&dsp_attr_buf_len;
 	args[0].length = sizeof(dsp_attr_buf_len);
 	args[0].fd = -1;
 	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
-	args[1].length = dsp_attr_buf_len;
+	args[1].length = dsp_attr_buf_len * sizeof(uint32_t);
 	args[1].fd = -1;
-	fl->pd = USER_PD;
 
 	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
 				       FASTRPC_SCALARS(0, 1, 1), args);
@@ -1730,7 +1730,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	if (!dsp_attributes)
 		return -ENOMEM;
 
-	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
+	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
 			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
@@ -1783,7 +1783,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	if (err)
 		return err;
 
-	if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
+	if (copy_to_user(argp, &cap, sizeof(cap)))
 		return -EFAULT;
 
 	return 0;
-- 
2.43.0


