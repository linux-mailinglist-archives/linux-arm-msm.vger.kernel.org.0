Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA95297522
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752761AbgJWQui (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752266AbgJWQug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2172FC0613CE;
        Fri, 23 Oct 2020 09:50:36 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w21so1783664pfc.7;
        Fri, 23 Oct 2020 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KFzgRAweXzmn2MO9Ofz0hLeT7MUlIlm2XMWMHmibkzc=;
        b=jjTEZX/wTYdDD5lHNJL27W2xxKiFRbgTn9CZuGMxqBNE7aO6w+V5K1v5f/d5sc171m
         sZrosNh78sEixsH6tiGfDKMAddRKkWo2GvMDPqQVQd0G8yW56h+s/ilB0LdoDQErSi6I
         rwlGJIyIBK6hHlWpVj1wDpchhLUgP3IUBFI8ZGmQEqj+uLAdi02T7JPuO0rfuMQADbVi
         uhvQAcSztekRlvJ9tgRRtEsURgoONqDBknwcqD1cVa+UjPgCZNUgwb8YH+lhJ24pVDI3
         9gam584zcrWq/gxASWZrj97X0xvOH7n080Pf+yvfqG7zQoXC65NG4Ymf1jPH/aojr9iI
         2atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFzgRAweXzmn2MO9Ofz0hLeT7MUlIlm2XMWMHmibkzc=;
        b=X1dZ/Uj934JI60n5MlMkMr1NX+6f8W249cQkE1yGkQUbh9tuQ1Xef2QgLng5F3YnNC
         mTTeu6n8Bqhh+XSiM1CNs7NDAHQWOykSKUe1W9fX+adHSCJCSL7n7q5CQ/y8UZYnsD3b
         tJ5NPjT7LL+KfJ2KWOoJr39rqi0IzrRJDkOZgiTuUObWV38rZxvkyXVh+fzaoMIQuhVq
         JNbIoM5ZlmMu3WjctBHvHY913pFTinu2xX4zn4zRVCX/j6lE9Sq8BlomfZzzMH2Xezcf
         yASftiuqLj2Fsl7ORJi2CQsMwbW9OQDIVB7yF9GazGxqP3hWPvvVq++KQfTPeIx9p+5n
         /xjw==
X-Gm-Message-State: AOAM530jwWqNo7xUNNXvO2HUWNRzdgSWM2Qs//F7Htt1tTHBHLa2QOJx
        byJhXDk9w2V8tQouERmR90I=
X-Google-Smtp-Source: ABdhPJzFi3q0p9NxlvgnrXQCVcgYMewNZQIFbAEtQamzsp6p/YysaoGKemc8fdiLDn/MO8AmDlMZSA==
X-Received: by 2002:a17:90a:c48:: with SMTP id u8mr3502279pje.121.1603471835689;
        Fri, 23 Oct 2020 09:50:35 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z3sm2372338pgl.73.2020.10.23.09.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:34 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 11/23] drm/msm: Drop chatty trace
Date:   Fri, 23 Oct 2020 09:51:12 -0700
Message-Id: <20201023165136.561680-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is somewhat redundant with the gpu tracepoints, and anyways not too
useful to justify spamming the log when debug traces are enabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 015f6b884e2e..ed6645aa0ae5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -545,7 +545,6 @@ static void recover_worker(struct work_struct *work)
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
-	DBG("%s", gpu->name);
 	mod_timer(&gpu->hangcheck_timer,
 			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
 }
-- 
2.26.2

