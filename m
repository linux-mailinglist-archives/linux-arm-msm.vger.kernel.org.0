Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53194C57DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 20:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiBZTr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 14:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiBZTr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 14:47:26 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C6F1D2B64
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 11:46:50 -0800 (PST)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 648BE3F40D;
        Sat, 26 Feb 2022 20:46:46 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Use indexed array initializer to prevent mismatches
Date:   Sat, 26 Feb 2022 20:46:32 +0100
Message-Id: <20220226194633.204501-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While there's a comment pointing from dpu_intr_set to dpu_hw_intr_reg
and vice-versa, an array initializer using indices makes it so that the
indices between the enum and array cannot possibly get out of sync even
if they're accidentially ordered wrongly.  It is still useful to keep
the comment to be made aware where the register offset mapping resides
while looking at dpu_hw_intr_reg.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index c515b7cf922c..c61b5b283f08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -54,87 +54,87 @@ struct dpu_intr_reg {
  * When making changes be sure to sync with dpu_hw_intr_reg
  */
 static const struct dpu_intr_reg dpu_intr_set[] = {
-	{
+	[MDP_SSPP_TOP0_INTR] = {
 		MDP_SSPP_TOP0_OFF+INTR_CLEAR,
 		MDP_SSPP_TOP0_OFF+INTR_EN,
 		MDP_SSPP_TOP0_OFF+INTR_STATUS
 	},
-	{
+	[MDP_SSPP_TOP0_INTR2] = {
 		MDP_SSPP_TOP0_OFF+INTR2_CLEAR,
 		MDP_SSPP_TOP0_OFF+INTR2_EN,
 		MDP_SSPP_TOP0_OFF+INTR2_STATUS
 	},
-	{
+	[MDP_SSPP_TOP0_HIST_INTR] = {
 		MDP_SSPP_TOP0_OFF+HIST_INTR_CLEAR,
 		MDP_SSPP_TOP0_OFF+HIST_INTR_EN,
 		MDP_SSPP_TOP0_OFF+HIST_INTR_STATUS
 	},
-	{
+	[MDP_INTF0_INTR] = {
 		MDP_INTF_0_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_0_OFF+INTF_INTR_EN,
 		MDP_INTF_0_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF1_INTR] = {
 		MDP_INTF_1_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_1_OFF+INTF_INTR_EN,
 		MDP_INTF_1_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF2_INTR] = {
 		MDP_INTF_2_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_2_OFF+INTF_INTR_EN,
 		MDP_INTF_2_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF3_INTR] = {
 		MDP_INTF_3_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_3_OFF+INTF_INTR_EN,
 		MDP_INTF_3_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF4_INTR] = {
 		MDP_INTF_4_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_4_OFF+INTF_INTR_EN,
 		MDP_INTF_4_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF5_INTR] = {
 		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_5_OFF+INTF_INTR_EN,
 		MDP_INTF_5_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_AD4_0_INTR] = {
 		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_STATUS_OFF,
 	},
-	{
+	[MDP_AD4_1_INTR] = {
 		MDP_AD4_1_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_EN_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_STATUS_OFF,
 	},
-	{
+	[MDP_INTF0_7xxx_INTR] = {
 		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF1_7xxx_INTR] = {
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF2_7xxx_INTR] = {
 		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF3_7xxx_INTR] = {
 		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF4_7xxx_INTR] = {
 		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF5_7xxx_INTR] = {
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS

base-commit: 06aeb1495c39c86ccfaf1adadc1d2200179f16eb
-- 
2.35.1

