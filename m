Return-Path: <linux-arm-msm+bounces-21977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9948FF32D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7841C23812
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9AC1991BA;
	Thu,  6 Jun 2024 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lBZT8EVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276A31991A8;
	Thu,  6 Jun 2024 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693203; cv=none; b=OwHSiSvJW1T4fYrBrCP5aa4iQMFtpjNmOJrsDhUWIaNGaB+MPu6w5votMM+9mRU2SEh+F3jG8cfl8QZA7Huh0q131SVDAr8ZQrJS5A8Oxh8eLnl7aAAar5I1N2sdAv1Qwky9lOYzH5FGKU+ZH/HLmnQGj4FcOxvOtMKF7W4t/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693203; c=relaxed/simple;
	bh=k+2Oz8ukul6aM2v+MQhnTt7zZVhtLEe9hv1rT9V/7HQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZX9rUKbGz7wFFkbScXefqG3bSI1R3w44+kWCdqTusCqDUzdo8cHQgtNgXCtXVyir7EJT6+AeDMytwy+0AzwJYnAVIZtwmr5FOmp6SrubQAsd9+WxfICXw7bPQw3K4zsdzXRpWHh6NZacMDi3sEnZHHXr2IphtTdL2mCdbDWyW5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lBZT8EVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456ALKGr027443;
	Thu, 6 Jun 2024 16:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0VhlNJnkp/ethjNqNz7+n85xwaF7ySSD2RLcQNkkXNI=; b=lBZT8EVaFVBij5Uf
	zfyhp3yj1d/RM2Qhv2mzVb6ZhqpEqOk1tS+hzxkCYeBoEa4SsBZvwey34zK6rr4P
	PC9iedAvDaE13+x3fnTtUHv5V+Wer86iuzBmFWhqMy9hV5gSX94WEB9s/gPQgTqd
	Luz6btS4KSS8K4EhuUMLFj3+eVLBQ66lJLZsCadnqXeCE/L8/4TTiJU8DtsWS/z8
	Q+OPyMvWwL7fJC8qSnUSlqGP3/ekWhAm8pABGmSPv04C9caQMvKehDCYRXfQiztP
	J0v/T0eArGcX/8zmTkesGYzxUhmU9YMu+ZNVODR7ZBy1uRZRvIQl/SReO8lOB2oU
	6k/06Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tknph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 16:59:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456GxtR1006423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 16:59:55 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 09:59:53 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v4 02/11] misc: fastrpc: Fix DSP capabilities request
Date: Thu, 6 Jun 2024 22:29:22 +0530
Message-ID: <20240606165939.12950-3-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: xuJIp5wQXLa57mTwPEO9L7BbKueIv6S1
X-Proofpoint-ORIG-GUID: xuJIp5wQXLa57mTwPEO9L7BbKueIv6S1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060120

The DSP capability request call expects 2 arguments. First is the
information about the total number of attributes to be copied from
DSP and second is the information about the buffer where the DSP
needs to copy the information. The current design is passing the
information about te size to be copied from DSP which would be
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
---
 drivers/misc/fastrpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4028cb96bcf2..abf7df7c0c85 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1695,12 +1695,13 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 
 	/* Capability filled in userspace */
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
 
@@ -1730,7 +1731,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	if (!dsp_attributes)
 		return -ENOMEM;
 
-	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
+	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
 			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
-- 
2.43.0


