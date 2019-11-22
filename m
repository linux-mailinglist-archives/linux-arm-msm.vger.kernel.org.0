Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA032105E27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 02:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKVB05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 20:26:57 -0500
Received: from onstation.org ([52.200.56.107]:33714 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfKVB05 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 20:26:57 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 482153EE6F;
        Fri, 22 Nov 2019 01:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1574386016;
        bh=Kq+RNFpqhutChH3/+5/pT8eAUKeDkBlnAGwXIrYo9xI=;
        h=From:To:Cc:Subject:Date:From;
        b=RL09JusxKP7Q2NBDbvwmFjeJDGHFW1vkN8cZqS9rqhpxdQEmg8v8HesxPW00j66BV
         sS3yuBiW71E5aQ2H7bC/JjONlWFZD/JANow9HKUK8ETpVKrC3PqkDvI7cMXd4n2fA8
         FNB9N6NYZYQJkBT8RFVJ7+82hbn702AWaMIEo8fY=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] drm/msm/gpu: add support for ocmem interconnect
Date:   Thu, 21 Nov 2019 20:26:41 -0500
Message-Id: <20191122012645.7430-1-masneyb@onstation.org>
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

Changes since v1:
- Don't rename icc_path to gfx_mem_icc_path. Leave existing variable
  named as is and add comment to declaration in struct msm_gpu.

Brian Masney (4):
  dt-bindings: drm/msm/gpu: document second interconnect
  drm/msm/gpu: add support for ocmem interconnect path
  drm/msm/a3xx: set interconnect bandwidth vote
  drm/msm/a4xx: set interconnect bandwidth vote

 .../devicetree/bindings/display/msm/gpu.txt        |  6 +++++-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  8 ++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |  8 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h                      |  7 +++++++
 5 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.21.0

