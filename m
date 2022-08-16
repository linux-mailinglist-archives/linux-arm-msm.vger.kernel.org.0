Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDF4595AA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Aug 2022 13:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiHPLuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Aug 2022 07:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234749AbiHPLuK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Aug 2022 07:50:10 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8E980355;
        Tue, 16 Aug 2022 04:25:05 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27G9Nhtv032508;
        Tue, 16 Aug 2022 11:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=NRhqXg8CC7bRyrO+2T0kaicCl7jB3rTvLAmesS0CbKE=;
 b=WB/d1P9e5UxTNqO+v4rzn15XMbW40eNJa3bFlxadvqgRlEucxZq2+YuWMBXODypdfQkO
 tcXk1rRfzQ1/3OVKuX9IZM5riHnO3RGZIR9tVJu8fws/6IIdObpHosNzv4VBQ2k7BnBa
 YTxLPC7LNT6UiV67sHveRRIcOzS3yL1jg6VLY3tA3e03BMDMF7cW0FlBOYQdUM+CjNSr
 m4t/EQXNNdJ9lXrwk9xrw4wM2V20sIozEoLH6/mK36Qa03F4Q3NVS9vHlKMGdvxSkExR
 oPB0FwWr98MaGsHf8vC20/mxKkL25ap2V79+HFNAg6YqUbHvF9/BIszjWprO5FiLEpv0 oA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j06wr0mvc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Aug 2022 11:24:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27GBONJN011459
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Aug 2022 11:24:23 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 04:24:18 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <linux-remoteproc@vger.kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v5 2/7] remoteproc: qcom: Add flag in adsp private data structure
Date:   Tue, 16 Aug 2022 16:53:49 +0530
Message-ID: <1660649034-4303-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660649034-4303-1-git-send-email-quic_srivasam@quicinc.com>
References: <1660649034-4303-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v7muDXj3ai5pI3gyk2GMVOyC4CoCt6Yy
X-Proofpoint-GUID: v7muDXj3ai5pI3gyk2GMVOyC4CoCt6Yy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_07,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160042
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add flag in qcom_adsp private data structure and initialize
it to distinguish ADSP and WPSS modules.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
Changes since V3:
	-- Rename is_adsp_sb_needed to adsp_sandbox_needed.
Changes since V2:
	-- Add is_adsp_sb_needed flag instead of is_wpss.

 drivers/remoteproc/qcom_q6v5_adsp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 2f3b9f5..d0b767f 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -62,6 +62,7 @@ struct adsp_pil_data {
 	const char *sysmon_name;
 	int ssctl_id;
 	bool is_wpss;
+	bool adsp_sandbox_needed;
 	bool auto_boot;
 
 	const char **clk_ids;
@@ -99,6 +100,7 @@ struct qcom_adsp {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
+	bool adsp_sandbox_needed;
 
 	struct device *proxy_pds[QCOM_Q6V5_RPROC_PROXY_PD_MAX];
 	size_t proxy_pd_count;
@@ -602,6 +604,8 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->dev = &pdev->dev;
 	adsp->rproc = rproc;
 	adsp->info_name = desc->sysmon_name;
+	adsp->adsp_sandbox_needed = desc->adsp_sandbox_needed;
+
 	platform_set_drvdata(pdev, adsp);
 
 	if (desc->is_wpss)
-- 
2.7.4

