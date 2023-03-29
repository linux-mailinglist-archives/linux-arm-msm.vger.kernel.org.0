Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BDD6CF6DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjC2XTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjC2XTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:19:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07F05B92
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:19:31 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TMgAUq028356;
        Wed, 29 Mar 2023 23:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=kiLgaPFJpOYoM+1bJKpuqCogtpl6F/aT4cqrbLDUV30=;
 b=TVOrqMnyt06AED2h/ycJrIqTS8HefVYMMD90S4jlzoE9bxxvcrKNKlkee7BLWSU4kXup
 YCqayidP9PFvzE1SmERENwjAZY5SS/Ncy/ZEJ67CEEEzGZp2/iQA/Ye7ZYa1EH0aXJ9m
 B6kmRjZyqN6ps07eDR96R8uk3QWZ6XcU0ToKbsNngYdWMeakT7w4G2h/Czf/NFI8utP6
 tU91bWM+ioc8XlcjdArQBzJHfHgLm1IkHZg1Did6UxX6DDiWRiooDxPW9mlvFwZhtAVE
 CxtsRv6rgX+eXFcRbRtn0suAvbPKfaEJxJMnRCFWp4OKEl9FyZph7m07HSIpSHOF17We 6g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmq959bvd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:19:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNJNPC027010
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:19:23 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:19:23 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH RFC 0/5] Introduce MSM-specific DSC helpers
Date:   Wed, 29 Mar 2023 16:18:45 -0700
Message-ID: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFXHJGQC/12NywrCMBBFf6XM2oE0RWjcCi5culRc5DExAZuWG
 RCh9N9NunR5DvdwVxDiTAKnbgWmT5Y8lwr9oQOfbHkR5lAZtNKDGrRBjh4nmTCIx0TvhRjN2Ft
 zpBBdUFBDZ4XQsS0+tfR6/w9ul3PbLUwxf/fzBzT33LYfAut9nJEAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680131963; l=1627;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=aKj7VKUb9VwqtjjdrCgKD6m99KV79EkZnRvfkrdDHl8=;
 b=lKi2ZjBPI34kiWTughFmqWdyFqgNStcsQGWs62YlovQuTtrvMyaez2lgnqzhZhE9fOtUJeMf7
 A4luep9FNA4Dch7kUKqjQYtrr+5svdsZtf5mSDctYOTje5k8zER5xX1
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BbKRTFKbC-JuF4577TOQSH1JYpTaEG0h
X-Proofpoint-ORIG-GUID: BbKRTFKbC-JuF4577TOQSH1JYpTaEG0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=771 adultscore=0 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290174
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are some overlap in calculations for MSM-specific DSC variables between DP and DSI. In addition, the calculations for initial_scale_value and det_thresh_flatness that are defined within the DSC 1.2 specifications, but aren't yet included in drm_dsc_helper.c.

This series moves these calculations to a shared msm_dsc_helper.c file and defines drm_dsc_helper methods for initial_scale_value and det_thresh_flatness.

Note: For now, the MSM specific helper methods are only called for the DSI path, but will called for DP once DSC 1.2 support for DP has been added.

Depends on: "drm/i915: move DSC RC tables to drm_dsc_helper.c" [1]

[1] https://patchwork.freedesktop.org/series/114472/

---
Jessica Zhang (5):
      drm/display/dsc: Add flatness and initial scale value calculations
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods

 drivers/gpu/drm/msm/Makefile               |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 10 +++-
 drivers/gpu/drm/msm/disp/msm_dsc_helper.c  | 74 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_dsc_helper.h  | 28 +++++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 18 +++++---
 include/drm/display/drm_dsc_helper.h       | 10 ++++
 6 files changed, 133 insertions(+), 8 deletions(-)
---
base-commit: 56777fc93a145afcf71b92ba4281250f59ba6d9b
change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

