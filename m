Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DECFC6716E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjARJBU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjARI7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:59:13 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F064EEC72
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:11 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hw16so69429502ejc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsYZ9kXBxRXYjdXYi3EuO6RFywLtz/JTmCkAqTyPm7Y=;
        b=pp94AYLoiIe3LR89Xf3QFr/6KwLzz8Tvs9MfgPUhO/l7EO6698cyrC14LjA0NP4ZVN
         NoNF6lsapl69djMz4p0mQ8vNt1RS9vgJwwYdh/WXqKbyFCWjrL/caBaDn94ygON779bW
         jDGvW7JkSiXh2HOUcvyyuPy5D3RpVBws5uCxohwwZx6C3EXfUdYkb/NpAbtPsCuW2FxP
         od267J+kfKsydgGttf1Ye/uU635s7Jgn7NQvcR4rEnDFjJcpBdy6zMhcIUlBJd13/aBg
         KjFfBYW+MFgCdD6cTgObqvIrc4tv5thcXtbYd9hNiQbvBHA4pkU47SV+u8gZdMNn2g0G
         JAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsYZ9kXBxRXYjdXYi3EuO6RFywLtz/JTmCkAqTyPm7Y=;
        b=i/wh1tcq0uXER0VsnE3fjbb3ieid1/i6R89uWuHR8XVBxb/zzFZ7SRKO54ovyCwjA5
         ZQrb50HZAdaJLIr0PD02wEjf9GsHP0xcNR4MvIwdhQAMEBaFMV0ZfY2rX/T0lbGcwV50
         yXUIfeSLyFJYDPOgOjAMlLZ5juwaVC7PdWXlTuERtlhdsS3/nRwMnJJSe74QMdOiH7BM
         7ZkMuPn5e6RCa89dVljTyQqQGCP+oLHyWtHB24s2CdJTFZzDkYL3DZZyrQvaqFSkzyN6
         nllkXPA3IIgRVifeWmWyVaUFITZplkO0B/RKy/jDiR2LoR9r30CDTrKDd6WHFjnWSsG1
         SwFg==
X-Gm-Message-State: AFqh2kpFMvHVmyPWxmb7V8KQviEJs5owzKY7B6m2G0KWs9Yn5RTFBfaz
        PbDeYWdSsB4ef4CmnkASCypRTw==
X-Google-Smtp-Source: AMrXdXvO0vgpkZfSv7xRXpy2KH+wUnsYErZHHrJugp/D35qPYzZLO1n2OVSH7ETmfP9hWN7ehqSOJg==
X-Received: by 2002:a17:906:8e0a:b0:7c1:1444:da41 with SMTP id rx10-20020a1709068e0a00b007c11444da41mr21736585ejc.40.1674029830067;
        Wed, 18 Jan 2023 00:17:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:09 -0800 (PST)
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
Subject: [PATCH 09/13] drm/bridge: lt9611: fix sync polarity for DVI output
Date:   Wed, 18 Jan 2023 10:16:54 +0200
Message-Id: <20230118081658.2198520-10-dmitry.baryshkov@linaro.org>
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

Attaching DVI sink to the lt9611 requires different setup. Fix the
register write to make the DVI displays sync onto the correct sync
pulse.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 773d7a56f86f..7f9be74acf0d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -352,13 +352,16 @@ static int lt9611_video_check(struct lt9611 *lt9611)
 	return temp;
 }
 
-static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611)
+static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
 {
 	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
 	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
 	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
 
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	if (is_hdmi)
+		regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	else
+		regmap_write(lt9611->regmap, 0x82d6, 0x0c);
 	regmap_write(lt9611->regmap, 0x82d7, 0x04);
 }
 
@@ -719,7 +722,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	lt9611_mipi_input_analog(lt9611);
-	lt9611_hdmi_tx_digital(lt9611);
+	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
 	lt9611_hdmi_tx_phy(lt9611);
 
 	msleep(500);
-- 
2.39.0

