Return-Path: <linux-arm-msm+bounces-68260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE161B2005E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D408D176B96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 07:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8105284B3E;
	Mon, 11 Aug 2025 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d+HBgGny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16518CC13;
	Mon, 11 Aug 2025 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754897630; cv=none; b=o3Sw2rf3hvUPZy6zdiYjxhz0PcfG6JOWfDcT1j41Q/rKRoo35TGwFBjvsInPK9ytMYHcMRYkMl/V2/RcMQdk6F/W8qdNmxQ9CU4MWYYyfKXq+Miqkhz5zRtUPVt554xxql0pac2WHiBGCyT5EEUua6XpPB/eaUKyNK7yrWv629Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754897630; c=relaxed/simple;
	bh=+XWE49nZuwMWpG+cBM6ZFAg3ISI+EuwAEezYT4iJHeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giq4LtoyrbXkjRmrylHyAlPDPxpx4QgqIn720ByBNQKvbtcYkiUUd7fAv33k2Mw7ihG/WfYsG/UBv1xEmhi/9XyXEtb84PF921uTZ4CtY64HnM1/PmHfm8ojZ40KOdK8ag0z+P/IfRSRZrQsZYFuG+b+ZV+thn36hnNhpnFNIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d+HBgGny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AL01I9002174;
	Mon, 11 Aug 2025 07:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aiAmNZKt9E0YJvypmkacX51fMuTyDiCUFP9
	6aaE7CEs=; b=d+HBgGny6BhUTvs6/d2sho6E9uoh6EvCdf3wHk7tg1/8BQrUati
	u9lwwLweilq7Rd4gupyEjqEpB7ONDduUnnlRrTpSf1oEYeXbkLeYpjr1DctOevOs
	yoWQY393GfuWnvhEqoAtKrCTCv95alkNYYUJKRIa77OBDZk+/wQp1UxjObwE1Zlf
	YepuMmYto9j+xg82RqgYYN4OlJ4swDyjTGTo24S9+xZ294FzUJE597gU+WhNkHfr
	9+/D3ySUaFyYA52XHsGJAf3ws+nGDxBdG+B8X5LiCakku6BjYlSoWzFsoS/+DCzo
	/RNP35gfA/5A31S4gl4x5SFiyqC7KoJHUdQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduuf81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 07:33:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57B7XWol014548;
	Mon, 11 Aug 2025 07:33:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48dydkk18f-1;
	Mon, 11 Aug 2025 07:33:32 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57B7XWU6014543;
	Mon, 11 Aug 2025 07:33:32 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 57B7XWVc014542;
	Mon, 11 Aug 2025 07:33:32 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 8170F571876; Mon, 11 Aug 2025 13:03:31 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
        tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH V2] ufs: ufs-qcom: Fix ESI null pointer dereference
Date: Mon, 11 Aug 2025 13:03:30 +0530
Message-ID: <20250811073330.20230-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=68999cd0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=bLk-5xynAAAA:8 a=COk6AnOGAAAA:8
 a=sYN47ipuJMKu5r72jOkA:9 a=cvBusfyB2V15izCimMoJ:22 a=zSyb8xVVt2t83sZkrLMb:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LvuBhDWOtgT0VijwQWxeMXoNLJ4TfqVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX3O9LajmnJ3r6
 nEHp/NpK0CLj7QHB2F2lLEBsTiZiZFnoN+3Y9bWHVTRgXS3g1WzPt1XY4C0rEflXgMAl4Ron5rp
 VFRQSZ/QMEkx2ibXHmMef/dou2xDjkVfPE2H04WlE3ZYsMPJy+iYOfbxeVLElg5jVuFy9gbkYYb
 ufQeHtheS917zRegQzPYfvKKToraM8UwOKHfVMKA15lCz8mk//zsjtQEB/Ee8MGAyp1YR7Dg/7+
 DRu8k/vzU/MULFp6iiIfE2zU9+GTpES+SNHWgtAsceUhDO9pJ/V/cwgG4zjPxyon6E5PCPIOocE
 6HZvRjC0kfeWkXcJ+iJwLxwlEY7/ZmSW3H7IOFwOs6Z7tbuosvbdp7YQ5fBKOf0sjMCXfNwqIz2
 fJMrkRlN
X-Proofpoint-GUID: LvuBhDWOtgT0VijwQWxeMXoNLJ4TfqVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

ESI/MSI is a performance optimization feature that provides dedicated
interrupts per MCQ hardware queue . This is optional feature and
UFS MCQ should work with and without ESI feature.

