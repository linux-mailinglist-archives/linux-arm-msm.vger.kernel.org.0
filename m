Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE6B2A22B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 02:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgKBBOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Nov 2020 20:14:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbgKBBOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Nov 2020 20:14:47 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6DCC061A04
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2020 17:14:47 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 126so15269044lfi.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2020 17:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mno6GH0dNld71X5m0YCHAC9Hb37IcAE5U+Ta7p4K68=;
        b=Z5AtIMt8nf7ET9vk5e2ATDfF69nqpcIn5Cz/PkjktGh8TcUwd9+G+miJeM39bA8s4e
         AWlwrsYuGzJx2OR9VBgyW2JVF676YPN1KRzW76fLG7GL/rHYJpPVz6Mpy5Zr6cld+Hlu
         WRcsAPP7BJ4Bbycpyjp6gmV8yYlBWInWnHkdJAce4CXBolTK+ohjojplgTXqKpYK9L2f
         IqMsjRWTlcC6z9x8TTNMIq39IVNl2Z9TJHwTzQGDndWJKMIab7DK7hZKepxgY3pfbcYA
         EqbIFtt8pVwFz9e4y3nIhqRdDsQwWqoygfEvH5nbw4HvMeqyxwd0kKp9TkuNZwpg5/6X
         evUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mno6GH0dNld71X5m0YCHAC9Hb37IcAE5U+Ta7p4K68=;
        b=EyTF9JAOkR/FWZUikYqSjBsi5bGlVzHwQpw1XJYFdDq6yErlVOzb7csLcaYuLmT3v9
         4y/HTgxY9Tuz1XgeJC1zET3flxRQJrSHkLbqNU7yxHwl5ebZyI9aJtHgQKVFzWOlEn7o
         voZywaDMdrq6wyYtsgry2jJil3QpgAcUfNilwvYMzqouQpRoV/oSXUyqTbdDIx1Myk2D
         +kGbhlq2s2JhPHHNh/x6LXSPCGjQqLU2fIswQtCOnSDniQf20zFXw192OMO2gTs+mD0Z
         cPieAuLtIgW2npatMd/9GcibgwBn4lYuKNqy6uZ5gJCC0M5xRmCgJCZY4hHAqqsjrVU7
         EiLg==
X-Gm-Message-State: AOAM533Cwm89AiJmuN5Kuw7B3YfwzQNBpIjNbLREDfRgE0eJ89PAkm5m
        M0SFUndIwjVNr3MjsX+X8rbfcw==
X-Google-Smtp-Source: ABdhPJwW2mT43fXLAstEQ7drTCZzffmbmU8MvWFdc803HNRdCPevfodmjCz1rQXoPqUohdM7pz4R4w==
X-Received: by 2002:a19:2c5:: with SMTP id 188mr4485378lfc.342.1604279684940;
        Sun, 01 Nov 2020 17:14:44 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
        by smtp.gmail.com with ESMTPSA id 127sm2101004ljf.118.2020.11.01.17.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 17:14:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/2] Add LT9611UXC DSI to HDMI bridge support
Date:   Mon,  2 Nov 2020 04:14:33 +0300
Message-Id: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series adds support for Lontium LT9611UXC bridge chip which takes
MIPI DSI as input and provides HDMI signal as output.

The chip can be found in Qualcomm RB5 platform [1], [2].

[1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
[2] https://www.thundercomm.com/app_en/product/1590131656070623

Changes since v3:
 - Support for firmware upgrades
 - Simplified modes table to include only used fields (w, h, refresh)
 - Added more entries to display modes table, as more modes are
   supported by the firmware
 - Wait for EDID to be available from the hardware before reading it
 - Do not store EDID in the interim buffer, lowering the size of
   per-device struct

Changes since v2:
 - Squashed connector support into main patch
 - Added comment on modes table
 - Dropped display timings support, covered by EDID
 - Dropped sleep mode support
 - Dropped hpd_status reading from ISR handler
 - Added "sentinel" comments to empty table entries

Changes since v1:
 - Fix whitespaces/indentation
 - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR


