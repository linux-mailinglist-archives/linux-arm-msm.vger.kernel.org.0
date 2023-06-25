Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF08573D3D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 22:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjFYU0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 16:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjFYU0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 16:26:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2869EE5A
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:01 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f6283d0d84so3311620e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724759; x=1690316759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPFo4vKtlliqmSpWNYdoeOen7rdyhvMtSIlE/C3NlFc=;
        b=l7Iixw7bug4ZuSJSq92NLEKBeeOCDFLRM9fUqVow4EFu3DB144HUL/du2+0+zCmw38
         vEy76L7n9elywaxnpowMvUVRVjF4ikybsg3NBhGLVqoB+h68vzbzh/YARwIzsNWZBT7y
         jprdiGgckq8OsIgKeJ2cMjh6kX85s1yTwlsg3wtI+Z3MoInyi0Vmw9wcDwNE0yvFJpBy
         dlppI+O2/yjZH/Hce2hXZTbGyvGKBBFTJw/jetVNJDhZ3a4VchL6iMbY39+B0yOl2Vzr
         BJ7/rviOWoFTUkgOg3DYdbnGovehUPgBqTvM5Qtgg4CtCf9ml6WS+LeleUzXiDiJMfkT
         3ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724759; x=1690316759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPFo4vKtlliqmSpWNYdoeOen7rdyhvMtSIlE/C3NlFc=;
        b=XI33CLa+rBp9vR/XjexCnYDPWmXAaOrDMhtMuBWbH4niaa4fhZcDiQ/ThqaK/eaoun
         Sdl9iAdnN1ecAgM8u9ZBIyhuzFQr66mOUWjKsNIlbIoARr5wmuaVjF9zp9Czdn7pB3Nb
         0JPFk0dcmzjXg7fEwkKcAvjbETtskpVWZzfVo2F9xdlLut6Yx1byhD1Cb/WL6QSx24UL
         ZnO9G7dPsURaDHvtux0WvPPz6zewrHl9y3imC0x3Xt9ZJOVpqnz0RmpM9LlhCOiOSqnE
         n9c+Yzu+CgUX6On6ArtNCar/9R8kdi+dY/cvRIHLyUEqfz/i0IFCwICHGN+ra8Kfjrqv
         MtRQ==
X-Gm-Message-State: AC+VfDzZOWNoAihd78Hn1scH4LUZJn5CSR7OhNF0bRR3Oqg7HfbPjKWw
        UrYbkSGtyXhtpZr6GQaRol+PMw==
X-Google-Smtp-Source: ACHHUZ67qlVEM58Z7E3cNlLy9cCNX4saDLR1Z/Yn3BJTJjlnM0dntiGhCZ22xsM/PzVWdXYYb767cw==
X-Received: by 2002:a19:e346:0:b0:4f8:3b17:e0c7 with SMTP id c6-20020a19e346000000b004f83b17e0c7mr15294424lfk.7.1687724759483;
        Sun, 25 Jun 2023 13:25:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:25:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 11/26] cpufreq: qcom-nvmem: drop pvs_ver for format a fuses
Date:   Sun, 25 Jun 2023 23:25:32 +0300
Message-Id: <20230625202547.174647-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The fuses used on msm8960 / apq8064 / ipq806x families of devices do not
have the pvs version. Drop this argument from parsing function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 3bb552f498da..2a591fafc090 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -50,7 +50,7 @@ struct qcom_cpufreq_drv {
 static struct platform_device *cpufreq_dt_pdev, *cpufreq_pdev;
 
 static void get_krait_bin_format_a(struct device *cpu_dev,
-					  int *speed, int *pvs, int *pvs_ver,
+					  int *speed, int *pvs,
 					  u8 *buf)
 {
 	u32 pte_efuse;
@@ -181,7 +181,7 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
 
 	switch (len) {
 	case 4:
-		get_krait_bin_format_a(cpu_dev, &speed, &pvs, &pvs_ver,
+		get_krait_bin_format_a(cpu_dev, &speed, &pvs,
 				       speedbin);
 		break;
 	case 8:
-- 
2.39.2

