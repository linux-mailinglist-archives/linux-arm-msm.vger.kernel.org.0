Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059BC6297EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiKOMCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiKOMCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:02:46 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80E7220C0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:44 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id z24so17225855ljn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr0hsDbh9KbOdv41EiPQ4QS/cPO20otloy2LEsAs9hg=;
        b=jc/2P1sOGoD4Nibn4NzcXND68JKBva0ib4bhOvNqC4Z0V/WDjcEVt+/X/0w5HJPxGj
         op2lkoIm8gbCQTA5W0MWZPZMzlFS0W0hSgTMnf7iE0heXpa4aL95DaEapG5KP0Jhcl5R
         DNPUzU36b10NQu7trgOD1Fh4EfBhu5Mb1G+VwMh4Msh1ZkFisr3ixNlx+IP7N6QzmqTm
         LtirX6gefbCRgNPEzhRMDfrTVIs30rbVaYV8sGtgXfGG3HpC9yv4RC/hc+uqS8R1d444
         I3XfAfIcOaRpKLjMAamtlsOIPZanWBlvewZLpKN8vHS+8HIqRy77eHctf45HvIZMSxu+
         Kasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tr0hsDbh9KbOdv41EiPQ4QS/cPO20otloy2LEsAs9hg=;
        b=eDSJT8MefGLwVOgYCjsAUbZO6nHmBMz5puaY+PSbWpnLKF9aXWDdLNnxKG21ixY7Pg
         VPpiL2b90oLUSUyVDo6zeOcle0wHj70z+Rqly3cIWrKETL9qQbAbTS61E14bf5+FcNHh
         0ScHmSXmPWffSU5tNXDVO9XXIo2EATuiqvC2wKv5XYOwol70S4ajM3xl7trl38DoagI7
         yh82Mq2r7WZ2TRiHaHoxEt3PL7U9dnmeX/WDiJQalr687PrksvTDINjwHflNGQo/y2OG
         f4lQ8E3lzD/eh8MLz11oQyij3hoWgK11jrURw1dpVeMtsg8Z5Rp2yhDGbFwAdqq4MRlG
         oAtQ==
X-Gm-Message-State: ANoB5pnfHeMSr3q3Q3q6Q2pV+ei823ar191pYYN7i85eRrqtKitsRN2G
        Z3mFSLJrEbVAuhS720zzGbXWeQ==
X-Google-Smtp-Source: AA0mqf4miB7J+UneSWRJUhg/zWhjzQYvGpn15eoi+YcAzUm8Mnhba1PaF57rVkTCb7Qvw+ETuQLwMQ==
X-Received: by 2002:a2e:a90c:0:b0:277:4e4:d21a with SMTP id j12-20020a2ea90c000000b0027704e4d21amr5818347ljq.196.1668513763136;
        Tue, 15 Nov 2022 04:02:43 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:02:42 -0800 (PST)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        quic_srivasam@quicinc.com, quic_plai@quicinc.com
Subject: [PATCH v2 00/11] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound nodes for SM8450
Date:   Tue, 15 Nov 2022 13:02:24 +0100
Message-Id: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Changes since v1
================
1. Patch 2: Keep compatibles in qcom,apr.yaml.
2. Patch 3: New patch.

Description
===========
Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
some changes to APR/GPR services bindings.  These bindings are part of
qcom,apr.yaml:

  apr-or-gpr-device-node <- qcom,apr.yaml
    apr-gpr-service@[0-9] <- qcom,apr.yaml
      service-specific-components <- /schemas/sound/qcom,q6*.yaml

The schema for services (apr-gpr-service@[0-9]) was not complete and is still
quite not specific.  It allows several incorrect combinations, like adding a
clock-controller to a APM device.  Restricting it would complicate the schema
even more.  Bringing new support for sound on Qualcomm SM8450 and SC8280XP SoC
would grow it as well.

Refactor the bindings before extending them for Qualcomm SM8450 SoC.

DTS was sent here:
https://lore.kernel.org/linux-arm-msm/20221115110053.110319-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com

Krzysztof Kozlowski (11):
  ASoC: dt-bindings: qcom,apr: Add GLINK channel name for SM8450
  ASoC: dt-bindings: qcom,apr: Split services to shared schema
  ASoC: dt-bindings: qcom,apr: Correct and extend example
  ASoC: dt-bindings: qcom,q6afe: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Split to separate schema
  ASoC: dt-bindings: qcom,q6adm: Split to separate schema
  ASoC: dt-bindings: qcom,q6asm: Split to separate schema
  ASoC: dt-bindings: qcom,q6prm: Split to separate schema
  ASoC: dt-bindings: qcom,q6core: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node

 .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 ++++++
 .../bindings/soc/qcom/qcom,apr.yaml           | 170 ++++++------------
 .../bindings/sound/qcom,q6adm-routing.yaml    |  22 +--
 .../devicetree/bindings/sound/qcom,q6adm.yaml |  51 ++++++
 .../devicetree/bindings/sound/qcom,q6afe.yaml |  68 +++++++
 .../bindings/sound/qcom,q6apm-dai.yaml        |  19 +-
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  32 ++++
 .../devicetree/bindings/sound/qcom,q6apm.yaml |  67 +++++++
 .../bindings/sound/qcom,q6asm-dais.yaml       |  48 ++---
 .../devicetree/bindings/sound/qcom,q6asm.yaml |  68 +++++++
 .../bindings/sound/qcom,q6core.yaml           |  39 ++++
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |  40 +----
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  57 +-----
 .../devicetree/bindings/sound/qcom,q6prm.yaml |  50 ++++++
 MAINTAINERS                                   |   2 +-
 15 files changed, 515 insertions(+), 272 deletions(-)
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

