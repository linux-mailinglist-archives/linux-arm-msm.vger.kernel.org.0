Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA102CF4E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 20:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgLDThK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 14:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730705AbgLDThJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 14:37:09 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB12C08C5F2
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 11:35:45 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id h7so4230771pjk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 11:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OLsx5vVuUCPRsEhZl6FaNYVhvrSnAx3P4TPwOM+YKjI=;
        b=EIj5KpgF9tseDgO+Vv6rRaCFuZLSRi9JZbJm4JZSurBPJ+8A2N9qHkTQ9q2eNsk8uo
         i2fm+pGhYslCHJoEqkv2Km4XZFq095EU+0QlmnLYOi5CDRXxecQ1WeHnFDX/Mb5MR2hS
         abrArIEdHM3VcxdsG8L3q/i8V8HFEGxMHWZO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLsx5vVuUCPRsEhZl6FaNYVhvrSnAx3P4TPwOM+YKjI=;
        b=WQeO9iip70zyGPBtdwv3yJ9MVsumHGE4qNNhOfqZOA1S9OhffngJroTtijtwj/L3UH
         aWcdRU1Ixhd4jUaNVSd6yYFYInJZnl/ETnEC3KNWGZm+dM/8DTMiBf9Hw1OVzf1j/gw9
         ssvgCdmYsd7u8gAqTh91hoHAoR0ioMfNweIaQAG5vUQjXjnyWkv+eTG84y6sxv7YqfSH
         /8FmyNfb+Yzhv2Cm81A55p05DJCnGhnmdW0yG3NukYsO1icnit6I+CpPzKb+97/vyIxg
         UsTVXvqkFI14KVA3Da75U+aLYGTfAIa0oUBggVaUZOq2FS9YtTiJCeRoDdEeNsvwpWKf
         5Z2w==
X-Gm-Message-State: AOAM533ifyN6tQYL2QGQMqxAju9IrcvIcOl2KKsRRcGXz8+pPFRH9UkP
        GTA9mmjHgRZAusIu6MCIz6/3VQ==
X-Google-Smtp-Source: ABdhPJyLxHobwqXis3U8gHN9sAqxP1e9stcIpd/P4vWXMjWVB05VxeGgscZGw83QTCfowLd+/lvpAQ==
X-Received: by 2002:a17:90b:2285:: with SMTP id kx5mr5596316pjb.104.1607110545594;
        Fri, 04 Dec 2020 11:35:45 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id g8sm4576548pgn.47.2020.12.04.11.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 11:35:45 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Benson Leung <bleung@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Simon Glass <sjg@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH 2/3] platform/chrome: cros_ec_spi: Drop bits_per_word assignment
Date:   Fri,  4 Dec 2020 11:35:39 -0800
Message-Id: <20201204193540.3047030-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201204193540.3047030-1-swboyd@chromium.org>
References: <20201204193540.3047030-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is already handed by default in spi_setup() if the bits_per_word is
0, so just drop it to shave off a line.

Cc: Simon Glass <sjg@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Alexandru M Stan <amstan@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index f9df218fc2bb..14c4046fa04d 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -741,7 +741,6 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	struct cros_ec_spi *ec_spi;
 	int err;
 
-	spi->bits_per_word = 8;
 	spi->rt = true;
 	err = spi_setup(spi);
 	if (err < 0)
-- 
https://chromeos.dev

