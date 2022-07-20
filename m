Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7E957C065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 01:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiGTXBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 19:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGTXBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 19:01:44 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A638EE1C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:01:43 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id s204so12772154oif.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o25Onl7W5ZVNjrmImxnkBTSvgWGk4UAcWc7YmpIZ6r4=;
        b=mK5F3e7LiNs/0CGm0JGzLchWjmGhAIkq+4IoVOpqXb6n3cpHI7cd57MntcGc0IyaXa
         a6WZI55Oj0lMwEvyP6VaRk649bnkQpGFppp5x18APUYhqL52SpQCHjLe/+9wMfeXPiIS
         O1L9S2XXzilDA41aVPJeUPIEPxeRLNHoEYsPF6XC2eMJKPex0yalZJhy4AkfZAUFZf8G
         KHabkEcGxM+dJlUAJmm6IqgmRxLLAm0N7CDCnthNkwp6nYFGue7oQuGFhNC4QuUbmwqh
         YyteQR2qhvJeoLabnPpahbVoMlEOG8oPtlVV8SP0OK+eo9uCOJMngLBA4aMa5PTVyv5R
         5N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o25Onl7W5ZVNjrmImxnkBTSvgWGk4UAcWc7YmpIZ6r4=;
        b=3jSJzQixzdeslZ3SnhFRFElJmd5Ci4ui4gToj08kXVxS4AWpW2z94N4jl1a6QtXae2
         58sg5UYhErXKOMcGhhHTrvUyl7ZI77zX8sWHPTihKh0xz6pAnY8gG4pkOjgFLW7dVlz7
         rqChT/LcHANnBiLkTB2B0BVJeTbx1JL9Pfb7ehVxNznsHtnZKwlrEE1P8FcoTEogAASx
         brvA6xVADmPAickmhgpYemlCuZcW7Szq4+aJl5ywbEBKPX3nxDKSWnSQM9eWzTyNCxTd
         PClPeXiIrXtW6nq+kynofbV9WGsFKpc+OwHh2T+VWu59tYXCSbXkoouiH/v6bXLLiXWk
         +OFw==
X-Gm-Message-State: AJIora+YOwa7LwiUAIi1iiaqX+6UZ+hHBnz1tA580ibeWn1ip1YxiSN4
        sQwkhptw3tIcrsApKgiKlTdZKL0wo6DX4A==
X-Google-Smtp-Source: AGRyM1ujUZBy++05futBPsAGLy0FI7423+W5FtvCMDAHJrVczv5Pc7TTBRPdPlzwE/C4lPbsRInXRg==
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id ch6-20020a0568081c0600b0033a9b3bb3cemr3414012oib.53.1658358102405;
        Wed, 20 Jul 2022 16:01:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b16-20020a4ae210000000b00435a4c8e3c2sm121321oot.40.2022.07.20.16.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:01:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
Date:   Wed, 20 Jul 2022 18:01:40 -0500
Message-Id: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
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

The following changes since commit 76f11e77f919397f31198354cd0e0bd8e76f8748:

  arm64: defconfig: enable Qualcomm Bandwidth Monitor (2022-07-06 15:58:13 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.20-2

for you to fetch changes up to 01579b88a03a90af73b584fed70d171c73c2c540:

  arm64: defconfig: Demote Qualcomm USB PHYs to modules (2022-07-18 18:56:02 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig more updates for v5.20

This enables a few of the core drivers needed to boot the 8cx Gen 3
platform and demotes the Qualcomm USB PHY drivers to modules, as they
don't need to be builtin.

----------------------------------------------------------------
Bjorn Andersson (2):
      arm64: defconfig: Enable Qualcomm SC8280XP providers
      arm64: defconfig: Demote Qualcomm USB PHYs to modules

 arch/arm64/configs/defconfig | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
