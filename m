Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1EDB6BA184
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 22:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjCNVlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 17:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbjCNVla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 17:41:30 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76586210E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:41:28 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x17so5717770lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678830087;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KKHLLfrtsWXe/lqW7YIokdSzSsx0dBn73FbFOSIwxzc=;
        b=BBsE2tGZnpCOA02VUkzl3RGwxXm1x3FIXK70j80MWpuNeVHbKqhAhVwDhXC98jRx3D
         aMxoXuRLFXAIisOYdpG21AxBfspc3Qd8AkKMyws+rg2Orfddylr5l0shfqgRiDLL2v8R
         HbfHYwQQrfP1syrdWD146ijbH+F7eWYzUY+B9xRqLL/lAYWccrhwf6TCWh+OMPFsFzXK
         mZa+omRPwe5glcq7hEFriHPziCcu/eD2Bz2UeD38hRE3LtujrigNi+Z5mQYq+0pI/yWO
         2JojZwJSA3K9bSzzj5oKdwZeDOvTrxw08OYqpaYHL1lJSMjat78OJGhk/EzVo9feWY4y
         bviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678830087;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKHLLfrtsWXe/lqW7YIokdSzSsx0dBn73FbFOSIwxzc=;
        b=OuJoEcTd2D1w8U9jHpQQEZQGBMZ+6226+jlH5kXTV1FDhz03kgc0dydXM6dsm5s55s
         heAhAWsKcdEri0RLBJ3fzQ6K6jJJazesC2ndInRZyBioHSITHaGj+bcLvFPE1BA7XBHB
         zbjYRjbRUz6dbwSSFuVui7EqvFHv0hs0hh361vwTsDAsmwNlsfrxQjcMkOPSwntNt/CF
         YTvwIJGmWr7HtHTk6Uk6LsrwGLe5kbUSpRzWJBC2I1hLTmpEJM7qh6b/1ObJ2zYF6sou
         NKU+WdATPoIWP07aEQnJAhi3H8PSki+X30dwm/8fFlDkOeKs83PvMVsQ8j0eDe3fj2Xd
         QZ0A==
X-Gm-Message-State: AO0yUKU/KiJv7AsPrTKk+SXIkta1gVpeRInsiPFbyBNaUHkIl59bLGTF
        WLiDHhHb+escxyrmPsncv6w1qQ==
X-Google-Smtp-Source: AK7set99d2uuQGEHb/BW7sT+lJQk+Z3Ety7McPDqWDqhO7Xj8A+tDLJBduLDOEbKZN6uZ6UzoPGFJA==
X-Received: by 2002:ac2:491b:0:b0:4e8:49ff:8dfe with SMTP id n27-20020ac2491b000000b004e849ff8dfemr1213369lfi.61.1678830086860;
        Tue, 14 Mar 2023 14:41:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id g20-20020ac25394000000b004e81e9d77c7sm549081lfh.107.2023.03.14.14.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 14:41:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] QCM2290 socinfo
Date:   Tue, 14 Mar 2023 22:41:14 +0100
Message-Id: <20230314-topic-scuba_socinfo-v1-0-acd7a7ab9d46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrpEGQC/x2N0QrCMAwAf2Xk2UDXVXD+ioi0aeYCIx3NJsLYv
 1t8vIPjDjCuwgb37oDKHzEp2qC/dEBz1Dej5MbgnR/c0AfcyiqERnuKLyskOhUkF8hfcx7HcIN
 WpmiMqUalubW6L0uTa+VJvv/V43mePxLubGh6AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678830085; l=564;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ivtUQQdOkAYNfjgBDX+0HKIg7ItmilYOYvwpR8ESwMM=;
 b=2gDfxJZFyacU2ZhWO6zgdvJBW+hK7ZI8xuLXjhnMJlTAFWec+E/Sau+3KH1c5gd+EHwaDiVdcmLy
 H0qInb5EBiRIMmSnPtJZMyfO0YHvAYPdG+ebsQblA9mO7vU5Q0DA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing SoC IDs for QCM2290 and its robotics variant.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: arm: qcom,ids: Add IDs for QCM2290/QRB2210
      soc: qcom: socinfo: Add IDs for QCM2290/QRB2210

 drivers/soc/qcom/socinfo.c         | 2 ++
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: ec0fa9a0a6fac454745c930bdb8619d0a354bac9
change-id: 20230314-topic-scuba_socinfo-c04c25dd9948

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

