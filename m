Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6A9663C778
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 19:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236230AbiK2Syk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 13:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbiK2Syf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 13:54:35 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139B656D6E;
        Tue, 29 Nov 2022 10:54:34 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATIekji008083;
        Tue, 29 Nov 2022 18:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=zkh5XXEIdZfFBZvLVeyb6djySik3rlD7agJhw3idEWs=;
 b=YF9ouFlgJ/RcVhM2SmCpcd+qFh/nk8+hNEFPEdUh+K9rqjMAxTXbU2h2t//VLgkAgbb5
 LyYJ1uFc25csBcMg6RxCuBJszsZ7F+8C3DiMppu1EOcMjs4C+vV6090FU8wcnbHf9RLa
 WqGQGJgYJw7qe9u6+PO6Mz+o+oGDrNv/c5RjjBifR/xbckmKdzVJzULcYU9NP/YGZjzL
 irqTeHal7RxEkIQNwXslaPFGxJoZrZe3S7PuDCqQA/31GZUCXE5iv7EBQeS/5GWn3igQ
 /59mOKL2Hr7MhcMlBcAUQbg8Lrij/o7LwaVF9mTcAzUZmAa6wACCY3WbA83rKLClAIPJ Fg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m5bnh25rp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 18:54:19 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ATIsIJV017125
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 18:54:18 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 29 Nov 2022 10:54:17 -0800
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
CC:     <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <eddie.huang@mediatek.com>,
        <daejun7.park@samsung.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Jinyoung Choi <j-young.choi@samsung.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 02/16] ufs: core: Probe for ext_iid support
Date:   Tue, 29 Nov 2022 10:53:08 -0800
Message-ID: <f4bb4850076c9a953eaaa9e76dc3b2fa37f0505e.1669747235.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1669747235.git.quic_asutoshd@quicinc.com>
References: <cover.1669747235.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _E28zf-vxFBzzeWwtyvx7TTAAC4tOQFy
X-Proofpoint-GUID: _E28zf-vxFBzzeWwtyvx7TTAAC4tOQFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_11,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290107
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Task Tag is limited to 8 bits and this restricts the number
of active IOs to 255.
In Multi-circular queue mode, this may not be enough.
The specification provides EXT_IID which can be used to increase
the number of IOs if the UFS device and UFSHC support it.
This patch adds support to probe for ext_iid support in
ufs device and UFSHC.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
 include/ufs/ufs.h         |  4 ++++
 include/ufs/ufshcd.h      |  4 ++++
 include/ufs/ufshci.h      |  7 +++++++
 4 files changed, 46 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 6ea22b5..595fd3c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2258,6 +2258,10 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	if (err)
 		dev_err(hba->dev, "crypto setup failed\n");
 
+	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
+	hba->ext_iid_sup = FIELD_GET(MASK_EXT_IID_SUPPORT,
+				     hba->mcq_capabilities);
+
 	return err;
 }
 
@@ -7687,6 +7691,30 @@ static void ufshcd_temp_notif_probe(struct ufs_hba *hba, const u8 *desc_buf)
 	}
 }
 
