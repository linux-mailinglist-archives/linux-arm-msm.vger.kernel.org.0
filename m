Return-Path: <linux-arm-msm+bounces-47866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA7A33986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9494F3A248E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B1820F094;
	Thu, 13 Feb 2025 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T20nn3sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0120B807;
	Thu, 13 Feb 2025 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433685; cv=none; b=RRfNH0lngw3EtASjCCgIXB7+DP2worExnytYNa7ON1rTJ+dEE4GklsiZWKzerV6mYxO255B66o9DNDwUQ/qaohPwcEt2+9VktljCLIAnGxvUXH26LWWQF4JjSbkGWgiVwCZnbRaLPNfz1v29boypkgVqzsehmHqijNEVBmoQ/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433685; c=relaxed/simple;
	bh=pNq8G6LE8l1psUY/haRyxNqBqOZZoRzN8NqbB5DpIzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqrgGqXRdTj6B8w+epLIDy/4TPBu4z9tqt00R3rSsbRIc+Tyu+Fq1EiZyrnTuFsgXAEjfn5jjCGq+QACdC/NwzAaD8/VFNx22dNlcfwt7kge6vdo+gQL13Z+YOMiJBVAuitV1Y+BNHpKSYbv63Oq+RznFROOqF96ncBgFQphpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T20nn3sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7H7fP032643;
	Thu, 13 Feb 2025 08:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6uyma+HDaTr80GZgI9jQtPOtdwyIuNDfTKOJAgOfB8=; b=T20nn3smej6HwXNC
	ag/TBMOO8EyEcJRhuz28UbUSFUkzkDlA0+fTX2O+0sFdwpS9ySc0TmzMDc6Y5xLT
	QAEcJ8Qk/nr49tyvDWliXgq9lpVSe8/Wxzu5EOl1Cshqx+dGxnANXPAqnBHjEayI
	8p7M47S1rCEdE1/dPjgMVB+5wi2MRJfilexd+bUk+cfwRt/nY8Fhyckcw+Om5g55
	Dukwlhltk9ac9tC5Ownxaf9qYeB3JGLUqP+k1Y71QaPqceWx1SIBi/CMmYxQse7V
	to0SC16AZohxz1DUcvw/IMMt1vofcsQJ2uRFBtFjwc9Lb3t3v2+PIKI5tyRsklWr
	cSEP/g==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc7b83aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:59 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51D80v1f020926;
	Thu, 13 Feb 2025 08:00:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkxycb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:57 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51D80uOs020920;
	Thu, 13 Feb 2025 08:00:56 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51D80uSV020918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:56 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 84A9040C04; Thu, 13 Feb 2025 16:00:55 +0800 (CST)
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
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v5 7/8] scsi: ufs: core: Toggle Write Booster during clock scaling base on gear speed
Date: Thu, 13 Feb 2025 16:00:07 +0800
Message-Id: <20250213080008.2984807-8-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aM9pWxy1_Z6ESXLoG0QYa55UUxTaOM6c
X-Proofpoint-GUID: aM9pWxy1_Z6ESXLoG0QYa55UUxTaOM6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130060

From: Can Guo <quic_cang@quicinc.com>

During clock scaling, Write Booster is toggled on or off based on
whether the clock is scaled up or down. However, with OPP V2 powered
multi-level gear scaling, the gear can be scaled amongst multiple gear
speeds, e.g., it may scale down from G5 to G4, or from G4 to G2. To provide
flexibilities, add a new field for clock scaling such that during clock
scaling Write Booster can be enabled or disabled based on gear speeds but
not based on scaling up or down.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>

---

v1 - > v2:
Initialize the local variables "wb_en" as "false".
v3 -> v4:
1. Add comment for default initialized wb_gear.
2. Remove the unnecessary variable “wb_en" in function
   ufshcd_clock_scaling_unprepare().
---
 drivers/ufs/core/ufshcd.c | 12 ++++++++----
 include/ufs/ufshcd.h      |  3 +++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 727ca930c2ef..628bf2aebbeb 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1393,13 +1393,13 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 	return ret;
 }
 
-static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool scale_up)
+static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 {
 	up_write(&hba->clk_scaling_lock);
 
-	/* Enable Write Booster if we have scaled up else disable it */
+	/* Enable Write Booster if current gear requires it else disable it */
 	if (ufshcd_enable_wb_if_scaling_up(hba) && !err)
-		ufshcd_wb_toggle(hba, scale_up);
+		ufshcd_wb_toggle(hba, hba->pwr_info.gear_rx >= hba->clk_scaling.wb_gear);
 
 	mutex_unlock(&hba->wb_mutex);
 
@@ -1454,7 +1454,7 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 	}
 
 out_unprepare:
-	ufshcd_clock_scaling_unprepare(hba, ret, scale_up);
+	ufshcd_clock_scaling_unprepare(hba, ret);
 	return ret;
 }
 
@@ -1814,6 +1814,10 @@ static void ufshcd_init_clk_scaling(struct ufs_hba *hba)
 	if (!hba->clk_scaling.min_gear)
 		hba->clk_scaling.min_gear = UFS_HS_G1;
 
+	if (!hba->clk_scaling.wb_gear)
+		/* Use intermediate gear speed HS_G3 as the default wb_gear */
+		hba->clk_scaling.wb_gear = UFS_HS_G3;
+
 	INIT_WORK(&hba->clk_scaling.suspend_work,
 		  ufshcd_clk_scaling_suspend_work);
 	INIT_WORK(&hba->clk_scaling.resume_work,
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index b34301de3cf8..6633c1a1c224 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -447,6 +447,8 @@ struct ufs_clk_gating {
  * @resume_work: worker to resume devfreq
  * @target_freq: frequency requested by devfreq framework
  * @min_gear: lowest HS gear to scale down to
+ * @wb_gear: enable Write Booster when HS gear scales above or equal to it, else
+ *		disable Write Booster
  * @is_enabled: tracks if scaling is currently enabled or not, controlled by
  *		clkscale_enable sysfs node
  * @is_allowed: tracks if scaling is currently allowed or not, used to block
@@ -467,6 +469,7 @@ struct ufs_clk_scaling {
 	struct work_struct resume_work;
 	unsigned long target_freq;
 	u32 min_gear;
+	u32 wb_gear;
 	bool is_enabled;
 	bool is_allowed;
 	bool is_initialized;
-- 
2.34.1


