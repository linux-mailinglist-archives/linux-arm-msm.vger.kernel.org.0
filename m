Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8242B4E50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733159AbgKPRoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387674AbgKPRlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:47 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9877C0613D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:46 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p8so19673240wrx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nUt9W7GZWBzXYxZLOdkAJHN0947I5vPgihBPSlg9tj8=;
        b=p2MDgQX/wofftkkr1Hy4/72WZE0tdzpOt5FVLHl0WdVI391TYiA+wQE+3Qv15Wev+K
         1C/3yMtFQfGzVbXpJ+k2jQIDu07h2B2x+BqjRUY6JXv+1njqRBOd6GBuLP6+7M8AwHDB
         abfRtQE9KsXwu463fk4uX/pjlR0P72t8HyIiSMtE24bHGlVed/pW5LQ/7E6culC49Cas
         f4Lor5+/lgetHGYXYwq3C8HCnrJqkC1PH50HCucS4EHC/XpRkJzguHigLsLHACZjdL1F
         wPzQvak0EVel6EWTt8s1bgoVvaENbqFgSMduIVtNtiVmW1aSRdwBOU3YeatY5V1e9PJG
         LUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nUt9W7GZWBzXYxZLOdkAJHN0947I5vPgihBPSlg9tj8=;
        b=lxxKWWdij7upL26ABWlwzVtw2A26Ze5tHNJvJ8sL3ZdleT17v5REl9is4xF+N9k8bd
         F8xkdKlGPi8ZoQZfk9XpRNL7eeJWc2a32XUtnjWp4zaoapPwFcBCmEAmgzStpnkNOgw2
         gqKOFp8bgWgeCRU4x8Tp+GAJ41pwghV7ZAEewbKNLksMBto79euD+Ht5kYqu0kjNwDuL
         rKSeL1WttnHKoQLdTX4HhV7XYO+IhXJ2GAedZK4HvZ5Iflb/WkcBEAi3NIMHK3VCWYL0
         bQvHmIeJNAIVUlyRkzly2FTwLNP0+MYSl25PonvQkkIrSPndH0SxHszUzJ/Lcb0bnbsf
         D+eg==
X-Gm-Message-State: AOAM531HZbB/F63dZarf4u/MQ/FsSju2gilWlJWG9KcLayBN/d4qKPsW
        FplkYAA+VmfkbGw/z5GNuiIYdQ==
X-Google-Smtp-Source: ABdhPJwrJ3qM0N77lCgwewkn0o/4BJZQjYlEpD5Odpef/EinSGDz+FIBUabKsEPNOivdq3sEqD4lTg==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr19916658wrq.424.1605548505702;
        Mon, 16 Nov 2020 09:41:45 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:45 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 17/42] drm/msm/disp/mdp5/mdp5_ctl: Demote non-conformant kernel-doc headers
Date:   Mon, 16 Nov 2020 17:40:47 +0000
Message-Id: <20201116174112.1833368-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Very little attempt has been made to document these functions.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b7..b5c40f9773629 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -213,10 +213,10 @@ static void send_start_signal(struct mdp5_ctl *ctl)
 	spin_unlock_irqrestore(&ctl->hw_lock, flags);
 }
 
-/**
+/*
  * mdp5_ctl_set_encoder_state() - set the encoder state
  *
- * @enable: true, when encoder is ready for data streaming; false, otherwise.
+ * @enabled: true, when encoder is ready for data streaming; false, otherwise.
  *
  * Note:
  * This encoder state is needed to trigger START signal (data path kickoff).
@@ -507,7 +507,7 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
 	}
 }
 
-/**
+/*
  * mdp5_ctl_commit() - Register Flush
  *
  * The flush register is used to indicate several registers are all
-- 
2.25.1

