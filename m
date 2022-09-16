Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C645BAE0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 15:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiIPNYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 09:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbiIPNYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 09:24:44 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F08B22BD0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 06:24:42 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id ay36so6518053wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bXYtZk9DuHwMmE7lTTFLwrOctNB6LlU7vnhCjjk89UE=;
        b=ZH0sIZgnFki3bD+19ezSXw9QfGCvGCSJUkIVLslojq8WR8i/6sqIDtCQPe+TmU6BWE
         6lREtR+DhB3Hfx7pvjDEDI/q3+d9OvTdr7bM8EL3mfTiOWNROCc4iNZwpRi6TegQheJJ
         1/tuRJHOc9kT3jC4J65Kerc1W+b8NGWKqpCbVITCjo4rG5v3KKm252HAwaPt/xK032e6
         I1VTRsV0BYYjsz0LzM6qzsvKSYKNTe9WQ6QgqFfiVFfzNQR9x2wn0VZ7y3tZ+VqOnEdd
         KGCFlmi9pVfSPHV/YLeTIrPQrVNsdPqsxH0+z+plEy5NY0eB4E5Fqqkub1R1Z4GEukA1
         PnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bXYtZk9DuHwMmE7lTTFLwrOctNB6LlU7vnhCjjk89UE=;
        b=X9Tm5M+WNzDYUXD9piPNZYN3bmuBUFeNfFDTysLQPzO7iHngqIiMFVcKINikuNTLl+
         Mz4/pL7bEXvsVcMX/H5NrAwW9C5J8HWTBtWG5Ld711jO/zqllkcYKF6NE1PLu7MmEPqM
         q+J+DAJVp8p58cVX5DfCG3ubVtFUtd/IUpaZjAsu41d9nIvbmPKyCsFjFvtDLBRwd/Vh
         lJh7tfEjAYHSiPDdam/IRDmavASgixPcLNf2cWyAx/JOomIzM8qSAv/MzD3wLjjV+LLk
         NE2ODhmDeTSEFuIblRgrfH1T07BAfR2D0u/3YtfRylfS6r6nwyPXr2Ua7cuEmTyReCpH
         YchA==
X-Gm-Message-State: ACrzQf3Bu7QGeUlzwsGLsxGcqZ1uo2ewZoy8RaJADNs6YBH9qWx4OWWv
        Hbcm8/TGDYJOmFU+RkvWW1poRA==
X-Google-Smtp-Source: AMsMyM4NYRajmi6DsUcjnbjh29HTN041/86Ue8INhhNHcP+iIJ+j/ghsUNko/iPFBv9z40nElL79Lg==
X-Received: by 2002:a05:600c:4211:b0:3b4:6334:9940 with SMTP id x17-20020a05600c421100b003b463349940mr3405497wmh.166.1663334680996;
        Fri, 16 Sep 2022 06:24:40 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 06:24:40 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 2/5] ASoC: dt-bindings: qcom: sort compatible strings
Date:   Fri, 16 Sep 2022 14:24:24 +0100
Message-Id: <20220916132427.1845-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
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

Sort compatible strings for consistency reasons.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a3a4289f713e..bab1a6f1890f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -20,9 +20,9 @@ properties:
       - qcom,apq8016-sbc-sndcard
       - qcom,db845c-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,qrb5165-rb5-sndcard
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
-      - qcom,qrb5165-rb5-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

