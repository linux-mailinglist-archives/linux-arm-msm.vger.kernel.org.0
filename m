Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013646814D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 16:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238136AbjA3PVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 10:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238090AbjA3PVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 10:21:47 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB7038648;
        Mon, 30 Jan 2023 07:21:46 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30UDc0X7009281;
        Mon, 30 Jan 2023 15:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=Flw/vHd0CdFc4SqUwwv5GipjVrTOBx2c+vi6fkcyTYE=;
 b=dYgKJI/IE9wrxgCy7UFEhNsiAl5BEIatqbHSoHENewcCPO1TlQtfQpy8M+Odd+9WPiiS
 6++7vX8ZU0CaK2b60tG0e6oL9YjfadRiGyLe+f3ek4VGE3tfLEYGcMnaJA2a1/Oj+8w1
 vxAlVUeW3ZsOwK79wJpubtOBMb4VBckM44kedQ9t1YfMEygBB0Z7UJVfrevCI3fsx3v/
 O58s336o0q+aYMjGdMKaMOMGa4fx+5KK8CzPBIg29zZ3wAdHrWK9hsZOilSCSv1kjS3h
 qgTpk7uDN8+0/oZDgfFCqKpdHTWXCka2csPeh+m/SBMRc/xyZ5wkbX4g/sg7n8qiOxzG Cw== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncuxakw43-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Jan 2023 15:21:40 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30UFLZGb027521;
        Mon, 30 Jan 2023 15:21:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3ncvsk4n3x-1;
        Mon, 30 Jan 2023 15:21:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UFLbS2027542;
        Mon, 30 Jan 2023 15:21:37 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 30UFLax6027538;
        Mon, 30 Jan 2023 15:21:36 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 075F74BA5; Mon, 30 Jan 2023 07:21:35 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
Subject: [v1 2/3] drm/msm/disp/dpu1: add dspps into reservation if there is a ctm request
Date:   Mon, 30 Jan 2023 07:21:31 -0800
Message-Id: <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D4WHBRJ7AzIUE1hSR7zyTExtBJpmy3YR
X-Proofpoint-GUID: D4WHBRJ7AzIUE1hSR7zyTExtBJpmy3YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_14,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 mlxlogscore=926 impostorscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301300148
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dspp blocks into the topology for reservation, if there is a ctm
request for that composition.

Changes in v1:
- Minor nits (Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..3bd46b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode)
+			struct drm_display_mode *mode,
+			struct drm_crtc_state *crtc_state)
 {
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
@@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
-		if (dpu_kms->catalog->dspp &&
-			(dpu_kms->catalog->dspp_count >= topology.num_lm))
-			topology.num_dspp = topology.num_lm;
-	}
+	if (dpu_kms->catalog->dspp &&
+	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))
+		topology.num_dspp = topology.num_lm;
 
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
@@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
-- 
2.7.4

