Return-Path: <linux-arm-msm+bounces-68091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D849B1E4DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E12116BD89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3CD26B951;
	Fri,  8 Aug 2025 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CuGJQvtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779FA26D4FC;
	Fri,  8 Aug 2025 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643117; cv=none; b=OHBkjBstsYvCe9EoYdQwHg0tKLdXP/3ee5uhCNBv3XXMkgGnaKrXnMtkQfWcNU2XNmllQeFSUwqfvffCRDsY13itNb9R99VRVBaDsFh/GZNBawGOMEKXQlMXFK+Smk5T2b4tr6h7uazMi9v3fu7u7PLqHrbYEdgICyqn2Hl/QRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643117; c=relaxed/simple;
	bh=Y3NNHPx4fORziUcmNLQU0bwJJTkr3LUpZj/FoP+Amgk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mnZaICrVKZZ4afZgbKbYGLEeFeDa5I64Q3bg1j/waMiJQ12ywoQ9rQ/5i1zPvJs+FC4GKK6iDl1uJPZoNlX8hnGt1RlNVBqfuOtw1++bRppRLX/U/Eroy7os/SX1wAKNCgAq+L9WEdty3oNbOJp2nnseouozErpcwofbwHdSjjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CuGJQvtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787DZVn020307;
	Fri, 8 Aug 2025 08:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fN6XVA3Zt3AXfvSpB4Cul2
	8Gzg6BqsjsXR/p9Ea7nlY=; b=CuGJQvtqRc9xfpMNNjkDwrFcrpCJnAVQJRvK6d
	KpyQ6CJinpP8tNSZKhfxku9v6e1ctdE1CH9qBvmUFhP/nIJr7lPoBtxg6sTnsv/l
	4g6pP/8Y9nFJCYiBR03HLokxwHewjKMFezEiBpsZxa9phvSQrRJUYM56jbhSNA/o
	/87kJ57683y48p88e7nu35I/KN1FT/ClhLuASzxo9Pe2+K8+K7tsOXVc1VaFP8Kl
	afnEEevTnnQZNgdj56itrPwWJTmf7rbj6XuleABkl9mDGXJbfY58O+0FXcmdzWPL
	yhLgxdHYS8uDqwmiS8M3mLsrdKSYesK8kIjgwQ0Ud30dKRMA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8hde4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 08:51:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5788pnFH025006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Aug 2025 08:51:49 GMT
Received: from hu-pkambar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 8 Aug 2025 01:51:46 -0700
From: Palash Kambar <quic_pkambar@quicinc.com>
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        Palash Kambar
	<quic_pkambar@quicinc.com>
Subject: [PATCH v2] ufs: ufs-qcom: Align programming sequence of Shared ICE for  UFS controller v5
Date: Fri, 8 Aug 2025 14:21:26 +0530
Message-ID: <20250808085126.871736-1-quic_pkambar@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GWtehTyzJA_pOXB9GVRik7sb1YU5aywh
X-Proofpoint-ORIG-GUID: GWtehTyzJA_pOXB9GVRik7sb1YU5aywh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX8zJ9kyQUZcyT
 CPcyZFHUI/5sX4/AnsPwKh7brXXAbUmDhSVZifgw/74YFavfipJMDjdHORii7j4yEyzSmF3YNRf
 gPrLH7+s8u0Ew/MQB0h7tClDCFe3T+JoQhvBjgbLK3UYqMJw1k94tkbfVy2LVPN7rftZo6FCZpw
 UZMEKfHMKVMoPL6AT2SJWr2kpJMRzeou8jqqrXv69TFADddd7m8iGXfPR4prPedV3Gzsdwb0EOS
 yxdPIuPndcN9OI31qWjqcxozZSrUg6YrvmIGAauKDeRoOUsE0DhY5xSpvoZWg7Dag1qmT8zCWmE
 g9ajatls/YWAhl2RHI+JqhT0o+2sNQUR5SAf5kQl4ieB3yvP5+l2IPbqgGDXriEzcTjKSrKGSix
 8fqML5tT
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6895baa6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=a9TggHSXhy7HR8-QzyIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Disable of AES core in Shared ICE is not supported during power
collapse for UFS Host Controller V5.0.

Hence follow below steps to reset the ICE upon exiting power collapse
and align with Hw programming guide.

a. Write 0x18 to UFS_MEM_ICE_CFG
b. Write 0x0 to UFS_MEM_ICE_CFG

---
changes from V1
1) Incorporated feedback from Konrad and Manivannan by adding a delay
   between ICE reset assertion and deassertion.
2) Removed magic numbers and replaced them with meaningful constants.
---

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 444a09265ded..44252c05d1b2 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -38,6 +38,13 @@
 #define DEEMPHASIS_3_5_dB	0x04
 #define NO_DEEMPHASIS		0x0
 
+#define UFS_ICE_RESET_ASSERT_VALUE	0x18
+#define ICE_RESET_DEASSERT_VALUE	0x00
+#define UFS_HW_VER_MAJOR_FIVE		0x5
+#define UFS_HW_VER_MINOR_ZERO		0x0
+#define UFS_HW_VER_STEP_ZERO		0x0
+#define UFS_ICE_RESET_DELAY		0x5
+
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -744,6 +751,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (ufs_qcom_is_link_off(hba) && host->device_reset)
 		ufs_qcom_device_reset_ctrl(hba, true);
 
+	host->ufs_power_collapse = true;
+
 	return ufs_qcom_ice_suspend(host);
 }
 
@@ -759,6 +768,28 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	return ufs_qcom_ice_resume(host);
 }
 
+static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
+				    enum uic_cmd_dme uic_cmd,
+				    enum ufs_notify_change_status status)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	/* Apply shared ICE WA */
+	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
+	    status == POST_CHANGE &&
+	    host->hw_ver.major == UFS_HW_VER_MAJOR_FIVE &&
+	    host->hw_ver.minor == UFS_HW_VER_MINOR_ZERO &&
+	    host->hw_ver.step == UFS_HW_VER_STEP_ZERO &&
+	    host->ufs_power_collapse) {
+		host->ufs_power_collapse = false;
+		ufshcd_writel(hba, UFS_ICE_RESET_ASSERT_VALUE, UFS_MEM_ICE);
+		ufshcd_readl(hba, UFS_MEM_ICE);
+		msleep(UFS_ICE_RESET_DELAY);
+		ufshcd_writel(hba, ICE_RESET_DEASSERT_VALUE, UFS_MEM_ICE);
+		ufshcd_readl(hba, UFS_MEM_ICE);
+	}
+}
+
 static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
 {
 	if (host->dev_ref_clk_ctrl_mmio &&
@@ -2258,6 +2289,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
+	.hibern8_notify		= ufs_qcom_hibern8_notify,
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
 	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
 	.suspend		= ufs_qcom_suspend,
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 6840b7526cf5..6bd205804feb 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -60,6 +60,7 @@ enum {
 	UFS_AH8_CFG				= 0xFC,
 
 	UFS_RD_REG_MCQ				= 0xD00,
+	UFS_MEM_ICE				= 0x2600,
 
 	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
 	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
@@ -290,6 +291,7 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+	bool ufs_power_collapse;
 	unsigned long active_cmds;
 };
 
-- 
2.34.1


