Return-Path: <linux-arm-msm+bounces-68201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D9B1F4C7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 15:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E56564FEC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 13:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E70C24338F;
	Sat,  9 Aug 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mp8fVqDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693719049B;
	Sat,  9 Aug 2025 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754747131; cv=none; b=Swds9sdzGkD3USV7cDlViyAoUEvoqOqKfJVWUcCFs/1X/CWIehCD026xYAwnIyC82JxSrawIg5VOvHl2+nR451LA3hM/fRqy0mJcoQrnYLTVH8UhfuNUksVniVtyE+Le+1ANIJfiYC1OAE+kd1J92KVYYQY7d70vNkfZ6WUhL9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754747131; c=relaxed/simple;
	bh=ydFHCGuoBScykYKE90uFJyDswDmXxIBtqGIzFZRDmE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCiysh2lD438dORGr7x9SYsYfN4bijeJNj7W4hxIY8XeU8HCJbYFw02VTglIWmUOLZ9PBjk+V/wIGkCzq61waQKyKcR4C+jamerdqDOM/QkxpamFx8TyWUkFFN9yc7vNO/Dpc+KVEXiX6GMZlOzmuTvfiOXEwQiP+oHPLDbyDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mp8fVqDL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 579DA4UA004805;
	Sat, 9 Aug 2025 13:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OG3d0lDrcuXWFch/2X4e2K4a3EtHmuRoI+T
	86cCg/bQ=; b=Mp8fVqDL4RHrC9ownhrxU8Wkj//AVqYe8TN7QpDq/YKxIl/EfnV
	3Q+n/fVVtOeAAwxqTcAM7rUKr+YZk4PTdMPzGxeDsAQ7tdtVo6nY5d4GD6rD/LE4
	v0IpEW+3JO3M2dfn+PotWaJyiXYl1bDmQgDytuEfeGzN8DXOtUgWc6l30XMWN9mz
	pWZTjXZfyGJweXw8vAKMwQByudPvlSQL09/HBPayGod1KRywcEowHOVP+TocuR/O
	IUT80IepWJkRdprPNS0VjOzSPHeM8Hfjiq3+WBNlPcYhBdRdcQ5EZkR4ZKZzqfOJ
	0NuHa415Il9CgjBbLv3Ck7kH7Vneb5yjE0Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm8k2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Aug 2025 13:44:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 579DimsD019700;
	Sat, 9 Aug 2025 13:44:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48dydktb6c-1;
	Sat, 09 Aug 2025 13:44:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 579Dim0B019694;
	Sat, 9 Aug 2025 13:44:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 579Dilik019693;
	Sat, 09 Aug 2025 13:44:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 22AE15729CC; Sat,  9 Aug 2025 19:14:47 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
        tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1] ufs: ufs-qcom: Fix ESI null pointer dereference
Date: Sat,  9 Aug 2025 19:14:45 +0530
Message-ID: <20250809134445.19050-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX+VgGfB/IWru1
 s4/3Hw7ZfGiH6/5RwRMzu/U4ybsIdk1Ar2wzzRen38f5m1LLt+Mc8ECQ46sOLZ5NWiVT7Wx4j6S
 4sw86j6b4vHiDPXab3hUjB16f0QX9IMiY5SJjSgnfkQFvtzvQ6YX+IF3Somq2AF4B4jo1wbvwt/
 zFH6JOiiLYGDd4seYCj4JYgtUca32MxoX5rBps1VZ2rUCTq2HO9/Am0+uaq1PFv4XNPk7tddujz
 eDLJQVJccQeY6NrSolUeWL79SB3C6J0KldwUY/j7lQiB8SEC0EpOx7r9glbazsXlTtiOWfMoltH
 QEQYu1OhjcM3KUhDByRkp5t4x2mmZTKTSYqQk9qae/IbzwABdauiMJL38rdI4nC5TBq8uG4e0HO
 62xGoYRe
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689750d5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=xPyU-xE4Y_ssW17iAtgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YLgI4I5zzs0HyKADvIiaEr9n-nIJ_ByT
X-Proofpoint-ORIG-GUID: YLgI4I5zzs0HyKADvIiaEr9n-nIJ_ByT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

ESI/MSI is a performance optimization feature that provides dedicated
interrupts per MCQ hardware queue . This is optional feature and
UFS MCQ should work with and without ESI feature.

Commit fc87dd58d8f9("scsi: ufs: qcom: Remove the MSI descriptor abuse")
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

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
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


