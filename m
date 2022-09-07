Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD975B01D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 12:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiIGKXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 06:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiIGKXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 06:23:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2E31D0D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 03:23:18 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i26so5959324lfp.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=DUZnAOXvnpwBSyYKpy7XC2+oubbqgditxTlrj9yISaE=;
        b=YKseDWEuQrei+DMXjAdhXWNkjPj/XhJlvCb3QGZ5L61lPym0S4hmAc/ek+LGwrpF6J
         TnQbf3UkUJUROG2eAEV0vphFJ3aIrx/O9wflRYVSJznxfGR4aznKVL6SoTRo7/IhPsUD
         s2+KzzSc5z/ivHykL5YgjKqTiVIQCteNe0H0j3odZoYhn0eft/dqcuGyQFikq1+h9Lq8
         X1iuaHT48VeuDWI2i0OvG2AypADRYKtAw3eWxTD5lBxUU8wp0fWvWEnMql8mAuC6YeHd
         41/6ZmqShTypXD+MP7XsD8swHbFbLal1AotIaRThcfR3zoCJzJTw5G13iBJK5gHMc9j8
         UCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=DUZnAOXvnpwBSyYKpy7XC2+oubbqgditxTlrj9yISaE=;
        b=LMnW7b9/yhLLzRzCcL5zNjuk54Ucj1bTNheJSOSlGRVnQEkx6ORWNqjcwzsrclm9jk
         puWWn+QQxyZ3qeIxUuZDLKC3Bm6JX4RKCdrrzmGnpBSll6YmV8XzZ/ldyUhMw8BCmHDt
         989P/TwpSwnO3jM5fogUJyLEGu86c0VCL/DCsMKaKMT74kWlD3tXWG7KpYFiQuGz4WnU
         D6o1cI+crk7Up6O7OmsTfWeDJ9E5BqoApOfx7acyK3AgOkSePmDJTRAEiQ7KWtDNzMrz
         CetMTUwHT/H8PjilWNsrtu9QgcQaJVWqJECZn0RSuBCR1JwtHj8OxO9bzNJ7Ewufbddj
         8glA==
X-Gm-Message-State: ACgBeo1xcwJxI/odE/kSHIq7Mht5HvhKrpdj4/lQ9lCS9fzDxCY1IjEc
        TpJDfgkFMNUDeEKFn07ICSa7Nw==
X-Google-Smtp-Source: AA6agR6tbubvvq8/DfaCTr0+Pf575TvwyTL1PYEUWtKKonjTxXHultN785WWU5YW7mRViESeUxF52A==
X-Received: by 2002:a05:6512:3f0a:b0:492:da2e:ce69 with SMTP id y10-20020a0565123f0a00b00492da2ece69mr817185lfa.269.1662546196496;
        Wed, 07 Sep 2022 03:23:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w22-20020a0565120b1600b004946d1f3cc4sm2378309lfu.164.2022.09.07.03.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 03:23:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: MAINTAINERS: add bindings and APR to Qualcomm Audio entry
Date:   Wed,  7 Sep 2022 12:23:11 +0200
Message-Id: <20220907102311.38428-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Extend the Qualcomm Audio maintainer entry to include sound related
bindings and the Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
IPC driver, which is tightly related to the Audio DSP.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0350effebe8f..453dc6fd0b80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16710,6 +16710,9 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+F:	Documentation/devicetree/bindings/sound/qcom,*
+F:	drivers/soc/qcom/apr.c
 F:	include/dt-bindings/sound/qcom,wcd9335.h
 F:	sound/soc/codecs/lpass-rx-macro.*
 F:	sound/soc/codecs/lpass-tx-macro.*
-- 
2.34.1

