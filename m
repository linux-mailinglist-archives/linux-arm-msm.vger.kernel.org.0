Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6B6333515
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 06:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhCJFZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 00:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhCJFZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 00:25:30 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE546C061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 21:25:30 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id t29so11138976pfg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 21:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=00Qj3y18Y6HEZTQemqqh4Pl0Lyv+swPhAM+M8xYZg30=;
        b=HQ9BQEzxD10uSnjlp0tQau1zqNP1/AQG2ieW3xcPQZMFBQ/AFgIqZJfNBJkIztjKqH
         JsVzZvt7BWvGKJIH8CjXAK/fj6QVO03l/F6wKZZeCFpskXmHneQEI375vKdWp9xUqsxq
         g+VOFQOX8E2Fu4milwd7D3xnb/VVbd7cN88GuHts5IF03WVSiUmKeZM3TupXr2roB9oT
         TGBQXafPfOpVIuzxQvGRYluaBk6qt+XUEEX5QHn0FkTm/ya3EbPm5gw/Gvgj3hXC8Sek
         E+whyWF9itbCwqV91MF+ecgyCS5cqxG52nWHZ5524H/2xxKPJI47s9oaZ9mgPOZJcXIS
         TZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00Qj3y18Y6HEZTQemqqh4Pl0Lyv+swPhAM+M8xYZg30=;
        b=VyFI8dm66cIIKpFAH0aKwkNVMVQvdCjG3Bhyp05PPdg/x7di7aZJG2HEOngMGD15aG
         iTTr1Eb1IugnfjPeK2yJK9qF+29qD5/wN2QwwAhUwFiAfxk6fMHFY6l6ICd2DjYFZbM0
         lyMsvVwwGF3Jn2xKV+WiGZYKWaAPE7cWK7BtQQjzSWfcKzYxaDUL16xcNtAF04vpEy/w
         ok3vTZ0tyPjAjCxAADDJNIlLAvpBElQJlMMIy03OrHE1d+9tDp5l0DmmjSv37426Odlw
         qGkq8E3JX+Cg2Cj/zQlaREDcb1RV7CmV8SCRaxP2LMG+Bh+k90Ng8MmOoOqKDl+vOLZ8
         4Wyg==
X-Gm-Message-State: AOAM532xcFMWCjENmLUyepBVrm5BcP0rMP//LbC/FXm2JSAgabGY7tvf
        xp+GWXl1dcI3KySPQSqmPxoyNGL562B2lRAHwBk=
X-Google-Smtp-Source: ABdhPJwfyJA7R9hJ6TqvcQhg8m3LL00lMVdevq2ilYQbeQdkIkW5NLWx+2xHXbaKD10ANJEyIvRakg==
X-Received: by 2002:a63:207:: with SMTP id 7mr1298617pgc.346.1615353930118;
        Tue, 09 Mar 2021 21:25:30 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:25:29 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 1/8] dt-bindings: qcom-qce: Add 'iommus' to required properties
Date:   Wed, 10 Mar 2021 10:54:56 +0530
Message-Id: <20210310052503.3618486-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the missing required property - 'iommus' to the
device-tree binding documentation for qcom-qce crypto IP.

This property describes the phandle(s) to apps_smmu node with sid mask.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
index fdd53b184ba8..07ee1b12000b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -11,6 +11,7 @@ Required properties:
 - dmas        : DMA specifiers for tx and rx dma channels. For more see
                 Documentation/devicetree/bindings/dma/dma.txt
 - dma-names   : DMA request names should be "rx" and "tx"
+- iommus      : phandle to apps_smmu node with sid mask
 
 Example:
 	crypto@fd45a000 {
-- 
2.29.2

