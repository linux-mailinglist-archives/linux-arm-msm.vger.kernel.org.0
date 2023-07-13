Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB49A7519B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 09:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbjGMHWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 03:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbjGMHWu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 03:22:50 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD41E172C
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:48 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3143ccb0f75so577549f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232967; x=1691824967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHcSZV+2M8z59v19UxvSsCTeTm6j87hA7y4TOzZbWzw=;
        b=It8gQaLEAvP0nzxN+mdYP4PrzdPg5XaK3AXOtOPXv/xobh6ZJdqj5wOWXTa/ZqOlKc
         V44HC+cqaJCRlBhb3ZfV35U0O0oYNwU0/6bdaIF6+uOheeWrJN0DbS1JAcWvoNhUWg66
         vDhtDmqTM9IgVCGkoHxRZ+poRY1+h3ZYt8gumlpxhwi2ubslgvKXHRJESbzfyfn8amZY
         bq8vuOgH0QcpVP36Zy3NDBPYhxbycIZy79z8YJb36Z3a8qqleBjBtAgtY2EGB52jRUpb
         gJ5A1IrBWsmqXb751fV/KU5p+F/Sg6UJ5sJHHVzs8Ertr0JfEEOMJle6Sd5T/sV6UqR6
         R87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232967; x=1691824967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHcSZV+2M8z59v19UxvSsCTeTm6j87hA7y4TOzZbWzw=;
        b=AHT6o32crt0LOt2RUmHYpS4X0COGBlKZOiA09uH6dajRF6hVjfkB0BdABataLcp36m
         0KUc8QWFl88W6jzM2T64uCEitZkc6zd4lb0Bhxhj51WapTQ3f8xpBkwFRDPehzH+UlAL
         Htsk40iT4t0235KzVNnlnVwr2nuZ8lMNlGV2UL/AOqBf+Upug8MGj4FIH6FwYY6WUFEH
         iYAg2TKCJwx1BuMX+UuSDpm0mMoEc1Zs1kL+FOHQPYVz/5hgWnVh5xbO6OFKYmuHEDm3
         98e7qKaXYr927ebSuk/cSZVSaHcEEjJE++Mi088Pv919XK9hBv9Wl/SURhRxduZR9hRr
         pdlg==
X-Gm-Message-State: ABy/qLbMvz25EMkGl1M6QoIJzHDuA5Fe7wPByRDepAgWjDyyLwZOiDkh
        kP1vKYk5EayCU+Iwq2RqxiYM7N5GHZ2ICBxN/jFg7A==
X-Google-Smtp-Source: APBJJlF45MwjLFi8DeoEpYYJ1M2FZY8uWEGy/ynbbzMI6Ae2ik89QxHMItzOQxSzHW/w0qcnq23cuQ==
X-Received: by 2002:adf:cf11:0:b0:313:e520:936f with SMTP id o17-20020adfcf11000000b00313e520936fmr886273wrj.17.1689232967162;
        Thu, 13 Jul 2023 00:22:47 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b003144b50034esm7071384wru.110.2023.07.13.00.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:22:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v2 0/4] dt-bindings: remoteproc: qcom: fixes
Date:   Thu, 13 Jul 2023 09:22:38 +0200
Message-Id: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

These were sent in March 2023, resent and pinged.

https://lore.kernel.org/all/20230331092125.44885-1-krzysztof.kozlowski@linaro.org/
https://lore.kernel.org/all/5fa6d988-b51a-7c18-b605-ab99ecec8bea@linaro.org/

I already saw two other tries to fix the same issues.
Please apply to fix the Qualcomm DTS warnings.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: remoteproc: qcom,pas: correct memory-region constraints
  dt-bindings: remoteproc: qcom,sm6115-pas: correct memory-region
    constraints
  dt-bindings: remoteproc: qcom,sm8550-pas: require memory-region
  dt-bindings: remoteproc: qcom,adsp: bring back firmware-name

 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml  | 5 +++++
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml      | 1 -
 .../devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml      | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml      | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml     | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml    | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml       | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml      | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml      | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml      | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml      | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml      | 1 +
 12 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.34.1

