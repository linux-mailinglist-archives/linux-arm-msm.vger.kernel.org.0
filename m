Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C7B4DB42C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 16:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242473AbiCPPKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 11:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347973AbiCPPKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 11:10:11 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E033A72D
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 08:08:57 -0700 (PDT)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7B98B3F325
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647443335;
        bh=yPtLMahnwKOtCcXgH/ktoILLnjecC9LZzwZsY57u2dU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ftMAJmmPbXItGZhosSt7kztlKjwAy37ZYdveOU4ZWzeW9HQuFIu2Utb49ON/1b298
         yWNW0nkHqT6JrbbklEI4WN1t4PZZJ6bSNlUG91LNbihiudz1sYhd+ci7qXZ+572D0R
         da4/3IV4l1J7YRJD1pUM2UnPPKDiHkiWmGbXGFRlVZS/VpRZfqQ5SPpc8YWnwGO5OO
         9oSxLv7N5daV0WqgcG+P7hK6TU0tjUjPnk7XjWCGXQSwrkdB1OHSr9r8zn3F8AJ26b
         hwv4+CYATlanC9Ei9R9ANceGW02NLo+aYasl4vkEST03F+f6lnm2+2zIJoHD8rz2HJ
         Y+R9SffLHAtCQ==
Received: by mail-wr1-f71.google.com with SMTP id a5-20020adfc445000000b00203dcb13954so652523wrg.23
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 08:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yPtLMahnwKOtCcXgH/ktoILLnjecC9LZzwZsY57u2dU=;
        b=Hku4M8dVoVQz5FeOuTx8motjs5cbYY37mjnXj5l8ihD4FKrfCOYDbwWtNKEqbfuipM
         KDe04rhifHdpLesjXiDuLDVBXJuHV0/KfZmpH/p2VFfy8Cv/OCc+LMh5wdHNj6pKWbKn
         0mVeeiZOJj2jh5MHK2+E6fq0LyyvEG6H9wo8WBKhcuQ+Zu0sZtanjujqjFM5R3bMDKWj
         p8k0xesI1otB9LcYqroiaS9K9HrJCLlN6rBRSzke0XhiX9aZNFqDSYLBTQF5Z5afUM7L
         vyKoJFi/RvjqKoUDqZ96p5LFWbzEWspcNNRbZ8zeB9Pb8cXjIYZFxzgz8D81QUGcBrpg
         cUYg==
X-Gm-Message-State: AOAM532TVV6tX14CjS7v+D0BCjpiq8dXmgx6QaxBfg/NAyFr8JGoGKnI
        GiC13rtwJwW/dDjmBIcNz5UyVqcccY5jmB4FHHxHGEbtq0W/x7PO+vR6oXTzKRgk405Rhy9taac
        1KNDMW8Aq4AHSBaYqJzRr/OV7+KBnGUP/N24dwPfWOw4=
X-Received: by 2002:a05:600c:1e1e:b0:38b:b31f:7fc with SMTP id ay30-20020a05600c1e1e00b0038bb31f07fcmr6700412wmb.191.1647443335039;
        Wed, 16 Mar 2022 08:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLttuQcgADlzoGu5HiDZ52KZb2YEjo0lDq9KqKlAOh9CGx+bAznJO89SsLTaClQchjThu5dg==
X-Received: by 2002:a05:600c:1e1e:b0:38b:b31f:7fc with SMTP id ay30-20020a05600c1e1e00b0038bb31f07fcmr6700371wmb.191.1647443334858;
        Wed, 16 Mar 2022 08:08:54 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:08:53 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 07/11] spi: Use helper for safer setting of driver_override
Date:   Wed, 16 Mar 2022 16:07:59 +0100
Message-Id: <20220316150803.421897-1-krzysztof.kozlowski@canonical.com>
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
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c       | 26 ++++----------------------
 include/linux/spi/spi.h |  2 ++
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 6937cf2d59e0..34f311224c47 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -71,29 +71,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct spi_device *spi = to_spi_device(dev);
-	const char *end = memchr(buf, '\n', count);
-	const size_t len = end ? end - buf : count;
-	const char *driver_override, *old;
-
-	/* We need to keep extra room for a newline when displaying value */
-	if (len >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, len, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
+	int ret;
 
-	device_lock(dev);
-	old = spi->driver_override;
-	if (len) {
-		spi->driver_override = driver_override;
-	} else {
-		/* Empty string, disable driver override */
-		spi->driver_override = NULL;
-		kfree(driver_override);
-	}
-	device_unlock(dev);
-	kfree(old);
+	ret = driver_set_override(dev, &spi->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 5f8c063ddff4..f0177f9b6e13 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -138,6 +138,8 @@ extern int spi_delay_exec(struct spi_delay *_delay, struct spi_transfer *xfer);
  *	for driver coldplugging, and in uevents used for hotplugging
  * @driver_override: If the name of a driver is written to this attribute, then
  *	the device will bind to the named driver and only the named driver.
+ *	Do not set directly, because core frees it; use driver_set_override() to
+ *	set or clear it.
  * @cs_gpiod: gpio descriptor of the chipselect line (optional, NULL when
  *	not using a GPIO line)
  * @word_delay: delay to be inserted between consecutive
-- 
2.32.0

