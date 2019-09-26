Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5A3BF06D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 12:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfIZKxY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 06:53:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38530 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfIZKxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 06:53:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id w12so1493831wro.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CKKmk9TqN2/1MoLYTAYc8amHX7J752W+bLMGWqOdUCw=;
        b=LUQtQYPNhY0Y8JsBeVR/RZ5ikxtFjF/YrS5ERMIfpbwxuVZzRIe6O4x7pjW3OKQj1W
         E3IbmiY6tQp7089/ieoUmEFWCYKq1NnnyfSk0Rcx3WRoDmX/Xl0FyuHmyZW8kELgU272
         hN7rV3gbNhWI1ziIzLJeWO1yZlZOJTQ+ykEbGpLaEtsJBn/9oVCBX7OttgXYQOWaCvE0
         YsxmLX1xJLpDQQJJIM/LXprkcgfhgZyK8T7IzbkrucMCGxtTyBAv7rsJRj8QqP1Ojck0
         tr8diW3pAcCGkYRE40P5g6uQsjoWdHancAJDQ69r+hXdTwXK7xbzngwthFkRPZ4le6kg
         BTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CKKmk9TqN2/1MoLYTAYc8amHX7J752W+bLMGWqOdUCw=;
        b=Arg6eRkv1c47PyWI06ogb/W/8gxtkeId7pCLz9m0S3uqQHLFrSVl2SuVtb++QhYdR6
         uo/hHBhxp0B7IDf2nKn+knAyeLtMNRvflluXUcBKk1JPQWLHQ1Erghbjy+qASCvhOBHW
         VdwUMx5edFgy90sC8NCPLFZQ0y6YQ4pv0vTgL1G7IDPyO3KG/QWI5JqUku3kg61FXBOP
         SQMNzXecF/11AJ+eyyMqG3DTNeMJWeJiqwOh4gHVbVDA5tVUjDLr565Z2UwOL9K7TPxv
         jFArXu8VA1TUw+FBBypFE9wdDn4nVCgyFwd7HDP6Ib8nQ/gIJhJuFZWSC73LXYEp06pd
         wNIg==
X-Gm-Message-State: APjAAAUXeROUNU5XAPdH48M2F0R21oUv9lpMuWRGygUjdmx5pXncl1i2
        BQRkb2yElovoE0PwV3DkVzINlCkrBHU=
X-Google-Smtp-Source: APXvYqwy1oWChQ9Uund4z/W26hcuQXiVLnJhbwhH4d3zXGNVZ8qQK40Iek3tF9TqYcoRsvv/WiAF8A==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr2439959wrr.390.1569495201303;
        Thu, 26 Sep 2019 03:53:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 03:53:20 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date:   Thu, 26 Sep 2019 12:52:52 +0200
Message-Id: <20190926105256.61412-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Some SoCs, like MSM8956/8976 (and APQ variants), do feature these
clocks and we need to enable them in order to get the hardware to
properly work.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/mdp5.txt |  2 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c               | 10 ++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h               |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 4e11338548aa..43d11279c925 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -76,6 +76,8 @@ Required properties:
 Optional properties:
 - clock-names: the following clocks are optional:
   * "lut"
+  * "tbu"
+  * "tbu_rt"
 
 Example:
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index fec6ef1ae3b9..23be9b95dd7e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -293,6 +293,10 @@ int mdp5_disable(struct mdp5_kms *mdp5_kms)
 	mdp5_kms->enable_count--;
 	WARN_ON(mdp5_kms->enable_count < 0);
 
+	if (mdp5_kms->tbu_rt_clk)
+		clk_disable_unprepare(mdp5_kms->tbu_rt_clk);
+	if (mdp5_kms->tbu_clk)
+		clk_disable_unprepare(mdp5_kms->tbu_clk);
 	clk_disable_unprepare(mdp5_kms->ahb_clk);
 	clk_disable_unprepare(mdp5_kms->axi_clk);
 	clk_disable_unprepare(mdp5_kms->core_clk);
@@ -313,6 +317,10 @@ int mdp5_enable(struct mdp5_kms *mdp5_kms)
 	clk_prepare_enable(mdp5_kms->core_clk);
 	if (mdp5_kms->lut_clk)
 		clk_prepare_enable(mdp5_kms->lut_clk);
+	if (mdp5_kms->tbu_clk)
+		clk_prepare_enable(mdp5_kms->tbu_clk);
+	if (mdp5_kms->tbu_rt_clk)
+		clk_prepare_enable(mdp5_kms->tbu_rt_clk);
 
 	return 0;
 }
@@ -948,6 +956,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 	/* optional clocks: */
 	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
+	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
+	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
 
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index d1bf4fdfc815..128866742593 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -53,6 +53,8 @@ struct mdp5_kms {
 	struct clk *ahb_clk;
 	struct clk *core_clk;
 	struct clk *lut_clk;
+	struct clk *tbu_clk;
+	struct clk *tbu_rt_clk;
 	struct clk *vsync_clk;
 
 	/*
-- 
2.21.0

