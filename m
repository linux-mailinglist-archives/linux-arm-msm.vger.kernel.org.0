Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367E22EB8C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 04:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbhAFD7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 22:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAFD7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 22:59:22 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5043CC06134D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 19:58:42 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id p5so2112228oif.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 19:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeaye40HSgiogM0RtB9LhClup78Pf9qm+C4hmRRt0II=;
        b=v3kccsmQ30hRPQn39cMqEBN0laDnsXHic1iZOBvfhjspwhVbm+36D1GdZVBq70NGvd
         IG5y+u0/U0dFAg6hNyn6/KpdZ9Yk2rVDPPYWmA5Oe6eHcyHTDR/asQaipc9q7uB9mj9q
         HzuoeUdYDg8khuVRu4Wi4TJqPf0I6dNTpEyS+R4mkWoX0HF/4tD0NHxnQzgGCHvAx/hd
         kg9wnnbu+TZPXCDup/9TtStkszCL3xUwYHjQzdyk2yXeLiggc8m7OnXwhqdbAUcnK17h
         feio65C0JNwPCC08DY/jBXz3GKChgDieT/jBA1xipq7Ugjss5fimyV/DAMFBNshSN8cK
         Ptiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeaye40HSgiogM0RtB9LhClup78Pf9qm+C4hmRRt0II=;
        b=qE54DcWf+rOgmz2YNQlJqwyc7EIMNstJEQ67NbaR7o+Q9jXjScXejY9sVAowS5g8lL
         J9fuCQsKUJy1sYeBXSOTpaPqAfYCHDPYNs8Yd6U8nygsaCpDouMq7Ii8A9y1gkRC3RAE
         Wh6NBPzL6D4bf35is1VbbPawOlqEogJWHWiqYh0L8iVmYAKt4wUYYyBPZC6Y2aW1Ooik
         GiiqJd7HK46m9Sb/+iE1ytdDyvtHR1YovDqeUOQo9N86fHDzWn3sVqTofhWvrW+UdhMy
         x2xU5EvtE7QMigGH+0ykqurOQTISRFULyugf0XvO3MjDMl7ARLde8IwngjyXogqfSYhx
         Xvyw==
X-Gm-Message-State: AOAM5331etpSufUtoInN2BdQVjhtlaTrx59gAClP8p09RrTyQ7A0Mq4s
        y0KfG4qte3wIYRMhH+Ki0QnNKg==
X-Google-Smtp-Source: ABdhPJyOrloJHKeu0LaF+eSlKzSYLWavopnvRTr7Jj+RnWKVXeSi1bL32oBlfVt3tQ8hmrvlDhpQGQ==
X-Received: by 2002:aca:3306:: with SMTP id z6mr1897359oiz.141.1609905521129;
        Tue, 05 Jan 2021 19:58:41 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t2sm292350otj.47.2021.01.05.19.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:58:40 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] rpmsg: glink: Guard qcom_glink_ssr_notify() with correct config
Date:   Tue,  5 Jan 2021 19:59:05 -0800
Message-Id: <20210106035905.4153692-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom_glink_ssr_notify() function doesn't relate to the SMEM specific
GLINK config, but the common RPMSG_QCOM_GLINK config. Update the guard
to properly reflect this.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 include/linux/rpmsg/qcom_glink.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/rpmsg/qcom_glink.h b/include/linux/rpmsg/qcom_glink.h
index daded9fddf36..22fc3a69b683 100644
--- a/include/linux/rpmsg/qcom_glink.h
+++ b/include/linux/rpmsg/qcom_glink.h
@@ -7,12 +7,17 @@
 
 struct qcom_glink;
 
+#if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK)
+void qcom_glink_ssr_notify(const char *ssr_name);
+#else
+static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
+#endif
+
 #if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK_SMEM)
 
 struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 					    struct device_node *node);
 void qcom_glink_smem_unregister(struct qcom_glink *glink);
-void qcom_glink_ssr_notify(const char *ssr_name);
 
 #else
 
@@ -24,7 +29,6 @@ qcom_glink_smem_register(struct device *parent,
 }
 
 static inline void qcom_glink_smem_unregister(struct qcom_glink *glink) {}
-static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
 #endif
 
 #endif
-- 
2.29.2

