Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2949C70D02C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 03:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjEWBJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 21:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjEWBJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 21:09:39 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001D292;
        Mon, 22 May 2023 18:09:33 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MNup4G025586;
        Tue, 23 May 2023 01:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=MxvjYItcJGm5nOz9BoSRzj3NxTrNJnujlO2Y2wbJVJo=;
 b=RgHjKgu9ElAacl/r+dh0Mn7MrOTbZw4WpGZ2FQ5cRRP+EMLunNHPnnHtqwsZ61xojBo7
 65pt+wMwcn163eoq5+oCnXmYvuiF8OPGf/Zt8QozW2X7H2S+bEq/eKb46HUUjVjxoj4q
 7JEc40ApRE7d6i/t7UK2qeJHV1PF1YOGTaqfG17wXhGPkpN+uU3PjtshKDtUuc6aV3C6
 6LNYMiBcWR5exe9lPX2Tg6m6KDUi3svAPAUMwPPQlXWD1lt64QApqGYqXIxfxVavadnE
 A2JGJxBl8YZJ0siW+adQy1QOecdPR5ja3AsBpmZ+ATeTM881B+96G3Q3hlDj1rFhMA9K /A== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qr8qr9agv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 May 2023 01:09:28 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34N195Oc011935
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 May 2023 01:09:05 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 18:09:04 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v5 0/5] Add DSC v1.2 Support for DSI
Date:   Mon, 22 May 2023 18:08:54 -0700
Message-ID: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACYSbGQC/4XOu27DMAwF0F8JNJcF9bKdTv2PIoMeVK3Bsis5R
 oLA/14pWxEUHi8JnssHK5QjFfZxerBMWyxxTjXotxNzo0nfBNHXzAQKiQo1GO/BFwfluixzXiE
 Ql2iNOg+Ks3plTSGw2SQ3trupTJDotrbVkinE27Ps61LzGMs65/uze+Nt+n/NxgGhs64LKA31U
 n/+XKOLyb27eWJN28SBIKrAsReuRzr3Q/cqyANBth+Ie6mNwM7KV0EdCKr9oL0JgwqDd/avsO/
 7L24JL+ORAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684804144; l=4132;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=+QQVkWGSONQI1Ic2X7Qmlh7i6zMfrSsrN+1X/zX8Vl0=;
 b=WoOtKGqjcQk3o281NuAyRaEP/Tq+Cm/uJPMhYq6lq/5vc++mUhn+tNrdYc+039ayEos5FrXMz
 iGdZVcAztmxCGeBQtNRLr7HNwhnUE+Kvn2KsIkYWPkRJEG/hqkoOfWc
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LOuZ9024xSjBSAhkAP0pTPRZgVK3jq9T
X-Proofpoint-ORIG-GUID: LOuZ9024xSjBSAhkAP0pTPRZgVK3jq9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230007
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

Depends-on:
 - "add DSC 1.2 dpu supports" [1]
 - "Introduce MSM-specific DSC helpers" [2]
 - "drm/msm/dsi: use mult_frac for pclk_bpp calculation" [3]

[1] https://patchwork.freedesktop.org/series/116789/
[2] https://patchwork.freedesktop.org/series/115833/
[3] https://patchwork.freedesktop.org/patch/538273/?series=118072&rev=1

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v5:
- Added newline before enable_compression() function pointer definition
- Rebased on top of "drm/msm/dsi: use mult_frac for pclk_bpp calculation"
- Reworded commit messages for clarity
- Dropped mentions of "soft slice" in commit messages
- "slice_per_packet" -> "slice_per_pkt"
- Picked up reviewed-by tags
- Link to v4: https://lore.kernel.org/r/20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com

Changes in v4:
- Clarified slice_per_pkt comment regarding pkt_per_line calculations
- Reworded commit message for "drm/msm/dsi: Remove incorrect references
  to slice_count"
- Wrapped INTF_SC7280_MASK macro definition in parentheses
- Fixed incorrect commit hash in "msm/drm/dsi: Round up DSC hdisplay
  calculation"
- Picked up Reviewed-by tag
- Link to v3: https://lore.kernel.org/r/20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com

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
      drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >= 7.0
      drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
      drm/msm/dsi: Remove incorrect references to slice_count

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 13 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  3 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 49 +++++++++++++++-------
 6 files changed, 58 insertions(+), 15 deletions(-)
---
base-commit: 12a0bf73039bd760c5e78d08109882aa628cce8c
change-id: 20230405-add-dsc-support-fe130ba49841

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

