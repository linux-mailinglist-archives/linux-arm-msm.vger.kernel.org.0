Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727DC31DC24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 16:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhBQP3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 10:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbhBQP0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 10:26:01 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05176C06178A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 07:25:09 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o15so2438439wmq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L1KI8A+esma4hYflQM0uYd5scP6Sr2iapwP5fLA1M88=;
        b=K4WS0WEUXE4BeMhWzkYflapBGnzfJ1xAh9rL80pOUhnFB5/y9YsL1LJxEsJ8/5n4Vo
         9/8IJYHuqP3jIxwW4x4Sk7N4TG1Ks/wj8HsrjvGZp4m92NXynoLCrOeb7LT9IZHWdU2R
         0FA2t5JPDxagcgiTWb6iWHEln84zQsBMg7x1Q4uQa/Dc80u4jfb+CmR3QDfLTor/AIiO
         hFhE/+bCpBk9f/pC97UjWtowej/LemnAvb5E7xt4FMn2xDDwRBk5SvqS/a8QR79J6rbl
         daxlIz2NEBFuXXaiC9+QKS+wjeBM0pXqMDiDj0mYvmzKWDgi1fhuiR9MToKAZXkvG0lT
         GruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L1KI8A+esma4hYflQM0uYd5scP6Sr2iapwP5fLA1M88=;
        b=ufZwf4tAmxIRbZR+uEjGfOFNLiDrGewZvwlgnFZFPM/Cd1ly882ApR+iz1YVY+LGNJ
         s2D9OyWoNlVsZvT2teQax/PHJFEMS6dVKxF/1YGIa3heCSQuJBrCFZIhxev5GJ0uKUiS
         vb0jYM4BuOdGe82EkXSTb2wD82TlBnVKU0nalYWmzHACK340V99/+rXIRpmT4XxJWG/n
         WdAe7XwT78XXHOAx49OyOnS37b5xbiwdv668Ke1fkrkUWJZVrAc2gTOhCb7hN4bzuEWh
         GqoawCnnLw/YpWh8zHpBS2UrOW6SZMmYHWQnK5ANHV4WE3a7uA+W86M5lxMomTE4BuHs
         1Dlg==
X-Gm-Message-State: AOAM532RUiMY8GuAjpQ+ZZNBSoP0RBqD72f8f2/U4Gn0NOc1XjJZF0q/
        j1PdxS6LNqgDspTq4TS7dJBl1A==
X-Google-Smtp-Source: ABdhPJzCteElT5TSbtiywRK8dhgOWzv0eEsBXQs82eXWAoWxR63R59cXkLga0PGbkrXHQ4dl1sGTmQ==
X-Received: by 2002:a1c:e402:: with SMTP id b2mr7639705wmh.122.1613575500979;
        Wed, 17 Feb 2021 07:25:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z5sm4511910wrn.8.2021.02.17.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 07:24:58 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@qti.qualcomm.com
Subject: [PATCH 0/2] dts: qcom: sm8250: Enable venus related DT nodes
Date:   Wed, 17 Feb 2021 15:26:19 +0000
Message-Id: <20210217152621.1714814-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds
- videocc
  The clock controller for the Venus core and codec blocks

- venus
  The SoC DT description for the core, encoder, decoder + associated

The second patch is contingent on application of this pending patch
https://www.spinics.net/lists/linux-arm-msm/msg80960.html

Bryan O'Donoghue (1):
  arm64: dts: qcom: sm8250: Add venus DT node

Jonathan Marek (1):
  arm64: dts: qcom: sm8250: Add videocc DT node

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

-- 
2.29.2