Commit e46a28cea29a ("scsi: ufs: qcom: Remove the MSI descriptor abuse")
brings a regression in ESI (Enhanced System Interrupt) configuration
that causes a null pointer dereference when Platform MSI allocation
fails.

The issue occurs in when platform_device_msi_init_and_alloc_irqs()
in ufs_qcom_config_esi() fails (returns -EINVAL) but the current
code uses __free() macro for automatic cleanup free MSI resources
that were never successfully allocated.

Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000008

  Call trace:
  mutex_lock+0xc/0x54 (P)
  platform_device_msi_free_irqs_all+0x1c/0x40
  ufs_qcom_config_esi+0x1d0/0x220 [ufs_qcom]
  ufshcd_config_mcq+0x28/0x104
  ufshcd_init+0xa3c/0xf40
  ufshcd_pltfrm_init+0x504/0x7d4
  ufs_qcom_probe+0x20/0x58 [ufs_qcom]

Fix by restructuring the ESI configuration to try MSI allocation
first, before any other resource allocation and instead use
explicit cleanup instead of __free() macro to avoid cleanup
of unallocated resources.

Tested on SM8750 platform with MCQ enabled, both with and without
Platform ESI support.

Fixes: e46a28cea29a ("scsi: ufs: qcom: Remove the MSI descriptor abuse")
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
Changes from v1:
1. Added correct sha1 of change id which caused regression.
2. Address Markus comment to add fixes: and Cc: tags.
---
 drivers/ufs/host/ufs-qcom.c | 39 ++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4bbe4de1679b..bef8dc12de20 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2078,17 +2078,6 @@ static irqreturn_t ufs_qcom_mcq_esi_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }

-static void ufs_qcom_irq_free(struct ufs_qcom_irq *uqi)
-{
-	for (struct ufs_qcom_irq *q = uqi; q->irq; q++)
-		devm_free_irq(q->hba->dev, q->irq, q->hba);
-
-	platform_device_msi_free_irqs_all(uqi->hba->dev);
-	devm_kfree(uqi->hba->dev, uqi);
-}
-
-DEFINE_FREE(ufs_qcom_irq, struct ufs_qcom_irq *, if (_T) ufs_qcom_irq_free(_T))
-
 static int ufs_qcom_config_esi(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -2103,18 +2092,18 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	 */
 	nr_irqs = hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];

-	struct ufs_qcom_irq *qi __free(ufs_qcom_irq) =
-		devm_kcalloc(hba->dev, nr_irqs, sizeof(*qi), GFP_KERNEL);
-	if (!qi)
-		return -ENOMEM;
-	/* Preset so __free() has a pointer to hba in all error paths */
-	qi[0].hba = hba;
-
 	ret = platform_device_msi_init_and_alloc_irqs(hba->dev, nr_irqs,
 						      ufs_qcom_write_msi_msg);
 	if (ret) {
-		dev_err(hba->dev, "Failed to request Platform MSI %d\n", ret);
-		return ret;
+		dev_warn(hba->dev, "Platform MSI not supported or failed, continuing without ESI\n");
+		return ret; /* Continue without ESI */
+	}
+
+	struct ufs_qcom_irq *qi = devm_kcalloc(hba->dev, nr_irqs, sizeof(*qi), GFP_KERNEL);
+
+	if (!qi) {
+		platform_device_msi_free_irqs_all(hba->dev);
+		return -ENOMEM;
 	}

 	for (int idx = 0; idx < nr_irqs; idx++) {
@@ -2125,15 +2114,17 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 		ret = devm_request_irq(hba->dev, qi[idx].irq, ufs_qcom_mcq_esi_handler,
 				       IRQF_SHARED, "qcom-mcq-esi", qi + idx);
 		if (ret) {
-			dev_err(hba->dev, "%s: Fail to request IRQ for %d, err = %d\n",
+			dev_err(hba->dev, "%s: Failed to request IRQ for %d, err = %d\n",
 				__func__, qi[idx].irq, ret);
-			qi[idx].irq = 0;
+			/* Free previously allocated IRQs */
+			for (int j = 0; j < idx; j++)
+				devm_free_irq(hba->dev, qi[j].irq, qi + j);
+			platform_device_msi_free_irqs_all(hba->dev);
+			devm_kfree(hba->dev, qi);
 			return ret;
 		}
 	}

-	retain_and_null_ptr(qi);
-
 	if (host->hw_ver.major >= 6) {
 		ufshcd_rmwl(hba, ESI_VEC_MASK, FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
 			    REG_UFS_CFG3);
--
2.48.1


