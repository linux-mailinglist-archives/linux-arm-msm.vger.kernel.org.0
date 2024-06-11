Return-Path: <linux-arm-msm+bounces-22290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59CD9038F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC57AB27F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CB517B425;
	Tue, 11 Jun 2024 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n4CejVfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CFF17B419;
	Tue, 11 Jun 2024 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102110; cv=none; b=R1yxBK+VXbhStztU3NRsb6t7n7+Nv+rKt+6QC3ryDr2OSp+stLk84ZywhyeC41fkOrHBS3lwDgu9RGelpcjudoh5UPyu/Y5szhUfhUi9nEk9UkATLPJG5nbDso7ERZysywbhLF4+2AafOwWer6XvljJdCvXEL0MfapQ2v8Rfkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102110; c=relaxed/simple;
	bh=A0NyWf4F41faDH1gwv4JvgeYvtUE7FdvEaIzJbmVcQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDFlxMFNBunVfeVt7cLQHAVSidvFio6flZ6i1FTFdSu7J4FiID11rtxxXdb0+svfriMBvNWtPtHZohOB1rzfVZl3cMgL1LzJkneVBpPHoQkQEFYKLVGo5l7R8+rtK88irHwzUWlygkdfIgs6hahJPPDmcP69Z03MJxeCs4rAXfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n4CejVfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B2aToK023167;
	Tue, 11 Jun 2024 10:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSTC6r9pONx6axc6XZ3T+NzPoV52gQeWrTZsxeySfSA=; b=n4CejVfRs0Z7mJqF
	3KtCp2M+UzsKq9kcLkTOYYDDblNkqB460QQjT6nUFpaulcqm6Ka0ecgwqfomf1N8
	Gje8AahiuC427A+NPWQ8S2t5tdhC4X4WQlISLQZ4ZKe2Be887zuomlqsV43p2bxP
	Tyy0IqKJho9a2hk3/f8SRwA7NXVmewN6YNQ/5HbzRK+H1dj/8mX010qUhr6iB7j6
	Ko0E0WlzN5YvPq/KEjQYpw4WW0ngrpbyVSRP8x/hK77hwn7tQUF8GvpIhu8JG5Xd
	ux/uhPnI3wPkmOL4GYuXlpHbMBEBuVvq4WOcVkP8s+hRC81+ntunK6W8pOtdaIAU
	TE7O6Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymd0eennc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:35:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BAZ3Vr022995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:35:03 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 03:34:59 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Caleb
 Connolly" <caleb.connolly@linaro.org>
Subject: [PATCH v5 3/7] misc: fastrpc: Copy the complete capability structure to user
Date: Tue, 11 Jun 2024 16:04:36 +0530
Message-ID: <20240611103442.27198-4-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: UBzywnyIxLp-ilwJC9x4YGQ-bOWscYJ5
X-Proofpoint-ORIG-GUID: UBzywnyIxLp-ilwJC9x4YGQ-bOWscYJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110079

User is passing capability ioctl structure(argp) to get DSP
capabilities. This argp is copied to a local structure to get domain
and attribute_id information. After getting the capability, only
capability value is getting copied to user argp which will not be
useful if the use is trying to get the capability by checking the
capability member of fastrpc_ioctl_capability structure. Copy the
complete capability structure so that user can get the capability
value from the expected member of the structure.

Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 0c5bba1d355e..c033865d8059 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1788,7 +1788,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	if (err)
 		return err;
 
-	if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
+	if (copy_to_user(argp, &cap, sizeof(cap)))
 		return -EFAULT;
 
 	return 0;
-- 
2.43.0


