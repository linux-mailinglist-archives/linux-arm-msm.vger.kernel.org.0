Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9E567CDB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 15:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbjAZOXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 09:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjAZOXC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 09:23:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECB9113E4;
        Thu, 26 Jan 2023 06:23:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8F3161856;
        Thu, 26 Jan 2023 14:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1D0C433A1;
        Thu, 26 Jan 2023 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674742978;
        bh=yUxC+lcXB5W9v1WZ5zrNhza/r9HK2s/OODdAQcbHFZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ejj99tG2bXtibv0Ng9yQlXE9MJdkQmaWaL0uOnpkCg3SwDVglOIoDA5fejqAPS8RJ
         EGERQvMw0JYJqQD+Ap/SUbxyKdowiunvIXLcPUsQV1b8xZ+Q1fcPyIbiJgOWLg7UJa
         KUPDx7iNFyeyyb/owSwhQ4KVXsLYQ5X4P45n5yQucekf11FvNiigJguauSOVNUG+I0
         +ObVsbJuAHQghSVxwTgJ1mvTQb/FOqPLemd6RMX4jni30rmEJSLRaOX/rm/HF+7Zr5
         0ZQP9z5M2Xn39QEVGurUOcCGl+A/kQlUA7VTwVo/CqCedhlHTPuaTZ5qG0142S4WbK
         dwIXSEvs4Grrw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1pL39d-0006im-4E; Thu, 26 Jan 2023 15:23:05 +0100
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 13/24] rtc: pm8xxx: refactor read_time()
Date:   Thu, 26 Jan 2023 15:20:46 +0100
Message-Id: <20230126142057.25715-14-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126142057.25715-1-johan+linaro@kernel.org>
References: <20230126142057.25715-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for adding support for setting the time by means of an
externally stored offset, refactor read_time() by adding a new helper
that can be used to retrieve the raw time as stored in the RTC.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 54 ++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index b1ce246c501a..2f96a178595c 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -59,6 +59,37 @@ struct pm8xxx_rtc {
 	struct device *dev;
 };
 
+static int pm8xxx_rtc_read_raw(struct pm8xxx_rtc *rtc_dd, u32 *secs)
+{
+	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
+	u8 value[NUM_8_BIT_RTC_REGS];
+	unsigned int reg;
+	int rc;
+
+	rc = regmap_bulk_read(rtc_dd->regmap, regs->read, value, sizeof(value));
+	if (rc)
+		return rc;
+
+	/*
+	 * Read the LSB again and check if there has been a carry over.
+	 * If there has, redo the read operation.
+	 */
+	rc = regmap_read(rtc_dd->regmap, regs->read, &reg);
+	if (rc < 0)
+		return rc;
+
+	if (reg < value[0]) {
+		rc = regmap_bulk_read(rtc_dd->regmap, regs->read, value,
+				      sizeof(value));
+		if (rc)
+			return rc;
+	}
+
+	*secs = get_unaligned_le32(value);
+
+	return 0;
+}
+
 /*
  * Steps to write the RTC registers.
  * 1. Disable alarm if enabled.
@@ -129,33 +160,14 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 static int pm8xxx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	int rc;
-	u8 value[NUM_8_BIT_RTC_REGS];
-	unsigned int reg;
 	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
-	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
 	u32 secs;
+	int rc;
 
-	rc = regmap_bulk_read(rtc_dd->regmap, regs->read, value, sizeof(value));
+	rc = pm8xxx_rtc_read_raw(rtc_dd, &secs);
 	if (rc)
 		return rc;
 
-	/*
-	 * Read the LSB again and check if there has been a carry over.
-	 * If there is, redo the read operation.
-	 */
-	rc = regmap_read(rtc_dd->regmap, regs->read, &reg);
-	if (rc < 0)
-		return rc;
-
-	if (unlikely(reg < value[0])) {
-		rc = regmap_bulk_read(rtc_dd->regmap, regs->read,
-				      value, sizeof(value));
-		if (rc)
-			return rc;
-	}
-
-	secs = get_unaligned_le32(value);
 	rtc_time64_to_tm(secs, tm);
 
 	dev_dbg(dev, "read time: %ptRd %ptRt (%u)\n", tm, tm, secs);
-- 
2.39.1

