Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18D962596A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 12:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbiKKLgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 06:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiKKLgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 06:36:11 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C15F4B9AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:10 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id t10so4246213ljj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+lo+EYchQIrutfVK7r/d71O1gZIvEmM22KyAmAwjKs=;
        b=zqzPwf0VhpEKqnCJQeB0cnMdP0hokvV0Xjbk46zcHBaH/WGMkK0ilcn5ZTjIoEjERy
         R+fU8Ifo5B5st2HNnfBFhjhkdVUcahN9cnzJaFzXWQZ/qBD8erQsfNDYiuZv2infQ/2N
         FFWRDmTX+5xIafMQpS5yIKM0Iw0zBUF4U62f5eLnlkO6HaT18V2lBXUNRJ9miqTJUcf/
         JBakGu05Diiy1F6bjHIS2+PSoa4zRdL6a3idwVYdgF4wIhrzSHpuz/Hy5XI6wkR+rLC+
         WwFppQTw8eTdo7P5I4hysvzkWWWwzXLvyXaajXneXiGLptSWzl47/ZerTddPm+9fFVz1
         WYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+lo+EYchQIrutfVK7r/d71O1gZIvEmM22KyAmAwjKs=;
        b=fOZymkSpj+i0corYKUUt6F6FrOUCaPkKC9/NpAAr5Jj3jnLsGvpCb8YMQCeZM/bJ/K
         i0/hTa4ex5fnoYjsioCFdCyc/oUFX1vStDEGVTXzP5h7k17jYVsMUEcw3jIyAHMz71c6
         9bsf6I+nOYTSphWCJdzmy6k2YmFBG/SAFnGspnxZQSMCvsjDXASkYRaq3HwZ5qW+0FU7
         DJRirxoz1ElmBF4gH20PhfDJ18xSUygSfpi2m0TcshcyaMRvz5qGyrDdv93pnrzcK2k5
         1zl0yRMd3pU202a4MTLDB2UE0bl5A0CrPQlukAJ3VtPzQ+OeFNnQtZ6AkCo60nHCwwrA
         ATLg==
X-Gm-Message-State: ANoB5pnW/9W0Vhf8Ds/xwTIlwKWRbhOayrbbManarqqLrBs+QGvXCEA1
        LYrZTVAO0DkOxwwaa6zmSfoScw==
X-Google-Smtp-Source: AA0mqf7Af5u4htDHYrs+2hewvDJau4fu8DLkLCe3TaU8xXrl/EP9cN9v5Txbclnj1xYPEGYOF2lwPA==
X-Received: by 2002:a2e:960c:0:b0:278:eab6:7542 with SMTP id v12-20020a2e960c000000b00278eab67542mr300253ljh.400.1668166568655;
        Fri, 11 Nov 2022 03:36:08 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 03:36:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Patrick Lai <plai@qti.qualcomm.com>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/10] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound nodes for SM8450
Date:   Fri, 11 Nov 2022 12:35:37 +0100
Message-Id: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
some changes to APR/GPR services bindings.  These bindings are part of
qcom,apr.yaml:

  apr-or-gpr-device-node <- qcom,apr.yaml
    apr-gpr-service@[0-9] <- qcom,apr.yaml
      service-specific-components <- /schemas/sound/qcom,q6*.yaml

The schema for services (apr-gpr-service@[0-9]) already grows considerably and
is still quite not specific.  It allows several incorrect combinations, like
adding a clock-controller to a APM device.  Restricting it would complicate the
schema even more.  Bringing new support for sound on Qualcomm SM8450 and
SC8280XP SoC would grow it as well.

Refactor the bindings before extending them for Qualcomm SM8450 SoC.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  ASoC: dt-bindings: qcom,apr: Add GLINK channel name for SM8450
  ASoC: dt-bindings: qcom,apr: Split services to shared schema
  ASoC: dt-bindings: qcom,q6afe: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Split to separate schema
  ASoC: dt-bindings: qcom,q6adm: Split to separate schema
  ASoC: dt-bindings: qcom,q6asm: Split to separate schema
  ASoC: dt-bindings: qcom,q6prm: Split to separate schema
  ASoC: dt-bindings: qcom,q6core: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node

 .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 ++++++++
 .../bindings/soc/qcom/qcom,apr.yaml           | 119 ++----------------
 .../bindings/sound/qcom,q6adm-routing.yaml    |  22 +---
 .../devicetree/bindings/sound/qcom,q6adm.yaml |  51 ++++++++
 .../devicetree/bindings/sound/qcom,q6afe.yaml |  69 ++++++++++
 .../bindings/sound/qcom,q6apm-dai.yaml        |  19 +--
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  32 +++++
 .../devicetree/bindings/sound/qcom,q6apm.yaml |  67 ++++++++++
 .../bindings/sound/qcom,q6asm-dais.yaml       |  48 +++----
 .../devicetree/bindings/sound/qcom,q6asm.yaml |  68 ++++++++++
 .../bindings/sound/qcom,q6core.yaml           |  39 ++++++
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |  40 +-----
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  57 ++-------
 .../devicetree/bindings/sound/qcom,q6prm.yaml |  50 ++++++++
 MAINTAINERS                                   |   2 +-
 15 files changed, 477 insertions(+), 260 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml

-- 
2.34.1

