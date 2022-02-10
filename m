Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E864B0664
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 07:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbiBJGiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 01:38:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbiBJGiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 01:38:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EE8DFA
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 22:38:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C0CC614A5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3129BC340EB;
        Thu, 10 Feb 2022 06:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644475096;
        bh=3UAY9lqkQR8YyUxNwNgQ/uSCRirIpixHQJe3MseOGWU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X1oq0v8Trur7u8glnPKOHBVwn9uvSfpjQa+ddgTlO47mVvjJx9DDVmZ7PW2vCR53R
         wTfgDzYZKIRplXggL2sdTcfA67oT+MlNypGGPNmkjzMm+S67lAONlT0GBFw1XRO+vK
         urihr1NT+Gn7WAn1uQKzljxIjU6H1MDbRiFfGipw5f7E5yTMAt6aCglaNTqYV8C09N
         obzdoX2Z9bCmeSUcb+mg/qsKEU1OmZnkaqwTHV72w/yC9eAFbV7twLJTTUE4Ylektm
         HqA3duj2xB7XEu4yw671fpL+//YrdTkOi+HtLvifVC7mCq2cF0GSLngsf/60B8hqRs
         Kt7Fxo530F8hA==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 09/13] drm/msm: Add missing structure documentation
Date:   Thu, 10 Feb 2022 12:07:35 +0530
Message-Id: <20220210063739.233634-10-vkoul@kernel.org>
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

Somehow documentation for dspp was missed, so add that

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e7a312edfe67..6425a42e997c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -102,6 +102,7 @@ enum msm_event_wait {
  * @num_lm:       number of layer mixers used
  * @num_enc:      number of compression encoder blocks used
  * @num_intf:     number of interfaces the panel is mounted on
+ * @num_dspp:     number of dspp blocks used
  */
 struct msm_display_topology {
 	u32 num_lm;
-- 
2.31.1

