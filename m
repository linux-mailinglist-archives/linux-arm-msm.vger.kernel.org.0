Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7A24C1BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 20:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbiBWTPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 14:15:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244275AbiBWTPC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 14:15:02 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F314131A
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:14:33 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 49F6140307
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643669;
        bh=rf7a9EFQwPOyocENu81tYUT+5dnJvDmCZPPvLR/17AA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nnCx6jS0XwjtguAvpGWTRIg6MxzCbqvy/JPPbAkS5/N5+uwhYPA26MXEtosgEmpy8
         tPZ3hPPsJRbRcShIN/oVV5WBWHAPd5Ur+JJfhaZYSuZ+6O1Rhf2imWnEQLKCbctiw0
         V8p/XGylVi69KKeMndh5q5qJ+xnLLxNK0LXt4eq/aRxw08IwGKMUQl/sRpZGcniHpY
         yIjhNughPnSLB/P18ma5fDzRCxddqSIZGkDIvs0lPJY8pEKOUP8h+GJ4bmMO0C3Bue
         Wd/7zl5OGPhN/ci0Vw44+DVqCSX2694MTc7yi7zDePxG9mt0i846kmaETP4jWEHusE
         VlLfJRHL0RYgw==
Received: by mail-lj1-f199.google.com with SMTP id 6-20020a2eb946000000b002463d2915d2so5464901ljs.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rf7a9EFQwPOyocENu81tYUT+5dnJvDmCZPPvLR/17AA=;
        b=SgwcElAAIaNh0dKqySFgecfC+6721tB+EsNWMRh4xrlKZ/dqqRxjpukm85o9fi9KUa
         SKKvTQoGSLeRpT9jUKgcZEF7XVSKUdWnPUkTXTwVBrv35dMoZVvG4uMsN8W9oRRKT0Ly
         7HL9h7VyUA968SYPHoZyI+8SEw+B6CgnyPeUaqPzsvhWYSlenZW/CnK31gIU+O69BHX1
         zibSTN4s8kggRpiEVkG418hFv8CwiKpa1/LN5mj0Hy/86GRBZPvZT97NSdzVoRZcHXNV
         Y5iwGQtcozbyWgLST7Se7CK8PN97lW2Au6ZO1Wmw8C8Rb1csxkb7N+Fn1M0EgM++Mz92
         hn4A==
X-Gm-Message-State: AOAM531ikkpZG7bFLhSejcNKFp+54VE697joTCR1DaOeLh7mOTC1hoyg
        jec/IKAwgi53rnmlOBiQKzCQt3ETnVLoG7jq/pTd61mvc25fZYoYM7ESZQh+3W3PogPa3XYJKWq
        SEjZoStCjMNXFJasMpp0LBCZjo+nAFyL49/+Q9MsWjuc=
X-Received: by 2002:a17:906:e244:b0:6cd:24e3:ab8b with SMTP id gq4-20020a170906e24400b006cd24e3ab8bmr856427ejb.633.1645643640106;
        Wed, 23 Feb 2022 11:14:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXgfLS9GHyX1kCvT/o1Mu24QLFIsYnwLPgsBOYcxKH/GiFu7jQtQB6sjAsK4TU39w3xnST4g==
X-Received: by 2002:a17:906:e244:b0:6cd:24e3:ab8b with SMTP id gq4-20020a170906e24400b006cd24e3ab8bmr856416ejb.633.1645643639914;
        Wed, 23 Feb 2022 11:13:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:13:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
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
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v2 05/11] pci: use helper for safer setting of driver_override
Date:   Wed, 23 Feb 2022 20:13:04 +0100
Message-Id: <20220223191310.347669-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use a helper for seting driver_override to reduce amount of duplicated
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/pci/pci-sysfs.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 602f0fb0b007..16a163d4623e 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -567,31 +567,15 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	char *driver_override, *old, *cp;
+	int ret;
 
 	/* We need to keep extra room for a newline */
 	if (count >= (PAGE_SIZE - 1))
 		return -EINVAL;
 
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	device_lock(dev);
-	old = pdev->driver_override;
-	if (strlen(driver_override)) {
-		pdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		pdev->driver_override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
+	ret = driver_set_override(dev, &pdev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

