Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F7A31D822
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 12:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbhBQLXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 06:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbhBQLXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 06:23:25 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FB6C061788
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:21:58 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ly28so1531613ejb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omqwj2z9F9rHihQvE5my1Bq8ugVfe2upOvjFAe2eO3E=;
        b=PR0KEci9qQWvX9WzciFum4T0xEyOsvEV0Fx5Sv6kNHpsewGcEa2NKwtcrQxYofHcCD
         LlTF9mBqxd91x99aGmdO31XQS/Iwee1smGVu58aLoJwSwWkyCjBQS9Oc1QHshr25vOZi
         rMXHqFgHfr8KZWVF6QIp23Z0KxsDG8f/E/JDYGyHlUy2+562VoF7+DBubc8jP1CQQla9
         MIoYAOJjUW7LJymEBCxTIoTmm93mg17GfIcsEyMETWdTHai5efya5SZc2fLqB0Dg64oE
         ynR+J/Id/f5MxWAtqb8idNLvYTrwMWDpTikG62bhKqgdxxHVlf3DjZK2BWkpBsXjBTJ8
         G4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omqwj2z9F9rHihQvE5my1Bq8ugVfe2upOvjFAe2eO3E=;
        b=UOzA+lDr0YqSsI2pAhX/iK+UzOlI62uPnQYJRsGH7mIxlQioypxCaIFIZN41L1HJV3
         FJ7SlZKP/suMzbI9jkYvXSSuHACkGq/mHIsWXFtlyX6/un9FbermLI9PZve5KSEaJPQU
         gkOdOrDY+ndZqgPk0pSvc8F5TmTor4sPgM6yAeGRaz8TU+GD4KQiiPZ82Z/ZGsrC/VcG
         lDFULBXJ3ieHfWJsAEpCq1a4L4UlnaZG53E+R+i42KZqzWHkYpArM0gI4cYb8MwB5LIK
         jcBHR9V95IZGUghQtFLB8WwkPvW0YJ2cEjkL69/1ijrkIP6YqkRf1NamBF/1nBiXqdMt
         2Svg==
X-Gm-Message-State: AOAM531m/cEwSFmijI/cXJCdktBCNdn5vpdyZkFZIyqbx92s8rp6I0WZ
        TiGQTqttpefx49ENF6eg8lNIgA==
X-Google-Smtp-Source: ABdhPJwl3jym2riwEu11r18s3NBE6YvhfUxpO17ig+7cymakJzze5qEuVJ7q0GMS2/yBEeW0/b1KNw==
X-Received: by 2002:a17:906:240c:: with SMTP id z12mr5269389eja.314.1613560917564;
        Wed, 17 Feb 2021 03:21:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:21:57 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Wed, 17 Feb 2021 12:21:01 +0100
Message-Id: <20210217112122.424236-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Function name is comment is wrong, and was changed to be
the same as the actual function name.

The comment was changed to kerneldoc format.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1
 - Bjorn: Fix function doc name & use kerneldoc format


 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..94c9ca7d5cbb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_isr_wm_done - Process composite image done interrupt
+/**
+ * vfe_isr_comp_done() - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-- 
2.27.0

