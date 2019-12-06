Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7CEF11598C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 00:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfLFXO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 18:14:58 -0500
Received: from mail-il1-f171.google.com ([209.85.166.171]:43525 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfLFXO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 18:14:57 -0500
Received: by mail-il1-f171.google.com with SMTP id u16so7677231ilg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 15:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OgzAFB+zH8GlVojyTVFAow6dMpgwdrzIFhrdEHUtvhg=;
        b=nsIITrocRHSetuaCgKu6s2C8xayl6Q5U5QuN0tQkjiMBXf/22zQ0Oy//9Xu9MWCty2
         yc8AMl720Dpjg2XaZaV2/kpE/sVz+RkudZ9qSIjdYAehIgapE3ky5KufYM8aE+sHzuW1
         uNagLcHcb+6YLBLMsg9FuwWL3Bvs3/dlCS+yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OgzAFB+zH8GlVojyTVFAow6dMpgwdrzIFhrdEHUtvhg=;
        b=nVIwlLTFWy/SrSc8nHMCSGsPVzSUIMQfJzT9a0CHPWTtMTSmfYwGgUVddYvy3wYil+
         N9miueXiWiWvks/fqI7WqCBGTkn+/LWHv8qfOeBavJAGCirVtepQjiAApDU3JXvmZUeU
         SVX13P7YshmWTzYCLeIKM0O8L+/XKNcD6ObC9VgIV0sO8/G7ahsXr9OInKb1w2JASyj2
         p7FQMr/3EOBu+3g0cKa8dDVD++oHL8u5QuQU5QASxzgGrXirsTjSpK6wuu0GSAczpAYr
         SYaxKf59WqzKGVentjjHcCcCeBLEQrpwC6dPJnfxWO1JxLx1pwWkKZv9jZlX2ez5gK/o
         M5Mg==
X-Gm-Message-State: APjAAAXARYqx0wGnc239vzqVhjrh/ur3SonZCVmzq6I4DylN76ousaEm
        wUddJGhwApMLDRiLhzWxTHnqhg==
X-Google-Smtp-Source: APXvYqwsQs11WhvacrvMTbUHKumnGg/DXD8ql0+dQvEU8SGQm6P6c+S8z35CBbHMIFitiO9F7uITRQ==
X-Received: by 2002:a92:cf52:: with SMTP id c18mr16802212ilr.44.1575674096396;
        Fri, 06 Dec 2019 15:14:56 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Dec 2019 15:14:56 -0800 (PST)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        Sean Paul <sean@poorly.run>, Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Dec 2019 16:13:44 -0700
Message-Id: <20191206161137.2.I3e20091f213b47dfa888bc2f528509d84d19c743@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_crtc_mixer.lm_ctl will never be NULL, so don't bother checking

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f197dce54576..b9ed8285ab39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -197,8 +197,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	DPU_DEBUG("%s\n", dpu_crtc->name);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
-		if (!mixer[i].hw_lm || !mixer[i].lm_ctl) {
-			DPU_ERROR("invalid lm or ctl assigned to mixer\n");
+		if (!mixer[i].hw_lm) {
+			DPU_ERROR("invalid lm assigned to mixer\n");
 			return;
 		}
 		mixer[i].mixer_op_mode = 0;
@@ -1115,8 +1115,6 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		m = &cstate->mixers[i];
 		if (!m->hw_lm)
 			seq_printf(s, "\tmixer[%d] has no lm\n", i);
-		else if (!m->lm_ctl)
-			seq_printf(s, "\tmixer[%d] has no ctl\n", i);
 		else
 			seq_printf(s, "\tmixer:%d ctl:%d width:%d height:%d\n",
 				m->hw_lm->idx - LM_0, m->lm_ctl->idx - CTL_0,
-- 
2.21.0

