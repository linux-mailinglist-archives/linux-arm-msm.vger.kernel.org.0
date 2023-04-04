Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A35F6D70FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 01:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbjDDX4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 19:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236661AbjDDX4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 19:56:52 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E988C44A3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 16:56:50 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334Nimwt023903;
        Tue, 4 Apr 2023 23:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=YfBpptkCkCXkMvYpslBde/rTOT8AjTZ/UPveNTU7WTg=;
 b=DAmNr9BqEmnDbiXn/V7EWPJT46WHW5LUjUQOfJ1Rvs5MhPF0rih7LdKcCXEOtm1IYjXv
 vU30lzy8NOwgOGJGWiZqfgd3npHCmmqOdKAmdh6dIv4xpy01tAtIZXA+tweMdGrGKMS9
 5QVgTednrWybdc4T+fDcvY5U4UxT9gOXze4bFTKIziw+pjdb8Xqy2laOew03o1/aR1Gg
 e5K6SiK63VWD8rcSJHxjA0T5ssVbG/bsTy0GJmvKWmnp4f8Y+gWLH5c6N6gRrXjTB4T9
 G0wBqcGcccbcMW0Pj7nGzYuHTEkmsOYK+LLGMOJyMqNp20gSfBObYGjXDo0zSnr2S4I9 JA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prppuh4s6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Apr 2023 23:56:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334NugrN022576
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Apr 2023 23:56:42 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 16:56:42 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Tue, 4 Apr 2023 16:56:13 -0700
Subject: [PATCH v3 1/6] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v3-1-6bec0d277a83@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680652601; l=6218;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=20I+Sr/QtdAmk7Pm6M9KB6TaVI2G3rBb0RYY8TRUsno=;
 b=lMvABP/Ltli0I3bkE/MQ+GO3oRa0Ua1UXKzHG0ibT0qB7k5UZOjv8JzNFVnL4hdrZ7m4EdkTa
 BpMDCxhhTWSCNkwu0j6/DBOsmWZdEsJSfVV3lIsT4Pg1MkzMSS/bNOq
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9iBoR6aSaTEUoFaZvPv4_zNE7uYm3EBy
X-Proofpoint-ORIG-GUID: 9iBoR6aSaTEUoFaZvPv4_zNE7uYm3EBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=650 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040217
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce MSM-specific DSC helper methods, as some calculations are
common between DP and DSC.

Changes in v2:
- Moved files up to msm/ directory
- Dropped get_comp_ratio() helper
- Used drm_int2fixp() to convert to integers to fp
- Style changes to improve readability
- Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
- Changed msm_dsc_get_slice_per_intf() to a static inline method
- Dropped last division step of msm_dsc_get_pclk_per_line() and changed
  method name accordingly
- Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
- Fixed some math issues caused by passing in incorrect types to
  drm_fixed methods in get_bytes_per_soft_slice()

Changes in v3:
- Dropped src_bpp parameter from all methods -- src_bpp can be
  calculated as dsc->bits_per_component * 3
- Dropped intf_width parameter from get_bytes_per_soft_slice()
- Moved dsc->bits_per_component to numerator calculation in
  get_bytes_per_soft_slice()
- Renamed msm_dsc_get_uncompressed_pclk_per_line to
  *_get_uncompressed_pclk_per_intf()
- Removed dsc->slice_width check from
  msm_dsc_get_uncompressed_pclk_per_intf()
- Made get_bytes_per_soft_slice() a public method (this will be called
  later to help calculate DP pclk params)
- Added documentation in comments
- Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
  renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile         |  1 +
 drivers/gpu/drm/msm/msm_dsc_helper.c | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h | 70 ++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7274c41228ed..b814fc80e2d5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -94,6 +94,7 @@ msm-y += \
 	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
 	msm_drv.o \
+	msm_dsc_helper.o \
 	msm_fb.o \
 	msm_fence.o \
 	msm_gem.o \
diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c b/drivers/gpu/drm/msm/msm_dsc_helper.c
new file mode 100644
index 000000000000..c8c530211f50
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <drm/drm_fixed.h>
+
+#include "msm_drv.h"
+#include "msm_dsc_helper.h"
+
+s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
+{
+	int bpp = msm_dsc_get_bpp_int(dsc);
+	s64 numerator_fp, denominator_fp;
+	s64 comp_ratio_fp = drm_fixp_from_fraction(dsc->bits_per_component * 3, bpp);
+
+	numerator_fp = drm_int2fixp(dsc->slice_width * 3 * dsc->bits_per_component);
+	denominator_fp = drm_fixp_mul(comp_ratio_fp, drm_int2fixp(8));
+
+	return drm_fixp_div(numerator_fp, denominator_fp);
+}
+
+u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	u32 bytes_per_soft_slice, bytes_per_intf;
+	s64 bytes_per_soft_slice_fp;
+	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
+
+	bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc);
+	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
+
+	bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
+
+	return bytes_per_intf;
+}
+
+int msm_dsc_get_uncompressed_pclk_per_intf(struct drm_dsc_config *dsc)
+{
+	s64 data_width;
+
+	data_width = drm_fixp_mul(drm_int2fixp(dsc->slice_count),
+			get_bytes_per_soft_slice(dsc));
+
+	return drm_fixp2int_ceil(data_width);
+}
diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
new file mode 100644
index 000000000000..5ee972eb247c
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#ifndef MSM_DSC_HELPER_H_
+#define MSM_DSC_HELPER_H_
+
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_modes.h>
+
+/*
+ * Helper methods for MSM specific DSC calculations that are common between timing engine,
+ * DSI, and DP.
+ */
+
+/**
+ * msm_dsc_get_bpp_int - get bits per pixel integer value
+ * @dsc: Pointer to drm dsc config struct
+ */
+static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
+{
+	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
+	return dsc->bits_per_pixel >> 4;
+}
+
+/**
+ * msm_dsc_get_slice_per_intf - get number of slices per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ */
+static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(intf_width, dsc->slice_width);
+}
+
+/**
+ * msm_dsc_get_dce_bytes_per_line - get bytes per line to help calculate data width
+ *	when configuring the timing engine
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ */
+static inline u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
+}
+
+/**
+ * get_bytes_per_soft_slice - get size of each soft slice for dsc
+ * @dsc: Pointer to drm dsc config struct
+ */
+s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
+
+/**
+ * msm_dsc_get_bytes_per_intf - get total bytes per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ */
+u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width);
+
+/**
+ * msm_dsc_get_uncompressed_pclk_per_intf - Calculate uncompressed pclk per line.
+ * @dsc: Pointer to drm dsc config struct
+ *
+ * Note: This value will then be passed along to DSI and DP to calculate pclk_per_intf.
+ * This is because DSI and DP divide the uncompressed pclk_per_intf by different
+ * values depending on if widebus is enabled.
+ */
+int msm_dsc_get_uncompressed_pclk_per_intf(struct drm_dsc_config *dsc);
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.40.0

