Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7A569E30A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 16:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbjBUPFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 10:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbjBUPFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 10:05:55 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27DD7280
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 07:05:52 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bo30so4216439wrb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 07:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hU12FqArPVLmpEr900EkmsHffMDqv7keP7H+/lbE0o=;
        b=0xwDX21OfpDIWBxbMXF/G+PdhB7KUalmzgO2jn0xC1tG72WJyjfR8nnlqH9MFVr5XU
         9nIUR00btwcTqieGpa8v8b8aJJju3M+KgbPco+1YFYOvI6OzXmoPkmyRrm3uekWk1Tj5
         RHv8kojqJTYHCxADJbOVU1qhwX9q2KlGvOk/WbTStzMfhWjg/1uaG0z1vs9kpUfcRXjh
         3DGb5vCNjiMRSitTUwRCWjGWeEkwY/z1JBOsKhZwevEJLNJ/MapPBG0Dyy8CdjiknEDn
         OCHdhHu/IJnyge15SuyCSmJOiWEi0u8MOhGr06TkCIpZ2LSra6giFRhAlB1vQTVj304y
         IvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hU12FqArPVLmpEr900EkmsHffMDqv7keP7H+/lbE0o=;
        b=K+A37H8L9AaqxaE8GH4Jz+UzpqN6p3VNGgvc49IKBhCn5xi1mPhldlZED3TnwlCPIb
         V9lP9ZDJnA4psHSp/M2X8Met3axrMj/k01d3FIqpxRworpm3vxSd1M0B4Fl0W5CjebYD
         UTmU0hpljr9T+0V8eN8qrJqkK5hp4qNw8cPTXT8JS6VuTAtvYHWFJHKOgWw++iQAC4XF
         /IUtzrGEm0de7XYRtKx0Kmzh2qMdbIvBtro0Bz7u6TMykD4OScWkiHJoDoVXIMpXuefT
         W9OsiM3JUve9+PobXqT7XywY0BZWaG4JWFrU1Kn7kEit1Q7mn8jKLXdyLK+eUIzeYTbE
         ugQw==
X-Gm-Message-State: AO0yUKUv/FVXfyhZQJbX5h+CsUyGYYdYoV1NWp/b9uE/7VNxyuGhKyna
        ET7qENL7A27aULkYusbnJ7j8sA==
X-Google-Smtp-Source: AK7set+vmrTR7zH0FX7OMl6Gb7mK6qabSOlJP7BIzOxfl4ndccToH4qGXYEbkhKNFfwEhoOXsi76XQ==
X-Received: by 2002:adf:e505:0:b0:2c3:dc42:5252 with SMTP id j5-20020adfe505000000b002c3dc425252mr4610327wrm.70.1676991951427;
        Tue, 21 Feb 2023 07:05:51 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4c24:722f:312a:76c4])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c3b9e00b003e206cc7237sm5331687wms.24.2023.02.21.07.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:05:51 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: add a compatible for sa8775p
Date:   Tue, 21 Feb 2023 16:05:42 +0100
Message-Id: <20230221150543.283487-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221150543.283487-1-brgl@bgdev.pl>
References: <20230221150543.283487-1-brgl@bgdev.pl>
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

Add the compatible for the cpufreq engine present on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index e4aa8c67d532..92693c33edf9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -26,6 +26,7 @@ properties:
         items:
           - enum:
               - qcom,qdu1000-cpufreq-epss
+              - qcom,sa8775p-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
               - qcom,sc8280xp-cpufreq-epss
               - qcom,sm6375-cpufreq-epss
-- 
2.37.2

