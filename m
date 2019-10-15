Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85BB7D72D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730140AbfJOKLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:11:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53948 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730047AbfJOKLE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:11:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so20177778wmd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
        b=eyWWTg+jLxtt84nZoM5D4rcr+PH8MheESX0TLZRqE997hzCQdhz8dLvGO1VIIvIR7k
         MYDiERgsu9eEtbsu+2xlQ0ddekGD3+1i2qdFjDIg+NsDWJj0Ov3CWAJMGIZiEBdqhVt8
         vDFRVm7pRnp85QftR8jftnJWImEweu+8K8Fca9lRFVtjugbvev3io6jZz1Bk/6Sv58oG
         pMVLkwOShw0uczWIyZmjNOdasg+kdkbz+NQbdzlQdG2eEnPvhRrQuZMg/v4/I4baEQBy
         BLrFyqJJ0ICw4XY+aAA57VJcDR3u1u9h4ywlyUqRs9pV8tixLkUnuAYH0QIh9WgdQmbq
         XGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
        b=TAgghSyMvjK7/FRUo2uTCspyHu8CvdicelEyNWzjskOpkE5e/JE0LcXwKvQm2mlkaY
         N7dNfUBrn742OwCNyirCvr/gKYOp5z5npU/6H6HMBC6cRIJogg4PjFTBhpS+keXUyRJP
         TNN6h36mxWUJCPuzSV/Xbh0pVTcWSYkHa9x/+qKxmE7+jXQWWeI92JpPy7zwT+ywP29p
         OmAY3YQmgjhEyLi5jaJMaMtbhcq6elDC+QNIVzchGHbeEvOuVp3PF6PXMSW67VGbaTP9
         x7GX6pjw4ZnQiDxIW+I9XNJ2AgeXahX+HIfonqat0zaqsOtTcnDu3z9Na2Rfma45IFlw
         cB7A==
X-Gm-Message-State: APjAAAU0dTcK5lq1BGu6+AsC6SLDuxakEcPENmAxECUTRWbLFSmv27GD
        QA8FcdE4KTa6aO0f4Vv1P3qfJccNN+HjiA==
X-Google-Smtp-Source: APXvYqwaRv8ZYQC8dAYjJc6iVKtoY8zuWRF0nJk+OnWTd2Ku/I5N1E6aLiEh9IxXvvzNWM2HsNdcGw==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr19955698wmi.175.1571134262527;
        Tue, 15 Oct 2019 03:11:02 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:11:02 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date:   Tue, 15 Oct 2019 12:10:52 +0200
Message-Id: <20191015101058.37157-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
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

