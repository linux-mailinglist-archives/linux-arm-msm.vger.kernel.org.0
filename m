Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB9A6E60D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 14:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjDRMMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 08:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjDRMLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 08:11:36 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638825276
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 05:11:01 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a8bcfbf276so16892731fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681819859; x=1684411859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fftkJp3Coct54pcoJxqOJznZa4eb2ZsBLmF7Bh2NPzw=;
        b=yT/BiOHJ+Wb2Fowb5VKhN9CkH2wqsNJE9NMZRSDGk4DXvenGL6eOdB8DlC/etQesDw
         dtOy68VZtrLhULwcn9/Mi9WT7Y8P3NAvFpLgTBxc+8AIDLGEScilP24Dh3AA/nx4wMOD
         j3Z9Q7BlS2bnKN139hMOkzsDLGoMk0fPulZVUEm5TosYsVVqzQMizwSXVbX72TBmvagL
         looqHnRRbrN27J2r3pebd4DSAIVDVFu/Et035MPmkDkjTuMHAluOrpHYbTTgAUgD0AYe
         dP3Kq03ixRHzCPq7IzoNQ3erAJ/HIQVJ4AfwP3pg49snXLAoXuIq8GSkth6QU20GOrmB
         YCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819859; x=1684411859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fftkJp3Coct54pcoJxqOJznZa4eb2ZsBLmF7Bh2NPzw=;
        b=dD4v+dvAZF4lGBuq3HKPUjWKrzW12FhWYzoPDFDJCxUa4vtQgTuvtY8gqaW0hvHznI
         ZV6JPEQVF0ovnCnydUGxUGI9KsdllPhxQ34lCELCgUinvuvsG/9OGtT1SGEtJw08jLDj
         qil1uxCvJn7lO9k1Ag1n8y3X+80gtpAUMIpFZuiRi7Ac7ThyNxKztyP8oNyWjsPRoaGl
         msYZqzYdycyay6JJl+py8bboPq7g40w60+emTjSvd8A8bokeKOoFq9Iv4KCND9hDRZZx
         UTtskAbxmgPiazXRHujS0ho95tVjzAzjeINbEcd1mpQvc0rGsbUw9hNS3nj+uoXCbpQK
         NK1w==
X-Gm-Message-State: AAQBX9dEDzruwXRspkbEdhmE5qHJEHlftVB5D/bXKyc+AImO/pJaSRZE
        2L3eTGC1bZmGbt7xdrKr3TodEg==
X-Google-Smtp-Source: AKy350ZPb2pcudeOWD4NUzexqOVtDM0ulgBKkxy07npJmGB5XjCQyP1ClBYjw6LCleNLEPUOy8LFOw==
X-Received: by 2002:a19:f70b:0:b0:4ed:cb37:7d95 with SMTP id z11-20020a19f70b000000b004edcb377d95mr897901lfe.44.1681819859602;
        Tue, 18 Apr 2023 05:10:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:10:59 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 18 Apr 2023 14:10:56 +0200
Subject: [PATCH v2 1/5] dt-bindings: display/msm: Add reg bus interconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-1-91a66d04898e@linaro.org>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=1310;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9eGzIhdzE/kh12Ssb8zLi8BB+5t4kj0lnuayorvjl54=;
 b=6fysWEnV+Y3QmSTMiVPNmoQ9u0QIAaEjvJEkX1mj0vdB2azvjMKBFTXFeb43KILmDBjB8FFs4iVp
 BB/S89PrA4Ytu9jBc2Dfi9OeeG/7wbARaGTUTtuRCJrQlU8X+ytt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

Describe it in bindings to allow for use in device trees.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..30a8aed4289a 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -66,12 +66,14 @@ properties:
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
     minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
   resets:
     items:

-- 
2.40.0

