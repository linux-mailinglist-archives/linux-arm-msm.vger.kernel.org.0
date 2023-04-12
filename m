Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413B26DFE6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 21:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjDLTKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 15:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjDLTKH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 15:10:07 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323DF30E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:10:06 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CJ2HT1015382;
        Wed, 12 Apr 2023 19:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=IhwNCBThNHzVz8uFh4+cKpeKdZeEmfY6Z5QQkFbnODs=;
 b=jNQNfNQEp5VfTuH6sJdmebOLKZpgSJOyHAkbkxmgGqVVKg8gmksswhbjtdAyEAsLI4P6
 AKs7/yQgL5GG8xbJN50SXev/NyPIClLbAHu/gs+wwCrJ25Wn3ImCSG3iyFUNEcU8Upvd
 K08dUTWHaoNtqX9x1jWbPlLahIcQbPUz19sUaPRTHSq0zDV24HeL0Lwmwe0HX5/+VMWn
 o1LMdeSF4dTsH4eR3BDH3ruQUdYBBT9HFSMGuBja9BeeKN8g5EIOAF37Y3+ngAokMYGw
 zrnOtWfLZDpXb6Z1uiJPVFzV23Q5FRVb8kWmUzNx8k5r5e46HynSQr/W8KLrtaBr3xxL nw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwj7wj7cv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CJ9wGa019224
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 12:09:58 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 12 Apr 2023 12:09:45 -0700
Subject: [PATCH v5 5/8] drm/msm/dsi: Use MSM and DRM DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v5-5-0108401d7886@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681326596; l=2243;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=9uQ4e/K+pbk9toY8K4dLpO654/bqIQJwjQqbmnNDKMI=;
 b=6mdZU6sZPC7E8vmNIN71SgrHYoVclILRuUiJb+qJ6mXEJ3gV0LBAYJPgi0yY1D5dwOz4RjLlw
 RXeG7IcROUPAtJ44lIq/xTbKPnly874EjkO+zGohR9m+o7oWaQm3MvH
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B9ptyfss2kchEfOg_4C_VCgmf8UzrwTw
X-Proofpoint-ORIG-GUID: B9ptyfss2kchEfOg_4C_VCgmf8UzrwTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=902 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120165
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use MSM and DRM DSC helper methods to configure DSC for DSI.

Changes in v2:
- *_calculate_initial_scale_value --> *_set_initial_scale_value
- Split pkt_per_line and eol_byte_num changes to a separate patch
- Moved pclk_per_line calculation to hdisplay adjustment in `if (dsc)`
  block of dsi_update_dsc_timing()

Changes in v3:
- Split pclk_per_intf calculation into a separate patch
- Added slice_width check to dsi_timing_setup
- Used MSM DSC helper to calculate total_bytes_per_intf

Changes in v5:
- Split slice_width check into a separate patch

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 74d38f90398a..508577c596ff 100644
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
+	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
 
 	/*
 	 * If slice_count is greater than slice_per_intf
@@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	if (dsc->slice_count > slice_per_intf)
 		dsc->slice_count = 1;
 
-	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	total_bytes_per_intf = msm_dsc_get_bytes_per_intf(dsc, hdisplay);
 
 	eol_byte_num = total_bytes_per_intf % 3;
 	pkt_per_line = slice_per_intf / dsc->slice_count;
@@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return ret;
 	}
 
-	dsc->initial_scale_value = 32;
+	drm_dsc_set_initial_scale_value(dsc);
 	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
 	return drm_dsc_compute_rc_parameters(dsc);

-- 
2.40.0

