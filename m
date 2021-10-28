Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01A143E628
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 18:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhJ1Qg1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 12:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhJ1Qg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 12:36:26 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED63C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:33:59 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id o83so9084901oif.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nem2XTY5QU11TIb5tpm+rntM/cfQ1YaYLiw0IXoaZ+w=;
        b=Y3qFNcE15hVggRrMhiAeClG/Hnfm+SplZEeWKDF6zQdWbTj1BeHIubrS60YhBSk9FD
         6NshmXy756/SwcXKW7YKdIa1eKHzXYn7Sv0sCtio1Rc0MsZxsVULUDOTwj2Vue+T+FMI
         C0cChZdf1dEZGcbEFPab7NJ153OsC19SbmM88Xd5Zpe89W49OIEiFs4G8p3/Uui7TuXM
         e/F4QKlhelC1nXa0FSH5uWEaREI7Pg6Jhof/tmCZRqlp5X4XCAqpYVB8AiHqzG6LBzVu
         qhMe8xxNj6xIa1xQjFM3vadRTjG8vKWDaarULUoL6E1jbwVrc/sn9hdJGg0jBl/UKOaV
         e+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nem2XTY5QU11TIb5tpm+rntM/cfQ1YaYLiw0IXoaZ+w=;
        b=oNHJRTj1b/GGhczrsgVGYTUWtE7HWgXkB7zjgzTFNIbHav+/IeHI6kpm1MHqR8RraI
         G9ezn+1+GDfJnRPrN7KIxVYqZgVaz1oL3bGrqgpNfb+oiX3zKm82tqVqmK4OV8VtQx9+
         t072baTSvo949mz6GpavL4WZTiq7VgavkPl2GEUl2HEtOAAPYZk9Z4s0R9aBJO/0n5UN
         bET3osSObb9hJjo0qJEXzIejXu/Cg4mxgTZ1wKQYLCfu4CwTZmoNqcaB2fGV5pQ6FcmQ
         UpeptumZDs4dpGvPsuxVtjNdsgSGu67PU6dWE5VHpLfExP2lOLx6+ew1uqmZjyywq6Qj
         Y2rA==
X-Gm-Message-State: AOAM530YnBBwj3P6vgA9V4oI27wdSAgbaNn9Jp8cCXp+QTzVP1Tl05T+
        Vtu+O8bLM75VhuFSP5ecp0bUiw==
X-Google-Smtp-Source: ABdhPJwtlHeKphy+Nfalit6/5el3VVG+6AjCVfyW9NdfXB5zsE959C+I2Txn2mrMSl4H3Eauhv3f4Q==
X-Received: by 2002:a05:6808:1a0c:: with SMTP id bk12mr3929768oib.48.1635438838563;
        Thu, 28 Oct 2021 09:33:58 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x13sm1058721ooj.37.2021.10.28.09.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:33:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/bridge: sn65dsi86: ti_sn65dsi86_read_u16() __maybe_unused
Date:   Thu, 28 Oct 2021 09:35:48 -0700
Message-Id: <20211028163548.273736-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When built without CONFIG_PWM there are no references to
ti_sn65dsi86_read_u16(), avoid the W=1 build warning by marking the
function as __maybe_unused.

__maybe_unused is used insted of a #ifdef guard as it looks slighly
cleaner and it avoids issues if in the future other permutations of the
config options would use the function.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Robert, I believe you pushed out the driver patch introducing this issue
yesterday. Can you please add the relevant Fixes?

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 430067a3071c..e1f43b73155b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -215,8 +215,8 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
-				 unsigned int reg, u16 *val)
+static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
+						unsigned int reg, u16 *val)
 {
 	u8 buf[2];
 	int ret;
-- 
2.33.1

