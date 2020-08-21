Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD7924D526
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 14:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgHUMju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 08:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgHUMjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 08:39:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C89EC061385
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w14so1684112ljj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIFTXiqdlJiH5Ff+L1iQE7Y7lj+PmoFksQbwOIlNgxo=;
        b=kiBhSfJ5PEpcHfVUu5C2cMfC9rQEBCLDMn3aPchEAe7VavcR0XsOTFPVGDmykEgVRW
         Btbv1uY2yErJSs6WWRTSxMX76gkyNiBx9gWfjuP1Z7Wo4xU2wcBCFnhbhtHVdRjU2G6T
         kBiMfEll3ZHLapavJDBcoxwoBoI2rnThQAehRQW7n16B5IaR73syb+NcXWGltGwmHJqm
         H3fWiPVnPZeZ1CrLc0giTSmIoVNDgnw4ZMibmb6mMcw+YvQMKV9dByz9ZNURGG1Kqg2B
         BNThmPTPcK1S1lY6okNvLZF/YvDXffPjdBg3SNOcNVdNtglVU2glMtmWwuGDq39Hw6CN
         vdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIFTXiqdlJiH5Ff+L1iQE7Y7lj+PmoFksQbwOIlNgxo=;
        b=l9ndGhU0VkajYN5DDRxNytAdNK2jN56sARKYfxFmhYimT1dEz8q9HPSXvnszZQQ+y0
         ieKNn3JLUcuDc6in4YD4V3Ygdys5rtUXZNjfUe/o0SCV3W9NlqCJszoDhBa7I9KTs9hV
         ky2P4ebv9bJkiagyhz6dbKQP+l4C66Cbe8R9g62+qHbNy1uejMU+dzpXYEhy/qHjp4Wk
         kO5wHL7HFfPrN3jZqIB0IxkMl2pVlbqgGA3esWJrRF7H0gIdr3zp1p6SayDgfmXwgjqK
         ytFskgjLYflPGkTcEvfW0e9+bjj6zXo3akAIclnHXUeXIzNvc9BnFYwkSOxVRmX06O1r
         lIeA==
X-Gm-Message-State: AOAM533HhST9bdNiGFT6+3hcvvVPR3X1ONKrOBcW7dSYhDCTJsCRiT0s
        bXLUPeFwt3WC4UF75yrf70lqgg==
X-Google-Smtp-Source: ABdhPJwSQ/OoMbOcVAUSJti1sYkQ3liRlRisl7pN51zUlNafL0BgOSJ5FZI6ki5puknfwx2YpogpJQ==
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr1571977ljp.312.1598013581021;
        Fri, 21 Aug 2020 05:39:41 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s4sm360782lja.124.2020.08.21.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 05:39:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Russell King <linux@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] Fix uncompress debug prints on Qualcomm
Date:   Fri, 21 Aug 2020 14:39:33 +0200
Message-Id: <20200821123936.153793-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This fixes the earlies debug prints on the Qualcomm platform
and possibly others. The root cause that the "Uncompressing Linux..."
and other super-early debug prints were not working was that
the Qualcomm UART has some elaborate TX ready code in waituart
(after this waituarttxrdy) that was not called.

waituart would sometimes check for CTS (clear to send) which
would make the kernel unstable on these platforms if we
introduce more users of that macro without thinking twice.

To fix this properly I first split the CTS check into its own
function and make it clear when we do or do not check for CTS.

I then convert the flow control option for 8250 to a generic flow
control option so that other debug UART drivers can look for
CTS to be asserted if they support it.

Linus Walleij (3):
  ARM: debug: Split waituart to CTS and TXRDY
  ARM: debug: Select flow control for all debug UARTs
  ARM: uncompress: Wait for ready and busy in debug prints

 arch/arm/Kconfig.debug                | 16 +++++++++++-----
 arch/arm/boot/compressed/debug.S      |  5 ++++-
 arch/arm/boot/compressed/head.S       | 15 ++++++++++-----
 arch/arm/include/debug/8250.S         |  7 ++++---
 arch/arm/include/debug/asm9260.S      |  5 ++++-
 arch/arm/include/debug/at91.S         |  5 ++++-
 arch/arm/include/debug/bcm63xx.S      |  5 ++++-
 arch/arm/include/debug/brcmstb.S      |  5 ++++-
 arch/arm/include/debug/clps711x.S     |  5 ++++-
 arch/arm/include/debug/dc21285.S      |  5 ++++-
 arch/arm/include/debug/digicolor.S    |  5 ++++-
 arch/arm/include/debug/efm32.S        |  5 ++++-
 arch/arm/include/debug/icedcc.S       | 15 ++++++++++++---
 arch/arm/include/debug/imx.S          |  5 ++++-
 arch/arm/include/debug/meson.S        |  5 ++++-
 arch/arm/include/debug/msm.S          |  5 ++++-
 arch/arm/include/debug/omap2plus.S    |  5 ++++-
 arch/arm/include/debug/pl01x.S        |  5 ++++-
 arch/arm/include/debug/renesas-scif.S |  5 ++++-
 arch/arm/include/debug/sa1100.S       |  5 ++++-
 arch/arm/include/debug/samsung.S      |  5 ++++-
 arch/arm/include/debug/sirf.S         |  5 ++++-
 arch/arm/include/debug/sti.S          |  5 ++++-
 arch/arm/include/debug/stm32.S        |  5 ++++-
 arch/arm/include/debug/tegra.S        |  7 ++++---
 arch/arm/include/debug/vf.S           |  5 ++++-
 arch/arm/include/debug/vt8500.S       |  5 ++++-
 arch/arm/include/debug/zynq.S         |  5 ++++-
 arch/arm/kernel/debug.S               | 11 +++++++++--
 29 files changed, 142 insertions(+), 44 deletions(-)

-- 
2.26.2

