Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A5753B083
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 02:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbiFAXfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 19:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbiFAXfu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 19:35:50 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A1123429D
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 16:35:47 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-e656032735so4818062fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 16:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nysr9Vv0SpeIMmITphfX37l3IqsFABna+5njElQYczg=;
        b=rOkQwislOKDkFcI/V4qlVnJ+B1DnE8Gl30iIVoh/pBU+KqD5ojyKMo3/xro5T8uz69
         Jflz072DH8bsEe+TA9ZIXc6Y5WjIuN1wJ+oUlgKKHkw9PIrmLrVl80aqjLU7PfPU9ieW
         8LRGpAl7G9xQxmuiJdq1AmtcD3j4P1LRM/IngG6nRSbHE1WkwqeiProcNpAqRFFmvShZ
         toh8wi8aPEeEKqzPFH//L3uLTO/5tsHARMlZ1SyVPSgVwDWt/v9G7SLDb5wIuD7M7Mkb
         RqR2z9l2r9egywSWl93Aw/Chl9SDGzGSmLX8f/MCpSyPOwMjx7MaJXvDX5MSha0KG/gt
         IYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nysr9Vv0SpeIMmITphfX37l3IqsFABna+5njElQYczg=;
        b=dCuIVDI9+rPaMsvacvLrAQZjzfbzVONQZjjRLXVfvMOdhEFF3XSPzWvBqUsVxh/OCC
         ssTKr0Hqe1z6+D0uuj1GSbKYv+/8bQa0CmoXokXp+S9hnxRR95yqxUMbGNgJrdtD1KlP
         /trMfj4SPns/9pMTArfNeDuwZVkATl097AWiHK77siw+OFWIw4bxad1Ylq5fZj7FnR0z
         1OL1A9cB+wASbvt70n+ipKLJXe7I47lzSN9ValfwlnrbIGS+YSCjdQIQr0upkWsuDFbm
         E7LNIxcG5b7RUTqD4/CCTg6XHR1GvKSrwLfmV73RD0WfBZpuHWqsNCv/jdT4sL6OefqP
         sLcw==
X-Gm-Message-State: AOAM5315HIflOv9193DSKzlHPzpMI5ulHA3I+ROBYD8Ep+DutxDAyTKr
        WZIJPPSl9GM2FU07wnveSAIPww==
X-Google-Smtp-Source: ABdhPJxTlWTl/SNX+dACDo7vUoDjljc+CM6IiK+RALMVaK5nsZboS/Oxij0yutp/YokkxVNMkLld6Q==
X-Received: by 2002:a05:6870:a10e:b0:f5:dc08:fe47 with SMTP id m14-20020a056870a10e00b000f5dc08fe47mr1168206oae.33.1654126546944;
        Wed, 01 Jun 2022 16:35:46 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a18-20020a0568300b9200b0060adcc87e37sm1315715otv.74.2022.06.01.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 16:35:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/bridge: lt9611uxc: Cancel only driver's work
Date:   Wed,  1 Jun 2022 16:38:18 -0700
Message-Id: <20220601233818.1877963-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During device remove care needs to be taken that no work is pending
before it removes the underlying DRM bridge etc, but this can be done on
the specific work rather than waiting for the flush of the system-wide
workqueue.

Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3d62e6bf6892..310b3b194491 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -982,7 +982,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	flush_scheduled_work();
+	cancel_work_sync(&lt9611uxc->work);
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
-- 
2.35.1

