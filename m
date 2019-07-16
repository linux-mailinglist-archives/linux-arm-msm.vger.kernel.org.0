Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB876A1AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 07:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfGPFDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 01:03:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36558 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfGPFDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 01:03:32 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so8802718pgm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2019 22:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XuPh1ec5nyWI9lzxp+dj0MV4o3EuhJcXc845yk8LJjk=;
        b=fQADIp2YgdYHdH1vX7+wb+Xf44XKPz90A4MQaawD9H4et04YyTumC1Vl+ZA5hbQSJz
         GWhkkNiFU5CD4DeVwbcshRHJ35gDgWgT1I13VRIuvRyRmnS31qL+OnyYS/FGN9YNsCro
         vDld9SXrbOgd9AxZaqULs6MMDYonX6w3aD4GsgE7Aw9laYfMCvIoHq/u9uEdghNPiDbS
         hDHY/IVeemd9h3/7ermIDO/1DTGlCIL0PQyWsQd3epqzzK/d7tS0fXdghZcdw6NErEFx
         kyzYlFF7CqBCFfVtwyKzRFdDml26ZhEUDgwGfNgH9cm0VZVb5Yr8p4t4wVezkcIAgzUN
         T3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XuPh1ec5nyWI9lzxp+dj0MV4o3EuhJcXc845yk8LJjk=;
        b=ZOwdtsv3+DhPArQEEb8pQ2iSJvqIoXL0qHiS/fkduAzBjf6/pG5HqrtUGIu8tphDqh
         bU/1bC1JDw/58lgtEIo4zqoeJjorzRPgx4cychfpRL1DiIRTYTVaxpGyQXuSDSBmmdBD
         wBJkzEhPGprqL18v96Erfyi7R0SsoIXNuDZ26nv7B0sCj+bPPNNpQH2+E9pJyL3FJNmS
         cWccxJAxKcMMuKXcJTKNbd0h3K03ZtGBWztGtqw5vig7cIvIyuOri1e13BsRe90TwCmT
         c7uurWuCAKtl8TOAeB26K+gA/qLsbI5Une9Os7w2Xn/nmdy8POUKgQe8zkZnyGTKQU5/
         WhDw==
X-Gm-Message-State: APjAAAXrobS+Dv8iQi28YfjT/WwsBn0ZH4TMUBYuIcxRJDsXuA4ecySQ
        4zf5LpB9IDlqdmbB//tH8NYH2g==
X-Google-Smtp-Source: APXvYqzI8VHfkqwCCD5Y4gUoyXvCjlVeGNhjcHrJUOtCmXjX/eamvM/OJL/hY9jIB0VNLLNw1gSdCQ==
X-Received: by 2002:a17:90a:2190:: with SMTP id q16mr32606625pjc.23.1563253411592;
        Mon, 15 Jul 2019 22:03:31 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j20sm18434336pfr.113.2019.07.15.22.03.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 22:03:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>
Subject: [PATCH] remoteproc: qcom: Move glink_ssr notification after stop
Date:   Mon, 15 Jul 2019 22:03:27 -0700
Message-Id: <20190716050327.8866-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

glink_ssr is used to signal a remote processor "A" about the stopping of
another remote processor "B", so that in the event that remote processor
B is ever booted again the fifos of the glink channel between A and B is
in a known state.

But if remote processor A receives this notification before B is
actually stopped the newly reset fifo indices will be interpreted as
there being "data" on the channel and either side of the channel will
enter a fatal error handler.

Move the glink_ssr notification to the "unprepare" state of the
rproc_subdev to avoid this issue.

This has the side effect of us not notifying the dying remote processor
itself about its fate, which has been seen to block in certain resource
constraint scenarios.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6a448429f223..60650bcc8c67 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -200,7 +200,7 @@ void qcom_unregister_ssr_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
-static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 
@@ -220,7 +220,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 			 const char *ssr_name)
 {
 	ssr->name = ssr_name;
-	ssr->subdev.stop = ssr_notify_stop;
+	ssr->subdev.unprepare = ssr_notify_unprepare;
 
 	rproc_add_subdev(rproc, &ssr->subdev);
 }
-- 
2.18.0

