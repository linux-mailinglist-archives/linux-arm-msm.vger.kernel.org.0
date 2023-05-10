Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12526FE76B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 00:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbjEJWql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 18:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236468AbjEJWqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 18:46:36 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABAF35BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 15:46:35 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34AMf6Qf001632;
        Wed, 10 May 2023 22:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=yhIZeis2EPPQK1yOvCNj2sIwDl1Vhk87LQCIruaEZIQ=;
 b=kZV351WY2HHRVFD3LDFQoEqwJvqu/ulpNVoiQtVjUmmhTg6GPE6nAuZjbfFabcrypLrM
 xUB6KY8OqxCBxQ3+KHwMbfJaVijd04Z/b2nzXasO4XPtI9NVc7jf1Sr7f8WR4ImmYiZX
 92fxHV5X7Tr7Bj4dOkTLfdJEf6jH7i/edq0mT/y73hXT4NDLaqnHYmd7DTFoy8WthOPu
 moAIrDqzI3i0uHHN057m2HIXAMMbc1gp9dSvhfF0ZdDjBSsBBCzqJH8kUr3xfU1fLvdh
 V+9ofWUMZRdQg0VjK9P0MhPtiTnToayYkzvOvbc2oT2VrDNuKtflEWX6o5tpvzEcG0Sr TA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgj1407je-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 22:46:28 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AMkSsT023975
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 22:46:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 15:46:27 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 10 May 2023 15:45:59 -0700
Subject: [PATCH v8 8/8] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v8-8-2c9b2bb1209c@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v8-0-2c9b2bb1209c@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v8-0-2c9b2bb1209c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683758785; l=1009;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=7nT+OllFFbEbZwx0+51CwWm5nXcZGtvB6fIkhYZL58k=;
 b=ZGdHdixK2BaPQ+mQsVY5/B2GGgKoVuNYXZfJig7sHB4y/tjSPww5It/wHRS8WSbSDM4PLNhGO
 z5X8D6/gqYWB2ymVjhO/mWYqbFbno7hod0lPoGCria3o9LE/k4TbK+a
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OjP6xOQ7ksjREzTQSsHoMYe0ftUyR0jI
X-Proofpoint-ORIG-GUID: OjP6xOQ7ksjREzTQSsHoMYe0ftUyR0jI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=892
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100188
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

hdisplay for compressed images should be calculated as bytes_per_slice *
slice_count. Thus, use MSM DSC helper to calculate hdisplay for
dsi_timing_setup instead of directly using mode->hdisplay.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 508577c596ff..d60403372514 100644
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

