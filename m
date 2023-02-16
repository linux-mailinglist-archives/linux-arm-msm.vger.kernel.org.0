Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8026992BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 12:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjBPLIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 06:08:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjBPLIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 06:08:30 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B7A1C7C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 03:08:08 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b30so1560982ljf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 03:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+O+pbAbqz0ncakc7kjAFIJNZPlWAoJghHrDomQ2uJo=;
        b=ABJcNBViId/LFgzzPqQ8fGMgiFzTXB39HzvdlCipNUEvcE7oIVERjcs4vqys8Dcmk6
         rgDKT+Tf/mri8ucHPKWsBdw9+3Eh9bcjdZIiBzTJkR7Ut9duLtC/TJFSD6GI5ekNRsfn
         ZmaIYN6MwWK6sEOrhL9jVczFEIMUajfJpaxXrsP2dOK8PUQPgZ82PMfI72O0nfHmhK2O
         XNcc9sa+46ywv0i/5KIrp4Cqn+rfjbF8fBXlxbiCOYwROgLKBiSfwAxduqUfG/wVWmpB
         rfs9SPYU6GgR7HHL0xm7En+TDTIZvam5gqikXG0WWGJM+SODA88MDWSmf8mKWU33gB7s
         I1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+O+pbAbqz0ncakc7kjAFIJNZPlWAoJghHrDomQ2uJo=;
        b=YNcCNAfOsdto15agEWia49MoM/qHkLBYmyP7k70s3bGy/g/i9Ha5PUNa03iAys+tUr
         cccMwTku89rqonLXq0vFYicVG0gj9Y8aSgkyqrCai/7HL1CHTaIfHgkgMdNuUO3FSErN
         CTwBTY6wfjktoCaIPIxxDVTagA8DU0QI9QakubgkF//iVxOlX2G6o6H+zacrkDXf3iR2
         v5omSzCLv03NZcAIwrk7V8VQgRxYtEFq9bttDkSSAfNmDlZ7pV4t25/g1qrt8m9MFR6/
         AOhb5M54cwdBs5MkmKxDK+pip9bRTcZzHnrjHXf844nfJ0uzVfr9lBq9gsl+rZxESh6M
         2Vhw==
X-Gm-Message-State: AO0yUKWZODuLnuzNNJNZa8l1BhaznQjCMddcenx2fQQolLQ08ROiEY6v
        +/9ZDHAtIeGMnh4jCJ2hLpwEn3jHIcQ9DD/R
X-Google-Smtp-Source: AK7set+T+PyD+3gP4rn3YTnaR3dvg4ebsWrnu4i6E/myhVZC0uXfNPSeUIbhVBiGE5KA8lfWMyVzpQ==
X-Received: by 2002:a2e:91d0:0:b0:294:666a:a38d with SMTP id u16-20020a2e91d0000000b00294666aa38dmr273771ljg.9.1676545686770;
        Thu, 16 Feb 2023 03:08:06 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id d19-20020ac25453000000b004db20d07decsm255993lfn.209.2023.02.16.03.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 03:08:06 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: Add Cortex-A715 and X3
Date:   Thu, 16 Feb 2023 12:08:02 +0100
Message-Id: <20230216110803.3945747-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles for the Cortex-A715 and X3 cores found in some
recent flagship designs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index a7586295a6f5..c145f6a035ee 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -141,6 +141,7 @@ properties:
       - arm,cortex-a78ae
       - arm,cortex-a510
       - arm,cortex-a710
+      - arm,cortex-a715
       - arm,cortex-m0
       - arm,cortex-m0+
       - arm,cortex-m1
@@ -151,6 +152,7 @@ properties:
       - arm,cortex-r7
       - arm,cortex-x1
       - arm,cortex-x2
+      - arm,cortex-x3
       - arm,neoverse-e1
       - arm,neoverse-n1
       - arm,neoverse-n2
-- 
2.39.1

