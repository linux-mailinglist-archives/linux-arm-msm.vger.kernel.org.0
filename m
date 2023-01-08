Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 135B86613E3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjAHH0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbjAHH0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:02 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095191D0FD
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:26:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so8293179lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
        b=a5UnEk763WqmfWKkoxukj6ks8ILK+Wpcvx1HEn5Y5xMKa8mtkSAPhJwX0PbNlnZS3p
         0eThhpm1S4Hg9c+WafdX3t9IyxVYTv0PD/wcxooHRW3EMWCgjwukRleH40EJDLdZ8gpX
         Em01O4MvGb71W3wC+S2tdrNKh5PFKcBsk3xugy4nDAnqCz/dmAcJ0KB64cQMDq4P2PQM
         1zDAMCwH0OAbKFgPzlV9Xjs3fPYQo7RUh2RDx2oF3Sc+iIH7QuFtUTzFChxTXo01Edvc
         p9vVIaeQ7VQSeAlu6w1rUofZL5vplKum89+mp8bgU/rGBnP9KxV0Ob0FSz/RgOMHSCPp
         tW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
        b=ja/8Hd/TTrN4VN6+vh2/IizhRikVJkruT7zl/CEimQGj6Cl1XJNKM7QJ+++dgRksAm
         rGMl+yGSxel0mCQ7iFv0AQEUGaqdqr5xiJs/dxS94dNIj1dZVd6nXLN5kzA8/WRfvGKl
         1tHxHJJo+no9106IL/Lx66M94i+eWu1qCI1+iPoRGCPX6T1CMOJtjoOtO2khX5qw9sD6
         5IRzEIH3VGHBaxr6dDNTD7RA9eXXBhtL3T2tbWQ3T6SsR1MVawxiynAhyqVnE9zdEYtX
         HgNtB/e5JaFaxVZm29EcuWQL9ML7ZyQtWR5n8the58NNOsQ93Vks0fpzATkoqCoUU+rU
         hVZw==
X-Gm-Message-State: AFqh2kpefdHTA5ntLh6bwWc3hsjN0As7ySaVbcjWe9bzWFFBrWuFe/iB
        UGAeIP4risobBUR7xYj+UJgcQA==
X-Google-Smtp-Source: AMrXdXtl2+m/ydzyCQ68iNyzxRo+U3AzUoukAvOI2dgDY+wV5ZcNHzLmyTpCbJ/FvgDcFL3rJOi69Q==
X-Received: by 2002:a05:6512:1111:b0:4cc:7e0e:8d5c with SMTP id l17-20020a056512111100b004cc7e0e8d5cmr403922lfg.37.1673162759416;
        Sat, 07 Jan 2023 23:25:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:25:59 -0800 (PST)
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
Subject: [PATCH 04/12] drm/bridge: lt9611: fix programming of video modes
Date:   Sun,  8 Jan 2023 09:25:47 +0200
Message-Id: <20230108072555.2905260-5-dmitry.baryshkov@linaro.org>
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

Program the upper part of the hfront_porch into the proper register.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
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

