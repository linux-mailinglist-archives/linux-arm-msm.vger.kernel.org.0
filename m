Return-Path: <linux-arm-msm+bounces-46710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A537A25412
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C9A1608D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9557820896E;
	Mon,  3 Feb 2025 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dwz89Jyc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A82080F0;
	Mon,  3 Feb 2025 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570379; cv=none; b=o2zqlXb+fYkcFh4s5qXExzFsAiyvplJ0FixgZA4WJfDPPDtiNJyIgocGf99qhJjnypyTKDM+rY3hFilXSpstLKRkIw9Mvlqpj066sApgyB0912JG4qRuK7lhqJxBIY35V97o6Y8faZMqiD2CwtkmptOg+s0RADbkJk6JQeAEf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570379; c=relaxed/simple;
	bh=WPe6I8CoRAqi3Dj+239RZzXKj2BRdCsW4SQRTBgGVic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=olzaet0F2XYp9pHU1u8YWW6poO9mIhm2+2OgXj9Ewqvf7xUO6rwOWuRPpgUCn0MmTy7m9KaTLmi/CrZA8voGn+uEaeNLmbuD/lW9hFNgG/GDNJDOxDM4DsQ2QRvFXGv0eYo8D6y5mCy2cB+rFQPgrHOZj1/H+6oDupLCkpgs3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=fail smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dwz89Jyc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512MuhPJ002400;
	Mon, 3 Feb 2025 08:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qE2zUl47MIn
	AKNvP9sua5UI7YMn0zS+/ffRqS7Lsu0I=; b=Dwz89Jyc9JGf03qNTi+mzxBKG7/
	z5WQS/NTOV+t5JENVNXRc1me4aKfHgwVFayjeiZup2x4BPiqGBWsmNG8Cus0ahzJ
	/eePbLuh/dnBfSvaoktLUlch1mRqqZRHL7QDa77HxlGEUyIQ84StV6wPZ/AKi1Mc
	GCbrAItzRQqLW5Cze/P8LNXshtNT+JiiFqjDEPOjWnXv3/fT2kR313pWfnoS3Xtj
	vOdyG8rsGDpzGwYRDqZ236bvAWIqkVAM8G3WJV9I75yeT0wqGuBG3wey9NIo4MvD
	FoJYTbCDt2WEzU1Tk8u/3X+Xku1weWO5rxRocWK6Hdrtl3jda76okNE1ALA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd429240-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:41 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138Bc3t026399;
	Mon, 3 Feb 2025 08:11:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44hcpkshkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:38 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138BcAM026393;
	Mon, 3 Feb 2025 08:11:38 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5138BcNA026392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:38 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 3216140BFE; Mon,  3 Feb 2025 16:11:37 +0800 (CST)
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
Subject: [PATCH v3 3/8] scsi: ufs: core: Add a vop to map clock frequency to gear speed
Date: Mon,  3 Feb 2025 16:11:04 +0800
Message-Id: <20250203081109.1614395-4-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: 2H03-QYP7n1WTAIGDO2j7VGLdmWy3xfi
X-Proofpoint-ORIG-GUID: 2H03-QYP7n1WTAIGDO2j7VGLdmWy3xfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030065

From: Can Guo <quic_cang@quicinc.com>

Add a vop to map UFS host controller clock frequencies to the maximum
supported UFS high speed gear speeds. During clock scaling, we can map the
target clock frequency, demanded by devfreq, to the maximum supported gear
speed, so that devfreq can scale the gear to the highest gear speed
supported at the target clock frequency, instead of just scaling up/down
the gear between the min and max gear speeds.

Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
v2 ->v3:
1. Remove the parameter 'gear' and use it as function return result.
2. Change "vops" into "vop" in commit message.
---
 drivers/ufs/core/ufshcd-priv.h | 8 ++++++++
 include/ufs/ufshcd.h           | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 0549b65f71ed..4da3e65c6735 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -277,6 +277,14 @@ static inline int ufshcd_mcq_vops_config_esi(struct ufs_hba *hba)
 	return -EOPNOTSUPP;
 }
 
+static inline int ufshcd_vops_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
+{
+	if (hba->vops && hba->vops->freq_to_gear_speed)
+		return hba->vops->freq_to_gear_speed(hba, freq);
+
+	return -EOPNOTSUPP;
+}
+
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /**
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index f51d425696e7..cdb853f5b871 100644
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
@@ -387,6 +388,7 @@ struct ufs_hba_variant_ops {
 				       unsigned long *ocqs);
 	int	(*config_esi)(struct ufs_hba *hba);
 	void	(*config_scsi_dev)(struct scsi_device *sdev);
+	int (*freq_to_gear_speed)(struct ufs_hba *hba, unsigned long freq);
 };
 
 /* clock gating state  */
-- 
2.34.1


