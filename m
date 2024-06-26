Return-Path: <linux-arm-msm+bounces-24268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8E9917F03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 12:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636521F269F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C71817E454;
	Wed, 26 Jun 2024 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C4CDLlGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6717DE11;
	Wed, 26 Jun 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719399353; cv=none; b=AL0b8Ds9FbOsle9RwdtDnpzyhgW+SDuFGAbhYtRxvdXU7iIULqw9Y3hNoD3VMq105hPQhLxjw3mg9AdTw0T+dDe8IXVnOjdKR16N5JYgpvnbCd7YgxXLbe20oW2x2piLYZSvDD6gDsccryTElQ3ECzik/orgcVd1Ksr9pAG8fys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719399353; c=relaxed/simple;
	bh=kh3BvM1UYLJbgnRm0wk8tVIY19VqIuh2seSAOWDNjek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=I15fp8LU6ZL1ZLEyPupiOIjQZhVTKIn1tqWi4tL2+6aA+/lpCCRLx8Lg7nbrz8YPFZ6NRyTTZFoJztIwEIwFgnbX06yKc3Is4x3Ki2P/DpRJKiGu0r/laciy5WZ1gOGMU4+A4U3r8ew1kCQohiSxYbbfjB2H3mQoc/9dya0JP3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C4CDLlGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfJ1N029739;
	Wed, 26 Jun 2024 10:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=/8PbBjaENy3mbbV95BuGAhcwyL8sMrqxjHV3mlbulEA=; b=C4
	CDLlGteVuXtfK42alK4cNu7YhUCc4Wb1nfQVfig0wQ07/BCRLKL6HFTn2gS3PS4c
	vaQZ2AGmXw+SUufQLCLXm0qhkDVo3n9MclWSsq61qMKR+GYTVVOqtfGIomiaZwgz
	l7ZauzYVKw46z5wXjLgPRq4R2xJOk3H1qgwwv5krBLRD3jjAgqfUExA7p9ruWawU
	hozwAZL+jahWtla+uqT+0cguML6Jss7Mg+lZIQl/ZQ8vpkoR9nz9RF2FqPl5XOvT
	/pUkOYOCkq0+7PRJI7RxV8EU6rWhPWZ5rBNy3bUJa5rVhJ12pqg1IFkQfJW+VUn+
	//HANElX5qmg6wCuCURg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400c468y57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 10:55:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45QAtQUZ027055;
	Wed, 26 Jun 2024 10:55:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpm73yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Jun 2024 10:55:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45QAqEDn022848;
	Wed, 26 Jun 2024 10:55:25 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.213.109.119])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45QAtPWn027022;
	Wed, 26 Jun 2024 10:55:25 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2305851)
	id B248952B090; Wed, 26 Jun 2024 16:00:37 +0530 (+0530)
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
Subject: [PATCH 2/2] scsi: ufs: qcom: Enable suspending clk scaling on no request
Date: Wed, 26 Jun 2024 16:00:33 +0530
Message-Id: <20240626103033.2332-3-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240626103033.2332-1-quic_rampraka@quicinc.com>
References: <20240626103033.2332-1-quic_rampraka@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Or2tOiRwshdF2qEdO8kMfDp3qOProMR_
X-Proofpoint-GUID: Or2tOiRwshdF2qEdO8kMfDp3qOProMR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_05,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260083
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Enable suspending clk scaling on no request for Qualcomm SoC.

Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cca190d1c577..9041ffab152c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1548,6 +1548,8 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 	p->timer = DEVFREQ_TIMER_DELAYED;
 	d->upthreshold = 70;
 	d->downdifferential = 5;
+
+	hba->clk_scaling.suspend_on_no_request = true;
 }
 #else
 static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
-- 
2.17.1


