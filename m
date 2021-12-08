Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A41B46DBE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 20:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234236AbhLHTUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 14:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbhLHTUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 14:20:33 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11173C0698C5
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 11:17:01 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id j11so2909248pgs.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 11:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2tKXoLlwrssYmm0QOvJSE4pdow+KE1ZDmxGm9frFvI=;
        b=QYaxRTb6OX+92SPhkm+86Pj4TZrKT2CDoHts6iEFO/0aW4A5zlSGTiT1Dj3w1u0rQ/
         r8JDoPRlSPq77FEQwELSoEKUqXpr+TEuNHAeRPGuh9uVc6zJXQsTWacv88IxS6XZ7ZBR
         46WGRlQrfSV9lIeM6IFTADcL2fQc1u2FQRbxVL6pntQlnz8/cN/yfCupXSXHd6Lim5p5
         2w1a04RawLlF8fmxyCOUzVbLX3O/D+Y3nQYukBI/T7yyaFxO6akEbWCyE5aR3tp4k283
         8pDSmQQK7Aex/mH6j1CvKkGPkyympk+zz2IhdI4bcfyPMRfG3fi59s8LpacgY/apW3+x
         h8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2tKXoLlwrssYmm0QOvJSE4pdow+KE1ZDmxGm9frFvI=;
        b=0Fu0Q1as/xoygFA1WOUMFwGg21sNmQC4V97hdUoNUDUSrBGVtE+J4i5Q0oiShpvLtf
         MmKFfwug0dlaVjDboDFHhlvgIOJb2Wxm48ea7o/uk2d29wTFOPhWrdSNysLYae9oG+ii
         4R+IgkqNtUGYI6+BLggqZ7Qts7A9UyGgn4C2Eo8CT14hRXWg6sghtmMzMbYxriHeqtvW
         ybuOgq5gajZ8q5w2t5PBLaysQ8VTek05074SHcPCj4gktkI+iA1bGLzNAlAEcdAwfS/I
         j3aa0FgKOkjBLqUfb5B5ZCIGdTSSEDxAUGpQuQDnC/k548cFdaF9z/cWye48dEMCPhN6
         Snug==
X-Gm-Message-State: AOAM530KqOllE7LJZRcaxvVOUXP70i0szM5Le/xfaiZiMVvP0d2oF9jE
        kgDLe0UuCxscHpQ3dvICDTA=
X-Google-Smtp-Source: ABdhPJwW0ZmNaDHfLPEQbCJ9n2IioXP8FP6EnSSDfCrh2BHbPfUlXSSJRvhDJOJEwV2A2XkNrWW8mw==
X-Received: by 2002:a63:8749:: with SMTP id i70mr30963071pge.487.1638991020571;
        Wed, 08 Dec 2021 11:17:00 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id m15sm6783129pjc.35.2021.12.08.11.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:16:59 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 0/2] tools/msm_dp_compliance: Multi-connector support
Date:   Wed,  8 Dec 2021 11:22:14 -0800
Message-Id: <20211208192216.743364-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Update the compliance tool with an optional arg to specify the connector
name.  This will be required for newer kernels, which will move the
needed debugfs files into a per-connector subdirectory.

Rob Clark (2):
  tools/msm_dp_compliance: Small arg parsing cleanup
  tools/msm_dp_compliance: Add arg to specify connector name

 tools/msm_dp_compliance.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.33.1

