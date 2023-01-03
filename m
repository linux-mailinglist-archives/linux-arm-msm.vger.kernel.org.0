Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9454C65C70B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 20:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238811AbjACTMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 14:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238791AbjACTMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 14:12:03 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2147012AD0;
        Tue,  3 Jan 2023 11:12:01 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303J0x2t029756;
        Tue, 3 Jan 2023 19:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=hE9GYfUM8o3Vo/83sDJu6eaRiUEIJAMDuOmvhoYoksE=;
 b=KTqt8OpIzejf93iGt766EojxK7hTudFkR7RM4VoH0Z11IlD3Upx0yKdaVglsbIrPmVIb
 DmHbTATr8qb0mEaEQ+QFmqO/AT5Z4b2gy3qHhCbRDxyi8Yee5FPl/vlUlji1bkxuacPr
 7rfwRDQD3lFZYrW1V47lIQytA8tXeOxHPRjVQ1eAA9AEx5X3q0p2XW0osuGOuYsAXfeY
 c2hxBGQH9iBxVZUZNqYOoN2BYIuOeHw0SipJm14F3P1mo1JBH5FSyf3YoYZC0ZCZvw9R
 /ZmDrjUbNYiWfjv9BaW+5FDl3b7k260XJoICPKeTkP6xs2CYpinYKlndnYxdfpLblrLL 2g== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvrg1hq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Jan 2023 19:11:36 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 303JBZIE020687
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 3 Jan 2023 19:11:35 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 3 Jan 2023 11:11:34 -0800
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
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Keoseong Park <keosung.park@samsung.com>,
        "open list" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v12 02/15] ufs: core: Introduce Multi-circular queue capability
Date:   Tue, 3 Jan 2023 11:09:21 -0800
Message-ID: <38f7db90626d4d94feb35e2d6aa3943e1e4a917f.1672771664.git.quic_asutoshd@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 35uh7LeW5oqUmTCN-HB3jop3tWQ4BcSW
X-Proofpoint-GUID: 35uh7LeW5oqUmTCN-HB3jop3tWQ4BcSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030164
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to check for MCQ capability in the UFSHC.
Add a module parameter to disable MCQ if needed.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 26 ++++++++++++++++++++++++++
 include/ufs/ufshcd.h      |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 025386c..bc30268 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -92,6 +92,28 @@
 /* Polling time to wait for fDeviceInit */
 #define FDEVICEINIT_COMPL_TIMEOUT 1500 /* millisecs */
 
+/* UFSHC 4.0 compliant HC support this mode, refer param_set_mcq_mode() */
+static bool use_mcq_mode = true;
+
+static int param_set_mcq_mode(const char *val, const struct kernel_param *kp)
+{
+	int ret;
+
+	ret = param_set_bool(val, kp);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct kernel_param_ops mcq_mode_ops = {
+	.set = param_set_mcq_mode,
+	.get = param_get_bool,
+};
+
+module_param_cb(use_mcq_mode, &mcq_mode_ops, &use_mcq_mode, 0644);
+MODULE_PARM_DESC(use_mcq_mode, "Control MCQ mode for controllers starting from UFSHCI 4.0. 1 - enable MCQ, 0 - disable MCQ. MCQ is enabled by default");
+
 #define ufshcd_toggle_vreg(_dev, _vreg, _on)				\
 	({                                                              \
 		int _ret;                                               \
@@ -2261,6 +2283,10 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	if (err)
 		dev_err(hba->dev, "crypto setup failed\n");
 
+	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
+	if (!hba->mcq_sup)
+		return err;
+
 	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
 	hba->ext_iid_sup = FIELD_GET(MASK_EXT_IID_SUPPORT,
 				     hba->mcq_capabilities);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 13d339c..be49d38 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -834,6 +834,7 @@ struct ufs_hba_monitor {
  * @complete_put: whether or not to call ufshcd_rpm_put() from inside
  *	ufshcd_resume_complete()
  * @ext_iid_sup: is EXT_IID is supported by UFSHC
+ * @mcq_sup: is mcq supported by UFSHC
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -986,6 +987,7 @@ struct ufs_hba {
 	u32 luns_avail;
 	bool complete_put;
 	bool ext_iid_sup;
+	bool mcq_sup;
 };
 
 #ifdef CONFIG_SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
-- 
2.7.4

