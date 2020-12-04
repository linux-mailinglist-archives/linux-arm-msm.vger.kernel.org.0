Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4682CF4DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 20:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgLDTgZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 14:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgLDTgY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 14:36:24 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDBBC061A53
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 11:35:44 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id o7so3767990pjj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 11:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xIokUz/0OVF9KG6gBm+1eG1ys/IbCXUboIQpNSvv5NM=;
        b=equO24iQTqLTdvV7288zmDksfFX6JcjVKYoJr9Nky72wptFmzZ8Kb2wzGtP1fOujRn
         /o4mCZyYqLCna+CENya0y2C/NxKg27vQt/41XLQ50xrLH/zmUx3GYflCr/s1j7aXKkxf
         JFFDx9Y/+wNSK9vki5W7ZDbbGVb99w5Z10qtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIokUz/0OVF9KG6gBm+1eG1ys/IbCXUboIQpNSvv5NM=;
        b=pQpUX86i6VGRnc+/xZm7iKXM1N4epOeyD+JRkIJv3gh3Jump4+ZuA0KqSs6Pl7icBN
         MRVxMOdFMFJ4cKejCjhfCxaXhP7R+XiyqD1eIIjXryxlF2g5+eAaOXdDOP6kL7QbrUtO
         7080Lg/95q+SVtBEHVnA1aBk8Ztk72GIEU4kVwFcYoX1DDYfQwPuJd4Ww9d4mDzH3Sy4
         b3AYjUFGH4BgkH/Xt2lfk8r9vpceVlio6rZntXkAW2P3z/PIwxtSZnRBrSrN5GrRE/WY
         Egvti0W2bMRpOLlIXU2pqz9dZ3PT3QMBvIJqyW/5EpqDO/mW7s+Vh5G3hLT75t4S4sMM
         AmYg==
X-Gm-Message-State: AOAM531+gcOElGTOWAAaiEo1KIcLidPkDl+hULf6F9Ery1zXbMtveXUL
        f+ZfK/mst7LdHVMTuoeFzwUyUQ==
X-Google-Smtp-Source: ABdhPJzPajPzoNsIkmyEDPn/62aoVLG6vuuhIl7/F6eaFy7j8d/eu/NHkUMP9N9glp/CYLfh+ZlFdQ==
X-Received: by 2002:a17:902:ff03:b029:da:6fca:7422 with SMTP id f3-20020a170902ff03b02900da6fca7422mr5153919plj.13.1607110544242;
        Fri, 04 Dec 2020 11:35:44 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id g8sm4576548pgn.47.2020.12.04.11.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 11:35:43 -0800 (PST)
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
Subject: [PATCH 1/3] platform/chrome: cros_ec_spi: Don't overwrite spi::mode
Date:   Fri,  4 Dec 2020 11:35:38 -0800
Message-Id: <20201204193540.3047030-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201204193540.3047030-1-swboyd@chromium.org>
References: <20201204193540.3047030-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There isn't any need to overwrite the mode here in the driver with what
has been detected by the firmware, such as DT or ACPI. In fact, if we
use the SPI CS gpio descriptor feature we will overwrite the mode with
SPI_MODE_0 where it already contains SPI_MODE_0 and more importantly
SPI_CS_HIGH. Clearing the SPI_CS_HIGH bit causes the CS line to toggle
when the device is probed when it shouldn't change, confusing the driver
and making it fail to probe. Drop the assignment and let the spi core
take care of it.

Fixes: a17d94f0b6e1 ("mfd: Add ChromeOS EC SPI driver")
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
index dfa1f816a45f..f9df218fc2bb 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -742,7 +742,6 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	int err;
 
 	spi->bits_per_word = 8;
-	spi->mode = SPI_MODE_0;
 	spi->rt = true;
 	err = spi_setup(spi);
 	if (err < 0)
-- 
https://chromeos.dev

