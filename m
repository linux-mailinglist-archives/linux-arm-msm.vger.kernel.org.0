Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF5B6F2C93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 05:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjEADBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 23:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbjEADAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 23:00:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1EB1BF7;
        Sun, 30 Apr 2023 19:59:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2161C616DB;
        Mon,  1 May 2023 02:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE96C433EF;
        Mon,  1 May 2023 02:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682909918;
        bh=cG3lu9FMZB1qZzX5GvnYFM79h8hoMu8URMJCS/qlmPk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MSRf1O8xoh6ds7rGWDSV7j+R2fO9C2cQH7oXmDd6M9vnmjJipvChjHDHv1aXic+aP
         NRO2zWWVm+7+27rT/QMsLUap664sZwK0oXcnXL9Mh8FjZf0Uqm70VWt5DvFFvnVThM
         xSGJCEaY6G8Cth2ud7U5ae8GzR04fya0wmG5UkzTyRvuZY0BXQu431CE24X+Iecf+o
         I+ZQ0/mGLXJeJ1swDAOSe4aoJTipCqZW625VO5UjZffnHAkZD5+lpVFPWWAYY4eHLT
         zh1OIeug23JfSzdRnTywd6FBwvXQfz7AGJvvzCY8cgw3Wc8OlAZOpfR/J+r/NlpehH
         hXqkd/UEh/rxQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sasha Levin <sashal@kernel.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, airlied@gmail.com, daniel@ffwll.ch,
        swboyd@chromium.org, quic_sbillaka@quicinc.com,
        quic_vpolimer@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.3 28/44] drm/msm/dp: Clean up handling of DP AUX interrupts
Date:   Sun, 30 Apr 2023 22:56:16 -0400
Message-Id: <20230501025632.3253067-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025632.3253067-1-sashal@kernel.org>
References: <20230501025632.3253067-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit b20566cdef05cd40d95f10869d2a7646f48b1bbe ]

The DP AUX interrupt handling was a bit of a mess.
* There were two functions (one for "native" transfers and one for
  "i2c" transfers) that were quite similar. It was hard to say how
  many of the differences between the two functions were on purpose
  and how many of them were just an accident of how they were coded.
* Each function sometimes used "else if" to test for error bits and
  sometimes didn't and again it was hard to say if this was on purpose
  or just an accident.
* The two functions wouldn't notice whether "unknown" bits were
  set. For instance, there seems to be a bit "DP_INTR_PLL_UNLOCKED"
  and if it was set there would be no indication.
* The two functions wouldn't notice if more than one error was set.

Let's fix this by being more consistent / explicit about what we're
doing.

By design this could cause different handling for AUX transfers,
though I'm not actually aware of any bug fixed as a result of
this patch (this patch was created because we simply noticed how odd
the old code was by code inspection). Specific notes here:
1. In the old native transfer case if we got "done + wrong address"
   we'd ignore the "wrong address" (because of the "else if"). Now we
   won't.
2. In the old native transfer case if we got "done + timeout" we'd
   ignore the "timeout" (because of the "else if"). Now we won't.
3. In the old native transfer case we'd see "nack_defer" and translate
   it to the error number for "nack". This differed from the i2c
   transfer case where "nack_defer" was given the error number for
   "nack_defer". This 100% can't matter because the only user of this
   error number treats "nack defer" the same as "nack", so it's clear
   that the difference between the "native" and "i2c" was pointless
   here.
4. In the old i2c transfer case if we got "done" plus any error
   besides "nack" or "defer" then we'd ignore the error. Now we don't.
5. If there is more than one error signaled by the hardware it's
   possible that we'll report a different one than we used to. I don't
   know if this matters. If someone is aware of a case this matters we
   should document it and change the code to make it explicit.
