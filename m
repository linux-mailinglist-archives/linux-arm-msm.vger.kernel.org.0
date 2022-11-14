Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B146283B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 16:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235995AbiKNPVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 10:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiKNPVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 10:21:37 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EA91EEEC
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 07:21:36 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id t10so13660347ljj.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R36aKWfFSpWkQkgORW2/ax5F2qQ9Htzj5JRJWu1dxZc=;
        b=ri7N6/EgyBWRyqZLMYdL0qy+Brbuw3/uyDB0n/nFBc+iJ4R7KDl64esfOso+ABPsXH
         RWDDfi86Cl4edTgLIQed5mfwXfJy9GcqgSV0Ne2m+ZCKpWwpMNoVudDFCuhTBsTcxg5C
         ekizZCZgEtQ8tJDcuxTpgzsd8nLX05coSTHSl/25ga4bEwoKz62cjkmQOR0fPS/AYvLo
         FWlTi2wRaA3qLTdulLnSCDzSZCOSSeBR3oZquwRvkHrr+TMuF9FMOFCKxeXdTTDyM1Bp
         knRyWQJ1NP/i6zI7NT8wtsxb8+ZJoUAaDdgrUd3OePe+HnfhdznYQaPjREsZWLy8FWG1
         VVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R36aKWfFSpWkQkgORW2/ax5F2qQ9Htzj5JRJWu1dxZc=;
        b=r4YXG5ngfzybgQWSfOl0736DVf+yk62A5/uIDN0mK66E9DZfzGo6TruHvoWFVypXTt
         JY4mXWInaK4WJvDP519LOUA3AswYmGWAE9ED/Atu/MljXUUC4ugtJBzV0bTf6KmH+j5y
         l3744n5Hs0UZGtxmgfQdTJr/TgYWFfUyAYnxhK3FNrk8ouSXrX1iaOkhqte3PvUzsUT9
         vQL5ZM9rn36rc/M1cboESSSFQMetwyDuWUObX4LEgU+HtKXowpKW/NXybfaC9BMTHi7v
         3rPH4u8iS15r0C2gSgOBC5Rckn1ZMxqZymWAMHEpRumapXkjggTgO/vhtKmy3++NN59v
         IFNQ==
X-Gm-Message-State: ANoB5pn3mnz3L+7Zaek0xSUn+2qDOOkIYu6z5fPjZQtfAVna6HOBSHpN
        TOSa9lpNra02KCu756VqECpSNw==
X-Google-Smtp-Source: AA0mqf5Pw9YuHGFmDGqzQdN1PVmLQYrrfwEoMjlNNVsG3K+0XYnr/DfEiX18EQrme313p1DUHbLvgA==
X-Received: by 2002:a2e:3606:0:b0:277:b84:81b6 with SMTP id d6-20020a2e3606000000b002770b8481b6mr4080877lja.425.1668439294598;
        Mon, 14 Nov 2022 07:21:34 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n5-20020a056512388500b00492ea54beeasm1854268lft.306.2022.11.14.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 07:21:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: sm8450-hdk: add sound support
Date:   Mon, 14 Nov 2022 16:21:27 +0100
Message-Id: <20221114152130.385871-1-krzysztof.kozlowski@linaro.org>
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

Hi,

Initial work (still partially in progress) adding audio to HDK8450 board.

Working/tested:
 - speakers
 - one channel of headset

The DTS patches do not have particular dependencies, however they:
1. Use updated ASoC bindings:
   https://lore.kernel.org/linux-arm-msm/20221111113547.100442-1-krzysztof.kozlowski@linaro.org/T/#t

2. For full operation need changes in Soundwire and Qualcomm ASoC drivers, not
   yet upstreamed:
   https://github.com/krzk/linux/commits/wip/sm8450
   Booting remoteproc without these changes will report errors, but these are
   expected at this stage.

Best regards,
Krzysztof

Srinivas Kandagatla (3):
  arm64: dts: qcom: sm8450: add GPR node
  arm64: dts: qcom: sm8450: add Soundwire and LPASS
  arm64: dts: qcom: sm8450-hdk: add sound support

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 161 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 335 ++++++++++++++++++++++++
 2 files changed, 496 insertions(+)

-- 
2.34.1

