Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5435950FB84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346939AbiDZK6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346665AbiDZK6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:58:17 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D5D5FD8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:08 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id a1so16179460edt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+kdqZ0e0BfTpUJcAQ2+O79SrHfdDIBqWofdQvVP3M4=;
        b=jR1XbJCEl9tiQvAOzAvK6SaGzt3gFC6OkN33Bn+qV2rYMQ/PHWJOCnSJrOAS5dlrdA
         wFGWQba/x7UMC8XoxnEKpy5ZsBchJpCsmRWXNFw1nSIXDW3pbdyrEmVziEV55lq0j1Uw
         2L66vW4wAOu18ynJ9vGnejALfPx6bo2ZFNIbXhAbG6C0kjLJVgHp1X08ZmtLpMm6j+hE
         /Ai07IduDoiGsWcob6ITc5bQch8uiOuFt4D0WkFH0JJZOsC/mbzgoGAWkoE12qENsUnc
         UCfM3WYJNkP+KxmIcpJaJYhz8/jFu3XnBSwBqX+ZqWbEODq/ro6MDrTMikmwTdmpBcbF
         pafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+kdqZ0e0BfTpUJcAQ2+O79SrHfdDIBqWofdQvVP3M4=;
        b=ewOVh6o3XtMishH7d2XLJWq71PiK/arD3amprx8XNlk16oflouajxg2fxpjvT4tseC
         4jmY0KCGqdMuipNlJ+kDzprtX0eBHb441i/c+CO/1SKyaupLZtiXq2Z5S7J8MRikdDtj
         ruwYGPmwwLhCqgEpqXxYgwyy/0RkJGqE7TOysiu8itakdhZSO2GuAk1LlfguS+DH4u+d
         ibvEEpw1kDegGvQOYTfGk2W4Z2e8CjEDwnPhCmqVMsiRFHiv2KvEbPfLZ2q+uw03klG2
         npiS0RUlwfqAX5l//ur0CJIhciXp7a5otfQklxJKJpd+Yt4SLvmmXW14zTx/LbpX6S1x
         Gw2A==
X-Gm-Message-State: AOAM5328fCYMEnHnFW7Y9991TFrCpR9AvCnS38JHaLFhcZx5QvSfg+/Z
        GtVyflpY9/BJO3Om1q3VidhFzg==
X-Google-Smtp-Source: ABdhPJy8Kgtcoxq+3D7YG54/OKzySwOPcYIgi5z6xFfcVwdiTIgBOe/ypJFWJcbxqd/lHrsPuJLQsg==
X-Received: by 2002:aa7:cb93:0:b0:415:d57a:4603 with SMTP id r19-20020aa7cb93000000b00415d57a4603mr23568366edt.62.1650970507360;
        Tue, 26 Apr 2022 03:55:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s5-20020a508dc5000000b004241a4abbdfsm6062843edh.45.2022.04.26.03.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 03:55:06 -0700 (PDT)
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
Subject: [PATCH v3 0/3] regulator: dt-bindings: qcom,rpmh: minor cleanups and extend supplies
Date:   Tue, 26 Apr 2022 12:54:58 +0200
Message-Id: <20220426105501.73200-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Extend the RPMH regulator bindings with minor fixes and adding narrow supply
matching.

Changes since v2
================
1. Remove "defs" method, because schema nows allows unevaluatedProperties
   without references to other schemas.
2. Include maintainer change patch, previously sent separately.

Changes since v1
================
1. Use "defs" method instead of referencing additional YAML file, because the
   latter was not working properly.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  regulator: dt-bindings: qcom,rpmh: update maintainers
  regulator: dt-bindings: qcom,rpmh: document supplies per variant
  regulator: dt-bindings: qcom,rpmh: document vdd-l7-bob-supply on
    PMR735A

 .../regulator/qcom,rpmh-regulator.yaml        | 260 +++++++++++++++++-
 1 file changed, 245 insertions(+), 15 deletions(-)

-- 
2.32.0

