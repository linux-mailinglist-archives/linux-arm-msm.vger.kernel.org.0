Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892D821800F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 08:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgGHG7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 02:59:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgGHG7o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 02:59:44 -0400
Received: from localhost.localdomain (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36DCA2075B;
        Wed,  8 Jul 2020 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594191583;
        bh=XJuInuxOHD6Yk8crXfvZ8un1d/Cyt8V78YS8TieLKLc=;
        h=From:To:Cc:Subject:Date:From;
        b=g3Xwsem7Pst2P3nEtC/CFj0f40mHZwdIY6kqx26B9FwEev7lyTd28eQJ7W1sXsMnA
         16ocXKNteZYT3HtEFA2T6PvrhDFXHixTY6TBBodUDfxcobgxryq4o5Uo+E0KD+lvJU
         lLrmnNzTg7S0Y9Vu44EOdbsOXP0JuW8Ja0dlaYWg=
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
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 0/4] Add LT9611 DSI to HDMI bridge
Date:   Wed,  8 Jul 2020 12:29:20 +0530
Message-Id: <20200708065924.59257-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
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

Changes in v4:
 - Add msm/dsi patch to create connector and support DRM_BRIDGE_ATTACH_NO_CONNECTOR
 - Fix comments provided by Sam

Changes in v3:
 - fix kbuild reported error
 - rebase on v5.8-rc1

Changes in v2:
 - Add acks by Rob
 - Fix comments reported by Emil and rename the file to lontium-lt9611.c
 - Fix comments reported by Laurent on binding and driver
 - Add HDMI audio support

Vinod Koul (4):
  dt-bindings: vendor-prefixes: Add Lontium vendor prefix
  dt-bindings: display: bridge: Add documentation for LT9611
  drm/bridge: Introduce LT9611 DSI to HDMI bridge
  drm/msm/dsi: attach external bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR

 .../display/bridge/lontium,lt9611.yaml        |  176 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 drivers/gpu/drm/bridge/Kconfig                |   13 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c       | 1174 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.c                 |    7 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |   27 +-
 7 files changed, 1380 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c

-- 
2.26.2

