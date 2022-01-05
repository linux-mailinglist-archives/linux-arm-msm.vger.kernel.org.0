Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283F6485C14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245309AbiAEXKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245310AbiAEXKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:10:38 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33084C061212
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:10:38 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x7so1188084lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VQ0ZgNuAluSnuM7ZE2zA1IGqyGYMHg8c0oXA5e7yknc=;
        b=wMd8DSiMeFNXgkyoSpiKIGH6Q5J3GD39IyoPdk727c0BpbtUc7fK68+G4WRRdVJYZK
         rW1UB3kPlP1nDLZ67GwblFOvA1qPfHIA1fgUWFDgoMc0o5gNaQmELtV+U0opCIui/4HZ
         zfPhEYbA6gEN/qV8pK+r0ZQvADN8mR+o19JZU+iQ7pvszqUCVYcUCX9YRDnktVKiTKnE
         p7RGrvEX31WV4efx1KqLlnaoM+D+W9j7kejcRwqoYD7k3ky+YcTHWu4uQrQtR/ZntD0g
         +nQnw7dZNrExG2EFSeLZpA6wlR6xqj8Qm5AlMxKSSQX3Ln/D+NACdVxLOlzPP/68A8TW
         vY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VQ0ZgNuAluSnuM7ZE2zA1IGqyGYMHg8c0oXA5e7yknc=;
        b=VUVbH83O/rGzn6tuphSxlEA2ouUCuCuLURzRS9ny1VP9zMfamuSsBvQEc+plGsX0ja
         Xf8bz5/8wYPLdiZp4+B1CdqgJWPUbXEL0guEEXIMLx40lFVBVzZBGGsSLZhO/S4Vxozj
         abtLfTaWW5GJB0SrqLUV4RmUl9t+xsQvCjb0dysBwdZsm57kNzSfuPd5Ri8UYw8SaqiO
         hRQACW370KixEnuu1MBJ8WmYb4HlA4poOo+J03JBKE2nt0okft5lC2EKeGQwl8+qpP/v
         2+vJGPEbkKZ7rzqRPzNM7C1idEv4YjWwm5Quuay3LcVaw3v1TZ+14Z+Cv6ao/wWydYEb
         7FeQ==
X-Gm-Message-State: AOAM532VvmjON26NhWRTNv1VFBh60gjdym/0BObaBVqJTOHtVnyX6LYp
        jEC7CSSpxhzt/wguaU+ufxA7fQ==
X-Google-Smtp-Source: ABdhPJykKlEJ9lekzLB1QgFkaj325/gKuLM26orBx+sGIScn2gpWELudG5SMTEw2N9cDfpJUhFCMpQ==
X-Received: by 2002:a05:6512:475:: with SMTP id x21mr19400581lfd.562.1641424236481;
        Wed, 05 Jan 2022 15:10:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 15:10:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/5] drm/msm/dpu: add DSPP blocks teardown
Date:   Thu,  6 Jan 2022 02:10:28 +0300
Message-Id: <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing calls to dpu_hw_dspp_destroy() to free resources allocated
for DSPP hardware blocks.

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index b5b1ea1e4de6..63ed0d7df848 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -35,6 +35,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->dspp_blks); i++) {
+		struct dpu_hw_dspp *hw;
+
+		if (rm->dspp_blks[i]) {
+			hw = to_dpu_hw_dspp(rm->dspp_blks[i]);
+			dpu_hw_dspp_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
-- 
2.34.1

