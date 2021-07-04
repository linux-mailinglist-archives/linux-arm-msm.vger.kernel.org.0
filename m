Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF79F3BAAF0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 04:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhGDCn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jul 2021 22:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhGDCn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jul 2021 22:43:27 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBBBC061764
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jul 2021 19:40:52 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id m15so3468484plx.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jul 2021 19:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EI7/NQoCGJxDIiM6o8K9wW0libMiYZLN48mcVrvQP9c=;
        b=X3nGaSDHgPmczKq5oEf7op2ydIhYldAo35HwAUI/MHekRdVfThucwc67fxv9BMFhUi
         7qaCVnNfm/u5E1vtXzfWOfqdBHiwVFsFnTu2elrbNtGBRV4ntZNTIwzhIXajCLGnJY2e
         g0p9rC//YResjvM4ss5kZ/KVTxoL2buKLSbkZRBRlvlksdMqkHfSmZ5bv51Y7ZfQUDsA
         YxQzocmWagqvmBMjGgekBl5xdC5kInr7H3HUsdfEhiKlDbu93wOLjpw21569S0ziiyWh
         3N82oLOnOlj9Sh7sEPjZWV08DculUwIIZfycTjMkWg8mo/1WetzuaIo80kGOBudeWuKE
         O2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EI7/NQoCGJxDIiM6o8K9wW0libMiYZLN48mcVrvQP9c=;
        b=TKFDHwVVDMOcQ91+IWOtzZ2dW8lvWQa/mz3jpjuxJJpJb5X04qsZy0r2VeHQ5wCtKN
         lP0SHyG160qo5ugJnLO2e5kq5mYWkRJK+E8gceQa1ymwfeSyGLrnY6juFIrFmjBHacBP
         N6JulHea8SvcigaJxOZG9TJrMjP6+E+9gmPHWImw1YiVx5OrklNVEPzF6pVncsmKHY5d
         taPMJfh3o8CwaJi0TjPwQwnvfGvHmmlbeWXtHmIrMS/WgMqe2SSEF/z58W4G8joZySXJ
         dqKYWBGBNezKxWu45RT+nWVxe6K9kR4qAAcxCRcXWaboAjvDF1Z44Bw+ygKCIFzZxHcM
         LAJw==
X-Gm-Message-State: AOAM530u87Tyy6Zz+E3aGQiFipznw6P2rFUh6JyD0hDFXW/KN9kNME86
        DSvOSExwr2l1TRzp9YGCaUxzYA==
X-Google-Smtp-Source: ABdhPJymYbYf/FLkuFUtRlRViJAIGuXK8u5r24KVu5G7Iz3L26V+uQI+8W8V91Nkpmh7reenNsnfvQ==
X-Received: by 2002:a17:90a:eb11:: with SMTP id j17mr7726052pjz.177.1625366452234;
        Sat, 03 Jul 2021 19:40:52 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g17sm9394624pgh.61.2021.07.03.19.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 19:40:51 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: clock: Update qcom,a53pll bindings for MSM8939 support
Date:   Sun,  4 Jul 2021 10:40:31 +0800
Message-Id: <20210704024032.11559-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210704024032.11559-1-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update qcom,a53pll bindings for MSM8939 support:

 - Add optional operating-points-v2 property
 - Add MSM8939 specific compatible

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index db3d0ea6bc7a..fbd758470b88 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,ipq6018-a53pll
       - qcom,msm8916-a53pll
+      - qcom,msm8939-a53pll
 
   reg:
     maxItems: 1
@@ -33,6 +34,8 @@ properties:
     items:
       - const: xo
 
+  operating-points-v2: true
+
 required:
   - compatible
   - reg
-- 
2.17.1

