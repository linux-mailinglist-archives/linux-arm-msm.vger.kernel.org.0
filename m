Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92386B70B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 08:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjCMH7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 03:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjCMH6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 03:58:16 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FC1574EA
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 00:55:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h8so1158096ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 00:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w5VDTJefrQL5CEvASX0IO0ZHVw+Up+XulFlBqPg140=;
        b=YUygzuoIl4+mbnorOoZwcJlNJ+waXHrYMKZbIO0F6cxQQrwUtL52vInbWoa4DeKkzz
         MCCHMaKBB0UjSzrD7dMv/ycuiulPFJwL9+CYikog06VBb1kfGN+BpXJan/DII5uKiedc
         5hQmRVV10AyxQR3E6OCGKHPwlf8GPKwXDMHaFDN1Tb7TbXNKCx7NVdw8Du6XP/OL6Qum
         JPR7g3ciRMWRbQHFsYnppXbCeWLkFtp8EVbMe8Bp85KtlaiBC8XmOYcH4XmPF/uT5sqe
         2EFxkktp+I15IDTivhbj/ZAYQC+VCR3Vm0o3hd2m99scYjElkceDNbHbfo+Jg42gwZob
         6ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w5VDTJefrQL5CEvASX0IO0ZHVw+Up+XulFlBqPg140=;
        b=Khy45tMO6eSNEzCExQZDxL+zM0haQXzsbQvBNc+TjbOrlZ/6ezNiZw++AgWqwXYC+L
         M8Sn4Y+2U4rkvCREdAfocVSFSoerr1EDR6mDBtloWj3d0CVi85AcPz261p9QQl1pMuZm
         DAKWTwBUG2zJOS8GcJc+4tfqVhNiYfaGQx6ahWYETdxINkjIPN/QK60sfACDYWT/rXzC
         36TQv1oAUDQveVYTXsU8c+9TgR+Ciwws4QoIqZXxe2dyrNYET1yO3qveltzMEKFPmoVg
         LOiQDLVlNNXXD2MK40jSx6z7AoUy7v9DiH34qLJj9QjhAaw7kgOSeVs1bMD/8XAk5Fms
         ME6Q==
X-Gm-Message-State: AO0yUKXG6+tDqpkesExV+HYMX9l5zwlJ7JH8glRlnzk9i7Y43SudGDhJ
        2Ygi+gh8X/rD7XRy4JAusUbjAw==
X-Google-Smtp-Source: AK7set8CeifPZKO2i7zODdjAgScxJot/p0i/tkeosN0wjbuu/cqMnyxmXc2u3iHqpoMP42NXB7HECw==
X-Received: by 2002:a17:906:9c84:b0:877:8ae7:2e44 with SMTP id fj4-20020a1709069c8400b008778ae72e44mr42843027ejc.5.1678694155650;
        Mon, 13 Mar 2023 00:55:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id bg15-20020a170906a04f00b008e09deb6610sm3100113ejb.200.2023.03.13.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:55:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/9] ASoC: add audio digital codecs for Qualcomm SM8550
Date:   Mon, 13 Mar 2023 08:55:51 +0100
Message-Id: <20230313075551.17290-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
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

Changes since v1
================
1. Move the flag define to common header.

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
 sound/soc/codecs/lpass-macro-common.h         |  3 +
 sound/soc/codecs/lpass-rx-macro.c             | 36 +++++++--
 sound/soc/codecs/lpass-tx-macro.c             | 35 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c            | 37 +++++++--
 8 files changed, 252 insertions(+), 57 deletions(-)

-- 
2.34.1

