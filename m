Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8B165C707
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 20:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238795AbjACTMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 14:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbjACTMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 14:12:03 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C7C12ACE;
        Tue,  3 Jan 2023 11:12:01 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303IhnJm027706;
        Tue, 3 Jan 2023 19:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=7Xm0VSVgweG9m9XLAVLMPG/lhjko9IbQj5SjAoXva0c=;
 b=AZCBltFd937D92yNwHAFgbM4VGvxujUyhhaoQHcXv6g8VGDZtAFM6ceZC8PUsYU35n3n
 chfTQHZIxdcjlzMhTgiKUTv24PUJkDvhtsapTI44ZAOPWFQYxNGnzm6G3v/PSTGOfiKw
 iphtqqspQd8wj3ByBraHdWOcHseldwlxfWshmV22v3J90dY5NARsC5NuQbiaRdLNmbmA
 2ClQYLztAKdAmyPc35PWppsK95+LpWXPiVQjg8Ykypu8XjxSdLxhMqZnbxl7FsFENAYA
 IPdSYvbFSZUC5oLbK6olNMXUOR5VjALQDClUOJhRlWSWs1DRwGtEr6rcJjmzZa7QP2/p 0A== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvv81j4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Jan 2023 19:11:29 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 303JBRTX010026
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 3 Jan 2023 19:11:28 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 3 Jan 2023 11:11:27 -0800
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
CC:     <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <mani@kernel.org>,
        <beanhuo@micron.com>, Asutosh Das <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jinyoung Choi <j-young.choi@samsung.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Eric Biggers <ebiggers@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v12 01/15] ufs: core: Probe for ext_iid support
Date:   Tue, 3 Jan 2023 11:09:20 -0800
Message-ID: <44708307fffa728fc912d4a93a47bb4578b83761.1672771664.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1672771664.git.quic_asutoshd@quicinc.com>
References: <cover.1672771664.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kuapKaZHdTlyjSQCqcoudn91HfeMOcWz
X-Proofpoint-GUID: kuapKaZHdTlyjSQCqcoudn91HfeMOcWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301030164
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
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 32 ++++++++++++++++++++++++++++++++
 include/ufs/ufs.h         |  5 +++++
 include/ufs/ufshcd.h      |  4 ++++
 include/ufs/ufshci.h      |  7 +++++++
 4 files changed, 48 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 99ca5b0..025386c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2261,6 +2261,10 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	if (err)
 		dev_err(hba->dev, "crypto setup failed\n");
 
+	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
+	hba->ext_iid_sup = FIELD_GET(MASK_EXT_IID_SUPPORT,
+				     hba->mcq_capabilities);
+
 	return err;
 }
 
@@ -7766,6 +7770,31 @@ static void ufshcd_temp_notif_probe(struct ufs_hba *hba, const u8 *desc_buf)
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
+	ext_ufs_feature = get_unaligned_be32(desc_buf +
+				     DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
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
@@ -7864,6 +7893,9 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 
 	ufshcd_temp_notif_probe(hba, desc_buf);
 
+	if (hba->ext_iid_sup)
+		ufshcd_ext_iid_probe(hba, desc_buf);
+
 	/*
 	 * ufshcd_read_string_desc returns size of the string
 	 * reset the error value
diff --git a/include/ufs/ufs.h b/include/ufs/ufs.h
index c146de5..bea7b20 100644
--- a/include/ufs/ufs.h
+++ b/include/ufs/ufs.h
@@ -169,6 +169,7 @@ enum attr_idn {
 	QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE       = 0x1D,
 	QUERY_ATTR_IDN_WB_BUFF_LIFE_TIME_EST    = 0x1E,
 	QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        = 0x1F,
+	QUERY_ATTR_IDN_EXT_IID_EN		= 0x2A,
 };
 
 /* Descriptor idn for Query requests */
@@ -378,6 +379,7 @@ enum {
 	UFS_DEV_EXT_TEMP_NOTIF		= BIT(6),
 	UFS_DEV_HPB_SUPPORT		= BIT(7),
 	UFS_DEV_WRITE_BOOSTER_SUP	= BIT(8),
+	UFS_DEV_EXT_IID_SUP		= BIT(16),
 };
 #define UFS_DEV_HPB_SUPPORT_VERSION		0x310
 
@@ -629,6 +631,9 @@ struct ufs_dev_info {
 	u8	b_presrv_uspc_en;
 
 	bool    b_advanced_rpmb_en;
+
+	/* UFS EXT_IID Enable */
+	bool	b_ext_iid_en;
 };
 
 /*
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index dd5912b..13d339c 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -748,6 +748,7 @@ struct ufs_hba_monitor {
  * @outstanding_lock: Protects @outstanding_reqs.
  * @outstanding_reqs: Bits representing outstanding transfer requests
  * @capabilities: UFS Controller Capabilities
+ * @mcq_capabilities: UFS Multi Circular Queue capabilities
  * @nutrs: Transfer Request Queue depth supported by controller
  * @nutmrs: Task Management Queue depth supported by controller
  * @reserved_slot: Used to submit device commands. Protected by @dev_cmd.lock.
@@ -832,6 +833,7 @@ struct ufs_hba_monitor {
  *	device
  * @complete_put: whether or not to call ufshcd_rpm_put() from inside
  *	ufshcd_resume_complete()
+ * @ext_iid_sup: is EXT_IID is supported by UFSHC
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -873,6 +875,7 @@ struct ufs_hba {
 
 	u32 capabilities;
 	int nutrs;
+	u32 mcq_capabilities;
 	int nutmrs;
 	u32 reserved_slot;
 	u32 ufs_version;
@@ -982,6 +985,7 @@ struct ufs_hba {
 #endif
 	u32 luns_avail;
 	bool complete_put;
+	bool ext_iid_sup;
 };
 
 #ifdef CONFIG_SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
index 9346efe..f41bc7b 100644
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
@@ -69,6 +70,12 @@ enum {
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