6. One quirk we keep (I don't know if this is important) is that in
   the i2c transfer case if we see "done + defer" we report that as a
   "nack". That seemed too intentional in the old code to just drop.

After this change we will add extra logging, including:
* A warning if we see more than one error bit set.
* A warning if we see an unexpected interrupt.
* A warning if we get an AUX transfer interrupt when shouldn't.

It actually turns out that as a result of this change then at boot we
sometimes see an error:
  [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
That means that, during init, we are seeing DP_INTR_PLL_UNLOCKED. For
now I'm going to say that leaving this error reported in the logs is
OK-ish and hopefully it will encourage someone to track down what's
going on at init time.

One last note here is that this change renames one of the interrupt
bits. The bit named "i2c done" clearly was used for native transfers
being done too, so I renamed it to indicate this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/520658/
Link: https://lore.kernel.org/r/20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 80 ++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 3 files changed, 36 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index cc3efed593aa1..84f9e3e5f9642 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -162,47 +162,6 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	return i;
 }
 
-static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
-{
-	if (isr & DP_INTR_AUX_I2C_DONE)
-		aux->aux_error_num = DP_AUX_ERR_NONE;
-	else if (isr & DP_INTR_WRONG_ADDR)
-		aux->aux_error_num = DP_AUX_ERR_ADDR;
-	else if (isr & DP_INTR_TIMEOUT)
-		aux->aux_error_num = DP_AUX_ERR_TOUT;
-	if (isr & DP_INTR_NACK_DEFER)
-		aux->aux_error_num = DP_AUX_ERR_NACK;
-	if (isr & DP_INTR_AUX_ERROR) {
-		aux->aux_error_num = DP_AUX_ERR_PHY;
-		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
-	}
-}
-
-static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
-{
-	if (isr & DP_INTR_AUX_I2C_DONE) {
-		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
-			aux->aux_error_num = DP_AUX_ERR_NACK;
-		else
-			aux->aux_error_num = DP_AUX_ERR_NONE;
-	} else {
-		if (isr & DP_INTR_WRONG_ADDR)
-			aux->aux_error_num = DP_AUX_ERR_ADDR;
-		else if (isr & DP_INTR_TIMEOUT)
-			aux->aux_error_num = DP_AUX_ERR_TOUT;
-		if (isr & DP_INTR_NACK_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
-		if (isr & DP_INTR_I2C_NACK)
-			aux->aux_error_num = DP_AUX_ERR_NACK;
-		if (isr & DP_INTR_I2C_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_DEFER;
-		if (isr & DP_INTR_AUX_ERROR) {
-			aux->aux_error_num = DP_AUX_ERR_PHY;
-			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
-		}
-	}
-}
-
 static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
 					     struct drm_dp_aux_msg *input_msg)
 {
@@ -427,13 +386,42 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 	if (!isr)
 		return;
 
-	if (!aux->cmd_busy)
+	if (!aux->cmd_busy) {
+		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
 		return;
+	}
 
-	if (aux->native)
-		dp_aux_native_handler(aux, isr);
-	else
-		dp_aux_i2c_handler(aux, isr);
+	/*
+	 * The logic below assumes only one error bit is set (other than "done"
+	 * which can apparently be set at the same time as some of the other
+	 * bits). Warn if more than one get set so we know we need to improve
+	 * the logic.
+	 */
+	if (hweight32(isr & ~DP_INTR_AUX_XFER_DONE) > 1)
+		DRM_WARN("Some DP AUX interrupts unhandled: %#010x\n", isr);
+
+	if (isr & DP_INTR_AUX_ERROR) {
+		aux->aux_error_num = DP_AUX_ERR_PHY;
+		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+	} else if (isr & DP_INTR_NACK_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
+	} else if (isr & DP_INTR_WRONG_ADDR) {
+		aux->aux_error_num = DP_AUX_ERR_ADDR;
+	} else if (isr & DP_INTR_TIMEOUT) {
+		aux->aux_error_num = DP_AUX_ERR_TOUT;
+	} else if (!aux->native && (isr & DP_INTR_I2C_NACK)) {
+		aux->aux_error_num = DP_AUX_ERR_NACK;
+	} else if (!aux->native && (isr & DP_INTR_I2C_DEFER)) {
+		if (isr & DP_INTR_AUX_XFER_DONE)
+			aux->aux_error_num = DP_AUX_ERR_NACK;
+		else
+			aux->aux_error_num = DP_AUX_ERR_DEFER;
+	} else if (isr & DP_INTR_AUX_XFER_DONE) {
+		aux->aux_error_num = DP_AUX_ERR_NONE;
+	} else {
+		DRM_WARN("Unexpected interrupt: %#010x\n", isr);
+		return;
+	}
 
 	complete(&aux->comp);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 676279d0ca8d9..421391755427d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -27,7 +27,7 @@
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
 #define DP_INTERRUPT_STATUS1 \
-	(DP_INTR_AUX_I2C_DONE| \
+	(DP_INTR_AUX_XFER_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
 	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
 	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f717f45c1158..f36b7b372a065 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -13,7 +13,7 @@
 
 /* interrupts */
 #define DP_INTR_HPD		BIT(0)
-#define DP_INTR_AUX_I2C_DONE	BIT(3)
+#define DP_INTR_AUX_XFER_DONE	BIT(3)
 #define DP_INTR_WRONG_ADDR	BIT(6)
 #define DP_INTR_TIMEOUT		BIT(9)
 #define DP_INTR_NACK_DEFER	BIT(12)
-- 
2.39.2

