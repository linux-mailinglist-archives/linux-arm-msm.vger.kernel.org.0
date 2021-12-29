Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC92D481590
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Dec 2021 18:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241028AbhL2REe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Dec 2021 12:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240850AbhL2REd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Dec 2021 12:04:33 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D34AC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id q14so80834440edi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
        b=N176GTGT9uTNBM/lNHY3viroE2j7RNyzIAGjMDuxaY+V0D1fgSqOgdkj7epPgiTGPt
         JWs++rwSKtKOm00NQTTSStWwOJAStrOxAXAt31ULVJ2KERgnhgR6pvu0ofJFWHOL6N/N
         gvr3SgzulkVNvRJqBhZzf/7YojmoO3mNH9a7R3l+a8wI9KrZ1dEIgJqJAwb30a8rUpdF
         EpGRJhVSJBas722q8AlK2fVsJHVnE77VwOG1RrcE/pXZm1zV2Fa8/fxGVRDDpVrVz0sn
         oDd+5LJnq3SQELHBtEqC8W6AivL8O+5qMg8275X6Lb02g/2IBnn5DoF/JKj1k7nj1cmk
         kGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
        b=i/4+OLCxTDVKmAukUeveRHTbwTsgNKTycc4zOL+PV96VzcX4g1WwGX8bSAc0Ld3T0b
         gGS6P4FN7HUCgai0M85ZEP/4myg1RDB+Vc84EAeYuYzBf3bOdbuKle1OwixHiTLjOsN9
         91Cap4xmuXJrPYYLIs//VRSX/BwvG8LCAiDAs9QD06O7jKe4v05gH5thxO0vMgrOiywW
         rrzGRY/w/QLO60Pj4IY2SCWEDujB1YWgzw9GZCFzoTanpbZvigANHmTfi72IUqu0ZR3w
         s+YNPbh5kXpSE/04zfCr7Hhw7NjrpqC+1clDOiDgiH+0Au7fE8JSxwLOo2bHdxhlHDf3
         T4FA==
X-Gm-Message-State: AOAM531o+pdguxTYr0FHIXHIEwginFtmBrP5EEZ/qG+KNgw3qAHQdeYG
        vt9MocjZ5lI2SusEw51VzL3uDD7geTYVb2dW
X-Google-Smtp-Source: ABdhPJx7fmCGVyYTONde3Afz2YEg3Ytza6u1AKO88xPsobuwvKKB+blwvg5emdFPJYP//+ZNe1xong==
X-Received: by 2002:a17:906:5603:: with SMTP id f3mr21611529ejq.272.1640797470828;
        Wed, 29 Dec 2021 09:04:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:04:30 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: backlight: qcom-wled: Add PM6150L compatible
Date:   Wed, 29 Dec 2021 18:03:55 +0100
Message-Id: <20211229170358.2457006-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatible for the wled block found in PM6150L.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index d839e75d9788..1c24b333c6e2 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,pmi8994-wled
       - qcom,pmi8998-wled
       - qcom,pm660l-wled
+      - qcom,pm6150l-wled
       - qcom,pm8150l-wled
 
   reg:
-- 
2.34.1

