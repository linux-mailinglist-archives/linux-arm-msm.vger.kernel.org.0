Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53442641166
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 00:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbiLBXVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 18:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234705AbiLBXVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 18:21:11 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C74BF7A2B
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 15:21:08 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id z20so8289666edc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 15:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtvKUnumnzVEtCCrGx2jX9RV0tsvIRbyk1vAVgd4Pdw=;
        b=Sbi+S+gPjUHT3arab+0NNvc+l7IToOHQQvdPU6a6+GqAdbg2QiUETyaF/z7tRNYTUS
         j04lTgJHOz0Nj9twV8qFbA/f9IcmTJrnD/IUt8xBcvAnRMp7BIQJ11yGUgltPn42iizc
         KFwvbFvgi/r7AUxtIBavnmJw17Lbcv4ojBgggctwVZQHv+3I0FiNx9+jebwvYKP+0GSm
         Df67eymGA+VyjeyshaJPdja2R96NEaGgQQUjbxSV8UbMAqmjaEyRPn9bWGonA0cnNVSH
         bi2TI0MetEqMssIMtO6e+kjU8XFvJwkaxz4yAIdEPYrInVwOJvETlbf/RDhb2TtKq4l1
         AEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtvKUnumnzVEtCCrGx2jX9RV0tsvIRbyk1vAVgd4Pdw=;
        b=dKgZZmuEJzZ3A+eTmwgbMl5tXrAoM2OZhrDZZxUCU0cMkuXUBkJ0umxmF+ZwPPZU0s
         BBaDR9jtXiHC8hPppOrp7FFWyNXZscRw6MoJPJb6D7N4lRtMtEet6VmkLpn8jKYQfXwv
         pZFEYZfQp+zvvnQ3cuAnFPH9UkVihMMWlQVVf4JV3lGAgy++xkEUq6//NUWhG1Yqw224
         /U/ADfXTzVus0SpfDzY5kSPU5+XsSXoUkbdZRc9pokfdWGZEgHQk8bY4dmZzzx4dIdmh
         DSbcXsp1DtNY2L/GIORlJbbpV6eVqtha7pxhvNg9bjKIpdmZW5ZT13mZxpJSKx496jIG
         aKgA==
X-Gm-Message-State: ANoB5pkM6qA75atAPHWbm6AVWnhb6qw1IOKtcjB0UkhTTjBtJtbtzzjS
        puyvgXsi2cwBwPJNkZI5KiGpuBGrzHSXKce+
X-Google-Smtp-Source: AA0mqf5X6CKep4syQrVvp+4miTb0w9B9WPX/2DEJN2hNrBOeCbq56fmA/M6dGpCSh7vzFv5HUXAFJQ==
X-Received: by 2002:aa7:cad9:0:b0:461:60e8:7ac1 with SMTP id l25-20020aa7cad9000000b0046160e87ac1mr18659661edt.45.1670023266561;
        Fri, 02 Dec 2022 15:21:06 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id d4-20020a170906304400b007b2a3cad2cfsm3521293ejd.132.2022.12.02.15.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 15:21:06 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v5 0/2] interconnect: qcom: Add support for SM8550
Date:   Sat,  3 Dec 2022 01:20:52 +0200
Message-Id: <20221202232054.2666830-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds interconnect support for SM8550.

The v4 of this patchset is here:
https://lore.kernel.org/all/20221130132059.3145243-1-abel.vesa@linaro.org/

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Georgi Djakov <djakov@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (2):
  dt-bindings: interconnect: Add Qualcomm SM8550
  interconnect: qcom: Add SM8550 interconnect provider driver

 .../interconnect/qcom,sm8550-rpmh.yaml        |  139 +
 drivers/interconnect/qcom/Kconfig             |    9 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/sm8550.c            | 2319 +++++++++++++++++
 drivers/interconnect/qcom/sm8550.h            |  178 ++
 .../interconnect/qcom,sm8550-rpmh.h           |  190 ++
 6 files changed, 2837 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm8550-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/sm8550.c
 create mode 100644 drivers/interconnect/qcom/sm8550.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8550-rpmh.h

-- 
2.34.1

