Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCAC76F215D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 01:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347063AbjD1Xpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 19:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346873AbjD1Xpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 19:45:46 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145F640DA;
        Fri, 28 Apr 2023 16:45:45 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33SNfLp4013721;
        Fri, 28 Apr 2023 23:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=gmb12qesKT+MWDY6q3XnXs0dYeE1m8qMx7XDwVuArvk=;
 b=YTalC/eBrNcrIvC4x2WgvkJh5svKmveF5C35vx4xLCkF0wfEkB3gidzbtp38V3ZvSJv4
 7modYW7wprQKdXRDetU0oqIrXT1DZyb7LJ0RtJmK/dgcoG2xIGnhZ2muRCNUqLJTpQ6K
 XbACmPtKEgksvhShdTlNMgQNu9NG3Ou3eY3WVg86LU2WdQuncT6mv6VfDVJ4cE9ixB95
 J/eGuOwwYqVfDZSKTIQXDOIBn1AeVi2BuUH7l1XBs6TrZ3ezx9Muo5U8oJ+HYkvBIfYo
 All4N8Xsz4t+BNVdDiDnZ/XFT6+VkFkgaCCXx+b8zeSllgacY0Fc+Lt1v1bvcnck4O2O yg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q850cu35m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Apr 2023 23:45:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SNjVvD003660
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Apr 2023 23:45:31 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 16:45:31 -0700
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
Subject: [PATCH v2 2/7] drm/msm/dpu: separate DSC flush update out of interface
Date:   Fri, 28 Apr 2023 16:45:06 -0700
Message-ID: <1682725511-18185-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3pn6pgr-NVcbbvkDSjawEXqr2RxOQ_pV
X-Proofpoint-GUID: 3pn6pgr-NVcbbvkDSjawEXqr2RxOQ_pV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 suspectscore=0 mlxlogscore=888 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280199
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current DSC flush update is piggyback inside dpu_hw_ctl_intf_cfg_v1().
This patch separate DSC flush away from dpu_hw_ctl_intf_cfg_v1() by
adding dpu_hw_ctl_update_pending_flush_dsc_v1() to handle both per
DSC engine and DSC flush bits at same time to make it consistent with
the location of flush programming of other dpu sub blocks.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 10 ++++++++++
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1dc5dbe..ecb87bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1823,12 +1823,18 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
 	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
 }
 
-static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
+static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
+				     struct dpu_hw_dsc *hw_dsc,
 				     struct dpu_hw_pingpong *hw_pp,
 				     struct drm_dsc_config *dsc,
 				     u32 common_mode,
 				     u32 initial_lines)
 {
+	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
+	struct dpu_hw_ctl *ctl;
+
+	ctl = cur_master->hw_ctl;
+
 	if (hw_dsc->ops.dsc_config)
 		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines);
 
@@ -1843,6 +1849,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 
 	if (hw_pp->ops.enable_dsc)
 		hw_pp->ops.enable_dsc(hw_pp);
+
+	if (ctl->ops.update_pending_flush_dsc)
+		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
 }
 
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
@@ -1887,7 +1896,8 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
-		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
+		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
+					dsc_common_mode, initial_lines);
 }
 
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4f7cfa9..832a6a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -139,6 +139,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 				CTL_DSPP_n_FLUSH(dspp - DSPP_0),
 				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
 		}
+
+	if (ctx->pending_flush_mask & BIT(DSC_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
+				ctx->pending_dsc_flush_mask);
+
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
@@ -285,6 +290,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
+		enum dpu_dsc dsc_num)
+{
+	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
+	ctx->pending_flush_mask |= BIT(DSC_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	enum dpu_dspp dspp, u32 dspp_sub_blk)
 {
@@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
-	if (cfg->dsc)
-		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
-
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
@@ -524,10 +533,8 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
-	if (cfg->dsc) {
-		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
+	if (cfg->dsc)
 		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
-	}
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
@@ -630,6 +637,9 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+
+		ops->update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 6292002..5762752 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
 		enum dpu_dspp blk, u32 dspp_sub_blk);
 
 	/**
+	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : interface block index
+	 */
+	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
+		enum dpu_dsc blk);
+
+	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
 	 */
@@ -245,6 +254,7 @@ struct dpu_hw_ctl {
 	u32 pending_wb_flush_mask;
 	u32 pending_merge_3d_flush_mask;
 	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
+	u32 pending_dsc_flush_mask;
 
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

