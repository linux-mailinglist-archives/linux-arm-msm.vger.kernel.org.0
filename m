Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB6D1256FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 23:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbfLRWgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 17:36:01 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40157 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfLRWgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 17:36:01 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so2021765pgt.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 14:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bs+0Z3ZAq0GUCLQ+n50Ot+tqfKigg1gtSIr+d12Ntvk=;
        b=OZ/SeBNzOTFV3iidD+L+EgqMHqkaR4aikrerDs76ymG1SN7nhEpyOC+UFiuamQUjd9
         ZD6SI1x5UKTrlQf2/09RPG1BGfMDxmxEPOhAcd7nfVhLEiBlV9oh1FI2bQ68S9BVPFlH
         m6nFcGb2TR8Wubr07fHZ0mnErVPI/Mjx5sEms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bs+0Z3ZAq0GUCLQ+n50Ot+tqfKigg1gtSIr+d12Ntvk=;
        b=ZabrdGtJ7MAic96iwnZ72j5ZzLARlGkayQ7P3AGYGGquUlYBSfkRvNi1cg+Kdqjpmp
         HbGM70tPPEoKn4fIgF+HLBi6Xa0i3BBBSzoWfdj5bxPMfPsgFDwLSmkSbrOk/cMZHY28
         bjd7l1imLsU2gYKUHdmhma93XxcQLzko0JmUi33zfPXvcFdAwu3PlSGTuIfFqd94t02a
         85nE9BYneJR+KELpWyvKoSB0KB4+FF3krod5fvNdypgGQMYdFQSkW/8oZKcgjdZrl0Qi
         Qi8iM5AbnxC3I5li/XmyVKc1XuQFcAVmdQkSt1u7qSVkw7fYJXQPyZ6A3zBS0RrBjKXQ
         5m9Q==
X-Gm-Message-State: APjAAAUx7Vnd0Ma6E/SpqPnUlza68tom1RJfKcn21yl/vzF97SKSa2+d
        d/4MK3HLdCPI4lmfkI4IO8hJKA==
X-Google-Smtp-Source: APXvYqxHbtd+gTe6cUJkLw0xl7+3zIZbnWasbDkDhnj6z7TE+24OJXXlyEG+S4g65cIiX359hal6dA==
X-Received: by 2002:a62:5290:: with SMTP id g138mr5847412pfb.54.1576708560228;
        Wed, 18 Dec 2019 14:36:00 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 14:35:59 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, seanpaul@chromium.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 2/9] drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
Date:   Wed, 18 Dec 2019 14:35:23 -0800
Message-Id: <20191218143416.v3.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
References: <20191218223530.253106-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
start at index 0 which always contains the value 0.  0 is not a valid
link rate.

This change should have no real effect but is a small cleanup.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2fb9370a76e6..7b596af265e4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
-	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
+	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-- 
2.24.1.735.g03f4e72817-goog

