Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95394B0668
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 07:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbiBJGiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 01:38:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbiBJGiJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 01:38:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749FBE28
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 22:38:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 25750B823D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C69C340FC;
        Thu, 10 Feb 2022 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644475088;
        bh=/Jj3Lmsl2bhD8w66aeCtQ+hifD/+nP3PmzaGwSrG6OM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qqVP197SmlNJyM2qjpaNxtLlLuCsQC+aEXEWCNIpE5Dx//AAFPDiol6X4KgVoQjiT
         egssuEPkLqi4V3LOcvybiIMeQ5QiBvJVMDXVQ7JlnvDidkeyxvc9Ngh6MtHUgogtWU
         IKDP/AtQKlzgKEyahwiDeydB8/GJtR+FCnvAJT90k3heeBqSrno7SwtoiOH7Tdhtmh
         y/6vIIHD3u5aTQvLILVDJplIKf2QFORYk3ERDol1uGMYb7zr53E/jo1ON4CnywOti5
         gs0XQ30hxtrrSFpU8IuzB7JZHozXtDRUqkwsIg6uFZOqvo2j+YNFpHS81qBWjXzgls
         AB5Zi/TaFw3Ew==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 05/13] drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
Date:   Thu, 10 Feb 2022 12:07:31 +0530
Message-Id: <20220210063739.233634-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210063739.233634-1-vkoul@kernel.org>
References: <20220210063739.233634-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds SDM845 DSC blocks into hw_catalog

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa75991903a6..9c09cf318dfb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -821,6 +821,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
+
+/*************************************************************
+ * DSC sub blocks config
+ *************************************************************/
+#define DSC_BLK(_name, _id, _base) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0x140, \
+	.features = 0, \
+	}
+
+static struct dpu_dsc_cfg sdm845_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000),
+	DSC_BLK("dsc_1", DSC_1, 0x80400),
+	DSC_BLK("dsc_2", DSC_2, 0x80800),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00),
+};
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -1124,6 +1142,8 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.mixer = sdm845_lm,
 		.pingpong_count = ARRAY_SIZE(sdm845_pp),
 		.pingpong = sdm845_pp,
+		.dsc_count = ARRAY_SIZE(sdm845_dsc),
+		.dsc = sdm845_dsc,
 		.intf_count = ARRAY_SIZE(sdm845_intf),
 		.intf = sdm845_intf,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.31.1

