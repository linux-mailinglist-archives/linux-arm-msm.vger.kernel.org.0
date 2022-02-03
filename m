Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C0C4A88FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 17:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352369AbiBCQqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 11:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352344AbiBCQqi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 11:46:38 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5B8C061401
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 08:46:38 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id t14so4732741ljh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 08:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8jB3QWFPq4tYyo9a6LQnVJfW1OWpkZK4X0yVs9VUaIA=;
        b=upiZmsHDarYV6iwQW1DlW79cmGmkJb2uWOokRc4WAwcuONG8v0taVQDKEwJheifFhp
         g/RzSBJtmQhsLPkhCKD/fXfkYe0ij4W/YO/gXQqZBP7EGG4D1TiO126bhJjo6EsBP0+3
         ypqXqeo84EhpiAFNVehcXO87sfGdQ/43EgRLxaWrpmqDmdqj7d/tMwRYdSC2rSmrCb/7
         5EOqURXReMMC4ACx2CxRMofbhlL7WEWmupdIZPKx8rItraA3sUt7WVKP8+UOBMHVwJlf
         xo6kog77+QKuQqh0x7PJ7xTVFsAfQ6QOQHug5wxxZlJmm+z2+viYl1dAdWeqCzADi5Ey
         TY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8jB3QWFPq4tYyo9a6LQnVJfW1OWpkZK4X0yVs9VUaIA=;
        b=X86IKeyKPd8X9lRuOlJd0ejylg4JroAing3YX7yl6wzf7KsyONcVQAdOcqyc6v3Ein
         /AFnFkWfDzTd6ojTloySWL+0gVFj9s0bJyCxpjSTR9DVb+ZrYXDZirNITTde/DXP+z9U
         4PMVPraQ47jxqZIellmLnhFVDe1ipndV7bQS64OGj6ROi3TUHsk4l1pcxcS26m+iJTfX
         mCpmNLfG+68eO30SI0xA4I0I8HngnKH5lJ1gEocEEPymyWG223V8DF/yoK500e4lXzH8
         hWiggAXcyDS/hs94D+y/K2pVHKfPFyHg5F6pGzXqh+l6IY9qHQA7Qrd7m5lQI8SoicTW
         8E0g==
X-Gm-Message-State: AOAM531dSycWZamOwQ147g0DV1yP87LT3aRRUhqtkr8cRBx5e7vndj1M
        a2oUtyFWoiBs+9CEB9vyj2cmhA==
X-Google-Smtp-Source: ABdhPJwIkL4AyrPYHs2BAQP+p95jSYywBKSJ62hIbgp1eN1PcZEpj4nIVyw/Q0DNp1Tv1rxo0HOE1A==
X-Received: by 2002:a2e:5ca:: with SMTP id 193mr23681605ljf.213.1643906796460;
        Thu, 03 Feb 2022 08:46:36 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id h6sm269999lfm.237.2022.02.03.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:46:36 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: i2c: qcom-cci: add QCOM SM8450 compatible
Date:   Thu,  3 Feb 2022 18:46:28 +0200
Message-Id: <20220203164629.1711958-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The change adds QCOM SM8450 compatible value to the list of QCOM CCI
controller compatibles, the controller found on the SoC is equal to
the ones found on previous SoC generations.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
index 7b9fc0c22eaf..924ad8c03464 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -10,6 +10,7 @@ PROPERTIES:
 		"qcom,msm8996-cci"
 		"qcom,sdm845-cci"
 		"qcom,sm8250-cci"
+		"qcom,sm8450-cci"
 
 - reg
 	Usage: required
@@ -43,7 +44,8 @@ PROPERTIES:
 SUBNODES:
 
 The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996,
-sdm845 and sm8250), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
+sdm845, sm8250 and sm8450), described as subdevices named "i2c-bus@0" and
+"i2c-bus@1".
 
 PROPERTIES:
 
-- 
2.33.0

