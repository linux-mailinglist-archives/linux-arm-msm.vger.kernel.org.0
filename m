Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0741D29DB3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgJ1XqT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgJ1XpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:45:22 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A196BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:45:22 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id h196so657197ybg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pjMjmENtYUj621klFYYU6RWKKnbIsd5hygGgsndT34=;
        b=PCRgtAydIUY+L/sB1ctbgzy5LolXIozx/vTA1kQsZ3Bfm21b/kEnBbAIsHqQtGATrs
         WNoxj/N4WLvAH6GObloXatgZNrSivpxy9nbVPCBh9B3OnJOU4HBWSwfZXqkIJnYEsd4l
         DrUkgJCXFVI4DJExXnNcGvXPW5SPEysYJkRAmcV4IIfx9IpjM5GIb8z17L7cm2HP0zdP
         ckjmHyoewkVAI4AupOH4trsLjDeGLRdrJewJeIWNbiyWisTVysLeB0PlNxfQOuCRf46y
         lfwzaM1d7Jrzg1zC4ccCjg24NcDhT0hqEHTGZADIcGyjpmO96PYVp1Qb0aMSQQLak3H6
         H5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pjMjmENtYUj621klFYYU6RWKKnbIsd5hygGgsndT34=;
        b=DAt+a7Cv3ETazFW4CLY2B61VoQgsi2DO2oqfeSQ38dGeLs8e2M8OR74YQ9XgzDKWvU
         sJbjkRfnzpcBMdlhG1OxHbZ+7aycqTuuIB3fIos/UiCNMqVQHTul1/GyNXKdCsRZwrGS
         hD4wrK8ZYgiwWPRkljQGzoMMDVDPB91Zj+iB9i00H3+0TSmUR9Kj/ZrBRZDiQ149ErXd
         Ss6JJA4VogBYzzS1t1aafaVXXEUoblJ/fdoBYg+EZQrIgVH8ZQETnfqdeIJ2yQq5pVRs
         gNhaY7wAl3kqRBRnBb0I2P+YLZ56Ul7PUzmMURa6yBtj4Hy4Lw9HFSfXGYPzvHClqn25
         XHmQ==
X-Gm-Message-State: AOAM533dEqAXFL6xtTRfxPknbYCqHitW21B7t1tDLr9aG6Bph8RL71lr
        G11QmXF9IYBpoaHfP2A633H0f2wmhyOrFQ==
X-Google-Smtp-Source: ABdhPJwfeZapuZ+9lvwIuDhnpi76l3f17jnxbk+XoJjRCMZkvvRxulr2ODP2TBVAvkZYDv3vePJZlw==
X-Received: by 2002:a05:6820:100b:: with SMTP id v11mr4338189oor.87.1603859773332;
        Tue, 27 Oct 2020 21:36:13 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k51sm1895884otc.46.2020.10.27.21.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 21:36:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: sm8250: Specify PDC map
Date:   Tue, 27 Oct 2020 21:36:42 -0700
Message-Id: <20201028043642.1141723-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the PDC mapping for SM8250, so that gpio interrupts are
propertly mapped to the wakeup IRQs of the PDC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index 826df0d637ea..af144e724bd9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1313,6 +1313,22 @@ static const struct msm_pingroup sm8250_groups[] = {
 	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sm8250_pdc_map[] = {
+	{ 0, 79 }, { 1, 84 }, { 2, 80 }, { 3, 82 }, { 4, 107 }, { 7, 43 },
+	{ 11, 42 }, { 14, 44 }, { 15, 52 }, { 19, 67 }, { 23, 68 }, { 24, 105 },
+	{ 27, 92 }, { 28, 106 }, { 31, 69 }, { 35, 70 }, { 39, 37 },
+	{ 40, 108 }, { 43, 71 }, { 45, 72 }, { 47, 83 }, { 51, 74 }, { 55, 77 },
+	{ 59, 78 }, { 63, 75 }, { 64, 81 }, { 65, 87 }, { 66, 88 }, { 67, 89 },
+	{ 68, 54 }, { 70, 85 }, { 77, 46 }, { 80, 90 }, { 81, 91 }, { 83, 97 },
+	{ 84, 98 }, { 86, 99 }, { 87, 100 }, { 88, 101 }, { 89, 102 },
+	{ 92, 103 }, { 93, 104 }, { 100, 53 }, { 103, 47 }, { 104, 48 },
+	{ 108, 49 }, { 109, 94 }, { 110, 95 }, { 111, 96 }, { 112, 55 },
+	{ 113, 56 }, { 118, 50 }, { 121, 51 }, { 122, 57 }, { 123, 58 },
+	{ 124, 45 }, { 126, 59 }, { 128, 76 }, { 129, 86 }, { 132, 93 },
+	{ 133, 65 }, { 134, 66 }, { 136, 62 }, { 137, 63 }, { 138, 64 },
+	{ 142, 60 }, { 143, 61 }
+};
+
 static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
 	.pins = sm8250_pins,
 	.npins = ARRAY_SIZE(sm8250_pins),
@@ -1323,6 +1339,8 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
 	.ngpios = 181,
 	.tiles = sm8250_tiles,
 	.ntiles = ARRAY_SIZE(sm8250_tiles),
+	.wakeirq_map = sm8250_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sm8250_pdc_map),
 };
 
 static int sm8250_pinctrl_probe(struct platform_device *pdev)
-- 
2.28.0

