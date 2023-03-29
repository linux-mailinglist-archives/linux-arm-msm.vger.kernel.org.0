Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88296CF6D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjC2XTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjC2XTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:19:32 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643F45593
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:19:31 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32THBTsr001514;
        Wed, 29 Mar 2023 23:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=VcJbSwjOw/d3rND/CFtqMkiwZwXi/wmNeLB4UpWHUkg=;
 b=E6yfKVhH74GlKDRGydtmIj9seDZQz+0zJ0uB59n8gdLuSX9/nNMrpNGlXV9rKvtZQc1+
 gPOhlolJpuwJs6BlyMdW2+FJfVrnFi+LBajpuy1BsKWGgoNh2Z7QH490Ue66X2RonW0B
 NQ21GqnN/CiFd1uSQ39RMHmx5HC3yPLBx4l/Zf44d0JPfxeOpu20Wi2haxIT00nVZnFp
 a025vg1SXHmSHBNuJWE77TaDn66Koqt4s1mgK3YOZpWvq8GE3YvK1s2F1ceUNpiuQOTi
 H/RZrp1d87uCn98AuAk2kgh7iUwlMY17TOVHeRKsUAn/FydR/NXBaxgW0Mg6rfXhC0sa 9A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmgpm2c5p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:19:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNJPTV027023
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:19:25 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:19:24 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 29 Mar 2023 16:18:49 -0700
Subject: [PATCH RFC 4/5] drm/msm/dpu: Fix slice_last_group_size calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v1-4-f3e479f59b6d@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680131963; l=968;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=JLy9D4qHiePrT9qlqkgBPYCd44S4qY5UwdeBpI8d8bU=;
 b=ew0IY0cw5IxwVHugdFFSX2XrznVKsjd2eGfagtwqrJCzJGLidD/d4ciTjjMqSiw21a29D4nEx
 UznHJx7xsMbAjWsqNv70qZ3NuKEb2thArjFLIZcvrE7bbjjcITy3atD
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: muM7ue7H-UGDQEi5GOwKgM8495NEdVt2
X-Proofpoint-ORIG-GUID: muM7ue7H-UGDQEi5GOwKgM8495NEdVt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=962 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290174
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the math for slice_last_group_size so that it matches the
calculations downstream.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 648c530b5d05..1a1a0f6523f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	if (is_cmd_mode)
 		initial_lines += 1;
 
-	slice_last_group_size = 3 - (dsc->slice_width % 3);
+	slice_last_group_size = dsc->slice_width % 3;
+
+	if (slice_last_group_size == 0)
+		slice_last_group_size = 3;
+
 	data = (initial_lines << 20);
 	data |= ((slice_last_group_size - 1) << 18);
 	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */

-- 
2.39.2