+static void ufshcd_ext_iid_probe(struct ufs_hba *hba, u8 *desc_buf)
+{
+	struct ufs_dev_info *dev_info = &hba->dev_info;
+	u32 ext_ufs_feature;
+	u32 ext_iid_en = 0;
+	int err;
+
+	/* Only UFS-4.0 and above may support EXT_IID */
+	if (dev_info->wspecversion < 0x400)
+		goto out;
+
+	ext_ufs_feature = ufs_get_ext_ufs_feature(hba, desc_buf);
+	if (!(ext_ufs_feature & UFS_DEV_EXT_IID_SUP))
+		goto out;
+
+	err = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+				      QUERY_ATTR_IDN_EXT_IID_EN, 0, 0, &ext_iid_en);
+	if (err)
+		dev_err(hba->dev, "failed reading bEXTIIDEn. err = %d\n", err);
+
+out:
+	dev_info->b_ext_iid_en = ext_iid_en;
+}
+
 void ufshcd_fixup_dev_quirks(struct ufs_hba *hba,
 			     const struct ufs_dev_quirk *fixups)
 {
@@ -7785,6 +7813,9 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 
 	ufshcd_temp_notif_probe(hba, desc_buf);
 
+	if (hba->ext_iid_sup)
+		ufshcd_ext_iid_probe(hba, desc_buf);
+
 	/*
 	 * ufshcd_read_string_desc returns size of the string
 	 * reset the error value
diff --git a/include/ufs/ufs.h b/include/ufs/ufs.h
index 1bba3fe..ba2a1d8 100644
--- a/include/ufs/ufs.h
+++ b/include/ufs/ufs.h
@@ -165,6 +165,7 @@ enum attr_idn {
 	QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE       = 0x1D,
 	QUERY_ATTR_IDN_WB_BUFF_LIFE_TIME_EST    = 0x1E,
 	QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        = 0x1F,
+	QUERY_ATTR_IDN_EXT_IID_EN		= 0x2A,
 };
 
 /* Descriptor idn for Query requests */
@@ -352,6 +353,7 @@ enum {
 	UFS_DEV_EXT_TEMP_NOTIF		= BIT(6),
 	UFS_DEV_HPB_SUPPORT		= BIT(7),
 	UFS_DEV_WRITE_BOOSTER_SUP	= BIT(8),
+	UFS_DEV_EXT_IID_SUP		= BIT(16),
 };
 #define UFS_DEV_HPB_SUPPORT_VERSION		0x310
 
@@ -601,6 +603,8 @@ struct ufs_dev_info {
 
 	bool	b_rpm_dev_flush_capable;
 	u8	b_presrv_uspc_en;
+	/* UFS EXT_IID Enable */
+	bool	b_ext_iid_en;
 };
 
 /*
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 5cf81df..aec37cb9 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -747,6 +747,7 @@ struct ufs_hba_monitor {
  * @outstanding_lock: Protects @outstanding_reqs.
  * @outstanding_reqs: Bits representing outstanding transfer requests
  * @capabilities: UFS Controller Capabilities
+ * @mcq_capabilities: UFS Multi Circular Queue capabilities
  * @nutrs: Transfer Request Queue depth supported by controller
  * @nutmrs: Task Management Queue depth supported by controller
  * @reserved_slot: Used to submit device commands. Protected by @dev_cmd.lock.
@@ -830,6 +831,7 @@ struct ufs_hba_monitor {
  *	device
  * @complete_put: whether or not to call ufshcd_rpm_put() from inside
  *	ufshcd_resume_complete()
+ * @ext_iid_sup: is EXT_IID is supported by UFSHC
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -871,6 +873,7 @@ struct ufs_hba {
 
 	u32 capabilities;
 	int nutrs;
+	u32 mcq_capabilities;
 	int nutmrs;
 	u32 reserved_slot;
 	u32 ufs_version;
@@ -978,6 +981,7 @@ struct ufs_hba {
 #endif
 	u32 luns_avail;
 	bool complete_put;
+	bool ext_iid_sup;
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
index f525566..4d4da06 100644
--- a/include/ufs/ufshci.h
+++ b/include/ufs/ufshci.h
@@ -22,6 +22,7 @@ enum {
 /* UFSHCI Registers */
 enum {
 	REG_CONTROLLER_CAPABILITIES		= 0x00,
+	REG_MCQCAP				= 0x04,
 	REG_UFS_VERSION				= 0x08,
 	REG_CONTROLLER_DEV_ID			= 0x10,
 	REG_CONTROLLER_PROD_ID			= 0x14,
@@ -68,6 +69,12 @@ enum {
 	MASK_OUT_OF_ORDER_DATA_DELIVERY_SUPPORT	= 0x02000000,
 	MASK_UIC_DME_TEST_MODE_SUPPORT		= 0x04000000,
 	MASK_CRYPTO_SUPPORT			= 0x10000000,
+	MASK_MCQ_SUPPORT			= 0x40000000,
+};
+
+/* MCQ capability mask */
+enum {
+	MASK_EXT_IID_SUPPORT = 0x00000400,
 };
 
 #define UFS_MASK(mask, offset)		((mask) << (offset))
-- 
2.7.4

