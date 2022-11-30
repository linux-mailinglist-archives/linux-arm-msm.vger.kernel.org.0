Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7134863D67F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbiK3NVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235767AbiK3NVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:21:11 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506A56DFCA
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:21:04 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id b2so24989458eja.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt+M81Eqax/B9E6ID1NKT7PSGx4EF8eZ9cLrbLUN/GU=;
        b=NLy0rbEBnyFn6jBjr9qKS6/tr2EzWXrVtc0VSMkNkR3WAxH6M9DJFfBEEKKHBpDNVM
         Si8/JG+dZLaqyK8AO2OIkHKqetRUyCsvELWFogjyPyPvNbJahTMayozY+0YO/Z8bVDsr
         bGKMX0bKMFgbgXycQXgP5uWVHVacJdsabKb6tI2h3dxPidvyd4K95Wv8lnGV7Lx2Rw0f
         eZcd3A44euo4ANvlUT6Jeg3KbyuhVlVtqeER8UT8H6h7eDhS1eBHpYfvCQTrG4pM134h
         Js6iJujMRSRa0c1SNKjY9vIhHulg5nqWF6cx/AXjWntqNK/EDA5uPNaZ+Xyd6fC2SFEw
         y0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt+M81Eqax/B9E6ID1NKT7PSGx4EF8eZ9cLrbLUN/GU=;
        b=pygEXJ/pLBImBhoUCpjPWMWagitu4sbChERmivc/S3tbnynWg9o2bByahm4TXLJXiA
         5XSnmbXQlWRlXmXNX+kV+KxNmer2Wn8o6DWmEE/RiVdMJh92MHzb28oPfmAzxS8YMU0v
         3xn3yjF3HhbCAA0SGhWmAEBlrSn4otL2uv5G0rMBlCHTtpPl+Ulmb6nGqYUxBTMZND4z
         TnhMTGku+yCEEjddE0rr1oyAAuPk9NOpx8BcewYMdHm20ff8swcqtbJfG81IInEzZQDy
         YgFa/oGpRbXzBsHMF1dna2RNqe5yTh9fLhzF/lse8rba8ZAmQhEMV8DBqkezESE90Hke
         ZccA==
X-Gm-Message-State: ANoB5pnY8zZlflsXwhqhIBkDkMBfHm/sZd3pb3h/mQEEg0D71Z490Ryb
        cH8zlo2uMv6N1DPERz56RdB9BA==
X-Google-Smtp-Source: AA0mqf5bPSTVc1ENyQlLFALsPp7erwFsC70U3GUIkkRDxbrOAz+U2EMEY5JXLRD5ynowcwyncXGs4g==
X-Received: by 2002:a17:907:989a:b0:7c0:7bd1:6436 with SMTP id ja26-20020a170907989a00b007c07bd16436mr10613264ejc.718.1669814462390;
        Wed, 30 Nov 2022 05:21:02 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y20-20020a056402135400b0046856c307d0sm650800edw.5.2022.11.30.05.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:21:01 -0800 (PST)
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
Subject: [PATCH v4 0/2] interconnect: qcom: Add support for SM8550
Date:   Wed, 30 Nov 2022 15:20:57 +0200
Message-Id: <20221130132059.3145243-1-abel.vesa@linaro.org>
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

The v3 of this patchset is here:
https://lore.kernel.org/all/20221129131203.2197959-1-abel.vesa@linaro.org/

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

