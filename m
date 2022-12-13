Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE2B64AC54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 01:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbiLMAYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 19:24:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbiLMAYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 19:24:32 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15595FD8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:31 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 1so2329868lfz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4q6KkeqgnM/VIxzMFkujQ4xlivfEBTCOf1r0+1KkKA=;
        b=eusrWSZAgsmPRJc6N9znea2Da65f2ALtLrRPkxePjh2U2GAPyZT/6yGVZMF1jus712
         1M/g34bw6XKZOp85KjVaQie+Ho5UlDXkN/YdKpiZ69HETNlYVZSAkInmCKgQAFfkb24H
         v2Q7iP2VEJvD5pRLMsPJd0p7wld7N3tnIqgXuihjM2iP0R9tp0Xw6xH7byyXdHiACcfZ
         OOxPE4ZzkM/R98Kgbe3pSQFzGZO0wA3Piy1LJtpaO12BHn56Szhr782tHJvQMqx8rOgL
         1yq4iT01lUe/nGmEkOLcVNljgv023KZWTVtzFXdzT1Bdl8ysZ6WT0FfVavmKatf6TdrP
         C3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4q6KkeqgnM/VIxzMFkujQ4xlivfEBTCOf1r0+1KkKA=;
        b=7NYKnHc1b7KUElJCswZFIqBXmh4uS6+rvSEr8Q5a6SjnZrBCom6eqmR2hn8LFt6fb7
         hhgHi2o8P7iQ6qGl8Dmb1CF0hGmNNk+MKMDezKcsyfdSRNjPWa7C/Y9rQTj2EpkTqbjX
         FAN3j2ixw6fst+FugHNVU/LYbzkYS6MB/RyIicIrFnMnpZAwx3uvLC6ZmXxCO85kG6LU
         MAJ4bZmCes2O/ABeSvCt2cWYOclqzTmuhxDjmFI6UKia8rednO1GG77CABr1K1SnJZih
         bY2QTJhuYqOHv3IS5WirOBUwC3HX9tK8gnPaIhQpJB9aH7lZlp1lLEgxtMUKlCBMleFN
         izmw==
X-Gm-Message-State: ANoB5pmdEKBO80rFH9Pj+A9KpYYXmAEuGwjIKuZ/Bld3693rbEUp5v8c
        +LPs0lzL1HqUHVHUCpzHoWW53eT0sWKbJu4a
X-Google-Smtp-Source: AA0mqf6F4AZqrS8BtwkOgXEUM1r0UFSawY85mESbk36TvdUnfid8hs6XJbQsTFfsB7pzbYpu/8JwGg==
X-Received: by 2002:a05:6512:280c:b0:4a4:68b8:f4c7 with SMTP id cf12-20020a056512280c00b004a468b8f4c7mr5984712lfb.13.1670891069862;
        Mon, 12 Dec 2022 16:24:29 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b004978e51b691sm137352lfl.266.2022.12.12.16.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 16:24:29 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: nvmem: Add compatible for SM8250
Date:   Tue, 13 Dec 2022 01:24:18 +0100
Message-Id: <20221213002423.259039-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213002423.259039-1-konrad.dybcio@linaro.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
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

Docuemnt the QFPROM on SM8250.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index a1305fd68f67..c3d909387e07 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm6115-qfprom
           - qcom,sm6350-qfprom
           - qcom,sm8150-qfprom
+          - qcom,sm8250-qfprom
       - const: qcom,qfprom
 
   reg:
-- 
2.39.0

