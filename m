Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8538F409B74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 19:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239653AbhIMR7s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 13:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239541AbhIMR7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 13:59:47 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B61AC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:31 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id s15so8844294qta.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
        b=HSkzBKaW16XHN25FVhfE4ylfh7Ho8sKCp7NrHnYeZ9jqVbeqyvv5nhvkjL7XnJKf4/
         BaklNXOp8gHXE+dIxpH1EqfKnYbBykjq53Yy+f9sYHgj5MhRKM3vU+TNRzbWCCrlgjRL
         d6Btg46MYbzPzLbcJsGef7oPKYbzbT8e8DOQ5S6WvYFiPu11tikgrc5rpfIXNQze8xAS
         EF5ybQt4EiD/YWqON6MYIWklZfZEaCODI3MttyJMNpzbQRoqnK4w7g5RcGHiZtTbrP1P
         bFHxJyDV5PUtAZJoKr8Nn73rhfQAKxB5ggKQWeIGZ3g1VCe/ow++3JDp6sm+AthJmZrI
         oqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
        b=KoUwwPKtaJ5+idOLCXE/ZX5ObAOj8EouH55KdRzEgVEvg273JHI1U3bjgaGIpiLAdO
         7+GVnYu9/qQllcrOSMm12RmxSGDtj49TuAQmlGhC1MVZV7QoED+W7qn7hOD1JA1gWvv+
         KWqkkHQBXmQCbpymU6CITf9zHpP5ylAp2jcXIXfYEm9TM/sQIGbwlEZRGvbw/7WbIxy6
         601A5A61GqowF1GzMfZz975+wNxH6ylN9GWSJF69LTeJaoPt6uwyU9V42ss82iQu5J3G
         uKzNjxhtzAGntMBCoo8G9fSYUsyUJWzUjE+iYziJVS1dEI/1TLU6fPu5ZBJ/MkSJgAGU
         wwAw==
X-Gm-Message-State: AOAM532ixPvhlSezlsLqRcq5LHf0Jmw4nQYse0Uhh6Gx5Xd2KjheLfLZ
        uvVIY2ODOuqEZn1bc4rcySsN5Q==
X-Google-Smtp-Source: ABdhPJwprGZQb5yj3SWlC8k2jMSq4z8CKpwRKlPSj4/nEKy9bCRmbnJ3kYbKUVAN837wrtFHdahvyQ==
X-Received: by 2002:a05:622a:199f:: with SMTP id u31mr763515qtc.141.1631555910663;
        Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id v145sm5853873qkb.132.2021.09.13.10.58.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 08/14] drm/msm/dpu_kms: Re-order dpu includes
Date:   Mon, 13 Sep 2021 13:57:39 -0400
Message-Id: <20210913175747.47456-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Make includes alphabetical in dpu_kms.c

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae48f41821cf..fb0d9f781c66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -21,14 +21,14 @@
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
-#include "dpu_kms.h"
 #include "dpu_core_irq.h"
+#include "dpu_crtc.h"
+#include "dpu_encoder.h"
 #include "dpu_formats.h"
 #include "dpu_hw_vbif.h"
-#include "dpu_vbif.h"
-#include "dpu_encoder.h"
+#include "dpu_kms.h"
 #include "dpu_plane.h"
-#include "dpu_crtc.h"
+#include "dpu_vbif.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
-- 
Sean Paul, Software Engineer, Google / Chromium OS

