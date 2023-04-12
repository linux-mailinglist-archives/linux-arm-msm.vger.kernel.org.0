Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228046DFE67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 21:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjDLTKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 15:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjDLTKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 15:10:05 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366BE30E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:10:04 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33C9IQIY017912;
        Wed, 12 Apr 2023 19:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=g4v1SmdpQ3ITrJZsYRldbxiSdUBr38ZK8eLEVIUfG1U=;
 b=m9c1hs4wBvzjTTb5Ei6eFiwHh18fFjsVhn/e9zie9a7d9+PG1xO3dFec/pADD9l9SERS
 bqPldxX9axyc/hJEtKikyc4v/0fZiuFQIhQALCsEHciOpO57zF0rKMT/1Q7dqyWHP+GL
 u6EFQh/ipTT6dv5LGF0FLpDKen+XbYwG8qW2YhdFZQDR7Vm+5E9M0qAiN1IZn3ftglbf
 Zt0j2Yk/gIie5MUqzPCNUUYvXVoCvLpkjcr6lX7qAbMNcWjBJ9518EO6aVVd0gDAgP/+
 ZGf6jmbIJPsKu2jj6OdihoWxdTceaO3K3QzGOgSkHHxOSupq6/Izljx0i1rfNDTnLXtl dQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwe6m2kup-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:59 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CJ9wox019229
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 12:09:58 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 12 Apr 2023 12:09:46 -0700
Subject: [PATCH v5 6/8] drm/msm/dsi: Add check for slice_width in
 dsi_timing_setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v5-6-0108401d7886@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681326596; l=897;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=4GjhaxvpbpnL7eWJFnssOJBgp66Wxc5nKWxfy3b8/m0=;
 b=F6AbROXP4nA0mS0ZPNpT7s8RTiWjxAk5GMzbJEtVJpOjwW+2lfAfb10fW3y7SmDcTrzVb/9Ok
 mRJvSq/CJKyDFLjfH3oO/+/bAS36RNRotsfwch1fAkSMSSJU6K+9x8h
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oy2-qvsLTXxzJ6dJvPnzB9qSJj0coAhI
X-Proofpoint-ORIG-GUID: oy2-qvsLTXxzJ6dJvPnzB9qSJj0coAhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=657 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120164
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a check for valid dsc->slice_width value in dsi_timing_setup.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 508577c596ff..6a6218a9655f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -937,6 +937,12 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
+		if (!dsc->slice_width || (mode->hdisplay < dsc->slice_width)) {
+			pr_err("DSI: invalid slice width %d (pic_width: %d)\n",
+			       dsc->slice_width, mode->hdisplay);
+			return;
+		}
+
 		dsc->pic_width = mode->hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);

-- 
2.40.0

