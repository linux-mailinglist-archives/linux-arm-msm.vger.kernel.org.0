Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB16B1B869C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 14:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgDYMx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 08:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDYMx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 08:53:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DC2C09B04B;
        Sat, 25 Apr 2020 05:53:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so12769693ljn.7;
        Sat, 25 Apr 2020 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8UzchNf6ebuUZU6Jtk0695PKv2lrQGXDNULzEQ+q9fA=;
        b=Jv6bVAzsBfbNsh7eQlEEx7re8eKnGVbFZIclojWTPhFn/75+eAXuoIQXDk5tW0mVbN
         VGAmOuLW/7QU9dMlN47hYSDiz424o/X1cgLhvG9bsRfwQhdwWZq3esxYTCukeG/TbFL1
         U1bdhVrW7wOwQwCmi5qgDVsm4Asp4v/rDrmCGxZIaqFnwfFpkjhLe2MfiyiyJPx48ofb
         GnObQjC2Qhijd2mo1tvKefmTmSUKOWoKJZi2e7DUp1YkiNEEk5YVjPiHDtGZkxh2B0Yc
         Ochy/3exOJeDuQTiVUacGoB2sfgro9w3bbc0137My9PqFy70x+FlzgluHYXHTOtO4Gh0
         Nkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8UzchNf6ebuUZU6Jtk0695PKv2lrQGXDNULzEQ+q9fA=;
        b=fr/xwv3lwWS0PQ+UvAfQ92ahoUeEAYEtz+p/od0atmGne3GvIXDSLoW32FDSqJTwIE
         cDrSnow8xqGJFXIzEgtRN9V4zGXToSRfI31DHdkWqj+NvdgvpIP1/cE91v62jdHu3nEK
         YBxM06s3aeKagpvXsmI9kzEm0Apq7esv7r/5SyH+zwjKt23TrhLIZMM52HW86htjAUkO
         wiJ6EXpLKgcaDwZTXrqOdkaDnXl+3I0UHXT/xgWc7/u7N757j1bqQZHEdwt2oYtcVLtP
         ahNVP5dY3PWurFRK+9+4y6WLW7OmhR0NSoXOB1mXOkqvXu+UmniMHRPjaSq2JquO87Ds
         k+fw==
X-Gm-Message-State: AGi0PuZOGosDuAc6cn/Qvjx12n5+0SdL0yn5Ybp6YcKELHSj0gmxLXWN
        C29vr7o+4DFgUiJ4kTDTc/uv7UefacpUww==
X-Google-Smtp-Source: APiQypL6/eBLN5bzQPHJ2ShWsgSL0nJcGXIijkmLET37+uDAzfhNZu6/xGArjM69tGipR5px0NZ7OA==
X-Received: by 2002:a2e:7e04:: with SMTP id z4mr9049872ljc.50.1587819236327;
        Sat, 25 Apr 2020 05:53:56 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id w9sm6016089ljj.88.2020.04.25.05.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 05:53:55 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH] regulator: max77826: Remove erroneous additionalProperties
Date:   Sat, 25 Apr 2020 15:53:35 +0300
Message-Id: <20200425125335.2674534-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In this particular location additionalProperties actually declares a property
named `additionalProperties` instead of specifying there should be no other
properties.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
Fix bindings documentation for max77826 regulator as discussed in
https://lore.kernel.org/lkml/20200413164440.1138178-1-iskren.chernev@gmail.com/T/#m9e9904560e68bcd98980fa0e68fe190525033af6


 Documentation/devicetree/bindings/regulator/maxim,max77826.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
index d4f0f958385a..19cbd5eb2897 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
@@ -38,7 +38,6 @@ properties:
         allOf:
           - $ref: regulator.yaml#

-      additionalProperties: false
     additionalProperties: false

 required:

base-commit: 8bdabd09ec86a993419c8c98a4f34c12bc902c6c
--
2.26.0

