Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 918F66AA49F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 23:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjCCWjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 17:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbjCCWjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 17:39:07 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3859E14990
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 14:37:34 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id o12so16089473edb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 14:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677882976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abXDj5NltbKSeLRsh9EY7sfm/FxwFg1uajo52uEDqME=;
        b=boU2MU6CVTB6uQcCNAIPj888RAO4U6owTbSd4v6dAy0gMVMrsuPVUqHnTdYbPxBAYC
         sBdY9AfmT7aBV3BVgJGODhQdYA36Wbui+0PSZIbS5FUS9oN/bFdc+bPfRXRZpHm5B7jv
         1fHTSk+DmUA/KROnXaWxl19Ctk4Oii7kalU02fO1eGdmRMcwl/GaAJNEO+5OYSk4y6Ln
         i0NYqPmf4m7xRVFPR/vjNqvhnsx4E7wB98R9JfcP745ugOqntkVu+NbM6m4B/ozMnzhp
         OquJRh8r3P8+NqlKMp7TWJqIWaUEYL8vuaeHRgIV09kuelvKW3d9X6ao7VBaTsKTY6Ch
         1RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677882976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abXDj5NltbKSeLRsh9EY7sfm/FxwFg1uajo52uEDqME=;
        b=ceyxprCyFj5oJImcqXV9Q+rL8Vj+HuQXUUod6Re3jv9A7ioaVQzRgkXh7nxQBOfKpQ
         dkQmrjRNTKCYELZ3H/xsnhy4mTHe13FK23joODaIbWr2mFr1x3wnx9NESYdCDHwJXAdv
         wRDoxFvYDWYQ83P+FWTI5MBEgt/tLT7ecjxKm7IpvAmkm7uY76tO3Vsol41cWYBPAFi3
         TvlnJLyMoZkfmqCdApu/zQ5Hr2OHuNztQlBHd85kaMoTUyWbY/tUwpZ4h2EyOFRrMFTs
         3v8SVm0q/TotR2rk4NMBR/sS7ss+lSVffQdKGKQR3HOkjfrOoSnMAjDt/vljKOqlmRjg
         EjLg==
X-Gm-Message-State: AO0yUKVA91M5/SM1tFAWtnV1Jtxo1uA2qJcwq21JDsbDG65u944UibAU
        p1sqaT5/5wtUiBwBVCcU1TzyRlmxBoy1O6rFO5o=
X-Google-Smtp-Source: AK7set/An1BtrKhxkQaFksrUZJVWeIWfp/ojIAxF8lGpYfv7ksIWNVqKkcwoLr35zkveVmQvfKKuFQ==
X-Received: by 2002:a05:6512:4da:b0:4dd:a053:3ba1 with SMTP id w26-20020a05651204da00b004dda0533ba1mr808661lfq.28.1677880695801;
        Fri, 03 Mar 2023 13:58:15 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id e27-20020ac2547b000000b004cafa01ebbfsm552670lfn.101.2023.03.03.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 13:58:15 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 03 Mar 2023 22:58:03 +0100
Subject: [PATCH 03/15] dt-bindings: sram: qcom,imem: document SM6375 IMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v1-3-8c8d94fba6f0@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677880689; l=734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fRR9bII2e5KK6+z/KcGqOf0XJiIuf0AqBHHO+8le6ck=;
 b=Rg7LgOLNnWhrT917vsmIUzlmNQW7hw5lDELRGk2JR0SaCt5j3pwKUb3IsmWA0sW7HuBq61SJ34eE
 QreEuo27CZV9TdAz4vUqOY4t4LWr36VBhZ7nXEw7wHJ+Y4YUPuOa
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for SM6375 IMEM.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index ba694ce4a037..0548e8e0d30b 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,sdm845-imem
           - qcom,sdx55-imem
           - qcom,sdx65-imem
+          - qcom,sm6375-imem
           - qcom,sm8450-imem
       - const: syscon
       - const: simple-mfd

-- 
2.39.2

