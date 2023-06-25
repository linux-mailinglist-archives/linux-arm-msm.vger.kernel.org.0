Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB4A73D3B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 22:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjFYUZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 16:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjFYUZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 16:25:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF3AE4A
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:25:51 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f86dbce369so3139320e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724750; x=1690316750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1S1is2cOz63gQMr+iNsqA7cGkmzXDgvApekIDI21n4=;
        b=IPkhDeBtv1Tnpg8MFffJbkZe8Qw0dogWowNIkFifoqYVxDORKYIYYPlyb6F6IfHPeP
         tr3QK9AaGNI+LbULrFXO6N0Cp2To2JnkHWl3XvalPdZMTmCCn7Qo8L5wlMMQxF6TZ7lD
         j5qI3nZbEw/Q+xu3PrAyFsMTF252S7iA3kodH+Cu+LCw0muhGCaYyCTlronFEDokJA58
         taQCRPi+jMxeSZO7qcOOlfl1zatPcatOwzdKQz94qZPMkJSRYVkvbnO7lnv3mK2yxe1F
         zINrIda5b29EP0ktnx+TnmUc+USWclm6G+iC2SHiLSjXvE3cDedNFUv/Zn4hIq25L26O
         edqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724750; x=1690316750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1S1is2cOz63gQMr+iNsqA7cGkmzXDgvApekIDI21n4=;
        b=aJauJ0AxGXmB3KwQ/Kz2RbczD40nC/0JtvaUMVYUnNx5ZILvra2yzxP4GrirH60WCe
         9RvtHTvDnVKBfgKBYsnz+yTFt4CYsM6lw+qV6NyaHR6M5Z3pbyN1LBKMwQ72WuC8Jg8m
         onNDGxBCIr/QEae/bjUEFO8vnE3+xHSnunqq0Z8sGOti5UhcWyemaA8/4C1TyytFIZSf
         NPbwFdXc3C8dxhoQ8FmbCS3Zxn0H3iVJBp8f/2JWrnxJwo7beWGEgYhu4o/23nc7PPwd
         oqzWNjv335V/hrqV8wEH5KxkMhPG3XUT8NaEaSTMNNHjW+EvYxde1TPFi/gB0YO0AWpt
         lfrw==
X-Gm-Message-State: AC+VfDyI9chB9UgB1jY0ZKLU4gb3Z0ELX4WMdkEvAkf2LX4QaG1/mxMn
        P2Vx2i5K2IBdTnLuT3C96uQyWA==
X-Google-Smtp-Source: ACHHUZ5CC8puO7GbHdrVgRG7ffiHWCvaGNAWdqGja/m0zKO+WEDCYC8YY0TOxxarPk33O5HZVXHo5Q==
X-Received: by 2002:a19:ca50:0:b0:4f8:578f:ace1 with SMTP id h16-20020a19ca50000000b004f8578face1mr13971019lfj.21.1687724749873;
        Sun, 25 Jun 2023 13:25:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:25:49 -0700 (PDT)
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
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 01/26] dt-bindings: opp: opp-v2-kryo-cpu: support Qualcomm Krait SoCs
Date:   Sun, 25 Jun 2023 23:25:22 +0300
Message-Id: <20230625202547.174647-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
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

