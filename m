Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89806439D20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 19:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhJYRMO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 13:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235077AbhJYRLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 13:11:31 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED1FC061224
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:07:49 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id o26-20020a4abe9a000000b002b74bffdef0so3875940oop.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OM0cPou9Yt3Ud6BL/XL+O772DGApdgc8zaM9N+mI1Aw=;
        b=wOW1uKfv35wx7ay7/EXrWat8asMllLTqON55vq3ZRfnefbC0dX0T04jeONk1+64HQ8
         OpoYU4vPno1TA9Im73pv9x4M5t5+TlKcL1Twiq4ECRybUTGK53HiERnZNhfLKPD1p5q9
         QPCtp8XLnNAw3SrwNEGMD8sDaaHbbHgY6WunmZ0koO62vWJWioGpvSLSYAE6YFMCd3h2
         3ceambUzY2wWVI0oFRPU0LZZInMMDRO1D6Qkg84P05d9mjdN6ysdKBhpmUM38FSeRV2/
         jTEZqHLwI8OVk75KL3jCHWIoBPBs19mCDiOM74eSf/ggu+IdgALuBNl4kTet5fmx0IXL
         C29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OM0cPou9Yt3Ud6BL/XL+O772DGApdgc8zaM9N+mI1Aw=;
        b=gS9Nykv3qbY1UjsRNjEYdicbsf7G7r/LtvasG0r8En085Z5Ael4VrM1SB5+fQ/n4p3
         Hmt+0HKZUd1S2R8Ue+0q920zx5EwuVmsRrv6sCfnuSBglOVvO4OisfubCMtOOgseVkce
         Z6P+RWEI+quLchNZoMNraEJJY/AFD87YVyBFRl6fNXt89d0MjbtK5zaUslo7SHhfZUjC
         hDvyxiU/Ec1qIY5Vb8jm6etmORu73bMJthkIjnoORagKSYKWQsqipEUPaCvJcAJY5Y4C
         gMa53rmRJAt29rd94579jTk629SWVwpkijwVO1EIaF90RUBmvOD5miayN6am9mLZVAcb
         A5Eg==
X-Gm-Message-State: AOAM532lMrvvLp2xqV3ehdvf72X5AWA5PmQs+GJt9BGIyORWU7vZhHcN
        oT8wNLvdsFeqCTQ7BdiZpE2ijA==
X-Google-Smtp-Source: ABdhPJy7TkF/lMJfJ1Xivrb4nJ+9n0smvlbKluTV6cZf/ycixxWBxfTRT11LZ5PCfDcNtqDv1ltx8A==
X-Received: by 2002:a4a:e9f0:: with SMTP id w16mr13239349ooc.3.1635181668593;
        Mon, 25 Oct 2021 10:07:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id q2sm3076003ooe.12.2021.10.25.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 10:07:48 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 2/3] drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
Date:   Mon, 25 Oct 2021 10:09:24 -0700
Message-Id: <20211025170925.3096444-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211025170925.3096444-1-bjorn.andersson@linaro.org>
References: <20211025170925.3096444-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The multi-register u16 write operation can use regmap_bulk_write()
instead of two separate regmap_write() calls.

It's uncertain if this has any effect on the actual updates of the
underlying registers, but this at least gives the hardware the
opportunity and saves us one transation on the bus.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6154bed0af5b..5b59d8dd3acd 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -193,8 +193,9 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
-	regmap_write(pdata->regmap, reg, val & 0xFF);
-	regmap_write(pdata->regmap, reg + 1, val >> 8);
+	u8 buf[2] = { val & 0xff, val >> 8 };
+
+	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
-- 
2.29.2

