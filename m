Return-Path: <linux-arm-msm+bounces-24269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C83917F08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 12:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780941C20CF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465351802A9;
	Wed, 26 Jun 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gkFZai57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38FC17F4F2;
	Wed, 26 Jun 2024 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719399356; cv=none; b=qqkXaAsfTmY4UA0y7RatVx1U+knrmZbXNmEN6bAqkGDBexzlXGkL+HC9VxVKz2IBwXzYP/NwrKGZdcvDaYFRw8UBz2Bi+TTAH76mz9LTFX1N1L89HNPb97YHeAZca/64aM+splWGw1a86KP1kG5fw2Sk+2ZF/xFePltNZ1fggOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719399356; c=relaxed/simple;
	bh=NFazCmtvteJe3dk4EPQLE2s6aXERomtkUSNX8Z6StSU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=rz6/hGhE9+n80Wvjt+igHEpxTwaFOIr6OQfV6zY/v4d2MfJ/Cy5TwWt54T3rOfOIJrFdx+E/AljljEPtZm/m+t5dI36cSWH3m5eA823WqoluXDWqR9LDuuwnbAMjfg5ft7Azyin+QpgO4OP6/n/AlsyKhEF+WYa44O2CblReh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gkFZai57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfV4g023753;
	Wed, 26 Jun 2024 10:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=ncWWruiY2lo+
	c+aIbVVxq7qvZxouEUyAxGka6MeZ9Fg=; b=gkFZai57/fSMgz1NDQz4efOOmL8b
	hcasmgmHAmrNrRl51QknOWSkMzifbJV4xwtlKhQYkG12mBVM2lfOCUwtPtbey322
	4dnhoDJD41dHq28i4Y9dncygW+DZ9kPKX9DkBs2/65R5Xnjzxrg6YkLpaIQw9mpQ
	74A4LhMFpPz3Lin8sxDaavwKWDSqqkXzjY9YwGDkggyI05doBsgFt9jGIDSVCt6P
	Sq2iV62l0EFkDsSWktvEwEP9fR6G97iWm1vhQDw9a3Njtqq+I/he7Ug4sJwnp1uQ
	hSjt3pYRK1T6ZjgjEc9yHRQX6dL4VOUhPs3zRjcbFEUpe38fma7H/+9PJg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6ysak5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 10:55:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45QAmBVG019093;
	Wed, 26 Jun 2024 10:55:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpm73yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Jun 2024 10:55:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45QAtP3R027026;
	Wed, 26 Jun 2024 10:55:25 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.213.109.119])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45QAtPs2027020;
	Wed, 26 Jun 2024 10:55:25 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2305851)
	id BEC9052B08E; Wed, 26 Jun 2024 16:00:34 +0530 (+0530)
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
Subject: [PATCH V1 0/2] Suspend clk scaling when there is no request
Date: Wed, 26 Jun 2024 16:00:31 +0530
Message-Id: <20240626103033.2332-1-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6XfUJXwRQXgeS_umIi3j6szHEVnGgLqB
X-Proofpoint-ORIG-GUID: 6XfUJXwRQXgeS_umIi3j6szHEVnGgLqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_05,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=837 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260083
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


Ram Prakash Gupta (2):
  scsi: ufs: Suspend clk scaling on no request
  scsi: ufs: qcom: Enable suspending clk scaling on no request

 drivers/ufs/core/ufshcd.c   | 3 ++-
 drivers/ufs/host/ufs-qcom.c | 2 ++
 include/ufs/ufshcd.h        | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.17.1


