Return-Path: <linux-arm-msm+bounces-22289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF19038F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 411E31F22940
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D121791EF;
	Tue, 11 Jun 2024 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ISFJ5FQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1491417A939;
	Tue, 11 Jun 2024 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102107; cv=none; b=Hm6bHysVS8CcqPB+cJ6mXtqsAeiG3P4O4QPwvM6v5gX8UCB1jDW18AVhzR6Tmo2JGQPylJfEKDIM6NPeJldLzDqjg4VTYP07MnR0KEb69Ve9v3su7kKArgyn56M7ZpRKUxZh9Lt+Zm1dRAcfpRQLRU7JBrzUJMVG6KOrrsV1+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102107; c=relaxed/simple;
	bh=IFAwgLYIVNiT1DyTOrZ+wD7aEJ+ZJbriVh9nPOim1P4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/T97iFdKBGUvflEECgPnI/Q2hxeC4IbjGR5ejQM6uAgrMy6vAlTGwpJyyGPnbMnUIoafVtvRMySHBdV2c5eZvfot/JHgTCD535Dbctstz4OLkNOvxI5zvJi1SojPaSoj4aox5E+Jyqp/mTpiTuDaP3pMngeR6G8TkilTHwc1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ISFJ5FQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BA7vgJ016951;
	Tue, 11 Jun 2024 10:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcaHTiFdtI61MVemNZZdvjdwIbXvZJOj3Oqq+GgO4zo=; b=ISFJ5FQ1vSnprqNh
	+r1tXbtMQnPTtAYfZaHb5wIm+Py2uxpg0V0E9oQfPXc5nrwMrhx8i4CSmfkNycxp
	gpas0XKs8fPa6mhR8oKEhd5d5jsDjq8KOCvOzGnWQFFT0i+5GnE4skR3/4QCsQi4
	bPR5XFV65Om+2tN/1UiNxZLVA6MG90C47Q0q4nf125QWXubIBP5I4e3Wht7qh7km
	dmDzMZ0fWaWDhn1AxYHViTQC/xESjGoszF+k7NHc32kBibjdlL4KOiB8w/FD58wq
	L5lYxxjFJAjFJJ5RLntxbud7dcFedKkuDFzaayiETLgAbB84qt+mJPBHIVPpadYA
	lKzg5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjar2b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:35:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BAYxQh022894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:34:59 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 03:34:56 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Caleb
 Connolly" <caleb.connolly@linaro.org>
Subject: [PATCH v5 2/7] misc: fastrpc: Fix DSP capabilities request
Date: Tue, 11 Jun 2024 16:04:35 +0530
Message-ID: <20240611103442.27198-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: pAittO2b2qkZMb_pBIsG7FHxY5XieoGx
X-Proofpoint-ORIG-GUID: pAittO2b2qkZMb_pBIsG7FHxY5XieoGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110080

The DSP capability request call expects 2 arguments. First is the
information about the total number of attributes to be copied from
DSP and second is the information about the buffer where the DSP
needs to copy the information. The current design is passing the
information about the size to be copied from DSP which would be
considered as a bad argument to the call by DSP causing a failure
suggesting the same. The second argument carries the information
about the buffer where the DSP needs to copy the capability
information and the size to be copied. As the first entry of
capability attribute is getting skipped, same should also be
considered while sending the information to DSP. Add changes to
pass proper arguments to DSP.

Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/misc/fastrpc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4028cb96bcf2..0c5bba1d355e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1693,14 +1693,19 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 {
 	struct fastrpc_invoke_args args[2] = { 0 };
 
-	/* Capability filled in userspace */
+	/*
+	 * Capability filled in userspace. This carries the information
+	 * about the remoteproc support which is fetched from the remoteproc
+	 * sysfs node by userspace.
+	 */
 	dsp_attr_buf[0] = 0;
+	dsp_attr_buf_len -= 1;
 
 	args[0].ptr = (u64)(uintptr_t)&dsp_attr_buf_len;
 	args[0].length = sizeof(dsp_attr_buf_len);
 	args[0].fd = -1;
 	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
-	args[1].length = dsp_attr_buf_len;
+	args[1].length = dsp_attr_buf_len * sizeof(u32);
 	args[1].fd = -1;
 	fl->pd = USER_PD;
 
@@ -1730,7 +1735,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	if (!dsp_attributes)
 		return -ENOMEM;
 
-	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
+	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
 			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
-- 
2.43.0


