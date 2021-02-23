Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A0B323369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 22:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhBWVrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 16:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbhBWVrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 16:47:04 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6457DC0617A9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:47 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id t9so2722081pjl.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GZZ4+isyvvBq3J9vCBIeGrq4NjZWjQ7x1vxpr0gQR+w=;
        b=mEhLT0SygSoX/t28f7YrV3MrUieLIR+/jhQtl7O26XtKMpO3tVFfTMVOFa1U+44Vj3
         BJl+NwKPDKmGj5CYbQImNlIikA1cNhmjRBJDoIDS3rZvrtnirAptezK05bdC6F7VZr5/
         fu6h8fsBCsVgtvCXGOjHBC3ejwLZ7uus4j2j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GZZ4+isyvvBq3J9vCBIeGrq4NjZWjQ7x1vxpr0gQR+w=;
        b=beBbzvORaq3SFOZXntKkm68+UbDg5bXpXq6wCfRIxI0B435kJnWXJ2NGyl6xCzBwzH
         G3wpqQN3t+R+eDcMpEfMXH64CHi8Xa+HQnmL1KaZ3wLE6yH6c3dwWB4gs2rcxqZKEb1F
         /aDcS592HUxkllG6i/cg4oOvfv/a6LdMnPdQ4TMC+5IJAFm7/SX67BCJ/hEZ6meDWq+1
         DeoUMha2JVCtc9q8ah+N2z+g7WYot3GECAk/ibXga3KsFYX/knVgbBypL3ucLG8VcLOO
         xEkgMbbe0FLecPQGaqZo3N/ZWMgN2+UTTGVCzvUUoCorHhFguBwAu9560128MVFrkMqI
         1Kag==
X-Gm-Message-State: AOAM532CqiVJKzbK0XIJ6Ms04F+H0mN4DwkijQ8QQrItKKHEOgvWeuZ4
        txq24heqYPLqUx+x/vfTpEXf5A==
X-Google-Smtp-Source: ABdhPJxJc903sUIztTzxmi80UqFSkT08yZw93ZuA7sAIlH/fyGCqwro42X/gy76qQ1RH8A0sZrqXrw==
X-Received: by 2002:a17:90a:fb58:: with SMTP id iq24mr830916pjb.64.1614116747049;
        Tue, 23 Feb 2021 13:45:47 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id r68sm137951pfc.49.2021.02.23.13.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 13:45:46 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 5/6] firmware: qcom_scm: Fix kernel-doc function names to match
Date:   Tue, 23 Feb 2021 13:45:38 -0800
Message-Id: <20210223214539.1336155-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210223214539.1336155-1-swboyd@chromium.org>
References: <20210223214539.1336155-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These functions were renamed but the kernel doc didn't follow along. Fix
it.

Cc: Elliot Berman <eberman@codeaurora.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Fixes: 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and legacy conventions")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/qcom_scm-legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
index eba6b60bfb61..1829ba220576 100644
--- a/drivers/firmware/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -118,7 +118,7 @@ static void __scm_legacy_do(const struct arm_smccc_args *smc,
 }
 
 /**
- * qcom_scm_call() - Sends a command to the SCM and waits for the command to
+ * scm_legacy_call() - Sends a command to the SCM and waits for the command to
  * finish processing.
  *
  * A note on cache maintenance:
@@ -209,7 +209,7 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 				(n & 0xf))
 
 /**
- * qcom_scm_call_atomic() - Send an atomic SCM command with up to 5 arguments
+ * scm_legacy_call_atomic() - Send an atomic SCM command with up to 5 arguments
  * and 3 return values
  * @desc: SCM call descriptor containing arguments
  * @res:  SCM call return values
-- 
https://chromeos.dev

