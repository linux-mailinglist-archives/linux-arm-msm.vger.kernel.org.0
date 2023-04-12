Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDFD6DFE6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 21:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjDLTKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 15:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjDLTKH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 15:10:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C44559F9
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:10:05 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CFsBEI013320;
        Wed, 12 Apr 2023 19:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=3TtQI71qOtd0TPp8bKUIe236bd/m09m5U4WSmTk54UQ=;
 b=gXDon69/wD0AegV8fLPqXP2bEMmifbi8VVhhybDiM5nLf3VwwHaHEo2IGOLLl9QnM4ZT
 e1NXIepnFEnvE4dDjyyRhl0Nq2EhJjSbWJE1KRm8A1QiguyPFSkevbX/oJ1wwYH3kgg7
 aB4jwexxFjWRLX0xvsGC9zH3TDtROS+HrqAx3DBBjy8RSIZOJ1aaznyC28KtcZcE4mRR
 dzyjQVI4Qf9cZPOkQJdJL355jSC8hXQ1v6gly1VcAVLxAFpBQm9pZ71C0LWdFTmcpAQF
 bP5QsY3sNZTpPrSRHcVuFokBGgFWFW+FIzXESON9cLKF5b3Oph0ujHmUxzYyybgfDv+u YA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwhhta9xb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CJ9vJe007431
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Apr 2023 19:09:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 12:09:56 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 12 Apr 2023 12:09:41 -0700
Subject: [PATCH v5 1/8] drm/msm/dsi: use new helpers for DSC setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v5-1-0108401d7886@quicinc.com>
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
        <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681326596; l=3366;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=a9VLK0oDQDcazg574rSjL3TYAMyzlM0hGgHg/0yl67M=;
 b=T1UP+BE2V0AmAu4D2xIFXUzO+SOm3axdjUSSffuvL05Nos/yJTm4ty1+EY90JzXnufLs77yAF
 EYgJNIPtFY5A7Vu6cOvXUkbIs/vZk4fIRir6mSAh+n5tAogt3MuZobs
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TxO9U4Z3QMBY1IUOzuYeZiaCjGd9zpPp
X-Proofpoint-ORIG-GUID: TxO9U4Z3QMBY1IUOzuYeZiaCjGd9zpPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120164
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Use new DRM DSC helpers to setup DSI DSC configuration. The
initial_scale_value needs to be adjusted according to the standard, but
this is a separate change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 61 +++++---------------------------------
 1 file changed, 8 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 961689a255c4..74d38f90398a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1731,28 +1731,9 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	return -EINVAL;
 }
 
-static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
-	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
-	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
-};
-
-/* only 8bpc, 8bpp added */
-static char min_qp[DSC_NUM_BUF_RANGES] = {
-	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
-};
-
-static char max_qp[DSC_NUM_BUF_RANGES] = {
-	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
-};
-
-static char bpg_offset[DSC_NUM_BUF_RANGES] = {
-	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
-};
-
 static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
 {
-	int i;
-	u16 bpp = dsc->bits_per_pixel >> 4;
+	int ret;
 
 	if (dsc->bits_per_pixel & 0xf) {
 		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
@@ -1764,49 +1745,23 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return -EOPNOTSUPP;
 	}
 
-	dsc->rc_model_size = 8192;
-	dsc->first_line_bpg_offset = 12;
-	dsc->rc_edge_factor = 6;
-	dsc->rc_tgt_offset_high = 3;
-	dsc->rc_tgt_offset_low = 3;
 	dsc->simple_422 = 0;
 	dsc->convert_rgb = 1;
 	dsc->vbr_enable = 0;
 
-	/* handle only bpp = bpc = 8 */
-	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
-		dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+	drm_dsc_set_const_params(dsc);
+	drm_dsc_set_rc_buf_thresh(dsc);
 
-	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
-		dsc->rc_range_params[i].range_min_qp = min_qp[i];
-		dsc->rc_range_params[i].range_max_qp = max_qp[i];
-		/*
-		 * Range BPG Offset contains two's-complement signed values that fill
-		 * 8 bits, yet the registers and DCS PPS field are only 6 bits wide.
-		 */
-		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & DSC_RANGE_BPG_OFFSET_MASK;
+	/* handle only bpp = bpc = 8, pre-SCR panels */
+	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	if (ret) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
+		return ret;
 	}
 
-	dsc->initial_offset = 6144;		/* Not bpp 12 */
-	if (bpp != 8)
-		dsc->initial_offset = 2048;	/* bpp = 12 */
-
-	if (dsc->bits_per_component <= 10)
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
-	else
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
-
-	dsc->initial_xmit_delay = 512;
 	dsc->initial_scale_value = 32;
-	dsc->first_line_bpg_offset = 12;
 	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
-	/* bpc 8 */
-	dsc->flatness_min_qp = 3;
-	dsc->flatness_max_qp = 12;
-	dsc->rc_quant_incr_limit0 = 11;
-	dsc->rc_quant_incr_limit1 = 11;
-
 	return drm_dsc_compute_rc_parameters(dsc);
 }
 

-- 
2.40.0

