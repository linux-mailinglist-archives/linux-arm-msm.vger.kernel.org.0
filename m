Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE933A509D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 22:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhFLU4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 16:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhFLU4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 16:56:00 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1824C061766
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 13:53:59 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b11so41271645edy.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 13:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xlYaRle/KBZdVqyKagtdFiOjMnJM8/KeL165T0BBTEg=;
        b=nLnuFh+nLohBsNgJOKq3QzSPVUvugPaDxgYnt2VZ+eBlPslWYWK36n85rk8/UvLMya
         XJVrq1UIKXhjfGNABp1yb0njZG7gJ33ssBy3MM2DsrXVOLYXa8GpUbHehjcS1/JpRijH
         zlZXnNnTJ4UFa5CeX8ZdNQeducqGBoKcPnwMqq0uXdk+Tl282W4IShor4s9OaN2oFyiO
         zuY1i0SA3X2uVCV3I/6O7XBULWIxHwf7arBiKJ+VttLuy92xxar/WE8nc0Zop5TnqYh1
         NraCOEFuF9EheonwWjTY5GVD1+bbK/IE7BxMs9FJvyguxqW23elarID5HtyTr3OBD8Bx
         V4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xlYaRle/KBZdVqyKagtdFiOjMnJM8/KeL165T0BBTEg=;
        b=fmaxb0RkzwB186BfAxeaK07hzKwQoJzlnTzzL+Xx+IwNCeL+Hg098v5Pf54YvGkxTk
         LkGnhq9Fs/Sz33bjksr7o7UZZ4MxOqXpHFVu7LY5vokO89IrD0a2Zo+j+Y51KbQBqSJA
         j6k/XOTU3HP8LFu3YzfJooyGBlF5yU48g4xC0vM30r4NvItbtFB5vFzibbeMR3C6MAKb
         +Ne8NhrFoWmExqbH1WcrTTB3DshCiW+v543p7w7kbHP2cFd9LliQNFlaJR1o5Gg407TC
         Cp54XQ0t1zFpUzVUuf05GkcyYQHjoBFUlCR5njbOtx1GmEwQm5hPz7UE3FEvnzutarrU
         +VXQ==
X-Gm-Message-State: AOAM5320iI0ptUzH4trg6v3qWCfMT2GlW/1PjWHOzyGX3AXbYuSczGnr
        3rYi4zJ7BG6W7M2Q69PNZPzycw==
X-Google-Smtp-Source: ABdhPJwHLDuHPg0VtenGkHarKw2PiL5QrFckPZGZN3u9kgjd+y98eRZb2Haq00sfLN5PzJEr8eEBXg==
X-Received: by 2002:a05:6402:5244:: with SMTP id t4mr3672905edd.254.1623531237180;
        Sat, 12 Jun 2021 13:53:57 -0700 (PDT)
Received: from PackardBell (192038129059.mbb.telenor.dk. [192.38.129.59])
        by smtp.googlemail.com with ESMTPSA id a2sm3574362ejp.1.2021.06.12.13.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 13:53:56 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id fb2a5c75;
        Sat, 12 Jun 2021 20:53:45 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [RESEND PATCH v2 2/2] cpuidle: qcom: Add SPM register data for MSM8226
Date:   Sat, 12 Jun 2021 22:53:35 +0200
Message-Id: <20210612205335.9730-3-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210612205335.9730-1-bartosz.dudziak@snejp.pl>
References: <20210612205335.9730-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8226 register data to SPM AVS Wrapper 2 (SAW2) power controller
driver.

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/cpuidle/cpuidle-qcom-spm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
index adf91a6e4d..c0e7971da2 100644
--- a/drivers/cpuidle/cpuidle-qcom-spm.c
+++ b/drivers/cpuidle/cpuidle-qcom-spm.c
@@ -87,6 +87,18 @@ static const struct spm_reg_data spm_reg_8974_8084_cpu  = {
 	.start_index[PM_SLEEP_MODE_SPC] = 3,
 };
 
+/* SPM register data for 8226 */
+static const struct spm_reg_data spm_reg_8226_cpu  = {
+	.reg_offset = spm_reg_offset_v2_1,
+	.spm_cfg = 0x0,
+	.spm_dly = 0x3C102800,
+	.seq = { 0x60, 0x03, 0x60, 0x0B, 0x0F, 0x20, 0x10, 0x80, 0x30, 0x90,
+		0x5B, 0x60, 0x03, 0x60, 0x3B, 0x76, 0x76, 0x0B, 0x94, 0x5B,
+		0x80, 0x10, 0x26, 0x30, 0x0F },
+	.start_index[PM_SLEEP_MODE_STBY] = 0,
+	.start_index[PM_SLEEP_MODE_SPC] = 5,
+};
+
 static const u8 spm_reg_offset_v1_1[SPM_REG_NR] = {
 	[SPM_REG_CFG]		= 0x08,
 	[SPM_REG_SPM_CTL]	= 0x20,
@@ -259,6 +271,8 @@ static struct spm_driver_data *spm_get_drv(struct platform_device *pdev,
 }
 
 static const struct of_device_id spm_match_table[] = {
+	{ .compatible = "qcom,msm8226-saw2-v2.1-cpu",
+	  .data = &spm_reg_8226_cpu },
 	{ .compatible = "qcom,msm8974-saw2-v2.1-cpu",
 	  .data = &spm_reg_8974_8084_cpu },
 	{ .compatible = "qcom,apq8084-saw2-v2.1-cpu",
-- 
2.25.1

