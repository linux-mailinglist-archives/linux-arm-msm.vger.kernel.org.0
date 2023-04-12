Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A396DFE6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 21:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjDLTKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 15:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjDLTKH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 15:10:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F1959C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:10:05 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CEonXB028557;
        Wed, 12 Apr 2023 19:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=MwHlK3RZXWRP0m9qqW+3z+8qkWTJru7gOWRI8ddXDE8=;
 b=mQGoQLkCzYu+AQFmAzF1gf/zKPWK1NqmjeswjQk/zL11xHoevviO+qsHFEVfGIGEuyQC
 nl29xHVxjNvUahddpoolh8lroHsV1tHZMTZze8YfezP/zdD68EivIT5XEDvyJOF2rNs4
 BNDT9pcDkOdkOseeVa/p1yNUH5Xk1qNELO30N5zoDrMW/LvQ1jbuV5ly22SkMfUWibdA
 x3VdvXHZ2a+PT2gUnwC3U0nLygj/ZVsO9OO8TlylcWvER/lKVG+4+GoKyklR8217Vclq
 sFXxcBuq8m+o+aV3+QS/oAe4Jd0GZ/4ltcD6PmpDYMlOZ3XHLrRwpYZ8ucL86mMFg63W Gw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwqn1hjxn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CJ9wGN007454
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 12:09:57 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 12 Apr 2023 12:09:44 -0700
Subject: [PATCH v5 4/8] drm/msm/dpu: Fix slice_last_group_size calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v5-4-0108401d7886@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681326596; l=1252;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=EZJQi5TyRcDkHdVu4/jy0MoOYfULU+TMbdRu+a09EKA=;
 b=wtUqdk3uquJulNMxlWJ/PeyFkuDK5L4uFwl6TyR1IwR8hOur2BH6JitkUB1tpWV7xlzv57UXA
 xu3sGG0bS7zBPhG1jIKdSWuCAlj5O5XGMoQIZlcimV1IqOQ30QW8Lsl
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ePS3xUvDwlfiyq7m9kjyeqJHnrar2eSb
X-Proofpoint-ORIG-GUID: ePS3xUvDwlfiyq7m9kjyeqJHnrar2eSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120164
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the math for slice_last_group_size so that it matches the
calculations downstream.

Changes in v3:
- Reworded slice_last_group_size calculation to
  `(dsc->slice_width + 2) % 3`

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index b952f7d2b7f5..ff1c8f92fb20 100644
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
2.40.0

