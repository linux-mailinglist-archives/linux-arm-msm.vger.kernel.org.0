Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6805D5E717E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 03:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbiIWBnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 21:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiIWBnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 21:43:46 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613B9118B2B;
        Thu, 22 Sep 2022 18:43:40 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id b23so9260065iof.2;
        Thu, 22 Sep 2022 18:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kOUa/yf1KJbyu+PEZGAIPrceiPS1gEcuSD5/KPz64pU=;
        b=WkdD/Pt84336mS1NZIBbZ03+wkOomBPyqYell8beJfH02nS5BDELZ5gIHYs3YiMiIj
         GV/9CSmzgn5G2SqDv6m4uB1kTARvzcSWXZ7k/av4sDnL0ioXNW6D0HH8SgbMnAPzD2Jz
         PT5tanv/a7tVo+rw6wWDNbH/Wpo7LdCLvwPmPcaMtcWqEqJnimdPTHONHQAtQgvXDduF
         jQhjAhjtZF5fySnfQsHiL4oPGLNuKX8Pu98pGWU3YiqovMDXxEEGF8kd4PJNMFuV92eC
         EVk4yBs3qbkEWrWn/8+eU6GBCyyJL8e9PrzHFnnNVQw//r1wjngkbrL8yqpoGDOL/2Na
         rwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kOUa/yf1KJbyu+PEZGAIPrceiPS1gEcuSD5/KPz64pU=;
        b=2CLpinphe0VC6Vl56he6tpWLFzSrO24r6oZIAEJKRSX/B+ldJ7hE1kz/u0b4VQqZM+
         6XnRI8erzVB0lLPrlHEfJtj34c7nIpbiNK45H46fjRXH0E2SK+0RFZoQwqD5/WlJnEwA
         pKcGELvMUk/5wIH+B6DSpVg3gKDiv5wzq7iwehry7zIE1gKy0kTjgIulgTu/DSkhffEp
         Vfu1h1XvLW/TLGj3qzKfzpT1kHULiMcV6IzWIIfvSUoKYmDyzkfzL48kxrFaH8K7d5kN
         ytU2SfuUWaTUKIukLxzrXBDzn0A8cdNbhbHA1kJrPE2PIjUN7UPX84heNDsndOtbnhIq
         0snA==
X-Gm-Message-State: ACrzQf1ZlzHcwl0HQm3Yg9cq5Vp/oSQlkFZ7DtuFZ3pU3ze1LCsI1wkJ
        E8Aeg4E7Hg/fRubnaa449BzNeuCskJo=
X-Google-Smtp-Source: AMsMyM5qPVY2YGfFK8brfhAaUP65W7dVTpxPmHSFYLOjXvDzMBKhEKBp+xwttZQ0Zl2Z+01LFPO9/g==
X-Received: by 2002:a05:6602:164b:b0:6a2:83c0:d3f5 with SMTP id y11-20020a056602164b00b006a283c0d3f5mr2904214iow.77.1663897418677;
        Thu, 22 Sep 2022 18:43:38 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::1e16])
        by smtp.gmail.com with UTF8SMTPSA id h4-20020a056e020d4400b002f47787f44asm2652201ilj.13.2022.09.22.18.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 18:43:38 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/2] SDM670 SDHCI support
Date:   Thu, 22 Sep 2022 21:43:20 -0400
Message-Id: <20220923014322.33620-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the compatible string for SDHCI on the Qualcomm Snapdragon 670.
As I noted before, I think it's fine to include something like this
before the initial device tree because it is trivial.

 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 drivers/mmc/host/sdhci-msm.c                         | 1 +
 2 files changed, 2 insertions(+)


