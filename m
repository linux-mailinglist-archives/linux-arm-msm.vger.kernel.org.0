Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487C65224C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 21:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbiEJTaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 15:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbiEJTaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 15:30:01 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4062992E3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:29:59 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 137so806869pgb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zvX7gsickFQTadjtrYNgvijsVxLzBuPY+lzXCPfdMic=;
        b=h5NRX/t/3JyPYbL9z5iKgKKIXs3pj78+XyWNFf5wd51084g3f1xCekZsqJPUukvcPc
         oTOncU/sklId/q9IiCLzrfxM6K470JJ0mlX8UZlM9cPUCyuTPMJns1/sD5imD8365vZ9
         WBlGpTxmL9mfRV4AAcEROMuBBaUCQSnBWsILc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zvX7gsickFQTadjtrYNgvijsVxLzBuPY+lzXCPfdMic=;
        b=jHOqgFoyRhKxH0Em6C9I3A/yaxg15kYdMOrhJ1bAkxnKL61K683IeCXrR3p5wdQXF3
         98QUxYr/VQLrhV0oro/4edD0YiJQd1z42AqctMnqkDCaIdAVI5kn4zazkS/CvR2eiUZa
         UEjmH8i1T2lr2Szv9+2qMJQNhknOz0D2uRXdPuElFxhzx3t6qJakhZNRCLVz9hg2Y9Qk
         /qU8RxfnKK+PMcennsiVMHHSZEmy+v7B8TIrT+/skDoVjyq2gUqMxLwfQoULQsb3/WQS
         wg/xWC1LssirBfddvAqO8WLq+qSRyq9ipJQSHht5FuoIH80DVPID8WsyLHACQStym9OX
         XdsA==
X-Gm-Message-State: AOAM533jbEviTY+ViIONTqRY6X52UryNn+zOwvFI+uqpWDuhdwNSLj/s
        7Zxa5cy4Bo1cxJXb3KruVr9evA==
X-Google-Smtp-Source: ABdhPJyahyDgFCU09TgF1fxSqRtJB1NMfsOwWIAdRG+4PWbHwz72o5ifalC4goK3AWXMjIro5XEw4Q==
X-Received: by 2002:a65:5c48:0:b0:382:2c7:28e9 with SMTP id v8-20020a655c48000000b0038202c728e9mr18452749pgr.472.1652210999063;
        Tue, 10 May 2022 12:29:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6f08:624c:c762:d238])
        by smtp.gmail.com with ESMTPSA id s43-20020a056a001c6b00b0050dc762819dsm10786989pfw.119.2022.05.10.12.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 12:29:58 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
Date:   Tue, 10 May 2022 12:29:41 -0700
Message-Id: <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
References: <20220510192944.2408515-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While working on the DP AUX bus code I found a few small things that
should be fixed. Namely the non-devm version of
of_dp_aux_populate_ep_devices() was missing an export. There was also
an extra blank line in a kerneldoc and a kerneldoc that incorrectly
documented a return value. Fix these.

Fixes: aeb33699fc2c ("drm: Introduce the DP AUX bus")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
None of these seem critical, so my plan is to land this in
drm-misc-next and not drm-misc-fixes. This will avoid merge conflicts
with future patches.

Changes in v3:
- Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.

 drivers/gpu/drm/display/drm_dp_aux_bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index dccf3e2ea323..552f949cff59 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -66,7 +66,6 @@ static int dp_aux_ep_probe(struct device *dev)
  * @dev: The device to remove.
  *
  * Calls through to the endpoint driver remove.
- *
  */
 static void dp_aux_ep_remove(struct device *dev)
 {
@@ -120,8 +119,6 @@ ATTRIBUTE_GROUPS(dp_aux_ep_dev);
 /**
  * dp_aux_ep_dev_release() - Free memory for the dp_aux_ep device
  * @dev: The device to free.
- *
- * Return: 0 if no error or negative error code.
  */
 static void dp_aux_ep_dev_release(struct device *dev)
 {
@@ -256,6 +253,7 @@ int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_dp_aux_populate_ep_devices);
 
 static void of_dp_aux_depopulate_ep_devices_void(void *data)
 {
-- 
2.36.0.550.gb090851708-goog

