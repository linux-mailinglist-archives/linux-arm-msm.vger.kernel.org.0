Return-Path: <linux-arm-msm+bounces-21079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64C8D4983
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6F07B23031
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5DF17E454;
	Thu, 30 May 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j3BHo8W1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A17817D375;
	Thu, 30 May 2024 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064455; cv=none; b=YPCXzLzFy+wpr2D0CHFhrquOllRDacF6ze8o67zceEaGsZsG3k5YPwCFsn26pBWp1JcI72CS3DQLIhqrouuLqmgn04y8H8LDT3dtWaugYAZEfNeG9GwSMoPFsUxCaZcip4WYTu8lgepHBUtTODOJKMB+IX8Huy2ZTQm5J4Z4stc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064455; c=relaxed/simple;
	bh=Dyhr7keEUVVzyyNY+TREEUaFWBf8yRwzboMKiSGpBA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WlyG2GredEM6B3aL4QOgvQ771GhoXcb7CIMPONn8HUFeJXp2nYjFKSLcekpUaWB84eFA0KMne8uVBl0vvRu41KHYJrO3Kbk/iKTequGlM/nHu0PDdgGY6bx0Iyria4DcbShO3zzT0Ol9gAg60ajYMsM5uHMw44WwFoTgEGeUWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j3BHo8W1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UA9Q9r005808;
	Thu, 30 May 2024 10:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9AMveJ+dSan5ebZIRz9hxO5CEtlvoPrrlO06yvWKGY=; b=j3BHo8W1umWUOCEU
	+898ELvpyOrz07gaNZeIp6ACsfj2C+bh/dRVih5e62DnQoxagjylYAKzT7PuuJjL
	1VGaR8fDgKOx97ARiRcALszi+wRwVbDGxXOXk4TeJTtRE1bGVrvCDZGfNEuXhvXI
	9tu6Mztu9Le4Wt5a0V3Vp9WHbOhYCg0vbxQHFvMe6yALrl6mCXhPXkADEk2vHGPA
	krXMKT5MsNsQEBZ+BJGX/2UPYV4vjQbZkZZWCJ4E6jIPsYuMAvKKhkhLkBXj2YZm
	lx3WRtxFHJo6dNmUsTjG+1zGou4wR9At/ve1+x46t7nn6xzfTjR7XvEarPRPyFmn
	Oo3osQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pufpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:20:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UAKmo6012736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:20:48 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 03:20:46 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
Subject: [PATCH v3 2/9] misc: fastrpc: Fix DSP capabilities request
Date: Thu, 30 May 2024 15:50:20 +0530
Message-ID: <20240530102032.27179-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rIsDX0Jz9gijY2q3q5JZJAXgr5MCoL7o
X-Proofpoint-GUID: rIsDX0Jz9gijY2q3q5JZJAXgr5MCoL7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300078

Incorrect remote arguments are getting passed when requesting for
capabilities from DSP. Also there is no requirement to update the
PD type as it might cause problems for any PD other than user PD.
In addition to this, the collected capability information is not
getting copied properly to user. Add changes to address these
problems and get correct DSP capabilities.

Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4028cb96bcf2..61389795f498 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1700,9 +1700,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
 	args[0].length = sizeof(dsp_attr_buf_len);
 	args[0].fd = -1;
 	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
-	args[1].length = dsp_attr_buf_len;
+	args[1].length = dsp_attr_buf_len * sizeof(uint32_t);
 	args[1].fd = -1;
-	fl->pd = USER_PD;
 
 	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
 				       FASTRPC_SCALARS(0, 1, 1), args);
@@ -1730,7 +1729,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	if (!dsp_attributes)
 		return -ENOMEM;
 
-	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
+	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
 			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
@@ -1783,7 +1782,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	if (err)
 		return err;
 
-	if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
+	if (copy_to_user(argp, &cap, sizeof(cap)))
 		return -EFAULT;
 
 	return 0;
-- 
2.43.0


