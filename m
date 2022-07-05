Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BD9567023
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbiGEOBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbiGEOAw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:00:52 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9343C20BDF
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 06:45:22 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v16so6200436wrd.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WU85wt75maZ/AzK5oGTPi4CFNSsHv61sFJKv4WZ1Y0=;
        b=RxiXpcrkgknD4jjo++ZfyQAgggitaIk+6jlabkqZstpElMQaJlj7WCB9WZGrPXSU1e
         vhknTdnPzCBAtCskAii1CkeT6i/u6wIns5IreDXa/KhP2WaFY4HZ2ZcUbPc8CkU5NsZD
         0EfAsTQcWIEhC7uKrNPg9YcGlSt5WHanF/aKbjnhZ5TdsyaUM1/abNR7m2AfEI8QLOky
         9oRdyCCA9rY4LEzCv59/h9RjLM3Nb5Z4iVxynwZIxUmFOeGjO6Wfehyw4yA8XKnik2nc
         /N+R7EXvR9+o4LZS4QqTzr8N9Q/bpQh0ch7rFmRugndYg21hGQqIyBhnWzHM3L81kco+
         c0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WU85wt75maZ/AzK5oGTPi4CFNSsHv61sFJKv4WZ1Y0=;
        b=W4HyvxlTzQ55NjCyJTUaBVtPqVCrgo3i1lg8Df2yO3b2BxqBvSl7KiBRj7pWptX/i8
         sIL7KvfDjQY7ng+6fojaYIL3l28g2o4/NQCjkw3wm1XaRAyfEmC327msGMltmpYSvtme
         zCB3g2Ttchwvpg3SYaAMqiB3FJ0W9MNghaYwKHMIInN207MqQKvvjdRnB5sNB2ptdHbu
         tZY3WbwfkuhbDda2ri+wKsA4aGuFhXbET6o3GPnvUEVVSBPhHsFQ8ORnxT4l+Bo78PBx
         BaOfMH6fuY18jAX1gfpEVPb2YRLXmcp0SiV6PkcvG9CMHapP/n1kBXDZ6dGc23KONZcB
         j94A==
X-Gm-Message-State: AJIora/+5q79jMO1UVNLMCiv47Do9llXvtntQXARI7DTfAEyO+c2Uldj
        VpodODLYkdy5LDLqXUhUn8h6Cy+IH8Br3A==
X-Google-Smtp-Source: AGRyM1vHf9aHnIcGqMkM0n4kILpbEuJpe3onES5N1d//akuurbopz8QkeZRhLlGJZdsG/KloV4uXZA==
X-Received: by 2002:a5d:4c8d:0:b0:21d:75cd:5ae4 with SMTP id z13-20020a5d4c8d000000b0021d75cd5ae4mr2523540wrs.510.1657028721155;
        Tue, 05 Jul 2022 06:45:21 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v11-20020adfe28b000000b0021d6ef34b2asm3047860wri.51.2022.07.05.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 06:45:20 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Saravana Kannan <saravanak@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC] driver core: Fix repeated device_is_dependent check for same link
Date:   Tue,  5 Jul 2022 16:45:02 +0300
Message-Id: <20220705134502.2603795-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of a cyclic dependency, if the supplier is not yet available,
the parent of the supplier is checked for dependency. But if there are
more than one suppliers with the same parent, the first check returns
true while the next checks skip that specific link entirely. So add a
flag that marks the link for future checks and bail early if it is
already marked with that flag.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

For more details about this issue, have a look at this thread:
https://lore.kernel.org/all/CAGETcx8F0wP+RA0KpjOJeZfc=DVG-MbM_=SkRHD4UhD2ReL7Kw@mail.gmail.com/

 drivers/base/core.c    | 14 +++++++++++---
 include/linux/device.h |  2 ++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index ccdd5b4295de..38cb478ae400 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -297,12 +297,18 @@ int device_is_dependent(struct device *dev, void *target)
 		return ret;

 	list_for_each_entry(link, &dev->links.consumers, s_node) {
+		/* if already marked before as dependent, bail early */
+		if (link->flags & DL_FLAG_DEVICE_IS_DEPENDENT)
+			return 1;
+
 		if ((link->flags & ~DL_FLAG_INFERRED) ==
 		    (DL_FLAG_SYNC_STATE_ONLY | DL_FLAG_MANAGED))
 			continue;

-		if (link->consumer == target)
+		if (link->consumer == target) {
+			link->flags |= DL_FLAG_DEVICE_IS_DEPENDENT;
 			return 1;
+		}

 		ret = device_is_dependent(link->consumer, target);
 		if (ret)
@@ -1660,11 +1666,13 @@ static void fw_devlink_relax_link(struct device_link *link)
 	if (!(link->flags & DL_FLAG_INFERRED))
 		return;

-	if (link->flags == (DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE))
+	if ((link->flags & (DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE)) ==
+			(DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE))
 		return;

 	pm_runtime_drop_link(link);
-	link->flags = DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE;
+	link->flags &= DL_FLAG_DEVICE_IS_DEPENDENT;
+	link->flags |= DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE;
 	dev_dbg(link->consumer, "Relaxing link with %s\n",
 		dev_name(link->supplier));
 }
diff --git a/include/linux/device.h b/include/linux/device.h
index 424b55df0272..3b0c4b777a60 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -317,6 +317,7 @@ enum device_link_state {
  * MANAGED: The core tracks presence of supplier/consumer drivers (internal).
  * SYNC_STATE_ONLY: Link only affects sync_state() behavior.
  * INFERRED: Inferred from data (eg: firmware) and not from driver actions.
+ * DEVICE_IS_DEPENDENT: The consumer is dependent on the supplier
  */
 #define DL_FLAG_STATELESS		BIT(0)
 #define DL_FLAG_AUTOREMOVE_CONSUMER	BIT(1)
@@ -327,6 +328,7 @@ enum device_link_state {
 #define DL_FLAG_MANAGED			BIT(6)
 #define DL_FLAG_SYNC_STATE_ONLY		BIT(7)
 #define DL_FLAG_INFERRED		BIT(8)
+#define DL_FLAG_DEVICE_IS_DEPENDENT	BIT(9)

 /**
  * enum dl_dev_state - Device driver presence tracking information.
--
2.34.3

