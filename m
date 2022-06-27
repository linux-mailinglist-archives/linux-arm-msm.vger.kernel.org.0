Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DCB55DCD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234378AbiF0LPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 07:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbiF0LPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 07:15:06 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1AD64FF
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=K4NMIcLvgXEpj+bXVjTFu2L5k2WlTzyocNMqodrm3NU=; b=mvwfVneYzELaZXs+GlASrrPNJg
        sgT6j7xpRcsSJNvyEBAxrBnM14nKQjvmt6mQvFRG5xT1bAl9OISdrGEiavFz27aYLNeZtrxaBxawR
        c7xHi8/CnVQ6VNwSVVjBSTxHtMh09d3F/gqXwlhXcry4xrlPMiuoWjvyXJ8yiyjFBXPpI0TZcwby4
        R52MUqBdkIyWsLnPbtjSJWlniernhUGX3CCo64kE9HF3yjpw2fen9fSndaEon/wQIjTUojCB2PyVK
        HmtsKFfieyaeClIA/jRFFNLK2k7oX0S0IuCd6WJU8j7UL25LQfp3PWK160T36yw9kuYK3ItKfJGor
        Wscpixxg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o5mhm-006C6l-U5; Mon, 27 Jun 2022 13:14:58 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 1/3] watchdog: pm8916_wdt: Avoid read of write-only PET register
Date:   Mon, 27 Jun 2022 13:14:30 +0200
Message-Id: <20220627111432.2625168-2-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
References: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PMIC_WD_RESET_PET is a write-only register that is used to ping
the watchdog. It does not make sense to use read-modify-write
for it: a register read will never return anything but zero.
(And actually even if it did we would still want to write again
to ensure the watchdog is pinged.)

Reduce the overhead for the watchdog ping a bit by using
regmap_write() directly instead.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/watchdog/pm8916_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 0937b8d33104..670cd79f4cf9 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -58,9 +58,8 @@ static int pm8916_wdt_ping(struct watchdog_device *wdev)
 {
 	struct pm8916_wdt *wdt = watchdog_get_drvdata(wdev);
 
-	return regmap_update_bits(wdt->regmap,
-				  wdt->baseaddr + PON_PMIC_WD_RESET_PET,
-				  WATCHDOG_PET_BIT, WATCHDOG_PET_BIT);
+	return regmap_write(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_PET,
+			    WATCHDOG_PET_BIT);
 }
 
 static int pm8916_wdt_configure_timers(struct watchdog_device *wdev)
-- 
2.30.2

