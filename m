Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988DC3FC6DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 14:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241611AbhHaLwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 07:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241608AbhHaLwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 07:52:33 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6AEC061575;
        Tue, 31 Aug 2021 04:51:38 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id d5so5830551pjx.2;
        Tue, 31 Aug 2021 04:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RX2rigJ/4yVGAmIjeTnRBQKJ9haoWNb/JQuSYn5hcTw=;
        b=oK5tdGSOQTMsLfb4/ETbVqXw4L2ZZPy7lgqdzuKE5vGRQ9NRXt3hyP4pkf+9CWn1I9
         JuuRZsjmLhas77RfTcWUeWg0TZBjR6pcEs0Jvu2IHxVmD3ZW/7TNY4HTfnSLoHC0WyfU
         Io6jF6RjVQ2U77QU7U000QluIYRTee+UuOWvI2Tfod4dkOU3vHk+4tXpGX/4TmlmX420
         2t3vi+xtP94r268cWL1AzAwpIz4xv5FNijaoCHf9CrRI63svgHwH3gVKAeBJ7QFq4kRb
         wEzPfOrSoCD6LRpPK5QZpiMWCEzYg27he/KSY2SJs4+Gs+TRPCR9ExT/pBpYsFjfeOq6
         SsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RX2rigJ/4yVGAmIjeTnRBQKJ9haoWNb/JQuSYn5hcTw=;
        b=Kx3yz0J0Ap4MFnrfbZWJjUUCUQ3HWQ5jXn4FA0X9QCXKZsVLJvc6Dy+jBDhFeTUbTw
         +xRT/tdE8zWrRjL62UrYj4cqbHMsZrglM/v9K7UypZhaSrn/agBu5Sh9gKSciaK/w81d
         fGIKEkzlcI4E7aQmWaEqOHUS4LsgjzGXYUqH1KLnEoTLVs5PSraVI34eqSSSrCpKEVBw
         8Um50Pd1xukFvm1/I6sEYMHl2lPioBMpdX4/kStKkg+allAAjm/YwNNQwYsbTXuSWPrU
         cNd7nLsIOzL5/iOgcBvDFaCjhllkj2fWOGszJbSHT2cFkHPgajU0iGk2EJ0dSS8hGZJ/
         4D3Q==
X-Gm-Message-State: AOAM5323lfe9pKHRroiJgTr4XAHa+bo42Xit6G9z+AyMc19f/oB9K4es
        a+3fgFISrNimNI/c9wYMnhg=
X-Google-Smtp-Source: ABdhPJzXWq2tYhWG1U3hwSgB2KoPkJW4AwHFV1/8WNeGxVPjtCWZWir2TS/a1El7ezWCydmwoCMq9w==
X-Received: by 2002:a17:902:a70e:b0:12d:9eff:23be with SMTP id w14-20020a170902a70e00b0012d9eff23bemr4351271plq.34.1630410697578;
        Tue, 31 Aug 2021 04:51:37 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id r8sm20399460pgp.30.2021.08.31.04.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 04:51:37 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        lyude@redhat.com, airlied@redhat.com,
        laurent.pinchart@ideasonboard.com, chi.minghao@zte.com.cn,
        treding@nvidia.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drm/msm: remove unneeded variable
Date:   Tue, 31 Aug 2021 04:51:27 -0700
Message-Id: <20210831115127.18236-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chi Minghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index 4fb397ee7c84..3610e26e62fa 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl *ctrl)
 int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
 		struct drm_connector *connector, struct edid **edid)
 {
-	int ret = 0;
-
 	mutex_lock(&ctrl->dev_mutex);
 
 	if (ctrl->edid) {
@@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
 	}
 unlock_ret:
 	mutex_unlock(&ctrl->dev_mutex);
-	return ret;
+	return 0;
 }
 
 int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
-- 
2.25.1

