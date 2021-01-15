Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A592F771E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 12:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbhAOLDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 06:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbhAOLDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 06:03:13 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C16DC061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 03:02:32 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id x20so12501106lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
        b=Q6OSfsKHIRau6OEp7U8C5Y+6jgIDFkbJL5vZk91Nuv0NpTmw5qQ5axByZ0pzivn+Si
         owKkBlxjCDFJSDxUZFD1Ehqk9+kxyKCa260yDW+BtNDdqS4QyCv0hAypajTGyz+UGXgH
         INO1yAMhbBbZ6ju1YmkaWYKJjix5mvZP6dTrZa/lro9WUF6ykREP9qqiOFZVPv9vOPT1
         N999vz7F0m/nUByMdKPhktsyjnCkqSnJr1hKKMJvSJCEgJgNXS7gJQMTlEPqOt3krd4y
         0aP7+OAYAsWeLdhAFW6Yoi+DM4Q7vZA/lb5hM2kkxB9+eEold3C44pOIVRXBc5tvoxng
         v7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
        b=sN2wX/BlHsjm/4qgolsuTV2EKyg3VGliDlZrssMiA0980C6nSNozBGdvjx5ecAXUVC
         Wr1js9crF7vCIle96vaVFqk0agByAc3EfJUfgGl6B0vkT6O8R4luuw37CUcywvIklKE7
         sgk3RiHeainLDidPLQY6f+6tEIcxfeJZGrDvdKkKa+e1fm9dRSgfEKfUV05lnbl/VLt3
         XEhHV24n17ylaR3KS7idQuntd017m0FqGLhmi2+9r0tz4KoDpFxqC1D/chbDhor2nJHL
         9nHBQ+sXzcHSNw/bEon/Ee4EKOgeeDeaJom5hsYEqxlCBLTNPYowa/Kpj9H4RNP4sRW2
         eE+w==
X-Gm-Message-State: AOAM532c7NiB7JScitpmRlGd/ezPYCXIcZq6gdAHd11UqQfcfeGDqImw
        odC4ZjD2xlQZEhlZ8jOtTrVELQ==
X-Google-Smtp-Source: ABdhPJxBug6UNOjEOx3RFIV60hE0chZMQa2BhXfTSNpiRFtgstHaPxI4KJqF8zn5ZRIsxUO9Suy7Aw==
X-Received: by 2002:a19:c711:: with SMTP id x17mr5344738lff.56.1610708551013;
        Fri, 15 Jan 2021 03:02:31 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
        by smtp.gmail.com with ESMTPSA id s8sm862020lfi.21.2021.01.15.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:02:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
Date:   Fri, 15 Jan 2021 14:02:23 +0300
Message-Id: <20210115110225.127075-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Call wake_up() when EDID ready event is received to wake
  wait_event_interruptible_timeout()

- Increase waiting timeout, reading EDID can take longer than 100ms, so
  let's be on a safe side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 0c98d27f84ac..a59e811f1705 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
 
 	lt9611uxc_unlock(lt9611uxc);
 
-	if (irq_status & BIT(0))
+	if (irq_status & BIT(0)) {
 		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
+		wake_up_all(&lt9611uxc->wq);
+	}
 
 	if (irq_status & BIT(1)) {
 		if (lt9611uxc->connector.dev)
@@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
 {
 	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
-			msecs_to_jiffies(100));
+			msecs_to_jiffies(500));
 }
 
 static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
-- 
2.29.2

