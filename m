Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285F9797FC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 02:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbjIHAdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 20:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjIHAdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 20:33:24 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DD01BD3;
        Thu,  7 Sep 2023 17:33:20 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387NqSfT032621;
        Fri, 8 Sep 2023 00:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=By8t/LVc9BtixrRYz4a2HRQgNTaIqjVmNrDhk0me8jI=;
 b=J/tgchuQbq12wNissktoJKTXzRD1oYWkzgSSrU+kYWcu8RvuvWdBjXBUY0AXQoErTywS
 I3vOkdetZaGOXGLWVE7b/LCZoosC9yIBa/vjBkTocg0HAFUxo6OIxKyVDx6RhF2Nhvis
 umg2p1/NGr2T2mdodR4bT9TeyvcZBt9NtIfqbVLRfC+d6prQ512kQ6a40SPP8Btzfqmw
 STBAwX83CSu+Sg4pSVLKhL4Do7B4fL5eqs0YcXAx/8pHCQ/NSBuBHHgOeMnZX83iRgrF
 xxQBmIYZU2/O7NLPMEseeXM07IL7UiFJrznFQ8F6T9i3rD+GXt/Gd7F+p+oHOKAgER0H 0A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sy4bqjq1a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 00:32:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3880Wo6e002931
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 8 Sep 2023 00:32:50 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 7 Sep 2023 17:32:50 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Kalyan Thota <quic_kalyant@quicinc.com>
CC:     <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <quic_parellan@quicinc.com>, <nespera@igalia.com>,
        Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to avoid overflow
Date:   Thu, 7 Sep 2023 17:32:40 -0700
Message-ID: <20230908003240.14104-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DgmdaCt2AuzMq5yMhhOTUaYiOUNm5U3B
X-Proofpoint-ORIG-GUID: DgmdaCt2AuzMq5yMhhOTUaYiOUNm5U3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_14,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxlogscore=842 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080003
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

_dpu_plane_calc_bw() uses integer variables to calculate the bandwidth
used during plane bandwidth calculations. However for high resolution
displays this overflows easily and leads to below errors

[dpu error]crtc83 failed performance check -7

Promote the intermediate variables to u64 to avoid overflow.

Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/32
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ae970af1154f..c6193131beec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -118,7 +118,7 @@ static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
 	const struct drm_display_mode *mode,
 	struct dpu_sw_pipe_cfg *pipe_cfg)
 {
-	int src_width, src_height, dst_height, fps;
+	u64 src_width, src_height, dst_height, fps;
 	u64 plane_prefill_bw;
 	u64 plane_bw;
 	u32 hw_latency_lines;
-- 
2.40.1

