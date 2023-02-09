Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1721869044E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 10:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjBIJ6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 04:58:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjBIJ6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 04:58:02 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F418317169
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 01:58:00 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1066811wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvYqvUjEOwvVMdDGDMILd7HS1V3n/y7VgwwFCMdGQ54=;
        b=jF2uZvk0RjEIXCI+UDPP0/WDqQ+Z9DuTjD7k8WPzPIFsxTpu/EBS/JElhfsiY/nrTv
         Zs+2KPGXZbDyH/Byp/COfssPxbA22MpG/Hh3R5GI9h+zDPx62PfSSyZ6nUpMegqsRZYK
         ZaMG4P42QCWhz0CG+cTDgCl5MsP7Oi/NSMFskj2rq7U8AwAw4SOR7LSsEMG1/oU5471R
         N4AiWaASs6ZE9CIhI9AheIBIjmdwK9JXpLOuJAHnLZ1+cXUTzyQ2RkDImsawgZdqG4n2
         jBYGvPosPXoMesHsHILnCkHiLi9Z8SID6ICB+xQWpNthcBk95OMpxCqZu+Bzpa/IZjr8
         QRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvYqvUjEOwvVMdDGDMILd7HS1V3n/y7VgwwFCMdGQ54=;
        b=QraT42K2b8KThM9Fl3mt4hE/In7bC6JuQuArmwZewp/g77UXziIji3IqOfKNrz/W9r
         b/ULMu5qc2thZbikDUTKzRIgR5ghvXSaI1WziT8xVlyzwAc23as8e1m2oCpdb6NA5fOl
         gKCLwRDl3MIW5sL2s2OrjT+EeAD8qKvcVaP6zuiVtBtYC/EoiILGaMyOKnWuM0j5Twfg
         hqCihL0dlPfsMr52fVIqFKEk5OHaXfcpoEEpsDQvLXOpx3nc0o865GJigxD8FufmlAcZ
         FtmxYrEMCUm7dKT/f74S6APhqyaU9tUHzyIjqdLp/k22qolkJtqzlbvJpLwbFSLkgT/Q
         +Y0Q==
X-Gm-Message-State: AO0yUKVNlZRYJT/zh2xVIUzKLxAAX9Pz5AgIDHnID8BLQef3BaMEj5zA
        +OjUdg0dcalMFaO/eAX4cTVMow==
X-Google-Smtp-Source: AK7set9IFoRTak19TaodtOyouTZrkfIHH8qxaVQowsNOXZDgduIg9dW1YLJwY1O7YjosGV42ll4+zg==
X-Received: by 2002:a05:600c:1c85:b0:3e0:fad:739a with SMTP id k5-20020a05600c1c8500b003e00fad739amr3763834wms.31.1675936679458;
        Thu, 09 Feb 2023 01:57:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7e6e:bfb6:975d:225b])
        by smtp.gmail.com with ESMTPSA id c63-20020a1c3542000000b003df14531724sm4628913wma.21.2023.02.09.01.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 01:57:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 3/3] soc: qcom: socinfo: add support for SA8775P
Date:   Thu,  9 Feb 2023 10:57:53 +0100
Message-Id: <20230209095753.447347-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230209095753.447347-1-brgl@bgdev.pl>
References: <20230209095753.447347-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add SocInfo support for SA8775P.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e24895f98600..a951d0f7d3ba 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -436,6 +436,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SC7180P) },
 	{ qcom_board_id(SM6375) },
 	{ qcom_board_id(SM8550) },
+	{ qcom_board_id(SA8775P) },
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(QDU1000) },
 	{ qcom_board_id(QDU1010) },
-- 
2.37.2

