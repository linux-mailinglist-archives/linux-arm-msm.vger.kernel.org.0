Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12EA6707742
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 03:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjERBOy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 21:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjERBOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 21:14:50 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FBB4224
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 18:14:49 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I0q5QG006634;
        Thu, 18 May 2023 01:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=ndJ0eb7GWnLpDM77t0zxsg2ID5CnEXfsxSmDjMt2OKs=;
 b=lSdYYs1KA2i19NNdk5MMQRcSebxZ+gofj44GNUhjfq6i4yN/2PiWSMgi4Xkh6DuM6FlN
 7/r9ya06MAFmbR0oURQXbXCrkLwiJIM1m2IFzA4hhHAaB8znt2s2RV9OClhT/AtK7ztg
 GR3UZpjWj1p6fAr/u6xJkX539Bp4aQL2U2k3T5wXUVE0mCEM8+ulEGsZ75FfaUmuDGn8
 SLnzOOOoCu4Xdg/IZsjk3jmcdSxFRJiKnRE0OOd+3M2nPOVKX/jQ/MaBmhWsyRYJVTX7
 YAjbe9ihUhxkUPTSDT/TUa++9hfch0jhkVhVVgC52pK3G3N9w2859qS4Cod9RdRnir8A 5g== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmts2a45s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 01:14:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I1EfA3003106
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 01:14:41 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 18:14:40 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 17 May 2023 18:14:34 -0700
Subject: [PATCH v13 8/9] drm/msm/dsi: Use MSM and DRM DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v13-8-d7581e7becec@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684372478; l=1475;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=wiLcZZqWj1YOb2TTOLktfoghKT6jBcPUf9na1sE9kKg=;
 b=DnZYQ4BzJKRb1bauwiMziBJnqY/O9VB396yyKyRWJL+W4EuGwM8F0s/nye1KPde4Syn2QG76g
 R/S3BvBq2aaDivAwGggUpJVAMPBE0f5uxymlaVdhsukUwKIkTCh3jtU
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0b3ugmCttu4Hl5vWloKVFXo4NLH0tzw_
X-Proofpoint-ORIG-GUID: 0b3ugmCttu4Hl5vWloKVFXo4NLH0tzw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_05,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=722 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305180006
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use MSM and DRM DSC helper methods to configure DSC for DSI.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 74d38f90398a..5526a51b3d97 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -28,6 +28,7 @@
 #include "dsi.xml.h"
 #include "sfpb.xml.h"
 #include "dsi_cfg.h"
+#include "msm_dsc_helper.h"
 #include "msm_kms.h"
 #include "msm_gem.h"
 #include "phy/dsi_phy.h"
@@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
 	 */
-	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
+	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	/*
 	 * If slice_count is greater than slice_per_intf
@@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return ret;
 	}
 
-	dsc->initial_scale_value = 32;
+	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
 	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
 	return drm_dsc_compute_rc_parameters(dsc);

-- 
2.40.1

