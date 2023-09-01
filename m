Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B643978FA5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 11:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348693AbjIAJCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 05:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345416AbjIAJCg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 05:02:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8949E10D7
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 02:02:32 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b703a0453fso29670561fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Sep 2023 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693558951; x=1694163751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJHjmi+q0iHTFctNC9OhHyJLMwyd3fj+9iKID7Mfapw=;
        b=ibIYZ5Z0wklSKq294ApYMKx8nVRmc1bhP5QZllP4m7cHrycXASvDr+VN2t+wXHFfpD
         iFulvUM3brKe/7jK3RmeCM2FyMffYMtd8oBNlOcrBvH3JxHZy6mgwq3jVgvG83L6s488
         f6oXtrwvwMRRM+qBbXlDDQNn88poHngKRIFKvJNkVTvyvGzCBSF9P5O/3niy9+LaNtvU
         C9qxR110Kwjuok6znMhtqs6i3/Z6MhpJ1Vvj5jgYrSbBYq4ysgRy3QZ+DIEQz4PBBxqI
         b5wpwe28vqpNOqLTcotkwIg9bonT0tybPtB3H9CCjqq8pcUQgg/iJYNK6w/AtUEkcofL
         QpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693558951; x=1694163751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJHjmi+q0iHTFctNC9OhHyJLMwyd3fj+9iKID7Mfapw=;
        b=i9BF7KasPk6xvNVgHCVfgF5+F8jy7Ek8TomcWOnEwilUqx8yIoq7mmNHn9UmEqdXzo
         D18FUik/rpw/qEygMeVWKRkZcm/x93aDMcNqSjMipflDWlkTOlwlJ9/cYLRofMEXcQpJ
         HMzyhQBUsw9oSi0z/zbcaJpHDX7KbAfos+M5UgqBM35Dr9XR998l3r4O60snfVPX5yxs
         PbyX3vFz+dKJ7+NJkVw54pAgB8x471BHOhxBy2IpYW7mP9A/ntReIz5aT2/m4Sw2FE2l
         JOcNJ3Y2kWXiqq0GJKdjH1BVEfEhxLTSxcT85N4ECRqtjUwpnLAHIJFy3Cn5UOPOEmJ0
         8mDA==
X-Gm-Message-State: AOJu0Yz9Jr9XddSe8utGOMhvThuZXheAY4D23giyztRT7ns8OCvRLV9/
        R7qYhH4Y9uWbuyQXhVBEwXNRbQ==
X-Google-Smtp-Source: AGHT+IEctluZrnUiVfm5uSX+097BIOvQyHari7Np4dy4lrD+QbhThPEG3aORpmAqhBndRm1EyOhfwA==
X-Received: by 2002:a2e:925a:0:b0:2b6:bb21:8d74 with SMTP id v26-20020a2e925a000000b002b6bb218d74mr1255364ljg.1.1693558950787;
        Fri, 01 Sep 2023 02:02:30 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id ov22-20020a170906fc1600b00992c92af6f4sm1753687ejb.144.2023.09.01.02.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 02:02:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] pinctrl: qcom: lpass-lpi: allow slew rate bit in main pin config register
Date:   Fri,  1 Sep 2023 11:02:22 +0200
Message-Id: <20230901090224.27770-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Prepare LPASS (Low Power Audio SubSystem) pin controller for newer
Qualcomm SoCs.  The patchset does not bring the newer SoCs yet, but only
re-organizes the code for future changes.

I understand that patch #2 (adding flag) makes little sense without
actual user of that flag, but such user I cannot post yet.

Dependency
==========
Context depends on my previous fix:
https://lore.kernel.org/linux-arm-msm/20230815110625.317971-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  pinctrl: qcom: lpass-lpi: split slew rate set to separate function
  pinctrl: qcom: lpass-lpi: allow slew rate bit in main pin config
    register

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 69 +++++++++++++++---------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h |  7 +++
 2 files changed, 52 insertions(+), 24 deletions(-)

-- 
2.34.1

