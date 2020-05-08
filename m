Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39C41CBB49
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 01:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgEHXdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 19:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727934AbgEHXdx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 19:33:53 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1EBC061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 16:33:52 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so1765633pfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aH8P4+Ei6pqqMKSRAGY6lrlBj9MTJLPAq1y54tH7x5M=;
        b=c2jrSafQfRhEZd9jTfLKbDy93UfmN/2t2IeoD8u5JqRk43Wn2SFjno2k+3fw8Ww7ha
         m/86nRlyZIcjbgT65I6GDky8MnlZk9UJacJo9vtbWrY6C2A8oO28CkrUfd8wSgbGF8ot
         w3YXATiZu/A7UtV8gDeP4jKT01vaiwWb7Walg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aH8P4+Ei6pqqMKSRAGY6lrlBj9MTJLPAq1y54tH7x5M=;
        b=DZXF5LNfcMNBTxP/+OeUcoDTpRUnjm/z47t9Wvyg+ho1EgTpyhT3Z+EWyNaS7Qp8LC
         66PAXbeF6lBOtCf1GdEKQ6gDeCFGufnhKcmZYAIcGbkgy9MAAKTO/J6AAh2Lpkso/vPU
         5KvtmVDNRxc9FK3kU+IXVhPB/yunuLUElVb+ZgfFMezJtSs5EmuGhOe6LuKMRx814V8M
         TCLaV8dcPYxTkKtlIplCvHTCr+RNStsonF4qFiW1IQ4IJm1EJ+grOyI5jacWiQV6HOl/
         wBGiHrBaGi7EQF5nwrC58m9kbIAuNSksxOfjFxgAlqgPBZXDD3TsvCx8z1MzVo/SKmNN
         5ZyA==
X-Gm-Message-State: AGi0PuZv5vbh5Q77YHif7ZM22PLoVn+9HAW89Y8a+fgy/t54kysTF5Nh
        TYIdfLWocQoS77SeJFXLcLy4fw==
X-Google-Smtp-Source: APiQypJvhMuGbXg+gBKnMJeVTmbSCsAWmHD2jkpOVJl3TZQ859+Dq6ODnzjWWTM/O3Ntaprp3YQ5hw==
X-Received: by 2002:a63:575f:: with SMTP id h31mr3707439pgm.200.1588980831399;
        Fri, 08 May 2020 16:33:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p66sm2713991pfb.65.2020.05.08.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 16:33:50 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sandeep Panda <spanda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Clear old error bits before AUX transfers
Date:   Fri,  8 May 2020 16:33:29 -0700
Message-Id: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AUX channel transfer error bits in the status register are latched
and need to be cleared.  Clear them before doing our transfer so we
don't see old bits and get confused.

Without this patch having a single failure would mean that all future
transfers would look like they failed.

Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6ad688b320ae..d865cc2565bc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -827,6 +827,12 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 				     buf[i]);
 	}
 
+	/* Clear old status bits before start so we don't get confused */
+	regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
+		     AUX_IRQ_STATUS_NAT_I2C_FAIL |
+		     AUX_IRQ_STATUS_AUX_RPLY_TOUT |
+		     AUX_IRQ_STATUS_AUX_SHORT);
+
 	regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
 
 	ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
-- 
2.26.2.645.ge9eca65c58-goog

