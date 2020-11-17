Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7212B6BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgKQR0M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgKQR0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:26:12 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219F4C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:26:12 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id v21so3758155pgi.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mXY01vYqSIFKCXp0IDMP/PsFb63uKbgbyX0xqNFjPx8=;
        b=Ui84wE1DPycMuErhBKrJglxCN+6U2dIsJ8AXIsquTnLJwX7valeZ/Wj4u13g/P7cca
         hCCwyq37SCXL+glSjaLy48q3Es/ccTZPdji18Jc19ouRkm25CJBTDoKB2hq56S1gsxJT
         CgkNQMv/DyTA8jUzzWDYbwu+gOE/Q4fpQMkqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mXY01vYqSIFKCXp0IDMP/PsFb63uKbgbyX0xqNFjPx8=;
        b=AmWaBd97aMVdAKn4vyhmU372H3UdPeSwn+KST5aO1H1VNzZrS6RLOwk4A+Ze93kmVF
         oKj6x7O5nkemjYsHp3Hn2LKC/DyuhlxiCRFGxiRfnIk0CV7HzA/t/pgTWI2oaPwsjxMh
         oK56wgea/Y/YmdQCPJIkWN9MGUzUpMWwu6t+VS/GwkR1lF3+t6p2sLKdLPdoBIdr7zgH
         EWtNHfsPZTl/JusAJWQWfECpBYp8AhNe1ezCkSDDR2cM+oehS0rhpfrznVpNarjDi1Va
         ySSIKWx5FnKGl2apilUOH0xCQvtSe4EKzHVdlaBJiSFB82DSkO/Wu1Jq3xXvnTWhluib
         rQyQ==
X-Gm-Message-State: AOAM532OEn3huae2Rn6+aAyhmdg+Qw3piXoluHklIbFFx/btLSunI1Qj
        JBD0/pmFtDdUCAC/XF4vg0oXd2N6Is3ChQ==
X-Google-Smtp-Source: ABdhPJx6BBjXdUQptGLanbbvON0/vIPEQPGdKUos1T5nRqRB9kJFXWbLNYc4fRG2VpF08DlYFiAz3w==
X-Received: by 2002:a65:4485:: with SMTP id l5mr4316577pgq.10.1605633971667;
        Tue, 17 Nov 2020 09:26:11 -0800 (PST)
Received: from smtp.gmail.com ([100.99.132.239])
        by smtp.gmail.com with ESMTPSA id y9sm3816846pjn.24.2020.11.17.09.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:26:11 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dpu: Remove chatty vbif debug print
Date:   Tue, 17 Nov 2020 09:26:08 -0800
Message-Id: <20201117172608.2091648-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I don't know what this debug print is for but it is super chatty,
throwing 8 lines of debug prints in the logs every time we update a
plane. It looks like it has no value. Let's nuke it so we can get
better logs.

Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 5e8c3f3e6625..5eb2b2ee09f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
-				params->vbif_idx, params->xin_id, i,
-				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 	}
-- 
Sent by a computer, using git, on the internet

