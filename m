Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9DEC4FC143
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 17:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348171AbiDKPql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348161AbiDKPqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 11:46:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4008101E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 08:44:06 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id s18so9287415ejr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IfKH2CI9M//LkZvjQ2ovL0RNbL5cFQ7ZiAOaiFFFhfo=;
        b=ibV3kGQKwcinaS1/iTDMsTIAihVjTtojxDgUre25vi954+OrzzCXK8ImxtuxVEAkb2
         Hg9OL2s+Yf0sIU3ag62n4Ww/agXCDQNz5u+5hwgF3rM8FvjzAS/cv77t3QdhbGi2/mD+
         0XAUrkKofi8LF/r3ulNzcVqr+YwXdWMoGhBIYA87ahdPZYM6pBWZKbmdU4Nkd0MRshwZ
         TA5ctc+Tgvmf8HPMTDqH+EPOlDdJv554KFI0zXq3pxu6zIQCOA1h93UhRBD5MSLmuJeD
         KvMLtcYHgtnubwq5Kasz3jHltnu7vd9PdyRo1xU3wl4I2ZXZnDcU9HfKbs2KU2m5cEhV
         LH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IfKH2CI9M//LkZvjQ2ovL0RNbL5cFQ7ZiAOaiFFFhfo=;
        b=EDjIjDvAvVDVzQ8aJfkfWwIEnz6+fQoFWp+QBT76S+aQaS95T8jfJ1cj56fxhku9di
         1wlL2HbqhU5LoSgcjKPWszucBT0airWdT/So2L/xa0mfyGsgNs77Up6x5FtlcRCQz/8w
         DLuNVq6pkd6Yb4Yt15aMOrBg1ILQtRthYcQ1odiqr4WzkBxdrUCYHvZ6j3Z+X+Ak3brf
         DX23dZJL4ALRIhDN3qvUYki3O1vaPamuV2paiBh+TYLwJE3Z40OTi3yAd7I377alxUPb
         JvPJd38Ktq9C4jZwmN5USodyxlYXHLHt18/Ie3aWnXwq5F2NvIH+nF5euSx3KQg0RYw4
         S8bQ==
X-Gm-Message-State: AOAM532h3HwkTmdzOw9wi5coMgNLZtT0OERBLRhxsxX6BbyuE8Wz7lk4
        WXvTro6CAONS4ZovTod6mV+3gA==
X-Google-Smtp-Source: ABdhPJxV0mCjni3ixH3ficisiO0VgzkFHoIXlralC8ju8qT8Yv+egeY0tlkfaqMPsRNcX8XOEFMyjg==
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id nd14-20020a170907628e00b006d9c6fa6168mr30508428ejc.132.1649691845390;
        Mon, 11 Apr 2022 08:44:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906608e00b006d1455acc62sm12173177ejj.74.2022.04.11.08.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:44:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH v2 1/6] dt-bindings: clock: qcom,gcc-sdm845: add parent power domain
Date:   Mon, 11 Apr 2022 17:43:42 +0200
Message-Id: <20220411154347.491396-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
References: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow Qualcomm GCC to register its parent power domain (e.g. RPMHPD) to
properly pass performance state from children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index d902f137ab17..daf7906ebc40 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -43,6 +43,9 @@ properties:
   '#reset-cells':
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   '#power-domain-cells':
     const: 1
 
-- 
2.32.0

