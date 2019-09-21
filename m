Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F84B9D44
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405764AbfIUKEs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:04:48 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35660 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407270AbfIUKEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:04:48 -0400
Received: by mail-wr1-f66.google.com with SMTP id v8so9142009wrt.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TU10K6Skk15L/pvzqM4I92P+pNTDJ30jUP1jPCOCqPY=;
        b=XY0Cy9iBpFXG+7DlS/LSIOMpO+wtX7mf5/MYkaQM9RCICkrmtNVS1BwPbXjSz9yiGb
         PwN5Cg/toj1zWu4s0xw21sYWWxx4rqklv0Wt7hIy/RIYEcu/WS8sdZIm8cAlj7pYXhCP
         2zS5Vj7aCJDl9XHmXpRClUT/lysiDhC3P9g7ZISsoq4kZgEYme/i5N0YNJcM93Y5KnyV
         Chy3sOdfQEuw6hQ+hRJ6kAcEW+5IK3XizXkQ8QFecTEBh0FKFR49vmzrFQcx8EtWGDto
         U5C0yaSlP9FyGywimXCpsqwejPxddp8emVjiY2gTdBXLRC0u9pKAqkOpOhrvjB400f3h
         nErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TU10K6Skk15L/pvzqM4I92P+pNTDJ30jUP1jPCOCqPY=;
        b=X2y1uKjS4+UqEIB4enfEs8AQs1B6YhcJ5Z5Itjgtw+F5gAjg6tDEpVLoKa08tLIFXX
         Jf95SGJSHmR1WwpraqFe0CYg91ZddPqD/udXHLfJJxOQNLU1fSql524AMw44ijlV4BUo
         VglXVJLF5YxHVFnXAciEppV7QOCxSS1k1Uq0bFjfm/+3WWIH45H/lLDe3XSCaxGJtbdY
         HbGAIyZ5sOgHwRj0yo6UB0RGdYLzebWkWPJpB+MLldS2Jz9Drj7aM2UCcJj9Wd9gwYFS
         Vby2wQcPexNL9y+m3JUvz6gaHJWc52uh6MpGnLP1+5YZfdaEuM0mTdd3emDZjPH8riz5
         OYkQ==
X-Gm-Message-State: APjAAAW8RtpV5QbQ1iq3aswu54xHkpmiA/lBcHK00KoMrEobRyNMkXlR
        sF2svhL/V+FteMmImQynxnv+Yi9lZmg=
X-Google-Smtp-Source: APXvYqzNjrxbkngU7LFFU+dHNZwp1gDMTaPtjHFrjch0u5EbG+NCe6vOQXL5XIfiCN9G6kZiVS2bew==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr14466640wrv.327.1569060284345;
        Sat, 21 Sep 2019 03:04:44 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:04:43 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date:   Sat, 21 Sep 2019 12:04:35 +0200
Message-Id: <20190921100439.64402-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921100439.64402-1-kholk11@gmail.com>
References: <20190921100439.64402-1-kholk11@gmail.com>
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 10 ++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h |  2 ++
 2 files changed, 12 insertions(+)

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

