Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E349859723F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 17:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240552AbiHQPAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 11:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240559AbiHQO7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724C79D652
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:17 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id s7so734506lfp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=G7nHz7460NiblDwkfaLZP3QC942cYsdIM8XAFA/ajO4=;
        b=xhu7062byW5srvTZgmlr0Gi5Zcqe/kW+3jZ32Ov1MdEbKq9qCeL2gOMT61DhxAaUea
         REHu+UUtzTW4B3IFr8zbFNuWqIdLnnIctD/PMPIXOXulAz7LK9wZGVrtc2XI3Ule5h6C
         L68i4vEbDbshIuLOHjRTQkcgkyKNc19bwW1cklzo1jzoqtehB5NmJz2DqIsZhjylDWLM
         ft8KHSRprnb0aq9vrSEiudOdXU8kpvtwnKwB53l8rklww5eyCL0JpEcTlnGzU+Ru2KsH
         cidsoZkMa02MQqyWSrQUvHSY/KhLWCkgsVeQ3ULVJaorXlKMQxT3VON25UfPim91HADu
         u+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=G7nHz7460NiblDwkfaLZP3QC942cYsdIM8XAFA/ajO4=;
        b=AGZ9pTsz3JEhP4ozLHjoZEiNEhcaGDahQgsTgDhobe/FbhAbBPjLkR737kvq6+/n6L
         SvPuzi+ELFN4JqPSh6xl9c77kH4EL3BuRXCDWabtUGopk2RU7R498NTZD0ytU8mWQDlG
         VxK+avsde4r36qE1Sne6wVXNrj2o6eeVZPv0/g20fPdRn5Lemr8PfD5/+7FCwrWO3YdD
         iY4rFT8WCEH4wJdh1Ocxm4JdSC9dnr56Gn/eH1Y2r4ZC+1eqFanNWWwy7LqH5hD7aCEM
         cf0PzRWWl9VllBdu+b0Aw+cjpjvMUMSFEK+BCcepfOASPBO7/bcfm5n4QpukltL8G351
         p4Zw==
X-Gm-Message-State: ACgBeo1m297ZSacN8PhzDICLLc1TGRXbIjik/pMWYMNsuJvn6vacgPiY
        BeRYD3P2TxM3K3HOw36pWLwZNg==
X-Google-Smtp-Source: AA6agR5CflGf6Ulm5sfS96AzrkW6+DPrfrH5S9uAkWvc7HUFfAZsYUS+mW1zrKXcqTkN6veMvSSf9w==
X-Received: by 2002:a05:6512:2828:b0:48a:f624:28b0 with SMTP id cf40-20020a056512282800b0048af62428b0mr8459506lfb.29.1660748354715;
        Wed, 17 Aug 2022 07:59:14 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 05/17] hwspinlock: qcom: correct MMIO max register for newer SoCs
Date:   Wed, 17 Aug 2022 17:58:49 +0300
Message-Id: <20220817145901.865977-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer ARMv8 Qualcomm SoCs using 0x1000 register stride have maximum
register 0x20000 (32 mutexes * 0x1000).

Fixes: 7a1e6fb1c606 ("hwspinlock: qcom: Allow mmio usage in addition to syscon")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 80ea45b3a815..9734e149d981 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -121,7 +121,7 @@ static const struct regmap_config tcsr_mutex_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
 	.val_bits		= 32,
-	.max_register		= 0x40000,
+	.max_register		= 0x20000,
 	.fast_io		= true,
 };
 
-- 
2.34.1

