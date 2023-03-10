Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CB06B4032
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 14:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjCJNWb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 08:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjCJNW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 08:22:28 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EF4FAAFF
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:05 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id s11so20329590edy.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5T8f82bUHjqZUCty2l1r+11I08uBphsz2e1x3k1UV0=;
        b=ZUTkGCW33X1K/tCGdzAxxLxfv00/g/6rmybU7DtTJStp08qmKi2SxtwB1gsNK6YkQz
         CNvEK8w926oxIV6hH/eREA9AcURYcCiNQjL1vf7hLATC4HPBxPMdYNJlkh6GCEAr3PYo
         WKlIW92zw5ZrfuU9110nSdts3IWyuYpluNf6Xdb2JwuHM17ItMte885aja6p/+C6RP5Q
         wovOKc/7i5FJ5ykd3HAndnl82TqJ0fGZ4SuhnQz4/rNRhYzMERKIc2nY0kgQcUDWz0zt
         nwz+kS+fNDMbQMm0OYoZgwbSnApcV7lJYIMYNiUwN+wIKX4OAEtkzBbb84SXLdoAKxXP
         0yyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5T8f82bUHjqZUCty2l1r+11I08uBphsz2e1x3k1UV0=;
        b=7VwHHNi1Nl1AX8Bi3bOdf4lWp5AjJEVWkObyGVThxg7nUs8FrjYIlYMCF808v/417C
         VPlSuj7AuNPFUP0OcB74dDdWO6t0JOp1uyinrEgE3QSgmhGT3Ka8tLZzljIZnxGBPNZs
         VF9QNCyYlY0WjRgt4Zc827S4kMt/dL0HYyyvfZUeV9/R2QKhd6bLf4+ZWTPe5vEcOTGT
         0Kh0oTSGyFB7f5DsYxMCYyu+u9wMNyt4f3CbgB9Ekdn4T2zti46HLcYuktApUP3o2XYe
         91W7k36lx7D55urTPSd1Hlo+h6cBpp0LaSHXLNYzBAmmmND66HTS76HMrmAD6D8TZl/E
         wPmg==
X-Gm-Message-State: AO0yUKW5pIa0QVCK1w9TpOdLOBQNwc/rQumAec1pcrQuionZ5rWOKWgx
        LqkJtyphJXfBjoTxqlLC/pOMoU1LWkKiiejKDpg=
X-Google-Smtp-Source: AK7set9GlyPV0rFLe1f2eiN1gBQ5GV1AdTOmGeTJjZwFIvAIXSn1ibLseUzeiuavtJXID8UiFUym8w==
X-Received: by 2002:a17:906:a4b:b0:88a:cbd1:e663 with SMTP id x11-20020a1709060a4b00b0088acbd1e663mr22727203ejf.6.1678454524129;
        Fri, 10 Mar 2023 05:22:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/9] ASoC: add audio digital codecs for Qualcomm SM8550
Date:   Fri, 10 Mar 2023 14:21:52 +0100
Message-Id: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Dependencies
============
For va-macro bindings:
https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org

NOT a dependency
================
The patchset can be applied independently of my previous fix:
https://lore.kernel.org/linux-arm-msm/20230310100937.32485-1-krzysztof.kozlowski@linaro.org/T/#u

Logically, better if they were together, but code will work fine other way.

Best regards,
Krzysztof

Krzysztof Kozlowski (9):
  ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX macro
  ASoC: codecs: lpass-rx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-tx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550 TX macro
  ASoC: codecs: lpass-tx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA macro
  ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
  ASoC: codecs: lpass-wsa-macro: add support for SM8550

 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 76 +++++++++++++----
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 81 +++++++++++++++----
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 18 +++++
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 +++++-
 sound/soc/codecs/lpass-rx-macro.c             | 39 +++++++--
 sound/soc/codecs/lpass-tx-macro.c             | 38 +++++++--
 sound/soc/codecs/lpass-wsa-macro.c            | 38 +++++++--
 7 files changed, 256 insertions(+), 57 deletions(-)

-- 
2.34.1

