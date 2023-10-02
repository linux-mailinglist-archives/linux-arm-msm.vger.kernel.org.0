Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C4D7B5AD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 21:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238493AbjJBS7s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 14:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238509AbjJBS7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 14:59:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14391B8
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 11:59:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50435a9f800so32366e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 11:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696273182; x=1696877982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXetwuwd7eyQ9A3g1yCGm8/1oY3jPgf1yMAkZGiV+mc=;
        b=SPkqjC6IJnIPlumbAYm4nu9q2TgH4/KlMAFeFaXF3nXK/lO1Cb7ObacoaNmJ0fYkID
         +2CWF7W4kWERi3dke9Bc7ga4bE7GvH/vr974woxskuqdw79/lIBvsj9tOfnvnzrl3S/F
         7izcsyX8wIFk69U5Tto1Me4+R7FHUJLwhMJo+SloVLOSZgAVTYTjYRjxpBNA+/VYbTOV
         cNROSXJiDHK7nV7pC0CS9uMSLsDDI2MGbCGWRAQQ5JdEmqz53qMhvgjKOcZ9a0NFKBK6
         t7aNoYTRVSeYGbUwaTERS5DLgxqxsc4NSmufJoVGN7yhPkozAp2xgERbSU8It1H+S5rv
         LUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696273182; x=1696877982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXetwuwd7eyQ9A3g1yCGm8/1oY3jPgf1yMAkZGiV+mc=;
        b=ava1Da2ZAuobI/zCr+DAagdZGzTAQi/9gHQTX/gKu5AxnoQrkkte7K7updO5dXH7OA
         cZhRmgTVhjSdgB7SoxJQ+lQhPZ2bFOrthMRzrPJyJPs5y1IB69oPXpCyJO9PD3aj8tG0
         MgjlR5rWMiDeoMs9u9Hkd6tohf5+T6OE5ANLZxUe/8WZPpQXQULLI2hpdaR4y5aLHUeK
         AS6OocrKqKrXoeZ/nq/lDBEtY8b3CoioV43NiHO+eNG1UbmZzvFyYPX/+PZXl40otkya
         H2GHNnowIQ2uZfw2RV/6kEAjoikqaMLH+BGCLBPxLfd0hoofDLLoYJ9v9AHm+rpV0IUr
         I3DA==
X-Gm-Message-State: AOJu0Yyjo2VTHfbJuOLmeEkAk4x3TG3DAHHPnhSIYpBw9CLWXvTuNi39
        weA21AAausQPOCyR0orjyLXXAw==
X-Google-Smtp-Source: AGHT+IHw0bsKYu/a7Q4FTDbZaZhUadyxYML+nweVMGrn9ermZvYwwiCn7W5vccf+ApXG4a+qB5yerw==
X-Received: by 2002:a05:6512:ea1:b0:503:2642:435e with SMTP id bi33-20020a0565120ea100b005032642435emr11407227lfb.66.1696273181901;
        Mon, 02 Oct 2023 11:59:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t6-20020a19ad06000000b00502d7365e8fsm2443981lfc.137.2023.10.02.11.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:59:41 -0700 (PDT)
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
Subject: [PATCH v5 1/6] dt-bindings: opp: opp-v2-kryo-cpu: support Qualcomm Krait SoCs
Date:   Mon,  2 Oct 2023 21:59:35 +0300
Message-Id: <20231002185940.1271800-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002185940.1271800-1-dmitry.baryshkov@linaro.org>
References: <20231002185940.1271800-1-dmitry.baryshkov@linaro.org>
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
index 27ea7eca73e5..316f9c7804e4 100644
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
@@ -65,14 +67,16 @@ patternProperties:
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

