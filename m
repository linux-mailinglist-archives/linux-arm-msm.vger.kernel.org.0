Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6CD4C1BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 20:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244284AbiBWTPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 14:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244259AbiBWTPQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 14:15:16 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DC841317
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:14:41 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 01D253F1CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643669;
        bh=BfVj2+YbqU03eg9FI58FYBrziSuvlZ92uC4zdqn5CTE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nlRhbM7cVkJU9fZtdEVn0XL8fNKTW3XIav3LFc9LMv2jBMBjJj/TmYLVfELrRRgVj
         0pbOfm9ee9R1MGuIXd1kVbQt1S4LwSehHPNm++8A7lvseQb80s8klwuvOiiTr4/z/9
         DKzjDxs1gFHoG0LjG8+nC7GgW27SlQMrV7TiP5+Xk16WHS4YNxtXdY5k2jJ/gkUm66
         bECI8ahg+iI8r08H2ObeIP02TODqHlxrg+/HaBebMemZrnif8/MrLKVAyJyaHJd5rB
         +iS7FrTMaMd9TmB8QDdh3RFE/VBkNnFvODCntNgoNNXtjFIX6g7klmqRI6bOYNNrwz
         7I6vjuRlBpKgA==
Received: by mail-ej1-f69.google.com with SMTP id o22-20020a1709061d5600b006d1aa593787so3596448ejh.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BfVj2+YbqU03eg9FI58FYBrziSuvlZ92uC4zdqn5CTE=;
        b=huZrBB80GR4gOrtRFJ1dkFeT4zpLFRsWW95XtNE0ltPeV1SR8w8SXcF/Faen4z2/iP
         NSP5hLp+ubPRuy5OsMN2tj8feIrXilh1siZCapJWxTSJa4C/5JNOAWVtnRDruRzLqJ4A
         dGwF6fDKpcWBpxMxWyxA5SiHqovZCe0n+CuSCo+tMeDLlONBogIk+h0VX3Qcbiis3Fl/
         pjcXzIb9YPHxned7+64ckXHoKiGj09e7OyuAtlXjoZjBzFRP7YgD60bi4p78izsiFuW3
         tp9aJE8JRG3VBxqhOfQtlGz+Tg8VKiv5iUdJ/fQZ0zN9Io7XvFLhCCizT9X4ACH59dNG
         7M2A==
X-Gm-Message-State: AOAM532IstHflgnkhVHnyzlKPhQdQLF6nszunpmaaD/ul7AEXKjOkFxb
        f9Zk/nQYSi+s6ocNH+WH3A0MSo5cw6Iht50v7Nb+mWsfFQBoxmKoPgUAR0M0wdQYnlWJMmOhyIM
        NvkfLR22JKQ9sviXLXWLfDL140E9ZjL34kyaiHxfqkqQ=
X-Received: by 2002:a17:907:271b:b0:6b8:7863:bf3e with SMTP id w27-20020a170907271b00b006b87863bf3emr962531ejk.188.1645643642491;
        Wed, 23 Feb 2022 11:14:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXMYb4BEMYhrxOu6QSGckuJedkkcxoYAbkZ+2GxGDgO4kr7mPrVFflFNpyN2dv7nSCwE216w==
X-Received: by 2002:a17:907:271b:b0:6b8:7863:bf3e with SMTP id w27-20020a170907271b00b006b87863bf3emr962519ejk.188.1645643642300;
        Wed, 23 Feb 2022 11:14:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:14:01 -0800 (PST)
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
Subject: [PATCH v2 06/11] s390: cio: use helper for safer setting of driver_override
Date:   Wed, 23 Feb 2022 20:13:05 +0100
Message-Id: <20220223191310.347669-7-krzysztof.kozlowski@canonical.com>
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
 drivers/s390/cio/css.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index fa8293335077..2ced49be1912 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -338,31 +338,15 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct subchannel *sch = to_subchannel(dev);
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
-	old = sch->driver_override;
-	if (strlen(driver_override)) {
-		sch->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		sch->driver_override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
+	ret = driver_set_override(dev, &dev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

