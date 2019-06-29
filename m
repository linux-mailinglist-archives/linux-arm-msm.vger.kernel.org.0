Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773CD5AB2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 15:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfF2NBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 09:01:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36656 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfF2NBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 09:01:55 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so5787556lfc.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2019 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbpuIcCBG2OY5e1NmpBE7wz6kAerHOIPdrXSJOYlBOk=;
        b=efVnvG6gsnh3l0XcsGPL7A1HnlxKgumwKIBMGtiqOMwHhdusEpWZaOWf+MqEF7BL5W
         WqbtG12LDpX6unXqMqDWTdVfM4zRrQmh4gqLzTx89lJEYR79woEb8W89uVlvW7MlFHEL
         Zp08PLKv6Na6vEgUdeNTUl5SJw8p7T4ZPUq94KcIME4V87xJpVQbKIHwoCK6jGRKWDu3
         Ngbb1bNlSk8+QAUVLVkhjTR0J8X3cz7gs99b/MC0wyJ4D28Wm9EDPnT2vEzHjH3XqEc/
         mhWNLYEUuhbeHtzFK/maFVDyz7mEP4hs1UZ+jfHb6VE7oiGbwu1a/LhUoF08NL8U/zFo
         qWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbpuIcCBG2OY5e1NmpBE7wz6kAerHOIPdrXSJOYlBOk=;
        b=V5utg/8rqKXKQxLeQ9NCKLYXIq/AsWzsh90MFyXLktCgEWCOGymIIvS44Zbpovydmf
         Xvx3A79Q3Pb1QMRB7Fj0iuFZ79gqswxMB3T8Q7rPTFOV/VfG7C+nw1duNTlNLVo2FHlG
         WMK36ePTXsrPAdWuX+1UBLdmDnoUyAJeL8pW7oHtHSKW3H6HxKltoxqHSp6EvOy3e7rB
         kWgsZldTOJQPdrmZx0yWIjITE/66Wr4onbGVsxXFkZMPGqKCe2HxFs+S1yAbHEJ7XjoE
         HVAYtuI4REcQBOHy+bkjGQ0QouYzis65qpUEKV3+TrCevwGV4lFzE3RjKXgs4Hgm5bDP
         gh5w==
X-Gm-Message-State: APjAAAU1aUWtMURsKyk27wmeX9OtU37ysuR05baSTMHXZXZGR4jUnopR
        BrKaACox0Pmwdk/LZel5lFM5eA==
X-Google-Smtp-Source: APXvYqwOS0pDKXe1RTOO0fPQa8iQngPginDmqxsbSy4gahwb7Y9qnEGHUp2+11mR/5U04XqewQh3gw==
X-Received: by 2002:ac2:5636:: with SMTP id b22mr4172787lff.2.1561813313145;
        Sat, 29 Jun 2019 06:01:53 -0700 (PDT)
Received: from localhost.localdomain (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 06:01:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
Date:   Sat, 29 Jun 2019 14:59:27 +0200
Message-Id: <20190629125933.679-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This file is not using any symbols from <linux/gpio.h> so just
drop this include.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 5368e621999c..753579914d0c 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -16,8 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/gpio.h>
-
 #include "mdp4_kms.h"
 
 struct mdp4_lvds_connector {
-- 
2.20.1

