Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77FCD79CCF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 12:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbjILKFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 06:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbjILKE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 06:04:59 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2FCCC3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 03:04:55 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5029e4bfa22so6453264e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 03:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694513094; x=1695117894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir9r9aQtaSZLleag9LnQwnbzzTQdAeEYrkqtlWNxaqg=;
        b=f3eQLp5XtvCZZsHP+2VpuFiC6WaoOrgQ98rYqNFvmfYosuSIE/bFDksKWh3puxYj+e
         Qet7lt5FYS8wIXuc40D0NQ889Jl3mXuWFcHBbOkPMZPxIFmenifCqJFQcfbKNl55Xdfh
         wSrsg+AFK5Mx04T2eR1xURGvK3DBL+64dh70z2RyLqUWneVkbJg8lBECTrBjwz64cFbm
         yU2twaxyPih777WrFvykwBSiABide2uHOgwQW38lyXo7ezRBJeTrNPO4CzGKtUyz8KgG
         UEJp8auCeSCYQhYAI5jwSFmNRiXSjyDrjnaNBjjh0UhUKEd3auEdehGtMrqGduoZNSLa
         aLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513094; x=1695117894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir9r9aQtaSZLleag9LnQwnbzzTQdAeEYrkqtlWNxaqg=;
        b=E2fRLz3cAOYhay5uOWUUtGsiVnF7dBYyEFd5c6Kqh4IHXqB/5tugSXOZ4GH62yZFGc
         P2xVrCysSPqCr+DdlLsbts7yiPz5CzD946v5IOLryKpmD1157HBokFk8uPWM2D8CsxLu
         Qlb72KBfwJA0lPWftgbzM9m/0JpgURdIQ7uYeVu71biOqbC2ygVDtT8D2Rmzn9S70QKH
         iFdSmuTZ9z6Ss+pMaKMmVD/WAezfrPUMc5xUJUvRSU5M8XliiM+pwGfaq/t3V8/Q6WAa
         xrPhdhYDPjmiVM+KuFrD7pS3Uz5Tl/K6ycChzfGjBpa5280B0eXKzGQi8XkS832YkT/P
         K2hw==
X-Gm-Message-State: AOJu0Yw/dILexhP8HQoTdPBcDHcsRlQWdCj4h+0w2IaYYjUX0TInhj9V
        cmYIOyloy1OrTDmZno3qu+ckNA==
X-Google-Smtp-Source: AGHT+IHyp6bxGr08MxrJXgU77ALZhRoZWA9rEEteS0kLQHTL/Fi8nw8lQ98cVxST83ghnfxL5Qje9w==
X-Received: by 2002:ac2:58cc:0:b0:4fb:c657:3376 with SMTP id u12-20020ac258cc000000b004fbc6573376mr8841228lfo.29.1694513093643;
        Tue, 12 Sep 2023 03:04:53 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:04:53 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 12:04:45 +0200
Subject: [PATCH v4 03/10] dt-bindings: display/msm/gpu: Allow A7xx SKUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-3-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=1566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VV4z2afr+St9/dA+OjbMmt+l3E+tCjarurRFVAL3RG8=;
 b=RliuCnOaiDRBp0EAJeURYXdZIfXDaE/0Hi/yLzX875X7bJqTyIF8cUX7zT13ntDismvMkq/5O
 ZcwAX8tFscDD90Z+QqcOFVeoXJG4vjP25RgJa/AF/5uGNgL+FYrxftf
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow A7xx SKUs, such as the A730 GPU found on SM8450 and friends.
They use GMU for all things DVFS, just like most A6xx GPUs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 56b9b247e8c2..b019db954793 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -23,7 +23,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
         items:
-          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Imageon to
@@ -203,7 +203,7 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.42.0

