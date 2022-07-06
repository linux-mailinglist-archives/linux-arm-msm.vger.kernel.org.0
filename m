Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01DB568E66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbiGFPy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbiGFPyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:54:11 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30B9D99
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:54:02 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id h17so9529038wrx.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsmbA7pbfVVxtCyP75LYleN73l2vnI6otlvz1z0zZeY=;
        b=GPCeOC8koQUZiomJs5lDS+GJha2vrjljjNaIlHncUy0sx/0Su39G9sAft4iW5/x6hR
         +lN9KSyacUkEL/xvb45f9EeO4rKXpIeYW4AkYB1BELQtsPDdfIaQmHatTfZZTH1aU7am
         BCh8/Sa2Lb7UIgswSHvQJp1I+5ZQ6Hh2KV93481v4MzBmdgsppr/5AfJDVbIgmcNTdLG
         JGIH+0e4klMayUU2tsLpl+XBjGhl4DCOj6+PlP7v/2UhWrJONlVclJnly+s5thxQBo5E
         tc2qNT/Uk7PB9QIPOiTAPKIgB04GZS3N0H18VseM6vT3RVn0H1Q1bsElJu7LI6z7sS5O
         qLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsmbA7pbfVVxtCyP75LYleN73l2vnI6otlvz1z0zZeY=;
        b=3dblMW7TlFocsdCm/iwZ9//8cv59pO+n8kfjbkzCupHopCXt1MhH9inCJRqdFd3WJL
         cp/57t5S3NMra68e58Ly9OtrBYpzEwETchKkE/bdIBLbkEC3drN6ZkYKwz5vgEz83by3
         S4xuGJqZfRvtnNJdpucnu7HEwDuTfDIIAkxiEJh7RTFeLFkXraOgKoJyw7zzkabxQor0
         43ih/hUxlJUBBipL8g118uPYviydjJD8aDETZb9GT1XdmqaLOWmvV921IFfCg5RmikDf
         n+KjUQgvG6CX7RoQjQ/8xemsoF7QtDK/ycYQJNGjgcet/Zjrc5CNPtuumSu/ljDWR08c
         YhLw==
X-Gm-Message-State: AJIora9r5JAUL2AzvdV3Soi4dKumDQuy8DFRpfMqqmZWBKhVns5SvXgW
        9YI6UGUUSfdvziVvh7VXI2CwCQ==
X-Google-Smtp-Source: AGRyM1s2OWTvbDmVKuCzd38bJ/J3patbtRXHtzGErxwQIacPhicFHRswI9XIzynZ18h5raFiWJ8miw==
X-Received: by 2002:a5d:591c:0:b0:21d:7147:a180 with SMTP id v28-20020a5d591c000000b0021d7147a180mr9812053wrd.582.1657122841273;
        Wed, 06 Jul 2022 08:54:01 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id a11-20020a056000100b00b0021b8c554196sm2276788wrx.29.2022.07.06.08.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:54:00 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC v2] driver core: Fix repeated device_is_dependent check for same link
Date:   Wed,  6 Jul 2022 18:53:47 +0300
Message-Id: <20220706155347.778762-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of a cyclic dependency, if the supplier is not yet available,
the parent of the supplier is checked for dependency. But if there are
more than one suppliers with the same parent, the first check returns
true while the next ones skip that specific link entirely because of
having DL_FLAG_MANAGED and DL_FLAG_SYNC_STATE_ONLY set, which is what
the relaxing of the link does. But if we check for the target being
a consumer before the check for those flags, we can check as many
times as needed the same link and it will always return true, This is
safe to do, since the relaxing of the link will be done only once
because those flags will be set and it will bail early.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/base/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 753e7cca0f40..2c3b860dfe80 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -297,13 +297,13 @@ int device_is_dependent(struct device *dev, void *target)
 		return ret;

 	list_for_each_entry(link, &dev->links.consumers, s_node) {
+		if (link->consumer == target)
+			return 1;
+
 		if ((link->flags & ~DL_FLAG_INFERRED) ==
 		    (DL_FLAG_SYNC_STATE_ONLY | DL_FLAG_MANAGED))
 			continue;

-		if (link->consumer == target)
-			return 1;
-
 		ret = device_is_dependent(link->consumer, target);
 		if (ret)
 			break;
--
2.34.3

