Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6CD2CF4F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 20:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730810AbgLDTi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 14:38:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:60484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727661AbgLDTi0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 14:38:26 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ma Feng <mafeng.ma@huawei.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: sysmon: fix shutdown_acked state
Date:   Fri,  4 Dec 2020 20:37:35 +0100
Message-Id: <20201204193740.3162065-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The latest version of sysmon_stop() starts by initializing
the sysmon->shutdown_acked variable, but then overwrites it
with an uninitialized variable later:

drivers/remoteproc/qcom_sysmon.c:551:11: error: variable 'acked' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        else if (sysmon->ept)
                 ^~~~~~~~~~~
drivers/remoteproc/qcom_sysmon.c:554:27: note: uninitialized use occurs here
        sysmon->shutdown_acked = acked;
                                 ^~~~~

Remove the local 'acked' variable again and set the state directly.

Fixes: 5c212aaf5457 ("remoteproc: sysmon: Expose the shutdown result")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/qcom_sysmon.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index d01bc4bda7bf..9fca81492863 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -533,7 +533,6 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		.subsys_name = sysmon->name,
 		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
 	};
-	bool acked;
 
 	sysmon->shutdown_acked = false;
 
@@ -547,11 +546,9 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		return;
 
 	if (sysmon->ssctl_version)
-		acked = ssctl_request_shutdown(sysmon);
+		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
-		acked = sysmon_request_shutdown(sysmon);
-
-	sysmon->shutdown_acked = acked;
+		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
 }
 
 static void sysmon_unprepare(struct rproc_subdev *subdev)
-- 
2.27.0

