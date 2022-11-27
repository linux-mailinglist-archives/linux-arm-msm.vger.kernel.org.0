Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBFAA639A18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Nov 2022 12:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiK0LYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Nov 2022 06:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK0LYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Nov 2022 06:24:32 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5637EE087
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 03:24:32 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id j12so7689760plj.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 03:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPILUa0E2+UPwh5RG/lt7u1tMuC1PixA+4Ph8vLKr9c=;
        b=cLecmEoEUkA48vnGQAkcp2jvBy3nUcSdoDo5hlEQEdSPdd3WgxCAP9q3DnHdYMVNo9
         3e9ueOrhH7lMJb9RUCCiQ8vASt3zEKJ+HMiUL3qJdqJSbLclz80Pcgb1qMrbN46hAwfx
         GIZ5fbiHFdXfoiGHzeqAGeA01bmP02SIsRBVxbE5xq95I7mUXN2PGwBy4lA3da+CwIbs
         CrQ4xKtmL2clBnWpmWawmhQErO4vuN8jLy6+OJQastrCs1BtXyc+/zEiGUH0KMdrmu8U
         +4nrGwbqaOipROcfVL4Hbix6Dheua2xvB2y8q7SEgNAZIjPApFxEujAJ1+1s+dfFHmhI
         HKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPILUa0E2+UPwh5RG/lt7u1tMuC1PixA+4Ph8vLKr9c=;
        b=pZFiRHX0JhRuWp2ssSGLLmhNJHa9PzChjbuc68wPoFP5JUe4GPSDuQGUUooAYT+UEG
         r3dDlejTKcSxkgTamWslTcB4NQAJcgZXMUzu4yELRQnY9Si6LjiEATJu8QTDl52wQauA
         d/D92q5IXW/3ib5Nx2kxES/VJAQYmD5sgSMhephLDJX2XKKirNKoiQQq4j0U5MFSe08+
         9fMS+JWr2B6+3WO+Ry+n770+j8TZ1OxI3LA7d7CvrDjuPeHwotJtAOeqoDrbqEisojCn
         ubnNMs7AsQwIyTUfdw4BlVzhZ+3Av9S2uR74a3Lawq1UwxUk1afCBOPxQ3oglD1Pjkq7
         NkiA==
X-Gm-Message-State: ANoB5pkMRJOZR2y2qaHAYdwg+7YXeqUAqjL9Py9K9kE6NkzJA9WzSzy0
        MRJsG+9sOGjmR01IdxLIRHkUT7VYVraYyA==
X-Google-Smtp-Source: AA0mqf6+Den320jvJgzcrIFShkeIBr7UH1fOPWtMOzWHVv31xj2aYO3nmNTBS3u96kkLCZBdlh+nJw==
X-Received: by 2002:a17:90a:9a98:b0:219:2f90:4fb3 with SMTP id e24-20020a17090a9a9800b002192f904fb3mr1891027pjp.109.1669548270831;
        Sun, 27 Nov 2022 03:24:30 -0800 (PST)
Received: from localhost.localdomain ([223.179.131.184])
        by smtp.gmail.com with ESMTPSA id oa14-20020a17090b1bce00b0020d24ea4400sm7691349pjb.38.2022.11.27.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 03:24:30 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/2] Add SM4250 RPM power domain support
Date:   Sun, 27 Nov 2022 16:52:02 +0530
Message-Id: <20221127112204.1486337-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add RPM power domain support for SM4250.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> 

Bhupesh Sharma (2):
  dt-bindings: power: rpmpd: Add SM4250 support
  soc: qcom: rpmpd: Add SM4250 support

 .../devicetree/bindings/power/qcom,rpmpd.yaml  |  1 +
 drivers/soc/qcom/rpmpd.c                       | 18 ++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h         | 10 ++++++++++
 3 files changed, 29 insertions(+)

-- 
2.38.1

