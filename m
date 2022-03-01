Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7797C4C81F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 05:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiCAELT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 23:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbiCAELS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 23:11:18 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEDE58E40
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:10:38 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id y7so15245778oih.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFxxNgl/Sl3OIeyhMM5RFMZPxpbryf6azJ9AgfVgySQ=;
        b=Zj8VLqfHVDHSZ0LvJkj5NdAYCmGMHwVddqkmtu4uImc62pjQ/wMI1Eopk/cA9lA9h+
         Qy11Ib1MVrgvPzYcZN4zhUVHB+hKnUcMq0nVRr6W9LWIAgtmaKrqhntqPuMnVmskIUAN
         aZhnc00x+24+2ni+ElfGju1mVd8sYW9Wyvn7C9qGgY1P7dubG8GwvPdZzaAr6CO+wppi
         HG4jtyjzVfywlhp0mQSU+JuCJMbgPXmnR65FInGn3Mu06dIc2Iz5lKDyAB1ABYBQVEJW
         g5W1M3cEEB1Eds913ZdDwsXMaWVr6VAIrMbQBKOrmsQzw7QwC3DHuaD4t3AoVwNQWZF2
         4hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFxxNgl/Sl3OIeyhMM5RFMZPxpbryf6azJ9AgfVgySQ=;
        b=8I8a+hJ3nkVdtXQ2u6BIRrzt57RN7PNpArUa2wMOvt/8f39M1RZuf1XoFDinI4jZk2
         K6tdl7TA0lsq7n+BMpMiJhtS2CBi+pKKCyx3ShrVxvXwE+yeqV2UlXK8XIm/DNc3DqtP
         dPqo9JLj8ZowxWDM+ul+9TKI9+t5CGwsHprjOT/6rjMN0uM39bB7q4wvu6zLzza1MLRh
         UT+KhXcXtXAOZjWfyDHzCUUADrlVkgdLcyMNqIO9h4yl8Khn2Vc7UQVBzwEtOIfB4/g7
         2XJmIt5zy/xAXbrT6hrAOTn5TbrTBVzKNqgkZMxfAehCFyd2Jo2it5NpTy0WlnXW+7i3
         W5Zw==
X-Gm-Message-State: AOAM533JbzOVcp6SesJaC1WM9KpjfHdhehdvn0HPvgha3whAz22QA0gT
        y4toelG/JRSOkOSvWX9LJGuexgomwDdVaQ==
X-Google-Smtp-Source: ABdhPJwdMBx/zpfoOxDDDNLMWaLcE4eNerej7Lxy/jpQzWl+IXhF2PcdB/6g0RLLp9JmVaKYDnTCUQ==
X-Received: by 2002:a05:6808:230a:b0:2d5:281f:9d23 with SMTP id bn10-20020a056808230a00b002d5281f9d23mr11728612oib.4.1646107837461;
        Mon, 28 Feb 2022 20:10:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x3-20020a056808144300b002d4dedfc1ebsm7505272oiv.20.2022.02.28.20.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:10:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [GIT PULL] Qualcomm defconfig updates for v5.18
Date:   Mon, 28 Feb 2022 22:10:36 -0600
Message-Id: <20220301041036.1804008-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.18

for you to fetch changes up to 7495af9308354b37a3557518d0d04f4cdb2a7837:

  ARM: multi_v7_defconfig: Enable drivers for DragonBoard 410c (2021-12-13 16:52:05 -0600)

----------------------------------------------------------------
Qualcomm defconfig updates for v5.18

The Qualcomm Snapdragon 8916 devices come in both 32- or 64-bit form,
and even though the typical case so far has been to 64-bit, it's
possible to run the Dragonboard 410c in either mode.

Enable the relevant drivers in multi_v7_defconfig to enable this, and
other Snapdragon 8916 devices to run the 32-bit kernel.

----------------------------------------------------------------
Stephan Gerhold (1):
      ARM: multi_v7_defconfig: Enable drivers for DragonBoard 410c

 arch/arm/configs/multi_v7_defconfig | 57 +++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)
