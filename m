Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10515695104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 20:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbjBMTsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 14:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjBMTso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 14:48:44 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC011714A
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 11:48:42 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DBFJLD015847;
        Mon, 13 Feb 2023 19:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=muB26ypjc3/yN4oF4eVtJN9QtMTWpQIqYJA6l8XUoII=;
 b=PmsGe7oUQGxIuQKNl/mK0O1veET3hVa697c2HTj9ZTdMcVixhGRfmtZ+107nMLIPolUd
 GzNjHIzui4pbqEFlbpXetLK6T7FypHSdk2Rx7aUnHt1oF9Kpdc36NBeFWqwmDsQ0LH1o
 Odbe80iDB6ERxUsEkauLkmCshZfWcm+vmM+MOVM7d9hshRn1ktm+3q2FRXLGdfuC1XDv
 ZpK+AcSNR0HNz4hO50pt3Kcd7g9uUO6AsbSVkCqF2MXzx/VJtJmdrQIGP+PWNWNAeMZB
 bWQqfvas78QoAkfqUs2tEXbdq6Pb6u4iAzurLGvElpLDsGFacRQT1AtROYHG6zy0Bn7u Nw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3npmvrkrqw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Feb 2023 19:48:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31DJmaZR022262
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Feb 2023 19:48:36 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 13 Feb 2023 11:48:35 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <marijn.suijten@somainline.org>
Subject: [RFC PATCH v3 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Date:   Mon, 13 Feb 2023 11:48:16 -0800
Message-ID: <20230213194819.608-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213194819.608-1-quic_jesszhan@quicinc.com>
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iocDkUwssXHt9Bfgi7Y1Xeo89nClPIAR
X-Proofpoint-GUID: iocDkUwssXHt9Bfgi7Y1Xeo89nClPIAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130173
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, DPU will enable TE during prepare_commit(). However, this
will cause issues when trying to read/write to register in
get_autorefresh_config(), because the core clock rates aren't set at
that time.

This used to work because phys_enc->hw_pp is only initialized in mode
set [1], so the first prepare_commit() will return before any register
read/write as hw_pp would be NULL.

However, when we try to implement support for INTF TE, we will run into
the clock issue described above as hw_intf will *not* be NULL on the
first prepare_commit(). This is because the initialization of
dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].

To avoid this issue, let's enable TE during prepare_for_kickoff()
instead as the core clock rates are guaranteed to be set then.

Depends on: "Implement tearcheck support on INTF block" [3]

Changes in V3:
- Added function prototypes
- Reordered function definitions to make change more legible
- Removed prepare_commit() function from dpu_encoder_phys_cmd

[1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
[2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
[3] https://patchwork.freedesktop.org/series/112332/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index cb05036f2916..c6feffafa13f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -40,6 +40,10 @@
 
 #define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
 
+static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
+		struct dpu_encoder_phys *phys_enc);
+static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc);
+
 static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 {
 	return (phys_enc->split_role != ENC_ROLE_SLAVE);
@@ -611,6 +615,8 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 			  phys_enc->hw_pp->idx - PINGPONG_0);
 	}
 
+	dpu_encoder_phys_cmd_enable_te(phys_enc);
+
 	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(&phys_enc->pending_kickoff_cnt));
@@ -641,8 +647,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 	return false;
 }
 
-static void dpu_encoder_phys_cmd_prepare_commit(
-		struct dpu_encoder_phys *phys_enc)
+static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
@@ -799,7 +804,6 @@ static void dpu_encoder_phys_cmd_trigger_start(
 static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
-	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
 	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
-- 
2.39.1

