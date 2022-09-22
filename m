Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8CA5E5AD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 07:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiIVFoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 01:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiIVFog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 01:44:36 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8922D115E;
        Wed, 21 Sep 2022 22:44:34 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28M4shY1014947;
        Thu, 22 Sep 2022 05:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=we5HxVglRR+sKuc84BskH/MwyDzSBZhVxt78pj1pxq8=;
 b=l9PG4vRfmpFcuXB5/Qa0k1Jc47Sgi3R/2eFIiZkkIlF5KH/D0HObgd/LN/hdIOrWp0CO
 NDiecN5sIA5kEKI6xRp4Ypyg94iRi5nujLjBqo7KVGOPgllzaqyY/OCZlcRFq6U1BKG+
 W4WmY3XQveAyKLqFlsDD2XBC7FeoSbjOGq9VMdaWIkyRNBZ6+zqZJuyAi6Akx3dj3pqQ
 FCzIe+IqgL/99Nltc3hCkoCAO33OaWT/2ujeu4MHY+mcJNYRGCXJ7CANqrx9KGmiNy3U
 NUoh8mKjYesvBzJY2z2XDkx9JDBOAyvqKrWYiBYCc2f3P5ibeAig/1xWa7KTlzAZuJLo hw== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jqx5wbvtc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Sep 2022 05:44:29 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28M5iQkN025029;
        Thu, 22 Sep 2022 05:44:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3jnqqrmr4x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 22 Sep 2022 05:44:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28M5iQbo025016;
        Thu, 22 Sep 2022 05:44:26 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 28M5iPYD025001;
        Thu, 22 Sep 2022 05:44:26 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id DF2961718; Wed, 21 Sep 2022 22:44:24 -0700 (PDT)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [Resend v4] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
Date:   Wed, 21 Sep 2022 22:44:23 -0700
Message-Id: <1663825463-6715-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fEX7tSJnk8z4SoruHOKQ-OQZWCfgWbKw
X-Proofpoint-ORIG-GUID: fEX7tSJnk8z4SoruHOKQ-OQZWCfgWbKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209220037
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Flush mechanism for DSPP blocks has changed in sc7280 family, it
allows individual sub blocks to be flushed in coordination with
master flush control.

Representation: master_flush && (PCC_flush | IGC_flush .. etc )

This change adds necessary support for the above design.

Changes in v1:
- Few nits (Doug, Dmitry)
- Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)

Changes in v2:
- Move the address offset to flush macro (Dmitry)
- Seperate ops for the sub block flush (Dmitry)

Changes in v3:
- Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)

Changes in v4:
- Use shorter version for unsigned int (Stephen)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
 5 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 601d687..4170fbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 
 		/* stage config flush mask */
 		ctl->ops.update_pending_flush_dspp(ctl,
-			mixer[i].hw_dspp->idx);
+			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 27f029f..0eecb2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -65,7 +65,10 @@
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
+	(BIT(DPU_CTL_ACTIVE_CFG) | \
+	 BIT(DPU_CTL_FETCH_ACTIVE) | \
+	 BIT(DPU_CTL_VM_CFG) | \
+	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define MERGE_3D_SM8150_MASK (0)
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38a..8148e91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -161,10 +161,12 @@ enum {
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
  * @DPU_DSPP_GC              Gamma correction block
+ * @DPU_DSPP_IGC             Inverse Gamma correction block
  */
 enum {
 	DPU_DSPP_PCC = 0x1,
 	DPU_DSPP_GC,
+	DPU_DSPP_IGC,
 	DPU_DSPP_MAX
 };
 
@@ -191,6 +193,7 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
+ * @DPU_CTL_DSPP_BLOCK_FLUSH: CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
@@ -198,6 +201,7 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
+	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index a35ecb6..f26f484 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -33,6 +33,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
+#define   CTL_DSPP_n_FLUSH(n)		((0x13C) + ((n - 1) * 4))
 
 #define CTL_MIXER_BORDER_OUT            BIT(24)
 #define CTL_FLUSH_MASK_CTL              BIT(17)
@@ -287,8 +288,9 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 }
 
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
-	enum dpu_dspp dspp)
+	enum dpu_dspp dspp, u32 dspp_sub_blk)
 {
+
 	switch (dspp) {
 	case DSPP_0:
 		ctx->pending_flush_mask |= BIT(13);
@@ -307,6 +309,31 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	}
 }
 
+static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
+	struct dpu_hw_ctl *ctx,	enum dpu_dspp dspp, u32 dspp_sub_blk)
+{
+	u32 flushbits = 0, active;
+
+	switch (dspp_sub_blk) {
+	case DPU_DSPP_IGC:
+		flushbits = BIT(2);
+		break;
+	case DPU_DSPP_PCC:
+		flushbits = BIT(4);
+		break;
+	case DPU_DSPP_GC:
+		flushbits = BIT(5);
+		break;
+	default:
+		return;
+	}
+
+	active = DPU_REG_READ(&ctx->hw, CTL_DSPP_n_FLUSH(dspp));
+	DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp), active | flushbits);
+
+	ctx->pending_flush_mask |= BIT(29);
+}
+
 static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -675,7 +702,11 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_subblocks;
+	else
+		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+
 	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 96c012e..1743572 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -149,12 +149,18 @@ struct dpu_hw_ctl_ops {
 
 	/**
 	 * OR in the given flushbits to the cached pending_flush_mask
-	 * No effect on hardware
+	 *
+	 * If the hardware supports dspp sub block flush, then sub-block
+	 * flushes are written to the hardware and main dspp flush will
+	 * be cached in the pending_flush_mask.
+	 *
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : DSPP block index
+	 * @dspp_sub_blk : DSPP sub-block index
 	 */
 	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
-		enum dpu_dspp blk);
+		enum dpu_dspp blk,  u32 dspp_sub_blk);
+
 	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
-- 
2.7.4

