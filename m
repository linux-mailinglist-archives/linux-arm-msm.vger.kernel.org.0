Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9C636F1A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 23:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbhD2VQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 17:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236695AbhD2VQC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 17:16:02 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FA1C06138F
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 14:15:14 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id y14-20020a056830208eb02902a1c9fa4c64so26159487otq.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 14:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kTyxnJ1yi531R5AZDzagRwpZVx/RNSIurfNN65budp8=;
        b=S6rFyfWZAPendWMKR6bwGEcvDFTkl7QZLv//CsPWs+gx5rzHkpv+sGP88ks6qDSNaH
         yHN6ZqScV5txpDI8SwAvPcaUDwIEgzHVsJBkGLgTb/4qwU28wKmqTdyUhxmMAnKd+ytL
         /18rCLhTWe8cX6f9HkzQLxy18ftGaLtCNZ7iq7juIYFOhmpM0o13hevqD7lhXRSMf+PU
         Bs03VQ+W355RD1yv/iSyz6EyealoMwz++a7c7AT5JTXnzZGfO75KsFhPvyqUxugGhreQ
         O00JjuuTaEmpw0pk+dRuuOVGwpnPVvQIUAE51vIpaL34lv+ia+ehFbCmiOdZ1s9qkZFS
         uySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kTyxnJ1yi531R5AZDzagRwpZVx/RNSIurfNN65budp8=;
        b=Ss005HNXOnjuY5OykWrX606pWkuerA1E87Rb2wSiykXtf9XUJh3v47ZqK8M2gZqq8v
         YzG4VKOvoMHa6MB4yr20d6aC2hTWFz1JvG/OYVe1J7D4Q7Q6Tsn4yk4kO9mtldYaUyc5
         2avuQqeZRNMAWx+cll2s5YsBvdCi/PM4zJC+ihm35UGy3iV1F8Eq5OLLjC0rWv3E1MFM
         pH2AUSX/uTaJXtVmK6153emYhODBgJ98C7L/xR51oUt6qacLIHxWUECNLbuW77T4PcVa
         X1KEVzp4Vq0VdGK1wmTcim13o7GIP54zK+9wfi58rjGmKSoV91WMGNkmiYtn5MFNOwvM
         oNAQ==
X-Gm-Message-State: AOAM532Gp8b47MVBuNt9NIsBMC9dTA2tbNkUy1H8WC0/QU/JYYQaq7Mr
        1K8KshrZzlUOlVlV1VLWFdKiXA==
X-Google-Smtp-Source: ABdhPJwI/aV509jX6FittC3nahit3zZyjvjjwFAwUQTbcgiygCVzFvo2c9Z6rxsC+CBfEC0jSr/55g==
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr1053267otl.290.1619730914250;
        Thu, 29 Apr 2021 14:15:14 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y67sm242707otb.1.2021.04.29.14.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 14:15:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH v7 0/6] Qualcomm Light Pulse Generator
Date:   Thu, 29 Apr 2021 14:15:11 -0700
Message-Id: <20210429211517.312792-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This introduces support for the Qualcomm Light Pulse Generator block found in a
wide range of Qualcomm PMICs.

Bjorn Andersson (6):
  dt-bindings: leds: Add Qualcomm Light Pulse Generator binding
  leds: Add driver for Qualcomm LPG
  arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998
  arm64: dts: qcom: sdm845: Enable user LEDs on DB845c
  arm64: dts: qcom: pmi8994: Define MPP block
  arm64: dts: qcom: db820c: Add user LEDs

 .../bindings/leds/leds-qcom-lpg.yaml          |  158 ++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  |   49 +
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |    8 +
 arch/arm64/boot/dts/qcom/pm8994.dtsi          |   10 +
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |   22 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |   10 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   24 +
 drivers/leds/Kconfig                          |    3 +
 drivers/leds/Makefile                         |    3 +
 drivers/leds/rgb/leds-qcom-lpg.c              | 1286 +++++++++++++++++
 10 files changed, 1573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
 create mode 100644 drivers/leds/rgb/leds-qcom-lpg.c

-- 
2.29.2

