Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A52C5AAB93
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 11:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbiIBJiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 05:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbiIBJiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 05:38:20 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983DAC04EE;
        Fri,  2 Sep 2022 02:38:18 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28299eJd005200;
        Fri, 2 Sep 2022 09:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=6DVvHBJK5oS36I91y8Xul0tolU1FYsD+UygTfAP2PS4=;
 b=VnyTA6ofZ6P9ZHkoCGKP4MPSYedW6+O3tZ14TDi9T2yH4MNH9bgCdxWXkNJ6yIMkfch7
 oQom6U7A3oo2fGftpOrujxfgM41vbxLnTkcMv9w6isNZRydpLcrQKUCbCgmf/yLS4rSZ
 NM1lPCSZNIWvy6RFuBkL5lYXwpNb/C5zoS31XRV6t99qB/aijYXN6/wTC58TcZ3Tw4vD
 lhAmlDL6zrwYi7/x8ijrz1J69Tkd8icVmD1OIqHrS+dAPzYl7M1PshcgKAZ62DKnCiKO
 9lyx0zpUHe6KUP9JOiWzg+aprzTyeA5ApiB+IbfjfS+6IiROLX31aNsrGdE0eAHA4tCI 3Q== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jbafy8uh1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Sep 2022 09:38:15 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2829cBEX010456;
        Fri, 2 Sep 2022 09:38:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3j7cbkwrk7-1;
        Fri, 02 Sep 2022 09:38:11 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2829cBdN010449;
        Fri, 2 Sep 2022 09:38:11 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2829cAmX010448;
        Fri, 02 Sep 2022 09:38:11 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 3CAE64401; Fri,  2 Sep 2022 02:38:10 -0700 (PDT)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [v2] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
Date:   Fri,  2 Sep 2022 02:38:06 -0700
Message-Id: <1662111486-15021-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xi5vvSt5cqLNQ-WQeegDBekRvIIZQ9Hj
X-Proofpoint-GUID: xi5vvSt5cqLNQ-WQeegDBekRvIIZQ9Hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=971 impostorscore=0 adultscore=0
 clxscore=1011 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020045
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |  7 ++++++
 6 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 601d687..ab38a52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 
 		/* stage config flush mask */
 		ctl->ops.update_pending_flush_dspp(ctl,
-			mixer[i].hw_dspp->idx);
+			mixer[i].hw_dspp->idx, DPU_DSPP_SUB_PCC);
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
index 38aa38a..6a0b784 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -191,6 +191,7 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
+ * @DPU_CTL_DSPP_BLOCK_FLUSH: CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
@@ -198,6 +199,7 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
+	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index a35ecb6..3b14c30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -33,6 +33,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
+#define   CTL_DSPP_n_FLUSH		0x13C
 
 #define CTL_MIXER_BORDER_OUT            BIT(24)
 #define CTL_FLUSH_MASK_CTL              BIT(17)
@@ -82,6 +83,31 @@ static int _mixer_stages(const struct dpu_lm_cfg *mixer, int count,
 	return stages;
 }
 
+static u32 _set_dspp_sub_block_flush(struct dpu_hw_ctl *ctx,
+	enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
+{
+	uint32_t flushbits = 0, active;
+
+	switch (dspp_sub_blk) {
+	case DPU_DSPP_SUB_IGC:
+		flushbits = BIT(2);
+		break;
+	case DPU_DSPP_SUB_PCC:
+		flushbits = BIT(4);
+		break;
+	case DPU_DSPP_SUB_GC:
+		flushbits = BIT(5);
+		break;
+	default:
+		return 0;
+	}
+
+	active = DPU_REG_READ(&ctx->hw, CTL_DSPP_n_FLUSH + ((dspp - 1) * 4));
+	DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH + ((dspp - 1) * 4), active | flushbits);
+
+	return BIT(29);
+}
+
 static inline u32 dpu_hw_ctl_get_flush_register(struct dpu_hw_ctl *ctx)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -287,8 +313,15 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 }
 
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
-	enum dpu_dspp dspp)
+	enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
 {
+
+	if ((test_bit(DPU_CTL_DSPP_SUB_BLOCK_FLUSH, &ctx->caps->features))) {
+		ctx->pending_flush_mask |=
+			_set_dspp_sub_block_flush(ctx, dspp, dspp_sub_blk);
+		return;
+	}
+
 	switch (dspp) {
 	case DSPP_0:
 		ctx->pending_flush_mask |= BIT(13);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 96c012e..227f1bd 100644
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
+		enum dpu_dspp blk,  enum dpu_dspp_sub_blk dspp_sub_blk);
+
 	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index d3b0ed0..c113d52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -167,6 +167,13 @@ enum dpu_dspp {
 	DSPP_MAX
 };
 
+enum dpu_dspp_sub_blk{
+	DPU_DSPP_SUB_PCC = 1,
+	DPU_DSPP_SUB_IGC,
+	DPU_DSPP_SUB_GC,
+	DPU_DSPP_SUB_MAX
+};
+
 enum dpu_ctl {
 	CTL_0 = 1,
 	CTL_1,
-- 
2.7.4

