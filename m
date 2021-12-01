Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF2946592A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhLAWaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353617AbhLAWaC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:02 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE25C061748
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:40 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d11so51081098ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fWCoIosLOkr8+Xp5Tky7xqwPwu8pC3ri4jt2sulhCRE=;
        b=Xb2SvLb1ZZ9tHGymd8d9tmuvelPOGxTOoUuK6Q+FG9Z7F/abPDzE7TWHp5oaeghX1o
         4An2eEl8JdsG302stGkaHUsC3nGi2P63gWMK0mpa9/nHbZcm4HAlW9xNEzAxzqurhFW2
         wzRu8qBkPI0gInFNlPjNACnxkzc00sxQqGzQvDu9rt50yzoqeKmdaffo7vzjqxEkLAaG
         mMQ/LqlRPSlq2vFUF+EeSgwh6FkbCcptBR8jHmOd5Vz1+kPQ1aDnM/NkpN8KWoJOolxP
         sR+kXa31AlkkzO29iSFuo7gkIhOE/+nBlJ4zJoENqYuJDY42NuJqTUjUhOYUZ5C4Ausf
         fijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fWCoIosLOkr8+Xp5Tky7xqwPwu8pC3ri4jt2sulhCRE=;
        b=AKmKqCjf8JXCD2VOvcX5LTxeiZXcJsGmke7o9kNpj4+VJ6MRJQMlwFVLAYTOTJf8ap
         CfU2PitzmvTIN1zdyblxsMVXqK1/QOhcbrnKZwRjxaingVWeK243n852lwtRtd6PzxsR
         NqpUHBlAeLIQYo+xZm+WoDk8eySc0N26IrIEBjs8Re0GX/bVMng6ZkOFayDMwUALioJ6
         9obTM0yU5TPpdDPKCzAMDNzYJGwHDjlzapNBURMHG4I/+Kr3Wt8W1eAga3ilm6TC6roj
         I63IoYlJNCOc0Ps06IBMRXY1h7aldB16K7xzcwR5ORT+CVarGV2lli53M28TrvkmcFib
         Xm/w==
X-Gm-Message-State: AOAM533SmRNX8BROHlmoMBn28XV7kYyEF6Lz/rLHjwO8mx8Ugu6HkgwH
        +DsF6idfA2kkwPvB8h2no08uxQ==
X-Google-Smtp-Source: ABdhPJxtqnDME8ugi6RNS2CRr24FIhayY929Ybdkjjg0tuAthvNZRunt6g/P/cX8aCOWaRL5rkDyVQ==
X-Received: by 2002:a2e:9dc8:: with SMTP id x8mr8170843ljj.502.1638397598784;
        Wed, 01 Dec 2021 14:26:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 3/8] drm/msm/dpu: make danger_status/safe_status readable
Date:   Thu,  2 Dec 2021 01:26:28 +0300
Message-Id: <20211201222633.2476780-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change \t to \n in the print format to stop putting all SSPP status in a
single line. Splitting it to one SSPP per line is much more readable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7f0cded2c6b..4c04982c71b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -82,7 +82,7 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	seq_printf(s, "MDP     :  0x%x\n", status.mdp);
 
 	for (i = SSPP_VIG0; i < SSPP_MAX; i++)
-		seq_printf(s, "SSPP%d   :  0x%x  \t", i - SSPP_VIG0,
+		seq_printf(s, "SSPP%d   :  0x%x  \n", i - SSPP_VIG0,
 				status.sspp[i]);
 	seq_puts(s, "\n");
 
-- 
2.33.0

