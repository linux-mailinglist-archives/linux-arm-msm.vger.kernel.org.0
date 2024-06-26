Return-Path: <linux-arm-msm+bounces-24267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB4917F05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 12:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D15C61F2737D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3D017D8B4;
	Wed, 26 Jun 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UMERHPhL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE8B17CA06;
	Wed, 26 Jun 2024 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719399351; cv=none; b=Hi+y7hCZKWurW2K4g4m9M5hJcUYNOe6rSZ8oIQPIuLxE3PtubsWCQdm9wy2jkKIDxW1BF/7dwh31Ne3v28ru0km2nkKIIO39u/IZ1Y2GS4sKR6NEewkGlmlV8TLiDEmhlf3g42WOGhpq1GNLVqtT+4QNKxRz6H3ddJYNPo2CBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719399351; c=relaxed/simple;
	bh=WfnkUjUloeev9V02xrOIjSJyVhK5ZzQb269EZt3BQ+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=OQKHOqkWl7njr+cVISXNwFj1+iQkQsnzWEL8vkHumBa7BTi86IFeu+Rl//3YYpzusRzR0gjJqhOBRYIxPDoFq9daY5rUZ7ygxLD3U+xWIkHAnaWm8zmhRrMUqB0P+JA2OAnHXuxrgiRXonuiwOt0NKDF6LDHfK712LSUX2MmwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UMERHPhL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfSrg010751;
	Wed, 26 Jun 2024 10:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=I/Dw1lhLN2Z1uSLj1NEkIlvWTPOeDTSlL2BE5ttA9sk=; b=UM
	ERHPhLnch54Q0+1zp5Vcrx2W2HNqb7ixa5vZWVn5AIaxds8Y21FmXhzvMjhX9c1Q
	52x9CFxcvg4K0souJqOSqNg3b1X2f1SJg0Mo7ts9pctDPXxSN9V90FN0+MIO8KzX
	VBJDWINhyVD0FbKbJySEnaMHEWxm00QW/Hf8dFTlbjmjVHGXzSWUjo4FbwQzqato
	8TAlKjUqNHQA84NsLKhSKtV584/66gFtJNY8f/RVG07ER7nh0/eD9/ndsxE62MNv
	fQO7QbQnFvy+iFXTPQAFSuoCV7KgbsEpppToqRH8d0liBEHFZMu/TxRtoPASR6CC
	8+4SDgHFB1q+Ddq34VyA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdq924g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 10:55:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45QAtQNg027056;
	Wed, 26 Jun 2024 10:55:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpm73yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Jun 2024 10:55:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45QAtPOZ027025;
	Wed, 26 Jun 2024 10:55:25 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.213.109.119])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45QAtPZD027021;
	Wed, 26 Jun 2024 10:55:25 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2305851)
	id 4E80952B08F; Wed, 26 Jun 2024 16:00:36 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_nitirawa@quicinc.com
Subject: [PATCH 1/2] scsi: ufs: Suspend clk scaling on no request
Date: Wed, 26 Jun 2024 16:00:32 +0530
Message-Id: <20240626103033.2332-2-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240626103033.2332-1-quic_rampraka@quicinc.com>
References: <20240626103033.2332-1-quic_rampraka@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MkXPFcZGRe_ys3pRZG0nnzQ4s1aNJlsr
X-Proofpoint-GUID: MkXPFcZGRe_ys3pRZG0nnzQ4s1aNJlsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_05,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260083
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Currently ufs clk scaling is getting suspended only when the
clks are scaled down, but next when high load is generated its
adding a huge amount of latency in scaling up the clk and complete
the request post that.

Now if the scaling is suspended in its existing state, and when high
load is generated it is helping improve the random performance KPI by
28%. So suspending the scaling when there is no request. And the clk
would be put in low scaled state when the actual request load is low.

Making this change as optional for other vendor by having the check
enabled using vops as for some vendor suspending without bringing the
clk in low scaled state might have impact on power consumption on the
SoC.

Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 include/ufs/ufshcd.h      | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1b65e6ae4137..0dc9928ae18d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1560,7 +1560,8 @@ static int ufshcd_devfreq_target(struct device *dev,
 		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 
 out:
-	if (sched_clk_scaling_suspend_work && !scale_up)
+	if (sched_clk_scaling_suspend_work && (!scale_up ||
+				hba->clk_scaling.suspend_on_no_request))
 		queue_work(hba->clk_scaling.workq,
 			   &hba->clk_scaling.suspend_work);
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index bad88bd91995..c14607f2890b 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -457,6 +457,7 @@ struct ufs_clk_scaling {
 	bool is_initialized;
 	bool is_busy_started;
 	bool is_suspended;
+	bool suspend_on_no_request;
 };
 
 #define UFS_EVENT_HIST_LENGTH 8
-- 
2.17.1


