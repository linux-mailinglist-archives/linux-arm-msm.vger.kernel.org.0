Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B586C6716CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjARJA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjARI6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:45 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C3555A3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:02 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ss4so73993339ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WANyF2F/RgYw3X0PQ15siC75t9y7XEggYSa5zgiK7xs=;
        b=w3pX+rZVu0y1aN6UOW2+7y7W1c+5KInTOYxSZxwn2lUGSfYO2mwRBmvY+TYeewqApi
         7gegKNXqiw2VaMBNA/sk7o51jRBlsKNcvT4v4fVuJPWY4SPGjXLg542X3EFLLwti6cfg
         pGd6EXIo88vo8+CpX00YmmycF1XElScAntM1hC0XaPnWLFcMhsMz4jcaoOvABts1AR+R
         fCn0Aum+sP5Z0iC4udsaSa59hPjfhwSUu35aodORV7Lony7NENfU/7yMALdCV6NSZnik
         +D8gpJkgvc6LuWtoabq16xUaSf1sZ6yETGGzifgxxC5ka6ZHtpQBy5c6sm09CmCcdsGX
         t/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WANyF2F/RgYw3X0PQ15siC75t9y7XEggYSa5zgiK7xs=;
        b=PNywUcSroTd4u1zVNTaJSAjdry1HA7bJO7Gzc32KmVZCQEtjy8SCkcOr43TQxiYADi
         eefNnjYKZsyfn4zlsIwAP9ZUD2Hsg1VBRvlcVB6M23G8gSL2b3fnOOmU6OxmiymxfDcP
         a/nK2OOxAqmh5ZaNRbNoEoD5tUM84667iicRpdJbArSENPq0cWm2xqCHDmlK6iAZ4wU8
         9QU5dZVLZoBuPQ1NVu83tEvMfNV31HysLm2YpvoBa9epQU87y76ymNFULK9MnajNFjzM
         mg8V0QYPAbivmRFfMUPliB5oSemaeZdNvboqcts71Cadw9WMNc+EM/lh2vFNwsr+pvo3
         Uopg==
X-Gm-Message-State: AFqh2koVuDepH90uJI+ETUgs76WxU2T39vmgwuTrh2zkXUWUkgKoVzyC
        I32QpLC11o9YnMHO/ISr087iTQ==
X-Google-Smtp-Source: AMrXdXt+Wg6xcTrkPiQyiXb8RxciTGBL7rIrHsRt08RnF1gyMk5qwxdnlQb1dkR86ClSBBpvc8FVQA==
X-Received: by 2002:a17:907:d007:b0:829:59d5:e661 with SMTP id va7-20020a170907d00700b0082959d5e661mr6164457ejc.29.1674029821376;
        Wed, 18 Jan 2023 00:17:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:01 -0800 (PST)
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
Subject: [PATCH 01/13] drm/bridge: lt9611: fix sleep mode setup
Date:   Wed, 18 Jan 2023 10:16:46 +0200
Message-Id: <20230118081658.2198520-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

