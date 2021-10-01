Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B5241F0D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 17:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354836AbhJAPOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 11:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbhJAPOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 11:14:16 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233BEC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 08:12:32 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id b16so9231704qtt.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7fgZd2r8WX3nKl+4VS4Ec2yUI3VXeazcd0O5WKokovQ=;
        b=Ekw0wHpPNXyuEdGuFqPgHxA+kv8/51N+Hne5e14flbbeeBVgPtyQ5ICjeWqPU7m/3R
         YiMD0iMg/yGhycVVZXZo+RKXBGV5UqWofCIemkgfFs20/sHbMYoz0dWeEFBAfbMGoqHI
         mQxiAocei0Kgsm7KUhPCBuuO6EFIul2dA3cLp5OvSLzbU2xDEniDZrAt6goykoR4sWRx
         XBY+QbqrGbzDEorkqhtVmCu1az9XydNLH2q5j7HFp5GnaC2F/Qipuj6SZ+ZWvWdYRHS7
         q/HpofbA0enfIjbK3P4Yz8KgGauYQAt9Y8BuXIpsN/UU2KdRFwkrpN3kLdn1/hGUkhem
         IxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fgZd2r8WX3nKl+4VS4Ec2yUI3VXeazcd0O5WKokovQ=;
        b=c/goLmnJ0SDWufe/b5oecyT2XC7MSv+T7MaB0PVOn5WpanzL54xt9hMge6zQPJBuEK
         E1pqzZS368F9QrTq48KZ/QHvQncPsgu2xpdBLRykADatWvqLoQP/V0F7JTPksCgC51si
         hkUfPRm7iXKG8J0DUQRqwkmw2X5F9Qx6cyqEfeDTN7yP+j4E8rA6oQKYEcIenhc2bM/L
         HGBPqqVgGdbh7TOvrnuxAayJfthVC4rO8VZWbqMlcHDs5LcGgKpgjt+LMqwEDKVSucLJ
         c2D9uvfviKBXvZkOhUIE3qLuB5pHmiX/uv1zAo6z0KrmGzsspuYlU/fQivrokPEKbBO0
         fK2w==
X-Gm-Message-State: AOAM532REobZusx7Ai8x/XND9a8Q+BS+ss05muIZy7J7/zt/oi9hKuCP
        LI2X2cq6jYUoArRBwi9vE1vAIQ==
X-Google-Smtp-Source: ABdhPJyDjQ5FYKaPKnVDjVzBRzMABzlSQfXttT77TbUqnzNAFsztEu110UbVqc/iHRF3E+sn35XjGg==
X-Received: by 2002:a05:622a:590:: with SMTP id c16mr13364628qtb.120.1633101150695;
        Fri, 01 Oct 2021 08:12:30 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id i11sm2877064qki.28.2021.10.01.08.12.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 08:12:30 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 09/14] drm/msm/dpu: Remove useless checks in dpu_encoder
Date:   Fri,  1 Oct 2021 11:11:38 -0400
Message-Id: <20211001151145.55916-10-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

A couple more useless checks to remove in dpu_encoder.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-10-sean@poorly.run #v2

Changes in v2:
-None
Changes in v3:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..984f8a59cb73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1153,10 +1153,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -1203,14 +1199,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	int i = 0;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	} else if (!drm_enc->dev) {
-		DPU_ERROR("invalid dev\n");
-		return;
-	}
-
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

