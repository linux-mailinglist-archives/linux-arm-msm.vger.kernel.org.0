Return-Path: <linux-arm-msm+bounces-47400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2FFA2E888
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 920803AACDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130681DFE3A;
	Mon, 10 Feb 2025 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KiN9z+9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FF91DFD85;
	Mon, 10 Feb 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181783; cv=none; b=uyx/+6NUtj5K0HcNOB7ytydaUGaPEN/XEtDQdSSvh/+WVafn5CPJIaCmSh48pJIg1L6wIClFAn1r9udKXh/xWGle3WYb9E2rbDTkt9qnSsP/+7K0shNesRwS74EVrPcyWvl2owEUAS6uhQz9vTcKLmRgpsqgopGiVDnPXQandEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181783; c=relaxed/simple;
	bh=cJZrd2rzmrCGmLCAUn1wv0OC7DQpvRYvY6WtdLcaQHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aaZp49d5J01udK72QL/GfQbN7YP5c6dUyts3gG+MiiT6HgBpJVfFNVVEvpRhE8dS1VYOkNg66SVh+3uASCwzqcPYd1bQJkAJbrOeGSIpwxR2NVkD3o4P2V/ePHE9J0nXNK8gKKTF19+CaprRr64QpoHK+vBlvKz/XqJxfrzpR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KiN9z+9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9Vg1Z018694;
	Mon, 10 Feb 2025 10:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyQdO5etRxQ
	uGgHlyMp8EaJ/FHzg76Hg3vSnesdKTzI=; b=KiN9z+9FKCu79p/TE7rOi0xNvL1
	dRAr0CKNHFrNcMQvmoapBvWGT/YyHtm49CI+d9yk3m8MVphfvEojsvtIQL829PAU
	Q3RcffsNMARcmNBYoRJG4aJuF+y1JzB1pEHopiX0aB13qhLmnfPm6TcvoMVFCkRC
	qeXwDESPnD6Fnwigt0jhI3YG6ZRsOW0ws/GUjgb3dZ6tB4H94pBjgnL+0aNQgUE1
	mrf1/koRfpeYe8EVoInXd7A7urWAFT+k5Ylr2sfZOvqEr1AC+4/bnuLV7l7NNQGJ
	W8lKj3/iUEKKU5Q6ixVcsBYZfkX4/it9UGJQUgNg4kUXy9L1H1JNzfo8+YA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0esby5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA2dDv011702;
	Mon, 10 Feb 2025 10:02:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkj1h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:39 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51AA2dNo011697;
	Mon, 10 Feb 2025 10:02:39 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51AA2cL6011695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:39 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 0B91540BF7; Mon, 10 Feb 2025 18:02:38 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 6/8] scsi: ufs: core: Check if scaling up is required when disable clkscale
Date: Mon, 10 Feb 2025 18:02:09 +0800
Message-Id: <20250210100212.855127-7-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H_jyycwSs6mXwUlnsvaehZDp4gc84zHO
X-Proofpoint-ORIG-GUID: H_jyycwSs6mXwUlnsvaehZDp4gc84zHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100084

When disabling clkscale via the clkscale_enable sysfs entry, UFS driver
shall perform scaling up once regardless. Check if scaling up is required
or not first to avoid repetitive work.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ebab897080a6..bd93119a177d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1777,6 +1777,10 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 	freq = clki->max_freq;
 
 	ufshcd_suspend_clkscaling(hba);
+
+	if (!ufshcd_is_devfreq_scaling_required(hba, freq, true))
+		goto out_rel;
+
 	err = ufshcd_devfreq_scale(hba, freq, true);
 	if (err)
 		dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
-- 
2.34.1


