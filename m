Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE6374B0DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 14:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjGGMai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 08:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjGGMai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 08:30:38 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D522118
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 05:30:30 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b69923a715so28428161fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 05:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688733028; x=1691325028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmXjq+lZDDi5wHIfZAKrYV8paKDWneNEfPxiISQS6NE=;
        b=XOSa70+wk+Lty0gEPkhazGIf7+F4pS2SiBZxztcvIFnBiKkV0lljeWrnhwWq4cMyEa
         JDWoWqg6wvMSz2aKBP4NYhgA8WHxVFgXGxdwQCurk/KsfXkPbK8pvlSXApCX+ZyjsBpT
         7CMUAFUPhQbZBFf/CqloEpf4/mvmPWfTxD4dauyibJa1z8F6/P/3twWJwI86aTiHTsqK
         IC9HFrgM8RY1UrTw3nzgNkk1uIka85UZQb7rAFe21mztAEBi9EdAiMv1coyq1akhqV2F
         IX4xDpNjozorNqkIhdMXB5B9HDiR99KAi3vM9k6dkTeIk8M+ifMzqMHvjbLC9kdvHlOb
         W5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688733028; x=1691325028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmXjq+lZDDi5wHIfZAKrYV8paKDWneNEfPxiISQS6NE=;
        b=AmrLkAHA0ynYpvPGdJB+c/Ifs2MoHGqF1UnoR9UWPdYoQxjSV+oOdN0X59Mb5VCvUV
         9dufItip2CeI6CLvrIrx6JsK88/PUpmy8tdIa/kAoK96oad2RqLsXOo+g9JIL19xaGph
         AMjhDWJXoxWYMdDUYINKZy+sxiBP1aQTmbKqv7PhIOl3+AI9+p8/xVoQHepDXRRP78+d
         o32mQCATxSBontFZhXXQm6IkzDjIqst9NYznqksZq4522ZbR4NL72tGT0aZr8g9rKnrx
         BpEkgJ1OjD//52UoFYc+Ie9ph1h6FpRYY43acyI3sOc/as6WGBuiD1sVrm5SfPV9jQLI
         GJIQ==
X-Gm-Message-State: ABy/qLbQZKLcVgNTXFj+oQMnnVBak8g52PV9cvl629bq3IZgZeoECgy9
        ENmpKHqdiFuX+hVrpJY0UB9BIQ==
X-Google-Smtp-Source: APBJJlHrhmdapKSALakQpoWLTAY/y9XSprAW9775cun1XROaeEXf3/t59oYBpF5l0yX1T2DE9+4SRg==
X-Received: by 2002:a2e:998a:0:b0:2b6:df00:b371 with SMTP id w10-20020a2e998a000000b002b6df00b371mr4273446lji.6.1688733028403;
        Fri, 07 Jul 2023 05:30:28 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm756803lji.34.2023.07.07.05.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 05:30:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 0/8] arm64: dts: qcom: sm8450-hdk: improve thermal monitoring
Date:   Fri,  7 Jul 2023 15:30:19 +0300
Message-Id: <20230707123027.1510723-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve thermal monitoring on 8450-HDK board. First set of patches fix
c&p typos in PMIC include files (mea culpa). The rest of patches enable
ADC-TM usage on the SM8450 HDK.

This patchset contains a dt-bindings header change requested by Konrad.
There is no direct dependency on the patch order between it (patch #1)
and the rest of the series, so either all the parts can go through msm /
arm-soc, or the patch #1 can go through iio indepenently of the rest of
the series.

Changes since v1:
- Reworked ADC7 channel bindings to use already defined channel IDs
  instead of having the same numbers in all adc7 bindings headers
  (Konrad).

Dmitry Baryshkov (8):
  dt-bindings: iio: adc: qcom,spmi-adc7: use predefined channel ids
  arm64: dts: qcom: pm8350: fix thermal zone name
  arm64: dts: qcom: pm8350b: fix thermal zone name
  arm64: dts: qcom: pmr735b: fix thermal zone name
  arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
  arm64: dts: qcom: sm8450-hdk: remove pmr735b PMIC inclusion
  arm64: dts: qcom: sm8450-hdk: define DIE_TEMP channels
  arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal zones

 arch/arm64/boot/dts/qcom/pm8350.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       | 288 +++++++++++++++++-
 .../dt-bindings/iio/qcom,spmi-adc7-pm8350.h   |  88 +++---
 .../dt-bindings/iio/qcom,spmi-adc7-pm8350b.h  | 124 ++++----
 .../dt-bindings/iio/qcom,spmi-adc7-pmk8350.h  |  50 +--
 .../dt-bindings/iio/qcom,spmi-adc7-pmr735a.h  |  22 +-
 .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  22 +-
 10 files changed, 449 insertions(+), 153 deletions(-)

-- 
2.40.1

