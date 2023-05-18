Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E69170773A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 03:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjERBOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 21:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjERBOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 21:14:49 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4144488
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 18:14:47 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I1EgHU025164;
        Thu, 18 May 2023 01:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=v4hdOistjXnRF5RLqWA+tShnrbCQm4iYw1xuvbpJfUA=;
 b=DXAwcdOijwJGJv9Ninhz9NOWr+JWxSZeRitYjw4N/qiRI5r2fTUsleQQxwcZuihDN6Gu
 bvhAdgJaQ3GO47ctxQItTff/21lscnMxR6xsKsgH585lKQkULPdha0jy9N47p34jhLE7
 58Oon6m2wvQLHm2uFnEiBCT9MQnyBGB6ghWlxIzp1OL7DJ0R+38tzBifBgr4hruuAz7t
 VLmRaRNVqlOqdKqHPcfPzXW/RNVsBqTjM6R4FcUUXI5A6HMaW8DrEP70rgXkVbTK5j84
 GnqbmQCNBpgIB3hmFgbWI8sPiUwOCwPhVwX3fRYjyVp5qiQY+H5qFcJhnx8SubMa5DG8 KQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn3fsgs79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 01:14:42 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I1EfCd006959
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 01:14:41 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 18:14:41 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 17 May 2023 18:14:35 -0700
Subject: [PATCH v13 9/9] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v13-9-d7581e7becec@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684372478; l=1029;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=x5Yx+3m1ry8zEMx//Z2KoppAyj/f7rIKvYja256G7lw=;
 b=/bVb5EzcBD37E3G5jMOMtkYLor6SBo1PiG8GwktD8VNA/0e2QT71oKYSQH5Gct5ShWLTwKiQB
 Lk3CpEp30Z1CMF8wNYAvT78VFxoK/ZvK0IZsi3xl0RnoP+xWNxpeZdH
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YHH6LkhCEbhjdczpzQjMmEF8zeZFjTut
X-Proofpoint-GUID: YHH6LkhCEbhjdczpzQjMmEF8zeZFjTut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_05,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 mlxlogscore=902 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180006
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, hdisplay is being divided by 3 for DSC. However, this
calculation only works for cases where BPP = 8.

Update hdisplay calculation to be bytes_per_line / 3, so that it
accounts for cases where BPP != 8.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5526a51b3d97..9223d7ec5a73 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * pulse width same
 		 */
 		h_total -= hdisplay;
-		hdisplay /= 3;
+		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
 	}

-- 
2.40.1

