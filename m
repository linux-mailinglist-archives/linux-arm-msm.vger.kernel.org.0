Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A6E4C1BB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 20:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244231AbiBWTOy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 14:14:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244239AbiBWTOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 14:14:53 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72727403EF
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:14:25 -0800 (PST)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7C85B4005E
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643660;
        bh=fyZde4QL+5WSjtUcZmZyQ9LOCmYULjkOm0dq/nBIuzo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=qBQokoKPizZLZ2UnvkN5VQded3OZUDYY/lI3AaUtyPCslWX9C8iYDV79FjJVKWgsR
         S6DYndF+9pGS3EYK+tASbPwfg0i6rPObQ0OGnIUxWoqIphXizAE5TDRt00hwmM8NLH
         VHo0WpxTX0P3aIHQQUhLqDYj7BPdKiQ9zHYhymZR3lq9HC9HmnQsezrvHNBImknJ2x
         zobPILGpeX5aE/Up+rM51f2ebl7NLC9uUuxOgHVyJdCoY6/ByyuFzqKg27kicoh7WY
         FLg5r2wwE/jCCkn8vhSzl42QHXKp9fTuQOhm7eE850mUKEAdODehcNpKh7HgpxCoNf
         QH/ky5jmbWxZQ==
Received: by mail-lj1-f197.google.com with SMTP id n9-20020a2e82c9000000b002435af2e8b9so7753601ljh.20
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fyZde4QL+5WSjtUcZmZyQ9LOCmYULjkOm0dq/nBIuzo=;
        b=hhyc+3Ho+oWyX1W/F5gHSdjQArUd3e1eSjT35P3A4dliJdvwbqi0cTdBOu32x/dngZ
         g2JEQj4obrnDgOgov7VYulOgTW8yGrbYhJxAu4oz2f6NcC/UmNxJDExa+7sWOZlSST3W
         u2H5R5iq7GDwLFPEM3Ub3J0ntWjs+zCoBlk5bHnnvuRFUHE2Gswwi6GpM4mMnTWF7PKw
         AZcUmPtmgq6wL5UTIRyxdievScs8KZaGMp+lc+0ofuw9qoDrg8/FRLDVVlSzTXOVzLrB
         1cj407mEc5fExLF3Z9hINq3AeW1FszcFbIYtHmbT1pw4AWgC3/TyaoqVke6vQ0tuVjHk
         1CWg==
X-Gm-Message-State: AOAM532tKmOjKySsC36PIhtU4hQlK8sdIQwMhLEU+1UABsopqO04/kOW
        FXKZRWCUgMnplgFY91DdoeelJ4GxR4FJ4a4N99JAbv23ZfC5o9mHWmN8KWjCT6fRKGh7sku95Ch
        YX7IwAq6F1hq0Xp1bqEcC8WYN0rD5Bb7t78DXG2HPHag=
X-Received: by 2002:a17:906:a384:b0:6ce:c3f4:c59a with SMTP id k4-20020a170906a38400b006cec3f4c59amr870098ejz.580.1645643635871;
        Wed, 23 Feb 2022 11:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQC18HONgcYdOr4fLdW/4QMQU7ra3n8dm0IepMHQhTlzr1OkJDjXXGMuSAKvUFTDXd0c3row==
X-Received: by 2002:a17:906:a384:b0:6ce:c3f4:c59a with SMTP id k4-20020a170906a38400b006cec3f4c59amr870048ejz.580.1645643635630;
        Wed, 23 Feb 2022 11:13:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:13:54 -0800 (PST)
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
Subject: [PATCH v2 03/11] fsl-mc: use helper for safer setting of driver_override
Date:   Wed, 23 Feb 2022 20:13:02 +0100
Message-Id: <20220223191310.347669-4-krzysztof.kozlowski@canonical.com>
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
 drivers/bus/fsl-mc/fsl-mc-bus.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 8fd4a356a86e..d93f4f680f82 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -166,8 +166,7 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	char *driver_override, *old = mc_dev->driver_override;
-	char *cp;
+	int ret;
 
 	if (WARN_ON(dev->bus != &fsl_mc_bus_type))
 		return -EINVAL;
@@ -175,22 +174,9 @@ static ssize_t driver_override_store(struct device *dev,
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
-	if (strlen(driver_override)) {
-		mc_dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		mc_dev->driver_override = NULL;
-	}
-
-	kfree(old);
+	ret = driver_set_override(dev, &mc_dev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

