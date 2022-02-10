Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7CC4B04BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 06:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiBJFIZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 00:08:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbiBJFIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 00:08:24 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799C6291
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 21:08:26 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 4so4768674oil.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 21:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=17HQ1lZ4Nfz73vYr3iF8T8txXNV0ECOTIWhcMcq56Ns=;
        b=MY0483PAAismrHYbFZFzShmOwL5Bjug/y7G2BDSpPqDsC3dbhYUAsmCP85NC5oTMAw
         RabL0o9i9iYRc6BV1JhmtUop9PRVeFYzXUdD0l7OIj7227F+vaZnf1r5a4Rs0FYzUdDz
         1AuW6LLRyVDuk/LsmboGoT4Q4SjwuJKuyB4SKpwAAGRAV8BOgxOyyNhiXkfK+fUWz32z
         unXibIaPtrwqkwC4UyGy2Srwq1w4VLAty5EIQRLlsxhUTnoWXtoTABGJ97jhLZDSXB55
         gPuW3DBHMD8J2i7DnKW5ISkkHXsPuKLc9gtMOaE8OrizMCLVBoFJ2pdCdHfV/OS0gAy8
         sssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=17HQ1lZ4Nfz73vYr3iF8T8txXNV0ECOTIWhcMcq56Ns=;
        b=uadgKoxkYfFfRLkNIbIV+oZhtaIxKh390lKGNwf5vRBxhHKy+dvjblwJdhPPX+ag6n
         RNvS8ZYy4atS7WsJLijFhiLiEuKJdJRo6sZ7sMGfo+l5rMj88D0tsDFzgJ8s3MyKlZTO
         8h057u9BckxgZx8gfNWsrAMDzk5oiByVGsT1uhDBWbAx21BuC0aobscjdQSr+trRCk5q
         Ajs8dEyuyBjsLyeLeJbKUIWcd1d5bYMO+pcOPhoq0wKRnd4DeBddvjV+34Gkh0SjN2Pn
         KZ+ZsdinSeMVkSnSaf2yvlQixYEU2wR3A/p6e6Nar9WYqtYykjalqlqWr4cPol6nX0zS
         8MPQ==
X-Gm-Message-State: AOAM530Mz/aux7/R7QAXsfNms9jiQvM1uFqsEmy5KWIQzFcpePgPK81l
        B2sUWh51lwwCE7M7gzXMO/dzNA==
X-Google-Smtp-Source: ABdhPJwCiMJEvUF1a9t7kam4kZ/xoR3EK6VXaI8vakYWaJc8fUukLGyPwT9ZZx9m4Dvk6OnjNH8j/w==
X-Received: by 2002:a05:6808:168e:: with SMTP id bb14mr363067oib.106.1644469705872;
        Wed, 09 Feb 2022 21:08:25 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id p22sm8915912oae.33.2022.02.09.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 21:08:25 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Add some more PMICs and SoCs
Date:   Wed,  9 Feb 2022 21:10:43 -0800
Message-Id: <20220210051043.748275-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

Add SM8350, SC8280XP, SA8540P and one more SM8450 and various PMICs
found on boards on these platforms to the socinfo driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 6dc0f39c0ec3..8b38d134720a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -104,6 +104,14 @@ static const char *const pmic_models[] = {
 	[36] = "PM8009",
 	[38] = "PM8150C",
 	[41] = "SMB2351",
+	[47] = "PMK8350",
+	[48] = "PM8350",
+	[49] = "PM8350C",
+	[50] = "PM8350B",
+	[51] = "PMR735A",
+	[52] = "PMR735B",
+	[58] = "PM8450",
+	[65] = "PM8010",
 };
 #endif /* CONFIG_DEBUG_FS */
 
@@ -314,10 +322,14 @@ static const struct soc_id soc_id[] = {
 	{ 422, "IPQ6010" },
 	{ 425, "SC7180" },
 	{ 434, "SM6350" },
+	{ 439, "SM8350" },
+	{ 449, "SC8280XP" },
 	{ 453, "IPQ6005" },
 	{ 455, "QRB5165" },
 	{ 457, "SM8450" },
 	{ 459, "SM7225" },
+	{ 460, "SA8540P" },
+	{ 480, "SM8450" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.33.1

