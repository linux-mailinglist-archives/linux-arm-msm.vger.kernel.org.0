Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644656585E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbiL1Swn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbiL1Swm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:42 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CB515F07
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:41 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id g14so17269836ljh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7w7cv/rycyo9tLFe/RTS7bl/f0qnn9z8JqftMfFPoY=;
        b=ssJAGw3OGc/uwlSkDVVP4yWViHQTldQNeYfRekBqa/1vZMnJv3z+RlYqThGQ+UVt4V
         EEh5uQVUas2tD6OWXyUraEV6wWwHM0dd692wcmnZp/L0RA7kvhyegxMXH37PM9ZzD5PN
         hdzGHov/Atbis8wGVbBWiqTziqZK6rwSHgvh8yPyne8UM3Iq08TssxjWRgOEDO+coiw6
         AJbkLnEzRvYabNZa/ZoSPkNEhVmEDfKqH8beATj9aF5/yqiJUipqFacUvl+dFFBw9yW6
         /fEYjz70P/WkLQrZuvJ8WvftckIGUWNr2stBth0DDku3N2QGHLTtieBOI/hAlChknPKL
         /1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7w7cv/rycyo9tLFe/RTS7bl/f0qnn9z8JqftMfFPoY=;
        b=mw5VeDU6XaNgp75EKxBnGt8VVxGPc+eCetPLxiXt8vvyhiHi59RJWkhcup0OoBOd5x
         4XDE9cms51w2xN0vpMyZNj9gtyoseH1pK9IHWysgc7ZA+i3UiaElX+kwPqGPw/hj6rsJ
         VuVimLaxkuMS6f0vtqka96oZVikS8oO06Ova1+vdEOV5IDlKJlZv+OxpVNOlMzxlUNp9
         fJ91oxOifCf08O9nuiWosGB0uBviUKJTrtmnupUqIyuuZYE9mZeEooWKnqehIVjM8pT7
         yZeqFXD8UoSFwQ3Co48lloa6MJfGigWIpzNq2XYFlihhnf1PPrVbziDzt+p5XdK3sIZx
         Ae3Q==
X-Gm-Message-State: AFqh2kp1MhQhTyRyk2RWYtDvYD4CEfptK+ru0iyyPSJG8GB/QobIgrdC
        HvXNOdMuZfrhcxLGUifqEpvBcw==
X-Google-Smtp-Source: AMrXdXsvzpwi/FuIhQ/1rnNN/ZuJ3dor/p/CpUsrlcpRii6ruHP0KtMLETkIXyjttXQuskBYoSTycw==
X-Received: by 2002:a2e:b553:0:b0:279:ee82:e0f4 with SMTP id a19-20020a2eb553000000b00279ee82e0f4mr5748918ljn.32.1672253559704;
        Wed, 28 Dec 2022 10:52:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 01/16] dt-bindings: clock: qcom,gcc-msm8998: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:22 +0200
Message-Id: <20221228185237.3111988-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-msm8998.yaml         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
index 2d5355cf9def..3c9729050d6f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -25,7 +25,6 @@ properties:
       - description: Board XO source
       - description: Sleep clock source
       - description: Audio reference clock (Optional clock)
-      - description: PLL test clock source (Optional clock)
     minItems: 2
 
   clock-names:
@@ -33,7 +32,6 @@ properties:
       - const: xo
       - const: sleep_clk
       - const: aud_ref_clk # Optional clock
-      - const: core_bi_pll_test_se # Optional clock
     minItems: 2
 
 required:
@@ -57,11 +55,9 @@ examples:
       reg = <0x00100000 0xb0000>;
       clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
                <&sleep>,
-               <0>,
                <0>;
       clock-names = "xo",
                     "sleep_clk",
-                    "aud_ref_clk",
-                    "core_bi_pll_test_se";
+                    "aud_ref_clk";
     };
 ...
-- 
2.39.0

