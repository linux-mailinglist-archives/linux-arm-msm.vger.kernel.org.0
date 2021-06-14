Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634A73A7220
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 00:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhFNWkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 18:40:16 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:36684 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhFNWkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 18:40:15 -0400
Received: by mail-oi1-f171.google.com with SMTP id r16so15662762oiw.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JEBptkwCOSVfqSHvIaKYeUu9NwMWSszSeUKl6IYxkPM=;
        b=LQ0+FxKPU0GcCXj8z0HjP7PW/fNiyf2DvV8s64WqkYvHbFUHvAN7abHeuT6tmfkP0e
         4xCh13e5gHGeoOpIBnFUtq96OTuF1VDYCk9mvNWyBbbXpcHnIL1bb/RjHc7FaH48JWQm
         fFcJDg/INY1a/hQA6LFmrkNEHJKq+QOWxHvRo7KkAGaA3hl4B760RcbtG04oNmX7zqZC
         Gcyk939ZWkVh97aB78OfOl+Jby0PyMb/w7HUK/aOZSFaOZNfn4LOWE6yuai6zA6buPLk
         qAoDcshn0upGJv/AcfXikXz5x4jOuJk004XPW4FZHE8JBSyEF2EruVNFS5uGJHybIb+s
         KOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JEBptkwCOSVfqSHvIaKYeUu9NwMWSszSeUKl6IYxkPM=;
        b=ez6SdN6tnPfEW06wFVMHVDbBWydMYvW0UbTgTV5Zk0ITXQdsHaYjJcvAQNnwnW19H9
         CvvAxGRFOEHW+EnhjY2xj3dFzLF64EaHggQ3+ukB0wPGTEKUSDDe2B64A2Gqr1CfiROo
         lVstVpBSR2jscsznvDILLSbfBP3Ia+DHnlB+TXbovwAtYr0qkknbtIO+iVleoRcFDH7X
         AEskZkSFumpmFCY6UgbQcXeFBf/8WY2bMS/IYF2HYdFUa8w521MsgjuZFkI+2Xm0acwZ
         VITiUTEetQHhLmkSsSTvWvVm8g12DSIwzRRnWmqKf955CzeyUG9IjXseXpO+galWQFwm
         iCKA==
X-Gm-Message-State: AOAM530rPFnWD0UyoJairy5osdg/ZA8I3z5/HjvUqjcqxUxTgmFY/6tI
        oojjyZcPePSnzRNrObdlOmFSHg==
X-Google-Smtp-Source: ABdhPJz9Ktvi6oY5qYq5IW9gi6GvArkQevPsTAWmPetaIOT4p2i6UwhCiFjxw1uJhcbUg/oa0SuUxg==
X-Received: by 2002:a54:411a:: with SMTP id l26mr11985680oic.65.1623710225296;
        Mon, 14 Jun 2021 15:37:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b26sm3670710otq.43.2021.06.14.15.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:37:04 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig udpates for v5.14
Date:   Mon, 14 Jun 2021 17:37:04 -0500
Message-Id: <20210614223704.393042-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14

for you to fetch changes up to e9cd414c1136aa31d34acc04c175bfaca4662f89:

  arm64: defconfig: add drivers needed for DragonBoard410c (2021-06-14 16:59:27 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig udpates for v5.14

This enables VADC, audio codecs and Venus (video decoder) found on
MSM8916 among others and the SM8350 interconnect provider driver.

----------------------------------------------------------------
Marek Szyprowski (1):
      arm64: defconfig: add drivers needed for DragonBoard410c

Vinod Koul (1):
      arm64: defconfig: qcom: enable interconnect for SM8350

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
