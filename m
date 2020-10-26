Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C770D299738
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 20:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgJZTlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 15:41:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:43566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgJZTlv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 15:41:51 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F41420872;
        Mon, 26 Oct 2020 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603741310;
        bh=VLNSpeq9/avcjh10RAUxOl5HJD/C0lqcUgYnxzCFedA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zyNLVnR7Y8LoSfkbNY4gd0K6VlfbjAqqlUi23Qqy54f0We4dvdQQaDOWeKtz58zM8
         CLzuQZP29aOtQ3guUZGXXt3mow91qds3KkcX2iLMoTOuqSRpnpr2nGnTvaJayU6kdY
         FPSrxYCzurbCzYzjTX2Mfcfe/E8p5aIf2H5tzQzI=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/msm: fix -Woverride-init warning
Date:   Mon, 26 Oct 2020 20:41:03 +0100
Message-Id: <20201026194110.3817470-3-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201026194110.3817470-1-arnd@kernel.org>
References: <20201026194110.3817470-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

There is one harmless duplicate initialization that causes a warning
with 'make W=1':

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: warning: initialized field overwritten [-Woverride-init]
  122 |  .max_linewidth = 4096,
      |                   ^~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: note: (near initialization for 'sm8250_dpu_caps.max_linewidth')

Remove one of the two identical initializers to avoid the warning.

Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 60b304b72b7c..9c23f814ccaf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,7 +111,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.max_linewidth = 4096,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
-- 
2.27.0

