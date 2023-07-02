Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15FE744ED1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjGBRmy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjGBRmx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:42:53 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0278E62
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:42:50 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69f1570b2so60361461fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319769; x=1690911769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3g6MqdL49Zw746Urhy4bMomELw3at37JA0MQmf1GuE=;
        b=XyOAorCbVJhHlABTTxrSiqvpmH84B9FRcTFOskg14oUyQ8673F0Hb+EIxSveJkzNXn
         PaslLsxPujCrNBjWef30FFU33/ijO7lp3w0JCjYe49/Ed0ziZnpUxmjgmNfa2Lhyh+FR
         +7LCyiMz8wBNk4zf28QL+BPfFLPbzyGA/zS082XOXUBTWYOBvSxq+rsmqlg3QhTeK8ra
         biowc48mDv9LepJPncePz12dHo4ho/61R5wrCONxSUA6hHYK8S3j0NcLsWoK/9olaZBB
         +5Aku1jnGfWhCiK1nxYmTTPhXRCTYMiI+uj47yYMaw/15PbpjwKuLZVas0ATU1kRmkGV
         SPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319769; x=1690911769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3g6MqdL49Zw746Urhy4bMomELw3at37JA0MQmf1GuE=;
        b=i1U28Vyg2s+FOE2sX9wZi4y48Lh2wgemEdwXMBVAaq1mdEh6JWUda5AoYYKYkQEX21
         eaSn7jV3Sv5wP5lpdi7KypGMMcoanVWXh9MPJfxv9+ScdYwrkm2Niuaf81T4RUBfqppQ
         btYoYott8naHz8yRw2eAO2U0L/vU2AFX19LFXE/P3U1FBGxzgnZKXzEhc0KNLGngeNQu
         GDtXVX9T+JQ819oog4RglEuy/7cSu9lYFDmck8MywCQxgQlr4lMzLX+YMHqNvzwuvNmH
         TMx1PlcVaYHTk4g+khuD2UyS2B4fzQoRAVLHDHF+jcwPK1gwHwpdE3aNY+xWwo0qC/nq
         BWlA==
X-Gm-Message-State: ABy/qLa1aOFJNFmX6Pb+3r6i8PyihGNDdZhqy5ofSu36O1zZTF9VRRuM
        MkhAE7Oof+z8Kg8av6YspQI1Jw==
X-Google-Smtp-Source: APBJJlFsCk9TTewguE2q66KIkVWwZwyJi4AYj2OmMKyzMW7r+4vde9GJMeZGnBSz8bgi8kmdmFp+lg==
X-Received: by 2002:a2e:9bd7:0:b0:2a7:adf7:1781 with SMTP id w23-20020a2e9bd7000000b002a7adf71781mr5882186ljj.2.1688319769170;
        Sun, 02 Jul 2023 10:42:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:42:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 01/28] dt-bindings: opp: opp-v2-kryo-cpu: support Qualcomm Krait SoCs
Date:   Sun,  2 Jul 2023 20:42:19 +0300
Message-Id: <20230702174246.121656-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Exted the opp-v2-kryo-cpu.yaml to support defining OPP tables for the
previous generation of Qualcomm CPUs, 32-bit Krait-based platforms.

It makes no sense to use 'operating-points-v2-kryo-cpu' compatibility
node for the Krait cores. Add support for the Krait-specific
'operating-points-v2-krait-cpu' compatibility string and the relevant
opp-microvolt subclasses properties.

The listed opp-supported-hw values are applicable only to msm8996 /
msm8996pro platforms. Remove the enum as other platforms will use other
bit values. It makes little sense to list all possible values for all
the platforms here.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/opp/opp-v2-kryo-cpu.yaml     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
index bbbad31ae4ca..4e84d06d5ff9 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
@@ -26,7 +26,9 @@ description: |
 
 properties:
   compatible:
-    const: operating-points-v2-kryo-cpu
+    enum:
+      - operating-points-v2-krait-cpu
+      - operating-points-v2-kryo-cpu
 
   nvmem-cells:
     description: |
@@ -63,14 +65,16 @@ patternProperties:
           5:  MSM8996SG, speedbin 1
           6:  MSM8996SG, speedbin 2
           7-31:  unused
-        enum: [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
-               0x9, 0xd, 0xe, 0xf,
-               0x10, 0x20, 0x30, 0x70]
+
+          Other platforms use bits directly corresponding to speedbin index.
 
       clock-latency-ns: true
 
       required-opps: true
 
+    patternProperties:
+      '^opp-microvolt-speed[0-9]+-pvs[0-9]+$': true
+
     required:
       - opp-hz
 
-- 
2.39.2

