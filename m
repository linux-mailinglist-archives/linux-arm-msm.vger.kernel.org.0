Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D656F5FB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 22:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjECULF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 16:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjECULE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 16:11:04 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E55CDB;
        Wed,  3 May 2023 13:11:03 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 343HG2We017490;
        Wed, 3 May 2023 20:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=p9Ia6Z8v8/6bC6eHwIwakNUC/mCmEOXBUrkomjSRM4c=;
 b=N7WtkF5I1nRRAfNHT2992iqx5Eci66SCn5cqcNLmIwdY+Vudc0jkDurU0NiY6ambaIW+
 ZI85iQlv+PvmqTyaO8yKgoawWXZUFbYPgchWV7MPjgiiG5NMxBQzRcC9oL62JIWlow9h
 AdHWtpgy5PiPDkiHWXeQ8EjAFwK2oQ9vQOLPWR7+Fc1JtUnVTkYTpbdIbJEvuOaaIwVW
 jYho2aU58t67KevONKtPr1x+Mpk+Dl1eVvMJVgwu67g6DKDKkfQ1sgTw96fKZCBIu5Mf
 dFDkwOnJCPbpHzUe7wzzjZdxfQNIyUpzYCUMatyC7iQuoQxgXO5RqFxp+bsnekyMliWF ig== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qb9fajs5g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 May 2023 20:10:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343KAqks021337
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 3 May 2023 20:10:52 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 3 May 2023 13:10:51 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/7] add DSC 1.2 dpu supports
Date:   Wed, 3 May 2023 13:10:32 -0700
Message-ID: <1683144639-26614-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a_1bNXgGD9SwYVavqB4QDi7S31ziCBhd
X-Proofpoint-GUID: a_1bNXgGD9SwYVavqB4QDi7S31ziCBhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_14,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxlogscore=892 malwarescore=0 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030173
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the DPU side changes to support DSC 1.2 encoder. This
was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
The DSI and DP parts will be pushed later on top of this change.
This seriel is rebase on [1], [2] and catalog fixes from [3].

Abhinav Kumar (2):
  drm/msm/dpu: add dsc blocks for remaining chipsets in catalog
  drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets

Kuogee Hsieh (5):
  drm/msm/dpu: add DPU_PINGPONG_DSC feature bit
  drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK and PP_BLK_TE
    marcos
  drm/msm/dpu: add PINGPONG_NONE to disconnect DSC from PINGPONG
  drm/msm/dpu: add support for DSC encoder v1.2 engine
  drm/msm/dpu: separate DSC flush update out of interface

 drivers/gpu/drm/msm/Makefile                       |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  23 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  26 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  35 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  26 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  14 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   7 +
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  16 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  14 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 385 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
 25 files changed, 650 insertions(+), 83 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

