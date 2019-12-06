Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A14311599B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 00:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfLFXO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 18:14:58 -0500
Received: from mail-il1-f171.google.com ([209.85.166.171]:43526 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfLFXO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 18:14:57 -0500
Received: by mail-il1-f171.google.com with SMTP id u16so7677247ilg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 15:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nb5X/YG7EhxVVMb4rPYE5JMk9umoZgG5Z8q8yvwSs2M=;
        b=NuMpicKsb6T6BeUCy+TlL4PJnkcDqAUqaRI0E66NpQifyU90z1WQQyECfu2NVtv0jA
         0bdI49nIuuwI4aiB/lszsIyNXya/559wjjVjvlvZZTdoQI097EexNyicnvZFeMHeIkho
         MUjJv2HRu6cwQ32HoRuTJf/Fo6/aKrxETWbAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nb5X/YG7EhxVVMb4rPYE5JMk9umoZgG5Z8q8yvwSs2M=;
        b=LKiTo7JsBI32FJlWCRmHDcHT/Y8iOkrdwej1TdemAI6OLa2mGameq3rthU6/QVjS+S
         I+e/CiAKfCnTQHDQ86zAaR2wc5mnEGcXL39Q35T5K9xwbNM/tYRgOWvSvzqNR5KMDnch
         Ib8OrWUJ8tIQsllIkHis8OH/CGqTTjiM6mACRNf9haM3C/SZCEH6SISefa+4zsbqmZ6m
         r4V+fxvj48Baq1dkldIYsjNZaOyGeDDeBzH6XvsfgWWUeyO/XX2KpLzCFKIaDkmoYhsE
         1luIujnutqEQbHQMXWxLllw458J+rv/Ab0YhlSGFm9IsGnZEEXi2bW1k5Bmi5UbnL76l
         7HOg==
X-Gm-Message-State: APjAAAUFtBWLab6gURS/2kuXtRwrVb2r3n/IY3m94GE7gVbEM20gjebc
        qv2uDgUTv8+GyHwaA2VcaDdLwA==
X-Google-Smtp-Source: APXvYqyszDdpM/3ud4bfV15wu6oE2QbjCevykqalAbVlwCBIN4naArSw84K73+sk7klQIdxWF+06mQ==
X-Received: by 2002:a92:8dc3:: with SMTP id w64mr15201727ill.68.1575674097195;
        Fri, 06 Dec 2019 15:14:57 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.56
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
Subject: [PATCH 3/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Dec 2019 16:13:45 -0700
Message-Id: <20191206161137.3.I55d53dbb7c64256e4231a6b99c6e6d1c336f624b@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_crtc_mixer.hw_lm will never be NULL, so don't check.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b9ed8285ab39..bf513411b243 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -197,10 +197,6 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	DPU_DEBUG("%s\n", dpu_crtc->name);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
-		if (!mixer[i].hw_lm) {
-			DPU_ERROR("invalid lm assigned to mixer\n");
-			return;
-		}
 		mixer[i].mixer_op_mode = 0;
 		mixer[i].flush_mask = 0;
 		if (mixer[i].lm_ctl->ops.clear_all_blendstages)
@@ -1113,12 +1109,9 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 
 	for (i = 0; i < cstate->num_mixers; ++i) {
 		m = &cstate->mixers[i];
-		if (!m->hw_lm)
-			seq_printf(s, "\tmixer[%d] has no lm\n", i);
-		else
-			seq_printf(s, "\tmixer:%d ctl:%d width:%d height:%d\n",
-				m->hw_lm->idx - LM_0, m->lm_ctl->idx - CTL_0,
-				out_width, mode->vdisplay);
+		seq_printf(s, "\tmixer:%d ctl:%d width:%d height:%d\n",
+			m->hw_lm->idx - LM_0, m->lm_ctl->idx - CTL_0,
+			out_width, mode->vdisplay);
 	}
 
 	seq_puts(s, "\n");
-- 
2.21.0

