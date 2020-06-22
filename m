Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2A1203001
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 08:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731282AbgFVG6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 02:58:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgFVG6b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 02:58:31 -0400
Received: from localhost.localdomain (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3ADF325439;
        Mon, 22 Jun 2020 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592809110;
        bh=cJaK9Ij0LnW3uaf90F+DxG2K4hVeM1atFzhGIhfMpbw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d8QdwWm0SMOkokdDVPicskvy40K7ynMncLQaHXxFnQTMFTimJ01a1vQMX/PSZ/nO8
         jGkKLCigR4/9ZePJBXqxvd0G4tHPH4Mbkxak3bGmivigI2FCilVmdOIfQdAjKHo9UL
         vj+ZjHlaPIvWK8xVXL1q22/fztbcgByVRAs0Gxyg=
From:   Vinod Koul <vkoul@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] ALSA: compress: document the compress audio state machine
Date:   Mon, 22 Jun 2020 12:28:09 +0530
Message-Id: <20200622065811.221485-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622065811.221485-1-vkoul@kernel.org>
References: <20200622065811.221485-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So we had some discussions of the stream states, so I thought it is a
good idea to document the state transitions, so add it documentation

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../sound/designs/compress-offload.rst        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index ad4bfbdacc83..6f86db82298b 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -151,6 +151,58 @@ Modifications include:
 - Addition of encoding options when required (derived from OpenMAX IL)
 - Addition of rateControlSupported (missing in OpenMAX AL)
 
+State Machine
+=============
+
+The compressed audio stream state machine is described below ::
+
+                                        +----------+
+                                        |          |
+                                        |   OPEN   |
+                                        |          |
+                                        +----------+
+                                             |
+                                             |
+                                             | compr_set_params()
+                                             |
+                                             v
+         compr_free()                   +----------+
+  +-------------------------------------|          |
+  |                                     |   SETUP  |
+  |           +------------------------>|          |<---------------------------------+
+  |           | compr_drain_notify()    +----------+                                  |
+  |           |                              |                                        |
+  |           |                              |                                        |
+  |           |                              | compr_write()                          |
+  |           |                              |                                        |
+  |           |                              v                                        |
+  |           |                         +----------+                                  |
+  |           |                         |          |                                  |
+  |           |                         |  PREPARE |                                  |
+  |           |                         |          |                                  |
+  |           |                         +----------+                                  |
+  |           |                              |                                        |
+  |           |                              |                                        |
+  |           |                              | compr_start()                          |
+  |           |                              |                                        |
+  |           |                              v                                        |
+  |     +----------+                    +----------+  compr_pause()  +----------+     |
+  |     |          |    compr_drain()   |          |---------------->|          |     |
+  |     |  DRAIN   |<-------------------|  RUNNING |                 |  PAUSE   |     |
+  |     |          |                    |          |<----------------|          |     |
+  |     +----------+                    +----------+  compr_resume() +----------+     |
+  |           |                           |      |                                    |
+  |           |                           |      |                                    |
+  |           |                           |      |                                    |
+  |           |                           |      |          compr_stop()              |
+  |           |                           |      +------------------------------------+
+  |           |       +----------+        |
+  |           |       |          |        |
+  +-----------+------>|          |<-------+
+     compr_free()     |   FREE   |  compr_free()
+                      |          |
+                      +----------+
+
 
 Gapless Playback
 ================
-- 
2.26.2

