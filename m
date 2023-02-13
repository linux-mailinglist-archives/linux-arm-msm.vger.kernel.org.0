Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1256954BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 00:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjBMX0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 18:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjBMX0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 18:26:07 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A6830C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 15:26:01 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DMseSg007370;
        Mon, 13 Feb 2023 23:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=WyjnaxGXRfzzqY7Ht33HHjjmmAwX2h2QvzaNXu+te1Y=;
 b=mnkWszfeQY4WTxA0OIxDAmpcgrjx6YkCaGuAM9/ZOcD+M2mA5PoiQkY8vUCkQUNp70N5
 lP7gIMDGlxAYsw6urlwe6J0KH9EMtS/s1SBXdZr43jYvZbN10L1/WOPHT8IZzzItoLCK
 DHk6jobPpeDx5AFqv0TDBIYtL74AYCT1epjcRLz1IYva8iOtFbEY91I9YvDapl5k5sp0
 K1KxUAOTj2ZdvLpoSES8v/9X3eMh3q+yPrXbOUK5H736nVwwVVTtWYzGPwBN4DDNuXFH
 NJ05AvzIpkkbsR4ujTRaWyOCdV89KCIbpyvlt/YtxqudH8Bkf2W76dmRH9VGYGJ0GgmK 0g== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3npmvrm4ey-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Feb 2023 23:25:54 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31DNPrAU006925
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Feb 2023 23:25:53 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 13 Feb 2023 15:25:53 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <marijn.suijten@somainline.org>
Subject: [RFC PATCH v3 4/4] drm/msm/mdp4: Remove empty prepare_commit() function
Date:   Mon, 13 Feb 2023 15:25:37 -0800
Message-ID: <20230213232537.762-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213194819.608-1-quic_jesszhan@quicinc.com>
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qAuUAbf3pW_J8fBzD6zICG7dzQxAoXng
X-Proofpoint-GUID: qAuUAbf3pW_J8fBzD6zICG7dzQxAoXng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 mlxlogscore=866 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130205
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove empty prepare_commit() function from MDP4 driver.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9a1a0769575d..6e37072ed302 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -84,10 +84,6 @@ static void mdp4_disable_commit(struct msm_kms *kms)
 	mdp4_disable(mdp4_kms);
 }
 
-static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
-{
-}
-
 static void mdp4_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	/* TODO */
@@ -154,7 +150,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.disable_vblank  = mdp4_disable_vblank,
 		.enable_commit   = mdp4_enable_commit,
 		.disable_commit  = mdp4_disable_commit,
-		.prepare_commit  = mdp4_prepare_commit,
 		.flush_commit    = mdp4_flush_commit,
 		.wait_flush      = mdp4_wait_flush,
 		.complete_commit = mdp4_complete_commit,
-- 
2.39.1

