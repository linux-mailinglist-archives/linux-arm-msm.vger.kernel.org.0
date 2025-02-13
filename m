Return-Path: <linux-arm-msm+bounces-47864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D29DA33982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541B91888879
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B0920D519;
	Thu, 13 Feb 2025 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ictuFXSF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6320B7F3;
	Thu, 13 Feb 2025 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433679; cv=none; b=CxiQh03DZjfywMl/eI2uFNy/oKl8eO2D34bERvOiRc+hsobVJOsGOmj+6RlFRchqoV4KXa/RIAm/CLyga9TR2iTHHmOgXfdLrntXJMrBBLtf5Q31e6vZHY7n2YC6EOkG4fiRvfSfbhDrnFYfsJaBf3Xb8Q7FYQ3a5Yipvirrnq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433679; c=relaxed/simple;
	bh=vAF+Y76YyVaOHqmGdn0DwxXrY0yv+BEm3z9bk49zjTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JL+iKG5fq0PLE1tWdHWXWGFjWUoNbroBdiodORi6RVDQCdgLUWRR/bPzhBS5720hSRoK6a+xSnEFsYLPh6oF2mu8y7K2IrQOYdb+VW1bpWrjMraWIyC0nnKEy3f8lwjW5d4KIMb1Qw9RzlhCTWghH5EP4XG3ab4mJ+EteebARzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ictuFXSF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CJdemR001528;
	Thu, 13 Feb 2025 08:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Te/nt0rgj35
	Gj3QXpfmw/Xvw29eM07yXT69zTDinPhM=; b=ictuFXSFAdfufDXTdt/bvPfU7l9
	IUavGqJQqnPzjKL1ZWLFzYjglM5TshQLiO8v5V+UMYXGsODgbnFXDXbgW29JyjKI
	7Wfz4xy26ccWVcAlOTqPoPSSW3Ct7fayAnEGsfflTeLqgTDt+miMlXYHzrcPoomW
	1PrrzOqLV4RJ5U4L6uqM7ixbyq6jT8H6vGdugvntiUE576rzsEJ0Vh83jG6JfN0s
	DGPOvy4BAG46rh6KWsUmIA0Ktrmujg9ukeufTve02V4s1ZH9x7RhswNVLdYUpb1v
	VvETewzWwsYNRVtq5KIjahmyC0Y35I0Td5bw5E3KzG09Wmq5hSJ1BC588XA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rrnfu48d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:54 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51D80psx031749;
	Thu, 13 Feb 2025 08:00:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkyajn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:51 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51D80mKL031714;
	Thu, 13 Feb 2025 08:00:51 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51D80pPt031743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:51 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 7067240C04; Thu, 13 Feb 2025 16:00:50 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        peter.wang@mediatek.com, quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v5 6/8] scsi: ufs: core: Check if scaling up is required when disable clkscale
Date: Thu, 13 Feb 2025 16:00:06 +0800
Message-Id: <20250213080008.2984807-7-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: Ng-XFjBtEhVtIG9dXqBhJ1xpozRW7NZx
X-Proofpoint-ORIG-GUID: Ng-XFjBtEhVtIG9dXqBhJ1xpozRW7NZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130060

When disabling clkscale via the clkscale_enable sysfs entry, UFS driver
shall perform scaling up once regardless. Check if scaling up is required
or not first to avoid repetitive work.

Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 9908c0d6a1e1..727ca930c2ef 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1770,6 +1770,10 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
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


