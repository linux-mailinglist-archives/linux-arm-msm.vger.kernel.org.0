Return-Path: <linux-arm-msm+bounces-45796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 964BCA18F28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC96E16BCD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD9E21149C;
	Wed, 22 Jan 2025 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EhxhfuoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D42211476;
	Wed, 22 Jan 2025 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540264; cv=none; b=QMlOEWgtxv5jOawJlcKrENygCKMDHaEAfeC62S0CKa4WfEDeyDpjUOP2MRab/cXjRfwTZg5gvDjjLrixYh92FkuR/tgn7Xc61wFzZebc23iy97wjyoa7TX2k9m0NmGPljdQr0BCRSvsqQgyu8Fs/61mCNnYsIIs5Q7JwLmpKVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540264; c=relaxed/simple;
	bh=YLIKmT/voqU7lJoYBk0dzxmf1NPi00fxL6KTMLlpV6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BHU4N0+p+vfJ63Gl7P7uapccKONRkW67zYQUPkNSW4v4EbGUV+OWwZ/2cvJF1iQlWFUCJCCm0hzzHqdMDbVwFDKO+JD1a2d4wPcfAk2WDudJLoHkX/v6vnFgYqu1zuvM9wpEcyI/GRt9LnQrsh9J7b0A9+N0nt0rf48p0ewlj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EhxhfuoU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6I7aY023350;
	Wed, 22 Jan 2025 10:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4manhHXny9F
	i7hRVodbdsginf0hAnZ34xkZ6PFG3Ifw=; b=EhxhfuoUpWcrw4H3JiOfxw+aMZW
	FAakIlbxCzmYw0fqijNY3Z+0WtePR4B+pMolM8nOY2qsWsEDzuHhNR5v3MObgNs8
	pLUEdlyvJLGISsi9XrNp6g6xA8Cph6Bx2ooVrv5mwVH/mddBEPtiWeFDgXcqaRxq
	yZVFsSO3iE8uzSj6lCh5PeWbXghV70IW8NFcQX/D/RWNIFlH+E4k+IbYSSIxb7Gn
	5B64YwZ406jJMSjz/pUdHlbkFUeMVowEDuBxjTvYFsM2M6iF+x6KlE/DXnab0Ao7
	i2GDEjxWrvX28zh6TUFU/sxEKE8NZs5MJLzXIaVF5ruCmA4Mx6pweGPNpxw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44au9eghj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:57 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA2cRs006767;
	Wed, 22 Jan 2025 10:02:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4485cm3b6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:54 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA2saQ006794;
	Wed, 22 Jan 2025 10:02:54 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50MA2sZ2006792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:54 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 274BB40CE9; Wed, 22 Jan 2025 18:02:53 +0800 (CST)
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
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maramaina Naresh <quic_mnaresh@quicinc.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-mediatek@lists.infradead.org (moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v2 1/8] scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
Date: Wed, 22 Jan 2025 18:02:07 +0800
Message-Id: <20250122100214.489749-2-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: 5ZQFgq9QRSnfX9-yTrJraYm7RFXEx-Dv
X-Proofpoint-ORIG-GUID: 5ZQFgq9QRSnfX9-yTrJraYm7RFXEx-Dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220073

From: Can Guo <quic_cang@quicinc.com>

Instead of only two frequencies, If OPP V2 is used, the UFS devfreq clock
scaling may scale the clock among multiple frequencies, so just passing
up/down to vops clk_scale_notify() is not enough to cover the intermediate
clock freqs between the min and max freqs. Hence pass the target_freq ,
which will be used in successive commits, to clk_scale_notify() to allow
the vops to perform corresponding configurations with regard to the clock
freqs.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
Modify commit message to make it more clear.
---
 drivers/ufs/core/ufshcd-priv.h  | 7 ++++---
 drivers/ufs/core/ufshcd.c       | 4 ++--
 drivers/ufs/host/ufs-mediatek.c | 1 +
 drivers/ufs/host/ufs-qcom.c     | 5 +++--
 include/ufs/ufshcd.h            | 2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 9ffd94ddf8c7..0549b65f71ed 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -117,11 +117,12 @@ static inline u32 ufshcd_vops_get_ufs_hci_version(struct ufs_hba *hba)
 	return ufshcd_readl(hba, REG_UFS_VERSION);
 }
 
-static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba,
-			bool up, enum ufs_notify_change_status status)
+static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba, bool up,
+					       unsigned long target_freq,
+					       enum ufs_notify_change_status status)
 {
 	if (hba->vops && hba->vops->clk_scale_notify)
-		return hba->vops->clk_scale_notify(hba, up, status);
+		return hba->vops->clk_scale_notify(hba, up, target_freq, status);
 	return 0;
 }
 
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index acc3607bbd9c..8d295cc827cc 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1157,7 +1157,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 	int ret = 0;
 	ktime_t start = ktime_get();
 
-	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, PRE_CHANGE);
+	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, PRE_CHANGE);
 	if (ret)
 		goto out;
 
@@ -1168,7 +1168,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 	if (ret)
 		goto out;
 
-	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, POST_CHANGE);
+	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, POST_CHANGE);
 	if (ret) {
 		if (hba->use_pm_opp)
 			ufshcd_opp_set_rate(hba,
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 135cd78109e2..977dd0caaef6 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1643,6 +1643,7 @@ static void ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 }
 
 static int ufs_mtk_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
+				    unsigned long target_freq,
 				    enum ufs_notify_change_status status)
 {
 	if (!ufshcd_is_clkscaling_supported(hba))
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 68040b2ab5f8..b6eef975dc46 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1333,8 +1333,9 @@ static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba)
 	return ufs_qcom_set_core_clk_ctrl(hba, false);
 }
 
-static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
-		bool scale_up, enum ufs_notify_change_status status)
+static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
+				     unsigned long target_freq,
+				     enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int err;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index d7aca9e61684..a4dac897a169 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -344,7 +344,7 @@ struct ufs_hba_variant_ops {
 	void    (*exit)(struct ufs_hba *);
 	u32	(*get_ufs_hci_version)(struct ufs_hba *);
 	int	(*set_dma_mask)(struct ufs_hba *);
-	int	(*clk_scale_notify)(struct ufs_hba *, bool,
+	int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
 				    enum ufs_notify_change_status);
 	int	(*setup_clocks)(struct ufs_hba *, bool,
 				enum ufs_notify_change_status);
-- 
2.34.1


