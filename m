Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C6AEADB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfJaKoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:12 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42862 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfJaKoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id a15so5654747wrf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
        b=Vjx22jOAuDKUp3zgblNS0LdjjxujAQl2/ARRTmo3LQXhidPT+z4nMCPRKb9iB5OIy9
         /J06LIS3zoauIwJFHBCbiMZTTZf7acrneJGWnbQdYW+9aUeQn1WuF1wEWLc4UZ5i4iL6
         Q0zNMmKLsRf8jiYBEuvTreX5bvOkET1U4wNrRnaQwdAytLNO3tqU2dlu5YxNWB+q5u7U
         ZAIe8m7ZiurX0sRNlIlytDWwCX16dKjHfAiKw0ERAvEzp/bnAk7h5mIl0KnLJHaapeKJ
         YrXJwQsCeHVMTkb3YGb2xMAgCKrdQKP/WvqKkwfbTHjdZdeURR+oTeliwuCaIiKv2yYV
         jFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
        b=F0knklzkLQtOCnASrGbI5QcLCB8Nflrm1/GCXDM91OMHp1oFWk3GM2WUXgwNWqr3vQ
         0Z5AQl6qim8Xe/ptdOTIGfz/V8GYs4aC4lqafW2N4Gm+2Uk4idw2mjcc333UE00othCj
         efBJ6hTQ0kk4jFEgc60vTcILbZcFt/PzSuOLMKUyNYFZ6OBIKotuAfwySe4J8IjU/StU
         d+geTebEFpIR+jkhdD7LmOlAIJMLksk7h3N8o6nLjlNeyquAvG7OBvGu4ANerpDykdu7
         Ft6IKdLQs0AeqGaxGeGAXZmmXSUfuTqh3esCYd+VnyZ/smxzMTPEjic8T1pKXWnPpIaL
         3++A==
X-Gm-Message-State: APjAAAWwiL6He6RQkht2BSHlsl55UneY16yHgFzLOxVmSA+MWyBcF9QV
        1HoX0Ielh1U9L13ik/j0FCA/nD/uwTY=
X-Google-Smtp-Source: APXvYqxH8oTHqLA63a1Uj/b4VAZDUACC4QbsyC80mYG0ahfDrOcSQv4/iYny9FdB+G3gt3lS0nfK0Q==
X-Received: by 2002:adf:d850:: with SMTP id k16mr5042506wrl.204.1572518649714;
        Thu, 31 Oct 2019 03:44:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:09 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 1/7] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date:   Thu, 31 Oct 2019 11:43:56 +0100
Message-Id: <20191031104402.31813-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some SoCs, like MSM8956/8976 (and APQ variants), do feature these
clocks and we need to enable them in order to get both of the
hw (mdp5/rot) Translation Buffer Units (TBUs) to properly work.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 10 ++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5476892a335f..e43ecd4be10a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -309,6 +309,10 @@ int mdp5_disable(struct mdp5_kms *mdp5_kms)
 	mdp5_kms->enable_count--;
 	WARN_ON(mdp5_kms->enable_count < 0);
 
+	if (mdp5_kms->tbu_rt_clk)
+		clk_disable_unprepare(mdp5_kms->tbu_rt_clk);
+	if (mdp5_kms->tbu_clk)
+		clk_disable_unprepare(mdp5_kms->tbu_clk);
 	clk_disable_unprepare(mdp5_kms->ahb_clk);
 	clk_disable_unprepare(mdp5_kms->axi_clk);
 	clk_disable_unprepare(mdp5_kms->core_clk);
@@ -329,6 +333,10 @@ int mdp5_enable(struct mdp5_kms *mdp5_kms)
 	clk_prepare_enable(mdp5_kms->core_clk);
 	if (mdp5_kms->lut_clk)
 		clk_prepare_enable(mdp5_kms->lut_clk);
+	if (mdp5_kms->tbu_clk)
+		clk_prepare_enable(mdp5_kms->tbu_clk);
+	if (mdp5_kms->tbu_rt_clk)
+		clk_prepare_enable(mdp5_kms->tbu_rt_clk);
 
 	return 0;
 }
@@ -965,6 +973,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
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

