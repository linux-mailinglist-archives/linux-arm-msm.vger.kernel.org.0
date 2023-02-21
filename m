Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 417DB69E307
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 16:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbjBUPFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 10:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbjBUPFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 10:05:54 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CFC4EC4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 07:05:52 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p3-20020a05600c358300b003e206711347so3296146wmq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDtAjKV2duI8aK39M5yuWp8bTPWDmPz63VxbaKpJyaU=;
        b=mxPXxnRgZbP4sgi3fRh1A+8DfgE14IuMc+uQhc3HfBC6JvkSQEK9MyWyjSOk70uOJC
         3YUppkPlJl2b7kmXkN0te4IMeuQn0L6y7a16uQB1teNNDjeQE7syu2ORY99hIEt0Fgj/
         M8sPx66WsTYdF6v2ikIRMJbt99h92qPQEZ0Gj1VUcnS5UydtdQ1mT5uPBjfORdxjqbQF
         uct4vuP/zYDnTpohSZTugLb1etyOzuTKLDWJ07bRKd1LaokdOTH+lHN9c/fBbDyJoDWI
         r+pWjUkOk4wdr9fg0xXB7r6QI4Aib8eSJ8pneX6MrUITfTwg4OjaZAZ60UpMG9uhBvaD
         zYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDtAjKV2duI8aK39M5yuWp8bTPWDmPz63VxbaKpJyaU=;
        b=n7LiHgktN/vsjyfxib3uCAiaXkRnjFHXOUYPOeG7SC1bac7F0ApvsXsw2gSXR6OJq4
         lkcM8Id/ahxfOnSsTwqygVH0ZF076U7BzjRjCjjYVcbIVLgsNGAR9Vsz8h0tSu4m3FP3
         R5INzfS39bNKkQRZU+FuAeUsIa6h75bTyQ+p/Z9BVWCk1uPo2UPn9Vcp0fuhvc9Du9at
         Rsdq2AT8QP/GsnBcLao3JFbPrH40Llr6q+inxKpB1DzZRpJxTbOMFuqXhionW7ZmZ67s
         DQdAXWIxe+/TqHUo58HEWfFoNbRB28HYowd0HIPPcONlyoKSf/NEpNH9fHoAsmgZ12QY
         U1rA==
X-Gm-Message-State: AO0yUKUUtbxke9n5NwNFVzRomv0t8ZxXUDE+rkx99x5QVpviyJER6Gkr
        2Y2WJ3SjUyurQ+hzzWlRQIPyLg==
X-Google-Smtp-Source: AK7set+T90fi3mhrfQgkbcCGizsm63S6+3QdA6P15+Pm2WdZCuRMEGRomXni96sDgrifOTCwGEGj3g==
X-Received: by 2002:a05:600c:600a:b0:3e1:e149:b67b with SMTP id az10-20020a05600c600a00b003e1e149b67bmr4736506wmb.18.1676991950469;
        Tue, 21 Feb 2023 07:05:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4c24:722f:312a:76c4])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c3b9e00b003e206cc7237sm5331687wms.24.2023.02.21.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:05:50 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/2] arm64: qcom: sa8775p: enable cpufreq
Date:   Tue, 21 Feb 2023 16:05:41 +0100
Message-Id: <20230221150543.283487-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the new compatible for the cpufreq engine on the sa8775p SoC and
enable it in the .dtsi.

Bartosz Golaszewski (2):
  dt-bindings: cpufreq: qcom-hw: add a compatible for sa8775p
  arm64: dts: qcom: sa8775p: add cpufreq node

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |  1 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.37.2

