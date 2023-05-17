Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3135F707145
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 20:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjEQSwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 14:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjEQSwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 14:52:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F4C7D91
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 11:52:29 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HFxtKl015387;
        Wed, 17 May 2023 18:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=RHhy4BQjRL/V8G3/bHElshhL0b77U6edHiavgqSVKAY=;
 b=Ax+S7v/muNRGo9lqgxzo/Bn986T/oXGW9CEmYjtrMCYnsMcbdRdxYieaNBFPH+FVAjcN
 6RvpH7f5yNPOklx8Cbu+ARNZz7wciFvUjEKw5p3yWRnYWFPFNk0axWVUm3PYT/5Ohhoo
 oL9kWqD0hyYa8a37XMNQkSeyjbOMnrgcz+xK+Ui/M8OsOgXca5CqgTbAOTxYd+rG/1Ls
 PELnXGqeu0nQpGm42Ovf29j4n9Xly1G8UznDxZTe3csj7JIIDP2lM6TcdVNvR3fhsonx
 wPcFAgfBeDUn+4hEC4GNAjxORd0YVGjSBq2bE6PvXmwYcaONr1HY4tObhgFqUHQL29Z9 5A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmnypj35f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 18:52:24 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HIqNAf027634
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 18:52:23 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 11:52:23 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 17 May 2023 11:51:14 -0700
Subject: [PATCH v11 5/9] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v11-5-30270e1eeac3@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684349541; l=1849;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=NsC4aG+BogTkekHTsO5RA/r7O0oDlkboclkkKV2xdMY=;
 b=k3GEw1NJ2T6eSGmd0wXbvrctLz4aFMIq1yuJgCWooPZAciHRAceFCcUI86wPZI39vBB80Mgp1
 ssyOAJd9AMGC5DhJ3ivMtnmvvrmO7luGOlSXO6yhAS9AeoUcGsUyF+e
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KMEH0fV_GW37R4L5wfbIwF9YGoyAXrbk
X-Proofpoint-ORIG-GUID: KMEH0fV_GW37R4L5wfbIwF9YGoyAXrbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_03,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=621 malwarescore=0 clxscore=1015 mlxscore=0
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

Introduce MSM-specific DSC helper methods, as some calculations are
common between DP and DSC.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_dsc_helper.h | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
new file mode 100644
index 000000000000..2d366ec7d92d
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ *
+ * Helper methods for MSM specific DSC calculations that are common between timing engine,
+ * DSI, and DP.
+ */
+
+#ifndef MSM_DSC_HELPER_H_
+#define MSM_DSC_HELPER_H_
+
+#include <linux/math.h>
+#include <drm/display/drm_dsc_helper.h>
+
+/**
+ * msm_dsc_get_slices_per_intf() - get number of slices per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width in pixels
+ * Returns: Integer representing the number of slices for the given interface
+ */
+static inline int msm_dsc_get_slices_per_intf(const struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(intf_width, dsc->slice_width);
+}
+
+/**
+ * msm_dsc_get_bytes_per_line() - calculate bytes per line
+ * @dsc: Pointer to drm dsc config struct
+ * Returns: Integer value representing bytes per line. DSI and DP need
+ *          to perform further calculations to turn this into pclk_per_intf,
+ *          such as dividing by different values depending on if widebus is enabled.
+ */
+static inline u32 msm_dsc_get_bytes_per_line(const struct drm_dsc_config *dsc)
+{
+	return dsc->slice_count * dsc->slice_chunk_size;
+}
+
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.40.1

