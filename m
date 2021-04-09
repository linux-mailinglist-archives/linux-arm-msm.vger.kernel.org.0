Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAB2359F4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 14:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhDIMwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 08:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhDIMwO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 08:52:14 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DDBC061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 05:51:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g8so9490023lfv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NHKrFew97Pku2Mis5p+VLvYGFN67YcYrFQJKKFDgqBs=;
        b=wIy/mHq2aMLYoIDzpXwzoZnpOZ4/tSf59LGJ00+4Pblp/7/3QYpnscpwmg3XDepSLU
         Qg9JyQ1VlAtim3u4XcptgZEST1H8pXwy1bjrejAoaZRmzj6P3YIYObhVurdjrVcn5Mwf
         /Nkt2Npiy9unla54V7ClsIoYu/QKGL+AmH1FmWVdwQ+NPDcB/YwYQgmdBgxhzBtumiFy
         vqz20Xbhn0rb7NUIQdzxZqt7tYd1tJAp+/VYJO1QDcNUJ79+CBAz5aYvRiHE9Yvl3SPz
         Pt+/riSQIPKpmbU8MipzTcXkIE8/Kui7I0O8oYWVQlJxEHRj2W/75oBCE9AKxL9aNp71
         AbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NHKrFew97Pku2Mis5p+VLvYGFN67YcYrFQJKKFDgqBs=;
        b=pSb1T34eK7ckewK8VqHi1t0/7OjrAOWdXwYaskTNnc8dvYE3PQWzYMJwd61KNq192i
         7Ku6+fvK4C+rQwXev4cHQZXi1mAqE0lLJ1oZYyPeGk7n4BK2HqJe9fmzMSzVWjTckwCF
         UuhLVsKQWecena8kCgloZsAJfuzAzWRBypgpPcdLox4pTTlDQcmG1p99nVVunr0YYeTi
         KidFzS4eLZbk1YfSLLRhwdxOcsTSTIuqkli5Z8Yk87oS3f2bCQCDfrcMhfUIP4+H6RwE
         eElw/sPX4aTtrdXQ9EnUu/KaUeHoCrOlzYpYO6FmzEHCodhZTyzrlTuLr5sCBbXX8tFb
         w+CA==
X-Gm-Message-State: AOAM530p3DoCsqMzCItTSWQOoTdobzOYWDWk5rSSJYJqjNErhDzEWCc3
        klVdL6drwyDrdQvaySa0Ze9jPh9nuk81nXyy
X-Google-Smtp-Source: ABdhPJzxseru43IFea5QDtzu95QQI0glf0FscdKUcwBZFu9gWjIQ+JwrdExLepDv8bNK9ZiXbTO6Kg==
X-Received: by 2002:ac2:5a0b:: with SMTP id q11mr10391380lfn.391.1617972718137;
        Fri, 09 Apr 2021 05:51:58 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id k8sm260510lfo.256.2021.04.09.05.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:51:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: qcom: Fix up APQ8060 DragonBoard license
Date:   Fri,  9 Apr 2021 14:49:54 +0200
Message-Id: <20210409124954.320529-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This file is licensed in some kind of BSD manner, put it under
the combined GPL+BSD license like what the bindings use, it
seems most helpful.

I wrote the whole file so whatever. Those are my principles,
if you don't like them: I have others.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 23 +------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index dace8ffeb991..1be467124a70 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -1,25 +1,4 @@
-/*
- * Copyright 2016 Linaro Ltd
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-- 
2.30.2

