Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8B363C0B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 14:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbiK2NNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 08:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbiK2NNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 08:13:13 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D78D62E83
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:12:09 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m19so18456272edj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGYMXBpX4kCTXFb7In42mmUQ0TnJwaY3tVruVQALiM=;
        b=qYzyHHRuHsbiBL4KnYqHuAcMAfaAL6Cryp5vPg0Zjb0XGggP+M1b6b2KiQyenpLQr6
         TZl0yUUe8OSlDVO97gTkjaI3cKSmCrkRPnkgXY5bi/29pGrePfz4Ly/6k25TZZmhGPUp
         KqfVBm7cAiQ4LuPz0NMfBPeO+ScQ4L+Gw065HaMzBznWX6D0fKsZ49WBcwdQ7veW18S8
         I3+kYptVPermoS64iqUo48NfRXMp8HKOHiXbAHIElXRkDRIGCLSQnZpJMhBXMlfnCAqM
         Bme7wERG7/zwLQ63Tl45wAIh98JfoCd2geWVlwOVNNryD8OfEr0H7TLone6ZNHKJ8CVN
         h/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvGYMXBpX4kCTXFb7In42mmUQ0TnJwaY3tVruVQALiM=;
        b=klzGNsFqWn497bDrTaiW4+rAGTktREH05HFrjHopp7kTf4xKW+8fxDi5e4c/4tX5Iy
         LoAc/VgNiKxD2/S+2NDddA0yBnFN9p7motclenZrRCdCq1TZ+QTs0rwjJBwmi18Uofi2
         an29CyaVC2J0+dI0B4EEvYkRSDPUzCeLzGSFk54q7er8eVy10c9sUZbIKYd41QHWiYhC
         mALavqqhQ3pqRWKq2UtoPitHnICxKvZfge6v/lYl5dZgK66EujEzYHMEzfAB/ikt4mCd
         cy+iXgWzG6OLeXc9tbVBIz1r+Hs6/Pd+JRojOfwdQ/50H9A3EWRVg9rPmGsa6P4a1aWz
         8pjQ==
X-Gm-Message-State: ANoB5pkIHaajELMQqiePEe3SLusqq86PNWSvhr3rY4Uc64PV92xsxaPs
        j9bY2QpAzo2lAoTBGvYvhAr9qS/nbKvxXQ==
X-Google-Smtp-Source: AA0mqf4mE6fmy2qJlzqH6rEehX2y9w2oMpqP6Zc2O9ZYfPeOLu+kRcI0MUTEUxfh31doNKzOYGj5BA==
X-Received: by 2002:a05:6402:2949:b0:468:fb6b:3a79 with SMTP id ed9-20020a056402294900b00468fb6b3a79mr50642882edb.63.1669727528092;
        Tue, 29 Nov 2022 05:12:08 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p21-20020a05640210d500b0046b25b93451sm2620541edu.85.2022.11.29.05.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 05:12:07 -0800 (PST)
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
Subject: [PATCH v3 0/2] interconnect: qcom: Add support for SM8550
Date:   Tue, 29 Nov 2022 15:12:01 +0200
Message-Id: <20221129131203.2197959-1-abel.vesa@linaro.org>
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

This patchset adds interconnect support for SM8550.

The v2 of this patchset is here:
https://lore.kernel.org/all/20221124112232.1704144-1-abel.vesa@linaro.org/

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

