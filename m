Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDB547228C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 09:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhLMI12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 03:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhLMI1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 03:27:21 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1A6C061370
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 00:27:19 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id t5so49030909edd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 00:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V+6dBa0dpNiAQwBua/Vm565hJ98yro3E+rDoSxhzfnY=;
        b=lTwIXlkDnyymIXPmnEgC/IaaolT+Iv2oiXW9XoVoG0OH8QD9MF97aPfEUbilbu2/r7
         u299Wl6c/1wfuJttjTyGyeFtKhbYRWOsulOptrG+d/OpVVvIUInvv9R+PP4P91Q2Z4WG
         0oh256cbj9wwM/F4L3AGUgJFxJatW8eKIpVgLaybiV1pJOA3Y/0t1IkpiltdGUIe7wN1
         xp0V8wDNpkIXNimCNoQY7VeJodR8GaXJgK8PbCyaNoZLqKf0N5UbTuE11CPLpXDWq79l
         WWwBOk8oQSe+ndLg9BYeUrzcOGAC2Ndd2y20nBY0q1GxyU0Up/KfityPdbX5BpPfgeTQ
         V59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+6dBa0dpNiAQwBua/Vm565hJ98yro3E+rDoSxhzfnY=;
        b=CqI2ptP4B5ICKpO9Uf/X8aJ+1/5N+LiIjXNnvpsrqiNQvnoyPhTm1pRIPkeFjYMO8R
         5/7KykChY96N/8zO0YngtZs/ASmnjGtuw0byP5+TOaU9WL1nN/ImIK4XFlH+/Et9Vt0a
         mOngLsz+Rq6cq6r4U/WEn0wFyrV4NVdZy1460AkiKvj6cEx2+atNfvZWSsQPAnZ/LCia
         FQKmepeTKCvmRr4rBXflEM+za8FsGZTFSBsHx09UaU5ekwS7ZRcMztQlz0mnNQG3TNyA
         59ME8ZKAjaXJPIdgnQSbwNLBZHhCsYf+S3zmJKUvvafqg1uQRI3Ks9e+O3tcB70rwRn4
         17hw==
X-Gm-Message-State: AOAM532WwDX5nvG3Zc0bZDCbr6Cw+JFggPds3mU5ZHKCJ+PnhI1gztTM
        yJiOizbeWcMW1M5ta4h1Lcb6FMWaSQfdL7AeDgE=
X-Google-Smtp-Source: ABdhPJwVXB+mq+ZXbgybllyImpIV7Dlkqt4dop/0/+ZeKlyxBj1li9xcYHbotGeBCDYeBklsH6KgXQ==
X-Received: by 2002:a17:907:608b:: with SMTP id ht11mr41425453ejc.479.1639384037784;
        Mon, 13 Dec 2021 00:27:17 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:17 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] dt-bindings: watchdog: Add SM6350 and SM8250 compatible
Date:   Mon, 13 Dec 2021 09:26:08 +0100
Message-Id: <20211213082614.22651-8-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree compatible for the watchdog on SM6350 and SM8250 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index ba60bdf1fecc..16c6f82a13ca 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -20,7 +20,9 @@ properties:
       - qcom,apss-wdt-sc7280
       - qcom,apss-wdt-sdm845
       - qcom,apss-wdt-sdx55
+      - qcom,apss-wdt-sm6350
       - qcom,apss-wdt-sm8150
+      - qcom,apss-wdt-sm8250
       - qcom,kpss-timer
       - qcom,kpss-wdt
       - qcom,kpss-wdt-apq8064
-- 
2.34.1

