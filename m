Return-Path: <linux-arm-msm+bounces-45795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2043A18F29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C39B3AA556
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4F6211481;
	Wed, 22 Jan 2025 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l2AaFEpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B18211473;
	Wed, 22 Jan 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540263; cv=none; b=ho+OCUxqO+UFmKN/iIlGgboDZpDuQ1R1NlgE86HDKKBrxQdjfQg6nvGcmL+oOCfhLQZ4veZ47TBlQveYvxuq658Orn/wM8Hvphd5hvzud9fg+LrDJrVsqCKD3+2noY6NxdiOw4sFKlghqGQ3kIgnJkhQfPVuqJhx6n26t8LGCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540263; c=relaxed/simple;
	bh=6mdWUrrVahAt/4fJaGIy7eiVqiIHbpAylmNmOk241kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UNea0P2uOBqN1jnsNfFKHyjpHxg2PM6+q5LA36Bx20DSUn0ABaN73r3y+NWqq5mHpT4+5PP9tnQg3bnyi4FpeuWz4mHJpV+aUzskS+oiI1/YBzKvps3ZBiD3GCAGi0c+4vlR+T+AcTR1xzHVirYIKgUKiGFBKOHGuGhDDdB7sBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l2AaFEpA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M5htn5005065;
	Wed, 22 Jan 2025 10:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Cb2OUInCQ6N
	UjMEozfJkNPHrCqzxlA21t77oiJVeWeE=; b=l2AaFEpAKk6xuW6Zp26BpdZXep/
	EJ0Fbc5BYb/W0eLhaNME55c/cqJgXs3X4pd2chQz3prtBRaZi7O6aE9PJXEf1Azi
	uSue3Z/qkPjosnze2eEky0XKEofCDOg/ylbydiUSAYYTrlxgEQdFlOsrDqx50GvY
	FIFHVxLlj5cBelnANYa92dje9aCgPoH57dICPCtd3os1gNkmRoPeH641msSLBGe6
	wraY5xQGpqG3cyR0rO2Qk9QB+flWBQ+427H8oKhWQP7RN3m1oVjG5r/Vg1qCLfnD
	biNNh+qA10LJhErOs2g7+oXV+7te+oW2AaXysyUdxJ3TYScONqlX1KzCZGw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44atsgrm4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:06 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA33aJ006903;
	Wed, 22 Jan 2025 10:03:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4485cm3b7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:03 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA33qM006896;
	Wed, 22 Jan 2025 10:03:03 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50MA32u6006890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:03 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 3E9DE40CE9; Wed, 22 Jan 2025 18:03:02 +0800 (CST)
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
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock frequency to gear speed
Date: Wed, 22 Jan 2025 18:02:09 +0800
Message-Id: <20250122100214.489749-4-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 3qZBRg-p4KqRKExBAo0ogzj8DowRKOLR
X-Proofpoint-GUID: 3qZBRg-p4KqRKExBAo0ogzj8DowRKOLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 impostorscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220072

From: Can Guo <quic_cang@quicinc.com>

Add a vops to map UFS host controller clock frequencies to the maximum
supported UFS high speed gear speeds. During clock scaling, we can map the
target clock frequency, demanded by devfreq, to the maximum supported gear
speed, so that devfreq can scale the gear to the highest gear speed
supported at the target clock frequency, instead of just scaling up/down
the gear between the min and max gear speeds.

Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/core/ufshcd-priv.h | 10 ++++++++++
 include/ufs/ufshcd.h           |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 0549b65f71ed..a8f05fc6e830 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -277,6 +277,16 @@ static inline int ufshcd_mcq_vops_config_esi(struct ufs_hba *hba)
 	return -EOPNOTSUPP;
 }
 
+static inline int ufshcd_vops_freq_to_gear_speed(struct ufs_hba *hba,
+						 unsigned long freq,
+						 u32 *gear)
+{
+	if (hba->vops && hba->vops->freq_to_gear_speed)
+		return hba->vops->freq_to_gear_speed(hba, freq, gear);
+
+	return -EOPNOTSUPP;
+}
+
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /**
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index a4dac897a169..8c7c497d63d3 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -336,6 +336,7 @@ struct ufs_pwr_mode_info {
  * @get_outstanding_cqs: called to get outstanding completion queues
  * @config_esi: called to config Event Specific Interrupt
  * @config_scsi_dev: called to configure SCSI device parameters
+ * @freq_to_gear_speed: called to map clock frequency to the max supported gear speed
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -387,6 +388,8 @@ struct ufs_hba_variant_ops {
 				       unsigned long *ocqs);
 	int	(*config_esi)(struct ufs_hba *hba);
 	void	(*config_scsi_dev)(struct scsi_device *sdev);
+	int (*freq_to_gear_speed)(struct ufs_hba *hba, unsigned long freq,
+					u32 *gear);
 };
 
 /* clock gating state  */
-- 
2.34.1


