Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A48363531
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 14:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbhDRMaa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Apr 2021 08:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235116AbhDRMa1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Apr 2021 08:30:27 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4997C061342
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:57 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id h10so37405971edt.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=jxI71f4L5r2PHuL6P8eTxXCWATovgLqV9ms1eVcUgKCwi+hTiX9pD5PAYCGLrRRnsD
         bTVo7NJqPzuGTkPrW8xxSnUsIjNiQbftvHPsiMa/bBPqfkNPz534XcXYhyT61l0Ptlpj
         YpxMpuPdlKrNNP06vxg3z5/NfNpJS80Wbsvfj1Epu87eC/WOYvC59jPJI7ov+UmvgaWR
         nGpHz5GefQAuBh+n8idLvg7XXnYau2iV8Zp+3u6R+gbAMAyhdoJ5egOlHtymAixP9a8G
         I0qok4jXFSNgvQMMszsNHW5usoljDr96S8uANTNpjBCy8tbKx6/+qfpotCWlV48TcSOF
         OztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=Zt+oB9andYhuFy3dEzqAkvNAq2Qa+0gHDpt2QY5nbnDQV86OW8jpjJ5w6iFHd1QS60
         NG1QPUFpfkSIc8uC9gSczS4uLl7t7Y26A+BKkGS18qZcDIZOvdi91GTo9VQiEEOXN86C
         HmZ9Ooc7RoQj7LqTUaS7mH8A1R/05g9N481KKyJg+U9t9iXzt7UIAdh6dE4AwAOYQlrP
         AGKp8zYqhggTbPuowEYayKzHGqFjozeGZdF2zl9Q5/bfIJNG/Em0xz1IV6FRHHNb/RM9
         wHcxF8Ak2anqW9tMX/YZR7Gpr3iGRthV3efJgotC9tOl6AfPb60oo4bWehjY/L8fK5wo
         n7dA==
X-Gm-Message-State: AOAM531l8CXhBn43W3sVNhl7nVujXpXfwUYsR01DPZkvX76O2oeEl64G
        CE3v9Xittpehh4dkFahSTuml/Q==
X-Google-Smtp-Source: ABdhPJyGX/ftdays69q5ndkss6svGGpAWjC4/CJqNRxdNiBRdj2hPflxZYvnlGj4VBPrnuejAMbtxQ==
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr20062254edw.303.1618748996620;
        Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
Received: from PackardBell (87-49-44-144-mobile.dk.customer.tdc.net. [87.49.44.144])
        by smtp.googlemail.com with ESMTPSA id k26sm8483371ejk.29.2021.04.18.05.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id f2c73f30;
        Sun, 18 Apr 2021 12:29:50 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 4/5] dt-bindings: arm: qcom: Document MSM8226 SoC binding
Date:   Sun, 18 Apr 2021 14:29:08 +0200
Message-Id: <20210418122909.71434-5-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the MSM8226 SoC device-tree binding.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 11ec349d56..73902ce46f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -31,6 +31,7 @@ description: |
         ipq6018
         ipq8074
         mdm9615
+        msm8226
         msm8916
         msm8974
         msm8992
@@ -111,6 +112,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - samsung,s3ve3g
+          - const: qcom,msm8226
+
       - items:
           - enum:
               - qcom,msm8960-cdp
-- 
2.25.1

