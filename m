Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789C49F4C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 23:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfH0VMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 17:12:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38885 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfH0VMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 17:12:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id o70so205633pfg.5;
        Tue, 27 Aug 2019 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oL1GWqOgGJTUP/aWDisoRY9YUOhWjgpc42t3TLlasqI=;
        b=s5+0+hI1teFiarwiw5+rK/Q/iNAOVIhSBKphVOHZ5QClySxbYLYH6WDerBGWk/7y9+
         Q3e8fvkcjesT0E61joXjZV6HP+vEqoD+kAZ04wFh3Mz8OttC0ZdLTku7JRdiQA1nwcGQ
         ljyLDNYjOAH63EswSRCB5l9XF0SJm+8adNZQxPnuhGhJxeGNLqbQfzmk/v7pUU7xltf+
         rXqvPgOdvNqLByVfuGDVnJ9bSVIubEFZlGi8aQV9GOD4c0CrTpfMnmJSGFkM1w4v49d/
         CXXJ5L9rUacb8cBTC3LSs3Ios857CIBM+c1bodtTEwoCl2awTuJG5amJ1nxNFTnHhto9
         uNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oL1GWqOgGJTUP/aWDisoRY9YUOhWjgpc42t3TLlasqI=;
        b=ibzGKRw2RCRjL3Qg8beCtrHGOFDeolyCLP8Rm6yrWYnTGgWupuUBLheYmGIAoCX1cU
         CC4lP88RVmsPz3TCaBfe7uHVB3YTjj0XHsiaieJWn2eRIVZUV7OBKL3U4S7h+YRUFcJD
         +MmL3B4CC9iiDZuOAdFRVWw1j0g3Aq+G2sAz1iF1xRHbDEHizQ3eb6MdwBEz+f2/RB1I
         uNlZ6yytOYq9PC6WwwyFbPFRHe1wgrNp7iyNMTtp56EI183WnhgT82HP7VU0J0mfd1F4
         7ULOIaxVJuePTOd4Ks1b4nWbkmhXsCKfmDIg7cd7WQef1124K9UamvthBeXSABUzfRfo
         EtBQ==
X-Gm-Message-State: APjAAAVdKJ4TcQFdw2lQuXS6og04c/fElP5VFliTQ0eqXFX8zRt5oHw5
        YiBta8Jw30PNY08TV0C6dKs=
X-Google-Smtp-Source: APXvYqxYD6any9nW+zK6K4XhJJ0N2mcL84DjNDyOLURw69g/TpNdeXKyvCThlPyAs/Q/GKoyeRZoCA==
X-Received: by 2002:a65:4808:: with SMTP id h8mr436492pgs.22.1566940349493;
        Tue, 27 Aug 2019 14:12:29 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id z14sm131424pjr.23.2019.08.27.14.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:12:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bruce Wang <bzwang@chromium.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: remove stray "\n"
Date:   Tue, 27 Aug 2019 14:10:09 -0700
Message-Id: <20190827211016.18070-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The extra line-break in traces was annoying me.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 765484437d11..eecfe9b3199e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -392,7 +392,7 @@ TRACE_EVENT(dpu_enc_rc,
 		__entry->rc_state = rc_state;
 		__assign_str(stage_str, stage);
 	),
-	TP_printk("%s: id:%u, sw_event:%d, idle_pc_supported:%s, rc_state:%d\n",
+	TP_printk("%s: id:%u, sw_event:%d, idle_pc_supported:%s, rc_state:%d",
 		  __get_str(stage_str), __entry->drm_id, __entry->sw_event,
 		  __entry->idle_pc_supported ? "true" : "false",
 		  __entry->rc_state)
-- 
2.21.0

