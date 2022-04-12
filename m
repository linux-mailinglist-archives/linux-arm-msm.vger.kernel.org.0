Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A151D4FDB55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 12:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbiDLKB6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 06:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377794AbiDLHxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 03:53:54 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68D853723
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 00:31:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bv19so12499960ejb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNe4Z5n6SgxquvKMNl7KQx+y5HXt+oFrwqEGNRcc5z4=;
        b=wjMW80PkOqvcS43yxumpkmpgw+Av27Uu7deaKWy7Nwvxv0fDMnrJGXRlScEH9hM27v
         60PSTU1BL+nWpCtYUZiqE0LaT/E0VLpLxJ11yCFliFsVQXmgFr02+hlbGSLDzjNWUJjZ
         Cx4RfyoKjf6xRSNpi5B7jvSayk2db/7aMrjTml3nBv/wO0A8Dl2fZkc3j7Y5mb15lsdK
         hHvlotngCHek82ky3yaC13i+NB6o4vlAT6rZuJSd827lKJmiLT6KSKz1YPhPhiT69mMr
         kLLRKBlVD6SCkuZJmX/S2ZevIs+LbWpNuP9PXnnw3Y9/GYj75gvVvvcAfgPKIc14exEv
         koxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNe4Z5n6SgxquvKMNl7KQx+y5HXt+oFrwqEGNRcc5z4=;
        b=xHdj4XwthkqB/mDDx03hjCggFNud5SOIUbmi9nlliNcc4KyM29Y/38/PiMfzvXX4yh
         MCEaOxo0zKorOFOEt9765c/3k3tnDZ3+DRsu21YI0bKpIU6U6UegdOL45IpBMPRIwjuo
         eVVeZsGFEKlrCpawFoASqxkwoQCoe9tCDODUSN/Jb+Zr/1jnZ2LcrAb3P5FkqQ0zyx/D
         77eOolMe4p8Li1FiHAZDOVbArnALff4Ob2Kpaj1kd+M09SxLG7u5EIvkcapscE/EkLlR
         P/siOUeP/DkaW+Mx+5led18VaOH8t67Z5Y/I9A7etFNpsh8cBm7/u7RSJC/y+108jHPS
         UJ4Q==
X-Gm-Message-State: AOAM5337v5uVVGUyHXaI5ch+gEYO24kzA+2eezYBA76USTYr874Yy1iC
        Y+tCzANO5QKyn1eWt/se4KmFfQ==
X-Google-Smtp-Source: ABdhPJybnYRzd4oTw/UKCt6YSg9tnEFOnLlLmbhOqi75QmarBAVUMLlCkNsPPv91AAAiHSUa4HKiZw==
X-Received: by 2002:a17:907:97cc:b0:6df:83bc:314c with SMTP id js12-20020a17090797cc00b006df83bc314cmr33755928ejc.587.1649748691460;
        Tue, 12 Apr 2022 00:31:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j12-20020a50e0cc000000b0041cd813ac01sm12571234edl.28.2022.04.12.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 00:31:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] regulator: dt-bindings: qcom,rpmh: minor cleanups and extend supplies
Date:   Tue, 12 Apr 2022 09:31:21 +0200
Message-Id: <20220412073123.27229-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Hi,

Extend the RPMH regulator bindings with minor fixes and adding narrow supply
matching.

Changes since v1
================
1. Use "defs" method instead of referencing additional YAML file, because the
   latter was not working properly.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  regulator: dt-bindings: qcom,rpmh: document supplies per variant
  regulator: dt-bindings: qcom,rpmh: document vdd-l7-bob-supply on
    PMR735A

 .../regulator/qcom,rpmh-regulator.yaml        | 291 +++++++++++++++++-
 1 file changed, 277 insertions(+), 14 deletions(-)

-- 
2.32.0

