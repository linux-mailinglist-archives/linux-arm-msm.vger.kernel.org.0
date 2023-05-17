Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3842707147
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 20:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjEQSwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 14:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjEQSwf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 14:52:35 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C648C83FD
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 11:52:29 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HEUSCW004295;
        Wed, 17 May 2023 18:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=K6pvt/KXDAo8KSKc00MIS7L7Ff9MuWAaT2rYVyRHplw=;
 b=kYfu6YgrCOOeLxC4a5S8LnHtfyIf7omUr70UgTxkijka4F71Ay66ZygBmSFOZWm35rsj
 xgbpd++O4XuPf8zi8Li0sQ5cxjNNrR06sg+EGzoR4DRurF5e5g1UK6K5xGMy9rJnWioT
 0xdttMYi5pthDoJqOrqoAlzC1Vsi/eOHsjpPXj3gGYOJdBKg1k3JNgYHr5M2fXtkw7dI
 GSp2IKfemPD75q7ZjzPL+hWGQZp2Ipq4qKkRSMGRn1f1u6PyEM9GGMkQSaJeZZuxfbAE
 knA3A7EsacrX2d+6wQkbzVfp63/0jeoXTOFMdD67iiFJHV9VzSjzqMpoS+h0zYNoBFN5 1Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmnypj368-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 18:52:24 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HIqOUm027252
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 18:52:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 11:52:23 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 17 May 2023 11:51:16 -0700
Subject: [PATCH v11 7/9] drm/msm/dpu: Fix slice_last_group_size calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v11-7-30270e1eeac3@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684349541; l=1214;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=JS9YeZ/caONaWwAdUbJOH/08/BIFVmo1xGTyIpBgzyM=;
 b=0T2en98YOO/nQFYAvi19wDEK/5fxvG+ndRWHHDs5qKkVrVQlT/AqcIktw4sEWw7MiuPMKlzdJ
 bOEE5O2kVMrCK9fn/gZurA2DW7mSnnRQSd8ewYNH/NikfSowXbJGZzc
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nU5oGxpH3LueUvPTU_ckbP9Dz2gH7UrW
X-Proofpoint-ORIG-GUID: nU5oGxpH3LueUvPTU_ckbP9Dz2gH7UrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_03,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=939 malwarescore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170156
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the math for slice_last_group_size so that it matches the
calculations downstream.

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 3cad6a80af97..ea7d828b8812 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -56,9 +56,10 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	if (is_cmd_mode)
 		initial_lines += 1;
 
-	slice_last_group_size = 3 - (dsc->slice_width % 3);
+	slice_last_group_size = (dsc->slice_width + 2) % 3;
+
 	data = (initial_lines << 20);
-	data |= ((slice_last_group_size - 1) << 18);
+	data |= (slice_last_group_size << 18);
 	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
 	data |= (dsc->bits_per_pixel << 8);
 	data |= (dsc->block_pred_enable << 7);

-- 
2.40.1

