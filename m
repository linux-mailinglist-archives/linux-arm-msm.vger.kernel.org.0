Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6581D0F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 12:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732579AbgEMKGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 06:06:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:40874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732551AbgEMKF7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 06:05:59 -0400
Received: from localhost.localdomain (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0045F20575;
        Wed, 13 May 2020 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589364359;
        bh=WjRy4bGb2XBE4e+1YGSH0DDmJTpK19nx1tzKdrx5qeQ=;
        h=From:To:Cc:Subject:Date:From;
        b=xJ51Bv2swDWPGJNoHbrEJBLashQwC/Xq44TcCpIoBvgmvk+w/yhWKGLTIXXpWuwQW
         m2rhP13GblVTwezQLIRo4n+13HW669cQaegtfkBSq3CX7DQP1CtM9Ug7DSqG9wA5vP
         RLiGzalHteJJIN0xsTBcoVDLLgfRdecFoh5XDehw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Add LT9611 DSI to HDMI bridge
Date:   Wed, 13 May 2020 15:35:30 +0530
Message-Id: <20200513100533.42996-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series adds driver and bindings for Lontium LT9611 bridge chip which
takes MIPI DSI as input and HDMI as output.

This chip can be found in 96boards RB3 platform [1] commonly called DB845c.

[1]: https://www.96boards.org/product/rb3-platform/

Vinod Koul (3):
  dt-bindings: vendor-prefixes: Add Lontium vendor prefix
  dt-bindings: display: bridge: Add documentation for LT9611
  drm/bridge: Introduce LT9611 DSI to HDMI bridge

 .../display/bridge/lontium,lt9611.yaml        |  178 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 drivers/gpu/drm/bridge/Kconfig                |   13 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/lt9611.c               | 1113 +++++++++++++++++
 5 files changed, 1307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
 create mode 100644 drivers/gpu/drm/bridge/lt9611.c

-- 
2.25.4

