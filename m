Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC446613E2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjAHH0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbjAHH0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:01 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F057C1D0F8
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:25:58 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bq39so8370773lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
        b=Ux2ciHFIvGWO6NT3TSZYAB6S//IPXOwYcprwgpxHswK6KaMc8BZXeunVEogXWh2UVX
         cJ7vCxBy+A263PXJ70ZbtZjgAmyvLdwt7weFf/UVBBNjX4smHNzB/59XIYJVLQ3XIoP7
         7GSNKGdW6PADsCLBuyKlFAp43Bq3ExEYz5msECLnIZ32SAOdnbntxtFuqGIHHs0Np1qq
         REWz9nqb/8tFhPn5GtWhYlo0C4IozI23vnHITkNfoQJgwE9uLbQQHHrspZ3mVMcsvtQ3
         cncr9HpO6q2LVNT9YUsBWYX85zkBURmWzpQ3uZnbZ/c63qqjwwWkEEw1sFsbODfNY0wI
         TpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
        b=WrpMjLSWENh2LYtAQUscqFLX31cflRWTUcw/WX18ZQOocShqfm9+md0rJ38dDgG5Mg
         CPfT3dDlA7VgJvqESQDXNriZnMS5glToQD43unT1Le+IFTokXfeGmRrXboOv9ZicQiEu
         zYd0xe6rzqVhZIvoZU8JpsDpS+jJswNuvyYRk3YQT+XfHRKIRFvY7AXNwy/VYLuq4WMM
         PLNrl+ueIkDRlWdgrsItkBNAdkCEZePVcBn6T8oSRzIgKY8jf/6lG9Lk43kCMr6J9THl
         s3OOOJyXk33A5FSrI4G43/IOQdfMteJmQ4iCuSuRgUoUn8LyJGtTw95+1d192gUXC3mo
         6/UA==
X-Gm-Message-State: AFqh2kqIYCQF/8FvY8U7pDtaaLuZhGOcRO77Kq/DlerU6JGcRug2n7UX
        xTvJOcqLyRXlTu1q0egh9h0Nuw==
X-Google-Smtp-Source: AMrXdXuAxN4yqXdIZptsyDsJjG5Jcnv7P/pNVbSR10r89IK21J1NzuWq9lidrKNOTS4PfUYs3gfuUA==
X-Received: by 2002:ac2:5975:0:b0:4b5:8f03:a2bc with SMTP id h21-20020ac25975000000b004b58f03a2bcmr15713088lfp.9.1673162757318;
        Sat, 07 Jan 2023 23:25:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:25:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 01/12] drm/bridge: lt9611: fix sleep mode setup
Date:   Sun,  8 Jan 2023 09:25:44 +0200
Message-Id: <20230108072555.2905260-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On atomic_post_disable the bridge goes to the low power state. However
the code disables too much of the chip, so the HPD event is not being
detected and delivered to the host. Reduce the power saving in order to
get the HPD event.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7c0a99173b39..2714184cc53f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -448,12 +448,11 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
 		{ 0x8023, 0x01 },
 		{ 0x8157, 0x03 }, /* set addr pin as output */
 		{ 0x8149, 0x0b },
-		{ 0x8151, 0x30 }, /* disable IRQ */
+
 		{ 0x8102, 0x48 }, /* MIPI Rx power down */
 		{ 0x8123, 0x80 },
 		{ 0x8130, 0x00 },
-		{ 0x8100, 0x01 }, /* bandgap power down */
-		{ 0x8101, 0x00 }, /* system clk power down */
+		{ 0x8011, 0x0a },
 	};
 
 	regmap_multi_reg_write(lt9611->regmap,
-- 
2.39.0

