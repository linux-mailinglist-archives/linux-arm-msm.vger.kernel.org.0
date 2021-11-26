Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84D145E3BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 01:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243510AbhKZAhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 19:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239373AbhKZAfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 19:35:42 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCADC06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 16:32:30 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id k23so15490914lje.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 16:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9zxxPurAOayOI5k8xCP1c5Dwmp5PuzCyvgFFBlIyeu8=;
        b=B75/NmrMNxEa1jk+XqTYqmWFQwGwSRzSYogVYVlas6FZgcwF4ZmcgmMS581RJFUKdf
         PuNfI3MVlc5HeL+JiNRVuwHAxhHS/JVisWGKMNKKesZn5EWv9U73cdZRtmOZU4MFTvQo
         CG4EmkLn5Rl4n2Ce+xFBibNAYmNywCGTUfJEHcvNfVtqg0JN3mCiP5gxXOqDwxmkfyFf
         nrg4GCfesAiwVcEvuvqpD/jOskmaa0D/j177ZIiEXrEj5GwyXdyMKxKdU6GI/BUzcsu4
         YWapH7nmcs4uhfLzG1Q+sbz2zD3Gffach5QwV0sziXBU7JueFZHx79Tr9rtc/eYBfU3j
         olGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9zxxPurAOayOI5k8xCP1c5Dwmp5PuzCyvgFFBlIyeu8=;
        b=ODb3XAa6KcPoBiTzr01lXAZXOv0R+yy6GLaxPmsHkUOTmf86IKzwz06sKvcympt72x
         mHRisxcSyLT5YxqgMz2S13vrAaolJlDfjMHFT3hLYy/Mwa1YClZ4fvv2lsB5vMv8u21/
         AI6QXIIldkb+OTNE/raDfa8/sVU3ZkfLU/GHy9KerQqR8PzYZbx/HgY2tlBlcy0CMfNZ
         GnJFdIApJR/ltTVL505PlS7Koxdioki+Zp1DpUcxw9yYKcYR2FiT+sVhK6AkL7TXS7kR
         zgI1hmBqIKX9n/4dO30/R5Up81Ejy9iwl2WcwljCczRiu7aiS0oHIHwH2Hpdp1jGjSkv
         cuKQ==
X-Gm-Message-State: AOAM531BIbtSe/K7llY/23RMYh2aZeVjvEsIeAYIGW1a1xuLts3yagxp
        KtMBrqjK/EPdqlm/pbdf8r4I1g==
X-Google-Smtp-Source: ABdhPJwtgkGmQFw8MHypVgwxcPXSz6OPwevU2ZFCZ5PdXKjzvDST7ym6kYJ7dKWaImbzOFWxheVuBg==
X-Received: by 2002:a2e:984f:: with SMTP id e15mr27903691ljj.427.1637886748722;
        Thu, 25 Nov 2021 16:32:28 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k13sm417812lfo.300.2021.11.25.16.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 16:32:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] drm/ bridge: tc358762: drop connector field
Date:   Fri, 26 Nov 2021 03:32:27 +0300
Message-Id: <20211126003227.1031347-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org>
References: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The tc358762.connector field is unused. Remove it to save space.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index ebdf771a1e49..930e19dfb329 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -61,7 +61,6 @@
 struct tc358762 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_connector connector;
 	struct regulator *regulator;
 	struct drm_bridge *panel_bridge;
 	bool enabled;
-- 
2.33.0

