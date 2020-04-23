Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559591B5164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 02:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgDWAiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 20:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726234AbgDWAiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 20:38:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD04C03C1AF
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:10 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t16so1635259plo.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GDaDftx9pwi4EUSlY8qCL60KLlRRULo9j/JV/6pOzBs=;
        b=JY/6N9ogUg3Na7E4o/Gs1J+yR3hYo68G3PI+t2xqfgW+VV3KHBxOCsiHJaNpN9idK8
         Itw8dlcqSBGk46ICsTQ0XXZQEwB4Tq0+5ZTedUDTCgSqaVp8tFtvF08s3fz1EV/UB06G
         7i4/xovxmrJaqOB9fHaHCkM1cn+h/8dQHC/cCIQCE5fzlDVuIPGhSJrDwE2DXyxWD5ga
         ybvYRxC7mdUv/F2B6XpahQRZujOp/WAbgF7fTxmEWi9l4SQnhnfyG2I8v7FxX+s4Qcmr
         rDtevFhHIl+wP1RCJJ4ddSXSg6nT99tzrB5cAgVbrcpAxZPLvvZIYStZZNlQffSAW24u
         CTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GDaDftx9pwi4EUSlY8qCL60KLlRRULo9j/JV/6pOzBs=;
        b=myShrsctsrZbLCj5Tidd10dhj4AFpgbJYV/9Uua39o5G1Erls80vDA/la7zw4799/c
         TuAO940TUVAo5+GOqaRP+3WC4CI49JbsAhEq8hILX0P9Jr6x9Le74fe3UK3M9FR1z9so
         /Y95MweIWJxt9lsxCpq5SEiEfRuEsXRaya5OjRnJcskcGTFU393yqtYuLiSCh8/1Kx1Y
         fSVsPwBNNwPayQioMQI0DtyY4IGmkW/FDuAC01sSuejDvXXwpI7v1GR/PmnvCqQtYyXA
         /5SKzk7NXKs7Bahb4J4BwZkIW7iRBMcWJY16sjsgjzIpeVVhPC288bXSD9yOm9xhbak2
         qhyA==
X-Gm-Message-State: AGi0Pualm+EUzxetx7oNknXZTMLDdlrrmU5XjTsuk6tjoM07e5HPFDPL
        zU4hJQdn4hXqP1SSkafPF3se+g==
X-Google-Smtp-Source: APiQypK74j+wjl3/96ICF/g8NdVM3oydSs/h3oqULxaq3T8Q0f62TIbNZAmkn3UyYXZIFoRYP/wGFg==
X-Received: by 2002:a17:902:b186:: with SMTP id s6mr1405856plr.16.1587602289841;
        Wed, 22 Apr 2020 17:38:09 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm432225pgz.0.2020.04.22.17.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:38:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 2/4] soc: qcom: glink_ssr: Internalize ssr_notifiers
Date:   Wed, 22 Apr 2020 17:37:34 -0700
Message-Id: <20200423003736.2027371-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than carrying a special purpose blocking notifier for glink_ssr
in remoteproc's qcom_common.c, move it into glink_ssr so allow wider
reuse of the common one.

The rpmsg glink header file is used in preparation for the next patch.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_common.c |  8 ++++++++
 drivers/soc/qcom/glink_ssr.c     | 24 +++++++++++++++++++-----
 include/linux/rpmsg/qcom_glink.h |  6 ++++++
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index ff26f2b68752..9028cea2d81e 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -42,6 +42,13 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 	glink->edge = NULL;
 }
 
+static void glink_subdev_unprepare(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
+
+	qcom_glink_ssr_notify(glink->ssr_name);
+}
+
 /**
  * qcom_add_glink_subdev() - try to add a GLINK subdevice to rproc
  * @rproc:	rproc handle to parent the subdevice
@@ -64,6 +71,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
 	glink->dev = dev;
 	glink->subdev.start = glink_subdev_start;
 	glink->subdev.stop = glink_subdev_stop;
+	glink->subdev.unprepare = glink_subdev_unprepare;
 
 	rproc_add_subdev(rproc, &glink->subdev);
 }
diff --git a/drivers/soc/qcom/glink_ssr.c b/drivers/soc/qcom/glink_ssr.c
index d7babe3d67bc..847d79c935f1 100644
--- a/drivers/soc/qcom/glink_ssr.c
+++ b/drivers/soc/qcom/glink_ssr.c
@@ -54,6 +54,19 @@ struct glink_ssr {
 	struct completion completion;
 };
 
+/* Notifier list for all registered glink_ssr instances */
+static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
+
+/**
+ * qcom_glink_ssr_notify() - notify GLINK SSR about stopped remoteproc
+ * @ssr_name:	name of the remoteproc that has been stopped
+ */
+void qcom_glink_ssr_notify(const char *ssr_name)
+{
+	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr_name);
+}
+EXPORT_SYMBOL_GPL(qcom_glink_ssr_notify);
+
 static int qcom_glink_ssr_callback(struct rpmsg_device *rpdev,
 				   void *data, int len, void *priv, u32 addr)
 {
@@ -81,8 +94,9 @@ static int qcom_glink_ssr_callback(struct rpmsg_device *rpdev,
 	return 0;
 }
 
-static int qcom_glink_ssr_notify(struct notifier_block *nb, unsigned long event,
-				 void *data)
+static int qcom_glink_ssr_notifier_call(struct notifier_block *nb,
+					unsigned long event,
+					void *data)
 {
 	struct glink_ssr *ssr = container_of(nb, struct glink_ssr, nb);
 	struct do_cleanup_msg msg;
@@ -121,18 +135,18 @@ static int qcom_glink_ssr_probe(struct rpmsg_device *rpdev)
 
 	ssr->dev = &rpdev->dev;
 	ssr->ept = rpdev->ept;
-	ssr->nb.notifier_call = qcom_glink_ssr_notify;
+	ssr->nb.notifier_call = qcom_glink_ssr_notifier_call;
 
 	dev_set_drvdata(&rpdev->dev, ssr);
 
-	return qcom_register_ssr_notifier(&ssr->nb);
+	return blocking_notifier_chain_register(&ssr_notifiers, &ssr->nb);
 }
 
 static void qcom_glink_ssr_remove(struct rpmsg_device *rpdev)
 {
 	struct glink_ssr *ssr = dev_get_drvdata(&rpdev->dev);
 
-	qcom_unregister_ssr_notifier(&ssr->nb);
+	blocking_notifier_chain_unregister(&ssr_notifiers, &ssr->nb);
 }
 
 static const struct rpmsg_device_id qcom_glink_ssr_match[] = {
diff --git a/include/linux/rpmsg/qcom_glink.h b/include/linux/rpmsg/qcom_glink.h
index 96e26d94719f..09daa0acde2c 100644
--- a/include/linux/rpmsg/qcom_glink.h
+++ b/include/linux/rpmsg/qcom_glink.h
@@ -26,4 +26,10 @@ static inline void qcom_glink_smem_unregister(struct qcom_glink *glink) {}
 
 #endif
 
+#if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK_SSR)
+void qcom_glink_ssr_notify(const char *ssr_name);
+#else
+static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
+#endif
+
 #endif
-- 
2.24.0

