Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A96565A69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbiGDPyB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbiGDPxx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:53:53 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E25E03F
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:53:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t25so16447815lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHNsyd/vegbJddsOdrJO3BCaJzfO02xBE+Znto7i/1M=;
        b=L2XT/7Se44ciHRjTjlQl8CAxkyX0MgBj9yIQRJ+mrcv5xtUAI2oycs1/z3GqLlkzw9
         vU2NiKbkDXpzGqnGK/YDvS5FvKerJwdhQczVYkkuZldz+Zmjlycj9VEcBzhoXic8H6Wy
         ygIqFUeu2cYJ2use3Z1aOM7SloVtzzHAagzvABfzXw73piGTQcYvvAptVl0RiGpIRuqS
         Jxo9j93LJKHoQXwvXc5/6gRHt/ntRXDdc3PuIsxRKDKiCefTwWwi2kbJAi1ZBfumEoxG
         lqAeMhp+jKHzu5TIyCHSzVtcx3z3XeJL/5J6jNdCMcsVcbACJUXZdWC96tDXHSoMsmql
         qCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHNsyd/vegbJddsOdrJO3BCaJzfO02xBE+Znto7i/1M=;
        b=TCAkKaO9pOdi+ppQ8KFj7Ib4x4eKnSI3tq7yQws1CGTe/PttJjgxWNu8oUB4ojMg9y
         5E7JzgXROCu6AVqkB6oykpBjPzCfq0AiCsDKttz8Q0bwmntC25YxJPGBZ1PbJvezng3s
         atMLMJsnIy3xdUOBbFiWrwWrn1SlxmHvaR/J2NiFPQSCr5a3ekOjssoqW8LMPKhbzFV+
         G3q91Tli68F7AnMxKrC+W4O6ZC7ujkyfXWhTtFjqkxfdayfygyeIDnd7Bgat7on4OuDE
         YcwX4n+0ycQMWmGAJlKG4qM83Gm7Wrb2AwWkyr5i7PebT+7J4JP0yeyORV9zgU+/n9jz
         dBrg==
X-Gm-Message-State: AJIora+0Pb1X02zSAeZndyH362K6nHPDgjCWv0HWl0cwJJCG1SedqGiY
        I29ESlNsNElGrcpw5Ja6ECCuNSecOFF8AQ==
X-Google-Smtp-Source: AGRyM1sTAZUI6hRKGMT2dYPDKgWSLIk8ZhXYH3gl+UhSo7FrqdF1loO6O4sOh2zaxlo4dmOVUEoxcw==
X-Received: by 2002:a05:6512:1151:b0:481:1988:d8e9 with SMTP id m17-20020a056512115100b004811988d8e9mr19446639lfg.338.1656950031269;
        Mon, 04 Jul 2022 08:53:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s6-20020ac25fa6000000b0047fbf4c8bdfsm5016165lfe.143.2022.07.04.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:53:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: clock: update qcom,mmcc bindings for MSM8996
Date:   Mon,  4 Jul 2022 18:53:47 +0300
Message-Id: <20220704155350.812319-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This is a split of binding patches from [1]. When sending the original
series I missed adding DT maintainers to the CC list, so while all the
DTS changes were accepted by Bjorn, the dt-bindings were not reviewed
(and were not taken in).

[1] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (2):
  dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
  dt-bindings: clock: qcom,mmcc: define clocks/clock-names for MSM8996

 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 162 +++++++++++++++---
 1 file changed, 138 insertions(+), 24 deletions(-)

-- 
2.35.1

