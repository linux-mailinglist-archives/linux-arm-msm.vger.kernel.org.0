Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E89BA5EEB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 23:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfGCVnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 17:43:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42293 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfGCVnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 17:43:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so1905239plb.9;
        Wed, 03 Jul 2019 14:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bC+NSmuLWEsv6oPx3XnIf+0FW2175TmLMl+WAygDkKU=;
        b=JPU5nLksJvt0fUeU3xq3KmutnplMnOxOQRJMgALyn2JDTEs5VeXoR+TfYHByBEcnwO
         zRU4F8bccZJ5ugFn4+d3zDBIXx2rwZU/8FrH8RnjCv/gcc8Em1b4q5WhSWqWtRQdWFC4
         BHDKHrHUr2XtytxOWj12mL54u8hMaSKtbKkac0KmwXRmvKTy8Y9V5mu7X42Rj7j0MHjZ
         Pvdq8uQ0I3QwczWfCZyvW1t1OIHsiax8Ej/J96sk7N4iq4gY6pUxq3a6FHF+rJr9apzL
         UdQjtwm5iUPR6chrAFY7V9VGJr0kiFjr5KEDgrlxH1+90wswDHf0/LMzlOQe6Rslqsbx
         qK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bC+NSmuLWEsv6oPx3XnIf+0FW2175TmLMl+WAygDkKU=;
        b=Hci5HrFipacW0J/M0CqeG59gfato+U4ZEL2j4xJ1QPWy6PDT4RpKQ6t5FEqc+6zJtE
         ZnOw665JWMxacdigNRplGq0p9L/Ck+d47it5RbwjUgkYe+hsq/8TNirbx4z2FZ5QIn1B
         biMVtKX3jF+sHbSWPFwp48WOQQXcbCnO6Q1svqt+n5wb2XFkQe/N2P16y5ElkM5CckSY
         7NIv5d5FIweZSMgFPibS13FIvD4BFqv+rj1M0M319AE4EFypRR9wEbSuOvB7rWfstuME
         0XUthdmTG1I631aylyWBWh8VrQSbE30vLMRcycT+aTGyDjZya3uzsmhqnyH3KTs+ajf4
         olug==
X-Gm-Message-State: APjAAAXRLDKlDohzN6z2j5jnao9iyS1qy1XYYRFzay+h3IFi/bGaGA7n
        HUuQvS4whyqWykq+vF9Y5Dk=
X-Google-Smtp-Source: APXvYqxupxMQrDq3Zqb7a37DqR6TG00xKI9iD9hNoRiw/XNAJDgi2Ws6jxpFETlLyzILp7T0P7jCkg==
X-Received: by 2002:a17:902:bcc4:: with SMTP id o4mr44071677pls.90.1562190210539;
        Wed, 03 Jul 2019 14:43:30 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b24sm3234095pfd.98.2019.07.03.14.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 14:43:30 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     broonie@kernel.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, bjorn.andersson@linaro.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/2] ti-sn65dsi86 DSI configuration support
Date:   Wed,  3 Jul 2019 14:43:26 -0700
Message-Id: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ti-sn65dsi86 bridge on the Lenovo Miix 630 does not appear to be
wired to an I2C bus - there is no indication from the FW which bus to
use and scanning all of the busses does not result in an unknown device
being discovered.

As a result, we must utilize the ability of the ti-sn65dsi86 to be
configured "inband" via the DSI connection.  Since the driver already
utilizes regmap (over I2C), adding the ability of the driver to
configure via DSI is rather minimal effort once we have established a
regmap over DSI handle.

However, regmap currently doesn't support the MIPI DSI bus, so add that
option first.

Jeffrey Hugo (2):
  regmap: Add DSI bus support
  drm/bridge: ti-sn65dsi86: Add support to be a DSI device

 drivers/base/regmap/Kconfig           |   6 +-
 drivers/base/regmap/Makefile          |   1 +
 drivers/base/regmap/regmap-dsi.c      |  62 ++++++++++
 drivers/gpu/drm/bridge/Kconfig        |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 160 +++++++++++++++++++-------
 include/linux/regmap.h                |  37 ++++++
 6 files changed, 222 insertions(+), 45 deletions(-)
 create mode 100644 drivers/base/regmap/regmap-dsi.c

-- 
2.17.1

