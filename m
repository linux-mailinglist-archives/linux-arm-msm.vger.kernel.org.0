Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C5062BBE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbiKPL1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239330AbiKPL1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:27:07 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7C013D5E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:50 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1218074wmi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJNbm/BEq4BvvQJ4DuY+WTXZwxIzZg57cNF+UvFbOgQ=;
        b=UvOPKeUkvHAHNER8lGOSCTiFAHtG2KmO2hU6Wr09tjcNAIHiT5WOaLrQ7dh0qeAOix
         fcgxSz7naOCBEGS3K8BVRLNaA2Slymjnz8+iDIJfafGXweRJl4uR1BE7Tm0DMIUalrwJ
         qPbb+P5scivk1Ulj/IOwsK3fC3DQOaElqjsilXl0UHE86xw+LtTcSsjmqIYKXzbkFcEV
         xMNQRv/uCmG/pflYhpZFmlZI51i2dq2ziUsPOgQGy1KWp9a1L+xpNrgrpnz1Yway+LpV
         CnoORtUIJY5mMBFH2G6LA3cGReWag+wrfGjTiWHDA+WjWKgcRxQOWb9KDTGqUPZBByAQ
         pA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJNbm/BEq4BvvQJ4DuY+WTXZwxIzZg57cNF+UvFbOgQ=;
        b=dDzkpdanXfJ5WADyskifYYtreZAQ7zmuFW6+PbTuaRxdmjXvog+PdFCQ7LxVKA2U0t
         6JiJjuY84ZviEqvi88EKQvYDuzRo422qXIjMk3UxTSTYYwNSUyPun42iayHFCAQSRs7Q
         0DbC6mDGQFE0ylVLYNYos3vs/X5pj7/aUNf80DTZStPosT2l4UqaEp9KzaSM5sTkEniI
         tPv5uSRXqAT+h5KVFKBdxt6exNsDnF2bmGR0+eQfifT7MrKK6+h9Gcj5+vxOxB0tyBiU
         EuG+ivokT0mYHUORlA6i3Y0s+wXg5xMRpvqC2UbXgYh88CSht8S7AEuMr01kP2NSTlpr
         0KvQ==
X-Gm-Message-State: ANoB5pnC8DC+/R7YNzxFOQZrThBPHPZLrlSW4lSx6oOi4/llAiyEfRJa
        EhMgBlSSG6PrnYn8K9B1esfSeA==
X-Google-Smtp-Source: AA0mqf4EfVmC3Ny/bNTCXXIYrw8XbIEbanKNFwWg+XY5cSND/ooSla/q7HqiZKwf5xpEezo5rxl5JQ==
X-Received: by 2002:a05:600c:54ec:b0:3cf:8443:e4a with SMTP id jb12-20020a05600c54ec00b003cf84430e4amr1838789wmb.27.1668597468977;
        Wed, 16 Nov 2022 03:17:48 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm1875870wmq.31.2022.11.16.03.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:17:48 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] soc: rpmhpd: Add support for SM8550
Date:   Wed, 16 Nov 2022 13:17:43 +0200
Message-Id: <20221116111745.2633074-1-abel.vesa@linaro.org>
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

This patchset adds RPMh power domains support for the new
Qualcomm SM8550 SoC.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Abel Vesa (2):
  dt-bindings: power: rpmpd: Add SM8550 to rpmpd binding
  soc: qcom: rpmhpd: Add SM8550 power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmhpd.c                     | 24 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 16 +++++++++++++
 3 files changed, 41 insertions(+)

-- 
2.34.1

