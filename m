Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9082E70A173
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 23:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjESVRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 17:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjESVRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 17:17:47 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDD01B5;
        Fri, 19 May 2023 14:17:45 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34JLHQC3007958;
        Fri, 19 May 2023 21:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=5FhssIiC+DX2Hv0hIoUJIUq0oRvrnilKVv4R00obZSA=;
 b=NubJBAmjmyUMxcSXLa8NgjwCTfPLuvAjCTDU76hH8rnUwSn3EHnfc/T8oJaLKrNI4JxN
 PGDIKlqlmsNFdAGUy4P/N7MoYbnCUSPOsb4VkrKKOnMwrh7I2PGmWcKc8H+TRJc8y9iu
 HiMONUiGxvlSOOUZHHwMRTqFfD6M/0dK5uit1nLc+XN85B7ygpZIH4b9DU3JqGf1C/ti
 /gPgmiyBwSIxFkrkODOP83PryYO2RSsRPrNVOnHTaEVTLbqaFvDApsuLiSu9m+NnUd6c
 TKssqk2D4YAWE1Ob4+X+YHmDaWk8+mfEqyV4apUTXbi8QEBVjdekT2uyTMuGpRoHjn/4 xg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp6mqsnea-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 21:17:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JLHawt010993
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 21:17:36 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 19 May 2023 14:17:35 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 0/5] Add DSC v1.2 Support for DSI
Date:   Fri, 19 May 2023 14:17:25 -0700
Message-ID: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXnZ2QC/4WNyw6CMBBFf4V07Zg+eOnK/zAuSjvILCjYQoMh/
 LuFnQvj8szknrOygJ4wsGu2Mo+RAg0ugTplzHTaPRHIJmaSS8VzXoC2FmwwEOZxHPwELQrFG51
 f6lywtGp0QGi8dqbbd33oweEy7a/RY0vLEbs/EncUpsG/j3YU+/V3JgrgUDambLnSWKni9prJk
 DNnM/Rst0X5xyCTQfBKmorjparLb8O2bR8crIhZDQEAAA==
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684531055; l=3083;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=oYp+35cQvnRs1rtEejLP8yEuQKT8HF+BJYrGN2cRads=;
 b=nHZZ0xle6+aENVCMPlEwxr6JaekPa7BowLeRk56S4jKy6auVIyoalWQX82ltZjzPIVRaT51k/
 +aE1uAq/oo8AnKI9V8Um+ywJtKttAgWcvZVY2yXWh8PTfadBwnCjNbX
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GmeALdUxAyobx0Ed4gLfDmJmsvedGcgz
X-Proofpoint-GUID: GmeALdUxAyobx0Ed4gLfDmJmsvedGcgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190184
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a series of changes for DSI to enable command mode support
for DSC v1.2.

This includes:

1) Rounding up `hdisplay / 3` in dsc_timing_setup()
2) Adjusting pclk_rate to account for compression
3) Fixing incorrect uses of slice_count in DSI DSC calculations
4) Setting the DATA_COMPRESS bit when DSC is enabled

With these changes (and the dependency below), DSC v1.2 should work over
DSI in command mode.

Note: Changes that add DSC v1.2 support for video mode will be posted
with the DP support changes.

Depends-on: "add DSC 1.2 dpu supports" [1] and "Introduce MSM-specific
DSC helpers" [2]

[1] https://patchwork.freedesktop.org/series/116789/
[2] https://patchwork.freedesktop.org/series/115833/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v3:
- Added fix to round up hdisplay DSC adjustment
- Fixed inconsistent whitespace in dpu_hw_intf_ops comment doc
- Moved placement of dpu_hw_intf_enable_compression
- Picked up "drm/msm/dsi: Fix calculation for pkt_per_line" patch and
  squashed all slice_count fixes into a single patch
- Use drm_mode_vrefresh() to calculate adjusted pclk rate
- Moved compressed pclk adjustment to dsi_adjust_compressed_pclk() helper
- Rebased changes on top of updated dependencies
- Reworded commit message for "drm/msm/dpu: Set DATA_COMPRESS for
  command mode" for clarity
- Removed revision changelog in commit messages
- Link to v2: https://lore.kernel.org/r/20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com

Changes in v2:
- Changed has_data_compress dpu_cap to a DATA_COMPRESS INTF feature flag
- Changed pclk math to only divide hdisplay by compression ratio
- Reworded word count TODO comment
- Make DATA_COMPRESS an INTF flag
- Read INTF_CONFIG2 before writing to DATA_COMPRESS bit
- Fixed whitespace issue in macro definition
- Removed `inline` from dpu_hw_intf_enable_compression declaration
- Only set dpu_hw_intf_ops.data_compress if DATA_COMPRESS feature is set
- Reworded commit messages and cover letter for clarity
- Link to v1: https://lore.kernel.org/r/20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com

---
Jessica Zhang (5):
      msm/drm/dsi: Round up DSC hdisplay calculation
      drm/msm/dsi: Adjust pclk rate for compression
      drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag
      drm/msm/dpu: Set DATA_COMPRESS for command mode
      drm/msm/dsi: Remove incorrect references to slice_count

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 13 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 49 +++++++++++++++-------
 6 files changed, 55 insertions(+), 16 deletions(-)
---
base-commit: 2f0218fa4805d7c7eed8dc072e1bdf9f100492c7
change-id: 20230405-add-dsc-support-fe130ba49841

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

