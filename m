Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD37874A519
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 22:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbjGFUs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 16:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbjGFUsy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 16:48:54 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D196F1BE8;
        Thu,  6 Jul 2023 13:48:53 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366KhKBj012731;
        Thu, 6 Jul 2023 20:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=bpcNOyhCt8GVBlUWuiPNVN5kngpMoNqhJ6nw0OJyUWA=;
 b=E13QRXJ0KBJZ9NbzKDYvqiETb/sXpmqlxfzgcHb6BekQaK6KE4WdsSnaJrWHPC2nYXCz
 jUjKSYWGn0ger3Gmnl6+sfww6H9uCY7J2uNbfxl8UQbcuQwYHbqX5SoCkVSYimGbdhbe
 ftskWkiIubbTJlrYE4L8CC40ap4AbZIJ+s53m+oX57XBBltCrNsBXctmhh6VGRHjvQ7f
 Wsnzc541OMGd2F7oHLupSmCn0+TFL+KgOK6lTgjciIWsnzOVOM0GYT5iQKHNVYVB26u+
 FdyDVi96bIq07DYkJ1H21N6PZCTLl6hdCykPvd+F4djcYodmhFMLnq1Li0YKzSmcsSmf Zw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rnvyvh38b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jul 2023 20:48:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 366KmhcD006035
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 6 Jul 2023 20:48:43 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 13:48:42 -0700
From:   Ryan McCann <quic_rmccann@quicinc.com>
Date:   Thu, 6 Jul 2023 13:48:34 -0700
Subject: [PATCH v4 3/6] drm/msm/dpu: Define names for unnamed sblks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v4-3-e304ddbe9648@quicinc.com>
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <quic_jesszhan@quicinc.com>, Ryan McCann <quic_rmccann@quicinc.com>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688676521; l=3183;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=zgAFvBFXwzKmtDtfVlO2u9XUGa1W2Gg6QzlpWWEVWAU=;
 b=w3LJ4t6YXTrL8U96KRsGPOHtawNBOIVCaqgreLmYV1jcwj0PZhblOn+jBfQY8r9eIa3pjNjb0
 jLrqm6ENB29D/YB2n77uUZxGH7Ip2ZCvIUTTkO6shBUsqF9IBN9yK8T
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jnBqHOdTTwFKnOzvwMJycMHAyOlFhHmQ
X-Proofpoint-ORIG-GUID: jnBqHOdTTwFKnOzvwMJycMHAyOlFhHmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=927 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060182
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some sub-blocks in the hw catalog have not been given a name, so when the
registers from that block are dumped, there is no name to reference.
Define names for relevant sub-blocks to fix this.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9f9d5ac3992f..79e495dbc11d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -444,12 +444,12 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
  * DSPP sub blocks config
  *************************************************************/
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
-	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {.name = "pcc", .id = DPU_DSPP_PCC, .base = 0x1700,
 		.len = 0x90, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
-	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {.name = "pcc", .id = DPU_DSPP_PCC, .base = 0x1700,
 		.len = 0x90, .version = 0x40000},
 };
 
@@ -465,19 +465,19 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
  * PINGPONG sub blocks config
  *************************************************************/
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
-	.te2 = {.id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
+	.te2 = {.name = "te2", .id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
 		.version = 0x1},
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0xe0,
+	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0xe0,
 	.len = 0x20, .version = 0x20000},
 };
 
@@ -517,13 +517,13 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
  * DSC sub blocks config
  *************************************************************/
 static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
-	.enc = {.base = 0x100, .len = 0x100},
-	.ctl = {.base = 0xF00, .len = 0x10},
+	.enc = {.name = "enc",  .base = 0x100, .len = 0x100},
+	.ctl = {.name = "ctl",	.base = 0xF00, .len = 0x10},
 };
 
 static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
-	.enc = {.base = 0x200, .len = 0x100},
-	.ctl = {.base = 0xF80, .len = 0x10},
+	.enc = {.name = "enc",	.base = 0x200, .len = 0x100},
+	.ctl = {.name = "ctl",	.base = 0xF80, .len = 0x10},
 };
 
 #define DSC_BLK(_name, _id, _base, _features) \

-- 
2.25.1

