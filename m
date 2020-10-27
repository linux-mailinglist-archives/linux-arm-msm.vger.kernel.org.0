Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9334B29A979
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 11:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410534AbgJ0KXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 06:23:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40656 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410469AbgJ0KXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 06:23:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id a9so1599801lfc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zCnAt3Ufpnd8qDbD+eSLDRky0zifegBLynE3fwmlgnk=;
        b=oq8XdJgwY33aXp0n2GrQDQSAwWGWnzcqqi3/5sSrHBhsrCE4hn9+Kk9Na3ypkP+MKg
         ag8ZfJQEJ1BhEMtGYYZVXisWeaimoqFjFjShC97cm4igo4PgLVzgTlFq9qBeyjdCXTz1
         dgLkhfyXfHooLHjcQhVN/G4si1mLKTlAX7ApKsuwP47g2wrgC/YIPXSi8XfbW+ikUuZI
         hIMc5e1LxCeRHIqVp0bpXHR92VfNQW/a6bAvaW3Nq2lLwlLdti9vAoORe5vERzbFU9Sr
         eOwXtCZWGA8TwQwgz0Y7z1Uui09DHdTUUIt/e23yVLBmSzvar4EI/h/l9YMTqtwCkxzw
         T75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zCnAt3Ufpnd8qDbD+eSLDRky0zifegBLynE3fwmlgnk=;
        b=k7Tkk6sx94XvjyBdMmxDLk40Xjlw2hfRY7IDFsoEl9QZD7uMVLy7i4RFMo/8R9pBhd
         fV2BUriwaxQKL/XHJcUZ8+dn5phAqzCTybic9ryDeUq0qUPTyuCpyoB+Bp1S9spKNLQm
         xEUDDG5pgvUvyYPxuLjC85O11bTsbJV9wx29kXoqvoWwJSXnUSkhxhLYmJk5CiE5ZNRn
         iS9pKVzwYvvFaj99PJUWNSX4OKCqymZDLIO9BkM0fjm52sBwGkVb0O7Vm2DsRVEW5PFW
         HOTZAE7f5vQjqY3edl8DXAEZAO0TtKfY0q8pFEX5ry0jsaqAHgKDQVL317h3ppi2lfO8
         lINw==
X-Gm-Message-State: AOAM5316bPNhx2yVE6YqcV4gbkWSrvcyVkwSwYNbaejvNOW3+vWO3sv0
        fmyRvRmka6lCLRfOf488B+PpUKnR+qNS3uQd
X-Google-Smtp-Source: ABdhPJyLMOnr5LkkVIrfKPzhut//bBvlIxsF2Uhz6k9PUSL+0zZ+iGQhqxrS88DLYpePA1A4urntGg==
X-Received: by 2002:a19:2d15:: with SMTP id k21mr652619lfj.276.1603794187857;
        Tue, 27 Oct 2020 03:23:07 -0700 (PDT)
Received: from eriador.lan ([188.162.64.248])
        by smtp.gmail.com with ESMTPSA id h2sm127327lfd.82.2020.10.27.03.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:23:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180 board
Date:   Tue, 27 Oct 2020 13:23:04 +0300
Message-Id: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
display") has added support for handling bandwidth voting in kms path in
addition to old mdss path. However this broke all other platforms since
_dpu_core_perf_crtc_update_bus() will now error out instead of properly
calculating bandwidth and core clocks. Fix
_dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
of returning an error in case kms->num_paths == 0 (MDSS is used for
bandwidth management).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 393858ef8a83..37c8270681c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -219,9 +219,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	if (!kms->num_paths)
-		return -EINVAL;
-
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
 			curr_client_type ==
@@ -239,6 +236,9 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 		}
 	}
 
+	if (!kms->num_paths)
+		return 0;
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.28.0

