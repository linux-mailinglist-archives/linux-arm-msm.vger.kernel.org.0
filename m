Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 008EEFF939
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 12:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfKQLsk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Nov 2019 06:48:40 -0500
Received: from onstation.org ([52.200.56.107]:38672 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbfKQLsk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Nov 2019 06:48:40 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B2A693E8F6;
        Sun, 17 Nov 2019 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573991319;
        bh=GmSQbPGsqt7hQkZ5e0T4S/NK61H3Et1C5o5BqmHyzFg=;
        h=From:To:Cc:Subject:Date:From;
        b=pVvBpIOewqOttuCPEHkzNsvb1fhuSPjKR91EyXeog8JkXFeNOG+uP+rsBUg/Phrbd
         zxZaWJtngOdtEpTR6psBmMEoXWhVKtIRywYC3wGskhFcNeiwyavZuN3uaBRVCuSz2f
         4co11X/FuDoqPWznKf0fLCAx8w6qUwepClRaiEC0=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH 0/4] drm/msm/gpu: add support for ocmem interconnect
Date:   Sun, 17 Nov 2019 06:48:21 -0500
Message-Id: <20191117114825.13541-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
and must use the On Chip MEMory (OCMEM) in order to be functional.
There's a separate interconnect path that needs to be setup to OCMEM.
This patch series adds support for that path, and sets the votes for the
two interconnect paths to the highest speed for a3xx and a4xx-based
platforms.

Brian Masney (4):
  dt-bindings: drm/msm/gpu: document second interconnect
  drm/msm/gpu: add support for ocmem interconnect path
  drm/msm/a3xx: set interconnect bandwidth vote
  drm/msm/a4xx: set interconnect bandwidth vote

 .../devicetree/bindings/display/msm/gpu.txt   |  6 +++++-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  8 ++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  8 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  6 +++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 20 +++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.h                 |  3 ++-
 6 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.21.0

