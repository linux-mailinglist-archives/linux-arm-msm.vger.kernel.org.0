Return-Path: <linux-arm-msm+bounces-24412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA29E91A1AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1442A1C20933
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 08:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DA412A16C;
	Thu, 27 Jun 2024 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FMlkLtYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126A7EF04;
	Thu, 27 Jun 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719477506; cv=none; b=gAJuvelWSM47HoeNARTbdI8Hb9h2JaisVD3/kh1Ko9rciyPr0O5qdexYj2rS4bFrwInDUO1hOBMc8lalA6TVbwiQ9tol1RfIPPOQxdYQujtIxzZvufUONRrw/QhzSeZUPyMlzGZZHiGuKxp/ssV47HeTi6n+8r00Kzk0JG+PLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719477506; c=relaxed/simple;
	bh=dHMQiAk0KuDJseI/jZU1VvVJtdyigKwX7iX6L7HwIz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=FZkGbWMayH1KCw0t8+Jkl0WsLWUfKZ7QYnWQ/lbs7aontUTq/QQuFthXljoMDsmaJxl6V+rn10+PvbOMKvBu8hafp9vr0IUcQxiOz5FTDzcqhFw6RiS+6j2a7WoqcDywzeboeHYFva0V5tv7sXyTG0P/V1pKzN8f+0+S3oc1y1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FMlkLtYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R23F9e022671;
	Thu, 27 Jun 2024 08:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=VkGm8NyiH5XHtCMqeL3s8fW7KGApr2o5luEf9lR9iJM=; b=FM
	lkLtYhjaSRmtmTFVIg+gGjzuVcOBuSv/IlBdMh5eKSj5W1+shXWP3Pgye2H8bew2
	Q9rPYy1hJiKG2pUadI0vKBVF4+LplKdlG+ONj6BTeRZON6TqFz6vrhdehDYeBxZl
	7DGt/zCLju61IhgSmOqGCA6xk06HLdcjiUgtA8ub+xgNpB32pc4Ws+3mF9fnv7WT
	ZcEi8k4oERqeKMDruigVv8/QuAI1laIXI11/bGhc7O/PNBRLiGzh+KM1pVFc6oSX
	Zj2yiR18DhXoUQ65fT4opYNMOPWsdUwJZsuW3QNJ4taqnVZNdUXaWDWLoxXtRqUH
	15WA3ad/mT3n4e0+lN+g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9k87a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:38:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45R8c4mr030665;
	Thu, 27 Jun 2024 08:38:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpmddgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Jun 2024 08:38:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45R8asSP029540;
	Thu, 27 Jun 2024 08:38:04 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.213.109.119])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45R8c3l8030651;
	Thu, 27 Jun 2024 08:38:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2305851)
	id 0F2C852B08E; Thu, 27 Jun 2024 14:08:01 +0530 (+0530)
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
Subject: [PATCH v2 1/2] scsi: ufs: Suspend clk scaling on no request
Date: Thu, 27 Jun 2024 14:07:55 +0530
Message-Id: <20240627083756.25340-2-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240627083756.25340-1-quic_rampraka@quicinc.com>
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nn0ctsMGxgrd-BtyAfCbFOlUa4OAMbv9
X-Proofpoint-GUID: nn0ctsMGxgrd-BtyAfCbFOlUa4OAMbv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_04,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406270065
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
index 1b65e6ae4137..9f935e5c60e8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1560,7 +1560,8 @@ static int ufshcd_devfreq_target(struct device *dev,
 		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 
 out:
-	if (sched_clk_scaling_suspend_work && !scale_up)
+	if (sched_clk_scaling_suspend_work &&
+			(!scale_up || hba->clk_scaling.suspend_on_no_request))
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


