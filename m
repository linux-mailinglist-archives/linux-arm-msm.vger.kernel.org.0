Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032CA6CA589
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 15:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjC0NXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 09:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbjC0NXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 09:23:24 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C1B44B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:10 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id b20so36238575edd.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAzgsxWh6iXA0Nkdpgf/2nCg4Tswo7Jo12F1Nk5UNUo=;
        b=fBdz5o8qi/Khlda5m9/yDdNzXPS0MNmVt/DaVgzii1B2WIVPpnEomjCEobZnn3Skfd
         iUzOZyFrp6PwIRZqxHwuQ2VtOTKVFfEDWL2o+uQ2PqQmOlvvywYXzU61f6ZyswdiIntW
         g9lt1f+YAPywDl4UbdvFIi1H6ONB0/6bgKlExrPL7Idco0A2bNKtE8Qmn7as7GBpYEgh
         DqRhZQN1TGtQGQSfetXAj8fNv1CY3M705cWxv0MSqOy1tGPwyjqBTwpNVldWV4wQt3kD
         D88Q0nVmfqbuZGOkvYHQCK2Gz/D1JS3XpX77uyqXL+brFlcgU4Kz+fvqx5NMfbgJAzIX
         ua7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAzgsxWh6iXA0Nkdpgf/2nCg4Tswo7Jo12F1Nk5UNUo=;
        b=mGAhM6NVv/fdig4KZLGJFxbpbMjM24jkiKzzHfoxGkHQuy/k81SRcb65elOe0F845Y
         LZNrE4kU+PmLLo6vYBa4xbfwz2id0xZK5SRoG2MfEGmuM0tsjG5XjfSgOSBEZlER3kl0
         FwUJfhWUgO1gIlGNH3uRV6Qy/IZLRlqkvlIzPiFDXkLjVNfpUTB74S3fitvZQTijIfCo
         dWIJM3wCCC0vRIEAk5WjWmowQKXEK/JuIE4pfnp83XD8LR3Y6OA4C4msxpCuCiZB+StQ
         k5pRYUcn6n6TBvxXSGp41f6aHGZFOZBc//dwUBtF9KxUktefGTyz85Rihq5iP8sHlQFF
         74NA==
X-Gm-Message-State: AAQBX9faweZshJbUBNLMAdwf5muHhNM4DaTcBaQev8H2dBXuUemuX5m+
        vekWywq4IppPBaaDfSPvkiD1Wg==
X-Google-Smtp-Source: AKy350Yzur9V43SIMdNu02lm0MTMhSQJ9oj2fMsNEnVoo1PNdyeY8nk4vpk1vFV5UUzWcfbhUnR4hQ==
X-Received: by 2002:a17:907:7e8e:b0:932:dae5:2af9 with SMTP id qb14-20020a1709077e8e00b00932dae52af9mr15876869ejc.51.1679923389159;
        Mon, 27 Mar 2023 06:23:09 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:08 -0700 (PDT)
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
Cc:     Patrick Lai <quic_plai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 00/10] ASoC: add audio digital codecs for Qualcomm SM8550
Date:   Mon, 27 Mar 2023 15:22:44 +0200
Message-Id: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This patchset can be merged as is - no dependencies.

Changes since v2
================
1. Rebase.
2. New patch: ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock.
3. Add Rb tags.

Changes since v1
================
1. Move the flag define to common header.

NOT a dependency
================
The patchset can be applied independently of my previous fix:
https://lore.kernel.org/linux-arm-msm/20230310100937.32485-1-krzysztof.kozlowski@linaro.org/T/#u

Logically, better if they were together, but code will work fine other way.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX macro
  ASoC: codecs: lpass-rx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-tx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550 TX macro
  ASoC: codecs: lpass-tx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock
  ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA macro
  ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
  ASoC: codecs: lpass-wsa-macro: add support for SM8550

 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 76 +++++++++++++---
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 81 +++++++++++++----
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 86 ++++++++++++++++---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 ++++-
 sound/soc/codecs/lpass-macro-common.h         |  3 +
 sound/soc/codecs/lpass-rx-macro.c             | 36 ++++++--
 sound/soc/codecs/lpass-tx-macro.c             | 35 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c            | 37 ++++++--
 8 files changed, 309 insertions(+), 68 deletions(-)

-- 
2.34.1

