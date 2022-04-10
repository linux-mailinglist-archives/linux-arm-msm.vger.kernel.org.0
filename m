Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A55F4FB039
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 22:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241144AbiDJUxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 16:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbiDJUxn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 16:53:43 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA9655220
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:51:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id m8so376356ljc.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XP78OVn+EySMYvkvHr42vemVzwzDRMsxq8nEH8XnqFY=;
        b=eCYEcTF3sLOiVzrOT7pbB7jQqTPyqpYe/7jhAuP9sKK9ANMYEkpXrrXOFduoxkHaVC
         2s+IJMKd+eJ1dzc4C2KkPytInjh3ClPAHW0vYHKg283/JPg3g/SnxEigKvIsyCPpDsM+
         h1Q9AzohX4qP3yHJucd301KGPUHP6zGTYvaZ7YVSZSBHNlgkf1FnS+9LGswuHgjo7LLO
         1+lyN1DpuYkuFi/ItLAPrXhZXol4TdvFTnWD/a4PPf8QvbwkzvLqaJkpCnwEFNhFs9ru
         8HVLeeHGJpguQSdsijW0xM+utQDWK2E4OpeqavS+9k794hmtjknz3suWQV+2X4Q/TxbR
         YMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XP78OVn+EySMYvkvHr42vemVzwzDRMsxq8nEH8XnqFY=;
        b=Ipmeh6jSmsPvrV4BgPZVx8OpS0ZA3vPXeYAXPr50jNL7aOcnRNPdKSeNLbtnNOyEdb
         YXhCc59rVuj7T84UqpwZAMSL358gscJ8dji07Xkly4GzLxW6oQzS3bTswtWCecerTjO3
         ePkEQrIyB7XCKz3yBzXKP5fBmrEsh5JhOf6UEJm1N5LFmdCJqe1vS9HT5vaVLzJqteAk
         u7lsKGpjHZQlKzkEWHL9G97SjXBvlhT/fGv/Qa0CHtCSzb/KxV9JT69gQkDV7z5h+iaf
         EU79h3hPRhB1Sn3LJnhzRfrKSClevCav4DtW5wyuv3QrZJpZ19LvVYvYBA/wdzramvdI
         F9aw==
X-Gm-Message-State: AOAM5320qfIGmuOAwC16TPz8wINbUdOm1XW0FlTK5PsgjCLzkWEm5jKq
        1T4dyJYpt0twkx1MQ4DabEwkAg==
X-Google-Smtp-Source: ABdhPJwr/IUolmG+Hnh/ET+ZaAkdk8RTwVJXtPdiTcl1Jkfw1tLts+55b1NXdP2x3rIkMs16aFxPJA==
X-Received: by 2002:a05:651c:10b1:b0:24b:2139:471a with SMTP id k17-20020a05651c10b100b0024b2139471amr18337142ljn.12.1649623888532;
        Sun, 10 Apr 2022 13:51:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15-20020a19910f000000b0046ba6b39d14sm85244lfd.10.2022.04.10.13.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:51:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8450: add PMIC includes
Date:   Sun, 10 Apr 2022 23:51:25 +0300
Message-Id: <20220410205127.1670705-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add includes for PMICs used on two SM8450-based platforms. These patches
depend on the series at [1].

[1]: https://lore.kernel.org/linux-arm-msm/20220226205035.1826360-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (2):
  arm64: dts: qcom: sm8450-qrd: add missing PMIC includes
  arm64: dts: qcom: sm8450-hdk: add missing PMIC includes

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 7 +++++++
 2 files changed, 13 insertions(+)


base-commit: 3123109284176b1532874591f7c81f3837bbdc17
prerequisite-patch-id: 435eb95d10af754e1f192cd8320bee260c3a46c4
prerequisite-patch-id: a3e95931fb401248d550ff95a1030bb2e6f86d54
prerequisite-patch-id: 5e13599495bd37b79c7fa870a440604892992f87
prerequisite-patch-id: 3d92b9a5b685aa2aae132cc4de10411ce5ce6472
prerequisite-patch-id: f36bb6107c1db6710a2766c623ecce5c5bf4f843
prerequisite-patch-id: 73bdfb2f30b1225919dedc692e9a9ed0ae923b2f
prerequisite-patch-id: f679f3592a872a3becab63912e735f9e4ecada1c
-- 
2.35.1

