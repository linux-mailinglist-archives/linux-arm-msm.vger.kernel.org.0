Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9F66616E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbjAHQ5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233213AbjAHQ5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:01 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0228F10BE
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:00 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d30so4620883lfv.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
        b=P9dqkZZfHOIrHOTu0QxjNN5J0k/OqwxrnUDvwRdcdF/erP0JK2wzbixjkCGmcn8AmP
         CxTtz7XvXAHP1NZ2aTtfEhBhTKh4jO/WFzht4gw5vbgTiivyjH5nZYW+XDSykIgoNfC9
         1n6uEb7M/WOgAKBqodZb9Y5Ozwy1Dr6hKuaOkf8FdUNhtHW4lg500zrJYeEpMzKiJgPm
         zyz+vTfWDUIptKZyD9Ps6REXcCzOSau25MqKEBMU8o0saEyA0v5gKpq2dOOVFlUpBdOp
         r9SmnN0By/RWCTOUFjwhQywtH1zgb9Ha3WEUh38MPzN0a/icfRdSpq7S5xfXCvnRdXxg
         ZmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
        b=w+JMdGxnr4YbG2ZDoz68tJSXaLU/xssRstWSgNkIJUCGfNiOmx6ykH7iU4H0c91Tuo
         43BdwF3WZ6AzOpSGCPFi+Crkm2qgAlbxqxrI+49fUPh2XLMUPjWo6I8hdahpW4P/PS+d
         l91QsDSmMti5W3tUMlExf8SnmBfijpVctcpsDGqsMcVLI9OkCcCDCpsWQQnkdGfD5UkG
         ToJFhRm40oG0ki1U16HzyxoDC+2XWBg2BR+RoXIIOrKwEMPdyHRxRVw6btWCUTqiKemh
         DddalQ1V325eeL1GplAZ3iZTUOBykH1hi54oDE/QezdZ66QbMjo2CUkOloH1ATDr+5Pf
         v0Yw==
X-Gm-Message-State: AFqh2kopTZrgrlAGjFc0SvfxmUqI340Zw0YZjT8dO06IkjUMDic1j4hU
        YHyIqPJB5GIKnhdTCXd+ANg5hQ==
X-Google-Smtp-Source: AMrXdXsSRYg+KJGElLjXPWCsXo8ii+CcZrDyeAXlnwyYhDZJuGqnEvGXDw/1RjhMYPVSdS2EH1jOmQ==
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2ef3:fd2b with SMTP id y12-20020a0565123f0c00b004b52ef3fd2bmr20160912lfa.18.1673197018396;
        Sun, 08 Jan 2023 08:56:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:56:58 -0800 (PST)
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
Subject: [PATCH v2 01/13] drm/bridge: lt9611: fix sleep mode setup
Date:   Sun,  8 Jan 2023 18:56:44 +0200
Message-Id: <20230108165656.136871-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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

