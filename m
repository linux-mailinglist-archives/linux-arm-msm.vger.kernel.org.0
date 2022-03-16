Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122B14DB473
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 16:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357108AbiCPPLN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 11:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355094AbiCPPKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 11:10:49 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75206673E7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 08:09:17 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5CC103F609
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647443354;
        bh=0TkaUHsdiaalOGmdOdYbrrLuoBcQ76N1kyxAw52pHyQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=uaNX+6lTP9qmxnJ3NdTtYdL8r61fnXk6rEhWx3i5Nq/P7UvKmc2GmDDHSknp4zMN0
         DN6k0q4scQs4JWJsuungU52CfPVZ4TRJk9mp+AESmoJJ76uieOKBLMk+pdMDhUZYHX
         cFgvu7dsdECRwcu8FgNJAYV0vSG+d45rU7jDKp3cngCEXnF7vmmPS45ZhtSDmDcxmC
         YvSxLl1Fr5wbUwbOg0Z3lMdxzzDGbZCdEOtADBsnKAyiYZhb9JDAfc4P/SrKkMHWSP
         oGlSIVfOsPgZMkUUV0JxH6xFOjvhhMTRbF/cAwFAOm4ToXtyrrGKXGm+1MRDt+QuhB
         w+ZpzABl1lHHQ==
Received: by mail-wr1-f70.google.com with SMTP id k20-20020adfc714000000b001e305cd1597so656380wrg.19
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 08:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0TkaUHsdiaalOGmdOdYbrrLuoBcQ76N1kyxAw52pHyQ=;
        b=CPdRlY8iXtLCB+WNa2Zaexk6ZaTPokeDMQJ9PQJp5Xq6o+gXCteAHWoSpsUQQc8085
         5xg0WB9TzSIM4AoqZlARDY75VB280q/iqeIO6RDV4/+P6NucAsUwZHN3q6Do52uo6Gty
         zwxVBS9tbxRLxGjOuPuW+b2nEDldpanUv2Gs1Y8F1qG9W7ly5AGziTzPOKXWyRAdgt/q
         o6rhJ4zrqhRXXGikgH3XRm7j8XAsIDFRddLZDUWQD1nZGr+48tm7EylvpiN1Crcp1aqU
         12wz8kEfez6+gYA3EpOIm3k5e/cfhZ8uo7PLmgawX6l7aFbN0Vef+MStTBSkpOKYu48I
         5A/A==
X-Gm-Message-State: AOAM530S3g1DFSakz6Ks1NJqUNIUyABKuog7290qeIBORzX/u7ZBhpq0
        nmQfYS1CrYSsktNGBIvQmZa45IQd/Oh4T9wT//iCauE/8N0eKzbbBdGCTxAk7ZZdQAXOhi2gO9c
        vDGuUhKza62jIkN3yLgjXSfxpdu3+rYs+vDCaetUAQ1w=
X-Received: by 2002:a5d:6442:0:b0:203:dff2:866c with SMTP id d2-20020a5d6442000000b00203dff2866cmr272584wrw.465.1647443340521;
        Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnOg2aSuuzk/AN13SVnFGjUvC/KtTXL980cTeRfOeIj0D4M/X0M0ZN717fC4+xLvcCtZ4GNg==
X-Received: by 2002:a5d:6442:0:b0:203:dff2:866c with SMTP id d2-20020a5d6442000000b00203dff2866cmr272574wrw.465.1647443340291;
        Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:08:59 -0700 (PDT)
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
        stable@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 09/11] clk: imx: scu: Fix kfree() of static memory on setting driver_override
Date:   Wed, 16 Mar 2022 16:08:01 +0100
Message-Id: <20220316150803.421897-3-krzysztof.kozlowski@canonical.com>
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

The driver_override field from platform driver should not be initialized
from static memory (string literal) because the core later kfree() it,
for example when driver_override is set via sysfs.

Use dedicated helper to set driver_override properly.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/imx/clk-scu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 083da31dc3ea..4b2268b7d0d0 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
+				  "imx-scu-clk", strlen("imx-scu-clk"));
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(ret);
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

