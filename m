Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FF96716DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjARJAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjARI6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:55 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818EC6E98
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:06 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id kt14so22384985ejc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+GwFGuHURa9u3Ijog1S5HZ1MuVt0LKqtxKhtevrnGE=;
        b=XXKEc0cdVABrKza8PldX1r7edCiQA5WbeuLkA/B9c9m7BaR/OZz1cu9SPRU0kHnKzv
         p9mh5rgYKh00QfVDDJVp37PjmoqxJYk5C5F71fF5sxwn5BduxoZ4cN9+WWcoC0rwkU/m
         Hmoy9VJ8sssmoME99WxmKtsi6aEQlBW3HvbjAPqW9JSbROOafu3ObpZ5stIY3n92t+ff
         PZ/2c/8aPJjxhdUBLyBY5gf0j2FzaNCz3YnTo+v8rYk6TrFb36hMkpPmSxB1riTpQjxL
         Kwo4pqvwN1UD4Dcm18t6ixonWr3gekmfHHOnWQBlPI4zAq+y7oKoC34WH/1jQyzXsv3m
         BxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+GwFGuHURa9u3Ijog1S5HZ1MuVt0LKqtxKhtevrnGE=;
        b=VWno7VNgmYhBiK9JmzhK6GjoKKNmFw7Q8Y/fAGns4oDQVqN/1R4LC/w0Qx7hZjciVm
         fxgAqo+ENr23AO/nwqFjN6ytD9n8JPQs895sxN6/GL1WDaB5V+sQxA2lrzF5s+9xjy+c
         i+GdmoriIdlUZHrv7FoI56DdGVSXADFFPby6bMyoK6nqvspgGjmSymP5OTegS8FE0O4X
         uGCr2Ke0D0RytFs6dm5Pm6lPQMzKrKMzpt456ygwhi8STB5WvKmPljGi1bnZkTMt6+gd
         9S3ccTIDXJ83wNmhp86aAo4mscn+S4ho96JQEdsyJ8O7YnZbugV55tBrSECEJQqIETBT
         BI5g==
X-Gm-Message-State: AFqh2kpOShJHLWeKYZC+9UpW7e90EWFnAzIIMZFnqNQXSO0mqStnbD5T
        FaMHLx6Gg0V4b8fP3tVSFNjKHA==
X-Google-Smtp-Source: AMrXdXtm2Fvr9sRQuv4VdZo5ULfq0W+0uB2MTEzG3Xm1YqV68IOxq+pDjWfJw5N/BIqqVuJMNXsLlw==
X-Received: by 2002:a17:906:e0c5:b0:86d:67ee:d607 with SMTP id gl5-20020a170906e0c500b0086d67eed607mr16081680ejb.64.1674029824691;
        Wed, 18 Jan 2023 00:17:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:04 -0800 (PST)
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
Subject: [PATCH 04/13] drm/bridge: lt9611: fix programming of video modes
Date:   Wed, 18 Jan 2023 10:16:49 +0200
Message-Id: <20230118081658.2198520-5-dmitry.baryshkov@linaro.org>
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

Program the upper part of the hfront_porch into the proper register.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index deb503ca956a..f377052a45a4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 
 	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
 
-	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
+	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
+						((hfront_porch / 256) << 4));
 	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
 }
 
-- 
2.39.0

