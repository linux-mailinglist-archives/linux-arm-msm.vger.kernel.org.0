Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC648666461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239654AbjAKUFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbjAKUFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:00 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D5243A32
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:31 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b3so25217471lfv.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1ASsGHKR4g4CL9h7lZg2fjHvPvUGBMoSRXi8aiWL9Y=;
        b=q6QvlWvpc+I/UFMgOrF72FBjP9/gHbyqnY9vd6VHx0PMznYAYQaBr5Ty3Ou9rdGnSC
         zLuInp2zpjHsa2022aKJ7dY2ymDfTzcBWXymtnIAPhSzrnAP84rwZtmuVpKZAcrO8lUi
         +t8uQ7Y2Vt1fQzwK4vzALyFQ71/uOPyOJHF0WE9tAo2KN4Ju2svnknDahb7bLp5lzmgW
         J0e6G3NDsWjPGzkbndP2QdRQB4ipxYsnL11fXCRaLmKqAY03DLebopICM9Sm9YMfCiD4
         NVkxQa0iWQrhXmpd9kSEmkoTapNjM42e+yt/3RejYBTBR6ELK7Nu7lQYAm6kU82T3QeP
         /1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1ASsGHKR4g4CL9h7lZg2fjHvPvUGBMoSRXi8aiWL9Y=;
        b=dBV5cvd8VVDvFKqNDFMV/unP61EDDL9T/bI/w78Mw6+fsATtj1DuA0Qd01YIuJgw8T
         9k/i2f1kej2LxnJfjwjwB7Zo4vUGqCq0HKBVixkVmzxKqKofrlemle5YEM5qxen7pvsZ
         tx6hqURPz30gpyKkh4gQrLbKuQpV4U+NfIBk+Haddl7p4bgK2bl+Fjg9FQzgXpULgTCL
         aKE6KmjSx7Ye7gvElZ7JmC87qDcEXefq9YtnOLsTxvAuARfVVHUnzDPMEXFnoZYtCRY1
         adddiKP+VSFxDkb8CAQrfdqcA7pwZrfiTjrcNRsp/LtwpYqftSLUHGqNUf9sf5y3hK4y
         +XUg==
X-Gm-Message-State: AFqh2kpG5xNxD+o6cc3cPXhcRPUjWgxfwXnB/w7ktzTVxnuc8UqXoeqx
        veDOqOYKwN5GwNZQglPPdQR5cA==
X-Google-Smtp-Source: AMrXdXusoRB/zu8OQvNTrMxPqTtHu9WNrzP+Ui9KgTN++eC8qoxDFNjZtSDbfLDNI4eme+kF/sRjPA==
X-Received: by 2002:a05:6512:22c8:b0:4cb:88c:c795 with SMTP id g8-20020a05651222c800b004cb088cc795mr20736546lfu.23.1673467289722;
        Wed, 11 Jan 2023 12:01:29 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:29 -0800 (PST)
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
Subject: [PATCH v2 01/14] dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
Date:   Wed, 11 Jan 2023 23:01:15 +0300
Message-Id: <20230111200128.2593359-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
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

The MSM8996 CPU clock controller can make use of the sys_apcs_aux clock.
Add it to the bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,msm8996-apcc.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index c4971234fef8..fcace96c72eb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -27,10 +27,12 @@ properties:
   clocks:
     items:
       - description: XO source
+      - description: SYS APCS AUX clock
 
   clock-names:
     items:
       - const: xo
+      - const: sys_apcs_aux
 
 required:
   - compatible
@@ -48,6 +50,6 @@ examples:
         reg = <0x6400000 0x90000>;
         #clock-cells = <1>;
 
-        clocks = <&xo_board>;
-        clock-names = "xo";
+        clocks = <&xo_board>, <&apcs_glb>;
+        clock-names = "xo", "sys_apcs_aux";
     };
-- 
2.30.2

