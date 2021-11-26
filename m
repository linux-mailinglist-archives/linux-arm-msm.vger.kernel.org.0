Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E1B45E477
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 03:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhKZCb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 21:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235268AbhKZC37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 21:29:59 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372C2C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:26:47 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f18so20500576lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I1rm/Jq26oF750hAIzAZnETPbyjuEDPSRcantqm5hzk=;
        b=p3RbkfySYS15f3JktRp/ICFfXKUEOE5t/hoQQfLNrILJRnMKLNFPkAEEmHNa96vkhM
         L9BJgNowHwb/YT3zzXQRMNvZG5vlIHPIepPKJtDDYRDaFV/n7gXAiT+7T2rsGimtFqdO
         raV3Fb9/j+MPXqHOJNUXwq7xhevUdGooQWk+2PlCWIK5mejiJi3mwOyBhJVyrRfILXL4
         mmcOKeah7zguMf+7nbzsFsdHcTpaLr4EER+D4FFJh12mMyZ/F9hlPg/R5IBGe9rg0Nmc
         QWr6KtjS4pDNjxWg9zuJTZ1MpqfVM5qiikfhhC6Cg1buA6fP15eBpCYQ6paQ4/5zgueP
         NJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I1rm/Jq26oF750hAIzAZnETPbyjuEDPSRcantqm5hzk=;
        b=VfqpaHmEiY8DcLUkkWwGoY/MIEy0clcw4HnrKJhrruLF3+GKMNXJyLC7SX51s9PBDj
         lmIHD/R6sjpE6Tl5JB6d20QNZROVHdvSl5MCB6mXgHPVD//xnqroyoUqz/5GIDHnkwAA
         W9i813nqW7N9J6K9cS6fs3k3F7e0qKIILR1mSiaYVnGGB3R6sg5+sSa1AsANVbbExd9m
         FdBfd0UR4cu7Ugu3WtfmZSZQsgDxl3QtqNLlHf1xrsdNnxNk1VPmIGr90KInAxUvQ84o
         BT/BwUJ/2kHKvS+T9E2vW4iRLaoxV6jUG1NmJaYtUxtcq/41lKLIiv5lkb8pNm9CjOCc
         +5/A==
X-Gm-Message-State: AOAM531ef5rSW3zzkU4lXulu0ZapewEuajjEM2IAue+zNRq+qAXRYpqA
        t1EjYaJdPplQsKGEhuIvE2/KmQ==
X-Google-Smtp-Source: ABdhPJywAUF2danCuEaYc5z8GfRLwOTylEft3KFvbxaoEikJOX/LViWl+3h38NiLwTp0vQTjHAVwSA==
X-Received: by 2002:a05:6512:1289:: with SMTP id u9mr27603853lfs.273.1637893605421;
        Thu, 25 Nov 2021 18:26:45 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x6sm388764lff.125.2021.11.25.18.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:26:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/msm/dpu: consistently index dpu_kms->hw_vbif
Date:   Fri, 26 Nov 2021 05:26:40 +0300
Message-Id: <20211126022642.1105979-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
References: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Always use vbif_idx to index VBIFs in the dpu_kms->hw_vbif.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a15b26428280..8e2236fe5039 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1057,7 +1057,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
 		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
 
-		dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
+		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
 		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 21d20373eb8b..bd328b5c6306 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -152,14 +152,12 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	struct dpu_hw_mdp *mdp;
 	bool forced_on = false;
 	u32 ot_lim;
-	int ret, i;
+	int ret;
 
 	mdp = dpu_kms->hw_mdp;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
-			vbif = dpu_kms->hw_vbif[i];
+	if (params->vbif_idx < VBIF_MAX) {
+		vbif = dpu_kms->hw_vbif[params->vbif_idx];
 	}
 
 	if (!vbif || !mdp) {
-- 
2.33.0

