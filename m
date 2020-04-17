Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3195A1AE768
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 23:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgDQVQN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 17:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgDQVQM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 17:16:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AAFC061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 14:16:12 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so1398343plk.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CUWz5jl2NcFu804QLjVaZT2+TkRuNEMWlXQJjNhqhNA=;
        b=c3/NOVC10A815WixHHHUkc1FXRRX3qF7MyRUpowbpKYoKiWFbmFAhuR3Y6wAi52z0h
         NqIQzCas8SOrrDBb83sfqbxrMnMDXxpYZ6g1l9hIWcOhtCdct3PG5EWNXr91JKQIDRNC
         XdXZbiv3ZZyTFgH15L3ZGe+jEPzZ9yH0XNhCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CUWz5jl2NcFu804QLjVaZT2+TkRuNEMWlXQJjNhqhNA=;
        b=OONXoUgEghNdGyoL+LTzqk/pDXkps9xAYZ/F5nS4nOsZC8dL3ZSlAmGprWZTO3aSlW
         h+o1OFthb31jrA7joG6KeI0hMrTRN/NEqYJrJYmgIB197327fwt9cIAuOsuy5EjKvehA
         EOYb/ZFuZ5vof1L3Jrqz59hSvciQCnQ614mxRSF5rw8/qzVNl5u/M+EBKPqYTXLH/p+G
         XakIfSwVhEEWy163FHNT90IVjDVZDrW9LIW+nOvMv/gdaZeKvDKLI7TzyPQ8J2Uj7MPv
         DhO73WgqviMkb4JvySdl+PJJ8kVCOA9lkHlqMvM7O7vkk9rdALnuODVGLQjhQ2EfKfEJ
         va5A==
X-Gm-Message-State: AGi0PuY/cB2//eOlfMbj+drqP+QhynntOarNPRu4C+1dlW6lxMzFr7JN
        jd+T8VJ1+XAuw8SXNH7choMuaQ==
X-Google-Smtp-Source: APiQypJkVy+nPYJWRl5GKjbYknb2uyZkEUhRrZjepNSDbbsG/l7ZLi1Egiy2xmvH8wqS8GQjRD8SZQ==
X-Received: by 2002:a17:902:44d:: with SMTP id 71mr5628244ple.123.1587158172061;
        Fri, 17 Apr 2020 14:16:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 3sm9582439pgh.75.2020.04.17.14.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:16:11 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     swboyd@chromium.org, mkshah@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: rpmh: Dirt can only make you dirtier, not cleaner
Date:   Fri, 17 Apr 2020 14:15:47 -0700
Message-Id: <20200417141531.1.Ia4b74158497213eabad7c3d474c50bfccb3f342e@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding an item into the cache should never be able to make the cache
cleaner.  Use "|=" rather than "=" to update the dirty flag.

Fixes: bb7000677a1b ("soc: qcom: rpmh: Update dirty flag only when data changes")
Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/rpmh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 3abbb08cd6e1..d1626a1328d7 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -151,10 +151,10 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
 		break;
 	}
 
-	ctrlr->dirty = (req->sleep_val != old_sleep_val ||
-			req->wake_val != old_wake_val) &&
-			req->sleep_val != UINT_MAX &&
-			req->wake_val != UINT_MAX;
+	ctrlr->dirty |= (req->sleep_val != old_sleep_val ||
+			 req->wake_val != old_wake_val) &&
+			 req->sleep_val != UINT_MAX &&
+			 req->wake_val != UINT_MAX;
 
 unlock:
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
-- 
2.26.1.301.g55bc3eb7cb9-goog

