Return-Path: <linux-arm-msm+bounces-46712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59573A25419
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94DC2164D4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579AD2147FE;
	Mon,  3 Feb 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KMFKo7nJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6A8214804;
	Mon,  3 Feb 2025 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570389; cv=none; b=TETwKEB1nISTF0DsYT4Di6g1sQZx0MMHDrjAmAMDSKl2WZ3HiY6Mc2710Ht9dHBMl+G4spsB8lUhKiBVglRGZwM2aOqQ90Q3Kib3jz1QCA8s7/6RAoRzW31+5k/jQo9LIP3AgFFNUKzHnbIIrW9Ivd61ANx5fFowo9AFl1LUtV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570389; c=relaxed/simple;
	bh=RhWzIvVzjz9HhvApiDZwgIdo+3OGCNdkFOq/M9NU0cs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sfaOHPt3WZ3lZ+PQZJbDPaC1+mmk7qwQgv3vCwhxFp8NA54wXJ0xW3XpZMMeprC6llaQArmDLWuktT4EaHmejbl7IpOwTqyjZIRVhl1LjoMg77ivAaaP9HHSUTOvtY7GGX/ElIhPALwGUtm2o2NojXq4ejDxRQPnzJUTVQfnzkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KMFKo7nJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135Nw1m000327;
	Mon, 3 Feb 2025 08:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WrS82mIqgeb
	uY3RQ3iTW+rel4V7Y00FB9f2nHQzJ3Yw=; b=KMFKo7nJtjpKbJ/aLJ6uhdrDg+h
	HTD7naZ1DLssfFycO0OKlKqYoBCEHRtTOJZYuKxYK0C6FoZnWqdvUx4ABTrjlhZO
	b4QlPOdlqB8Eo+a7uHNRw2QeO9NR4WlwWvXakXM9aNf4iJS3k0NiFZ2ZiL2iXS3C
	s+9oY0qIXFh76Aa7FdYv5h63NKi4/5XHRZ538uUEomKXac7XSpxI3+wd3jrKDFHc
	L6NtLFtmRq39T0ITe+dsL6XbVPS8ujqysMgl5Hicv+ueF8x4a3itKcSs3zTYUghP
	w0pxoXd37xRuAKMphBGOyEJ8ZK4hSh/ljQqRu8bKLvNnhtRcodR5VYadZ6g==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm40b2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:53 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138Berk026412;
	Mon, 3 Feb 2025 08:11:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44hcpkshmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:51 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138Boqc026473;
	Mon, 3 Feb 2025 08:11:50 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5138Bo0U026458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:50 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 9C73C40BFE; Mon,  3 Feb 2025 16:11:49 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 6/8] scsi: ufs: core: Check if scaling up is required when disable clkscale
Date: Mon,  3 Feb 2025 16:11:07 +0800
Message-Id: <20250203081109.1614395-7-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: Mp0REY4w97gDa6U6HFv3Yj2Rf35izQIB
X-Proofpoint-ORIG-GUID: Mp0REY4w97gDa6U6HFv3Yj2Rf35izQIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=988 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030065

When disabling clkscale via the clkscale_enable sysfs entry, UFS driver
shall perform scaling up once regardless. Check if scaling up is required
or not first to avoid repetitive work.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
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


