Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6924DB421
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 16:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356951AbiCPPIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 11:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356970AbiCPPIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 11:08:25 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB86673EB
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 08:06:55 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 611523F325
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647443214;
        bh=QAEyo1xXNWnC/wTobDlvVW3kuxucr7Y+nryukeY/7zA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jxJse8r1enMSjSGbdjDXLE3mDFmSMY527q2rYX1ufpnufWsASQcvbhvGPAQ7qPeCL
         VboIFk0KWChdVlPWgkIEb5gmCN/d4Jape2KpvuONazgx6itBBSDFaDhA8gHOKiKxDg
         utN0ZbD5M04u4RyxzdiVpnwc4NL/xBUy0nikBn+0PxtVzdPfUr9ynEa+9dNeOuesNw
         k3KCCn6c2KOXzF8Re9nok7nc+6/ZvVXTTIvFW4s4/Nj8oci8R7lfsEM7107xx3fQsT
         wBLvMRLcLT6jPI3fx7QRxim7Cwv5/Hx9+bvYaSG5CutHcKx75KkUBepeYcvwSdt5C0
         ZRYp/LcQ9kZlg==
Received: by mail-lj1-f200.google.com with SMTP id v2-20020a2e9f42000000b00247e9c3f0e1so1034292ljk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 08:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QAEyo1xXNWnC/wTobDlvVW3kuxucr7Y+nryukeY/7zA=;
        b=cj6/Qeej6t9N0nLYuMGg1it2bLkNhyfj+5QGruif64yQrxSjJeCPVt0ZpZvcWlXILk
         sRRnUmjMFs6aWDYCIIMzh4fPgMSMlCcMMxBZZlhtVYPrHJRpAfFSRtg4dl4sHfccuUeU
         J2MQssNga4JuPCbb5t+LvyYeldRBKA5kNPiKgsCjpT6FKYk8p0N4qipj7+kJYReTdfca
         2Buwx+V/RohOzaoGXHxXQs8EamU8/EAR2lCp6q4mxYn5XI3Du/+UgSBspcAkDr7h6QKe
         cEP6PP0GbqQ5yCWtYC4rQ91zx/436xnEo8zbfTfC64dM5mCDWLHRktfRlrLuia0R3pvR
         0GIw==
X-Gm-Message-State: AOAM530HWeEnci/pMCsDuP5PzH5QO+3GV5cTEOHLkcAjnEximM54/x6s
        hsso9LZZgva3B2gh1UcEYSZmDDpuwLgNd4mjWuJl1b+UbrxSsQEoIz7JicWcU2+l7zicmv1B8cc
        qQZRMS33HHOxk4AXxlkpv5imV5iV4XvovRaycxHbnuOI=
X-Received: by 2002:a5d:55c5:0:b0:1f0:7672:637d with SMTP id i5-20020a5d55c5000000b001f07672637dmr349059wrw.170.1647443202244;
        Wed, 16 Mar 2022 08:06:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxweeXNXzqSiK6jLHKTzxTuSJXVd/nxHPvdpHWEAERfetg3Sykd8n3TukHieLMV78+GWu3x+Q==
X-Received: by 2002:a5d:55c5:0:b0:1f0:7672:637d with SMTP id i5-20020a5d55c5000000b001f07672637dmr349028wrw.170.1647443202062;
        Wed, 16 Mar 2022 08:06:42 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d59ae000000b00203dcc87d39sm3130155wrr.54.2022.03.16.08.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:06:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v5 06/11] s390/cio: Use driver_set_override() instead of open-coding
Date:   Wed, 16 Mar 2022 16:05:28 +0100
Message-Id: <20220316150533.421349-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use a helper to set driver_override to the reduce amount of duplicated
code.  Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Vineeth Vijayan <vneethv@linux.ibm.com>
---
 drivers/s390/cio/cio.h |  6 +++++-
 drivers/s390/cio/css.c | 28 ++++------------------------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 1cb9daf9c645..fa8df50bb49e 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -103,7 +103,11 @@ struct subchannel {
 	struct work_struct todo_work;
 	struct schib_config config;
 	u64 dma_mask;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 } __attribute__ ((aligned(8)));
 
 DECLARE_PER_CPU_ALIGNED(struct irb, cio_irb);
diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index fa8293335077..913b6ddd040b 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -338,31 +338,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct subchannel *sch = to_subchannel(dev);
-	char *driver_override, *old, *cp;
-
-	/* We need to keep extra room for a newline */
-	if (count >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	device_lock(dev);
-	old = sch->driver_override;
-	if (strlen(driver_override)) {
-		sch->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		sch->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &sch->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

