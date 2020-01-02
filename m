Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D2212E76D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 15:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgABOyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 09:54:43 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33647 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgABOym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 09:54:42 -0500
Received: by mail-pj1-f65.google.com with SMTP id u63so2075250pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VtDUTQjwQa4iJtNbmp2oh8w540jx+9fBWmE0OFJWN5s=;
        b=BWwaYA6vNRkCdYaWQy6Xo1X1nAgYmYYaM7X09iTP5li6SWvSHs5nZvbJsVKpQvMHtf
         zdojI0OK6raZEtT6w9mR+8Iv9LXNaDdjuqH+91QIsfVVe4MvXLCFAurL+c7CCjzyENzQ
         kwzjzxbnG8sqoqAZ914QuEGjIGupcxixZHb9tgEYMcr6CiV6QCbTwgQbluB/1DdDAksf
         OCqWkgsX6l21elKxZdelw+vznZzdX4Cr6nfppWMGyohTlMS4ijaU1KN9VwnRizKqOgU/
         rh07FXy3kdW819H5vP4skfEhulDJhhdsrEt/19qEEVo1mx67TB66sZsNrrdwPSRFcQPf
         z9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VtDUTQjwQa4iJtNbmp2oh8w540jx+9fBWmE0OFJWN5s=;
        b=WyjctCoG/T6WIXDZMPIFjOOgdZ0ZQU+o0ae6zCxUcttvQ1ylFZ9lp/rZjxPupnvT2M
         ix5LfOZOlu1P/KgTrs6+612puaa4X0WRYegSKwZW1o47QqFT5Rn3nqVePNEeo08GNLvF
         //Mmw+Z9jiEBT73yGFEsAUNwNoIYkh9i+9z8mD0FFE9XQC6UMNl3ta7kTjdoDoLrSRF5
         qZMJ4KQyh6nngiP86PXS5zCSlpoMBpFXaZobRZ+UznybwYw3oa+So26BxRvt08VTYj4X
         jWzumJaI02XTi460r76BBkA0dYe9bVN9L0Xzk7ojEObmsR/dZ3+FiLY1ZeXGvaE7NmYW
         P8oQ==
X-Gm-Message-State: APjAAAWZhHyFafMuWHU/EZqn/+XoUsqnvWSzIqP+yJuh9uDEM1RjtkSe
        vo4FQarU00sxVS9YJFoFc4sLpA==
X-Google-Smtp-Source: APXvYqx/t9weau/82TBMzffkI1Rt4tlViNW0WGABJ+oSXsGqWDmmqCdMRwpjK0DHHZU1ry16gVuZxg==
X-Received: by 2002:a17:902:bf49:: with SMTP id u9mr32469865pls.199.1577976880635;
        Thu, 02 Jan 2020 06:54:40 -0800 (PST)
Received: from localhost ([103.195.202.148])
        by smtp.gmail.com with ESMTPSA id q25sm65113198pfg.41.2020.01.02.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 06:54:40 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v3 0/9] thermal: tsens: Handle critical interrupts
Date:   Thu,  2 Jan 2020 20:24:25 +0530
Message-Id: <cover.1577976221.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TSENS IP v2.x supports critical interrupts and v2.3+ adds watchdog support
in case the FSM is stuck. Enable support in the driver.

This series was generated on top of linux-next from 20191202 to capture
const changes for msm8976 that is queued currently.

Changes from v2:
- Handle old DTBs w/o critical irq in the same way as fix sent for 5.5

Changes from v1:
- Make tsens_features non-const to allow run time detection of features
- Pass tsens_sensor around as a const
- Fix a bug to release dev pointer in success path
- Address review comments from Bjorn and Stephen (thanks for the review)
- Add msm8998 and msm8996 DTSI changes for critical interrupts


Amit Kucheria (9):
  drivers: thermal: tsens: De-constify struct tsens_features
  drivers: thermal: tsens: Pass around struct tsens_sensor as a constant
  drivers: thermal: tsens: use simpler variables
  drivers: thermal: tsens: Release device in success path
  drivers: thermal: tsens: Add critical interrupt support
  drivers: thermal: tsens: Add watchdog support
  arm64: dts: sdm845: thermal: Add critical interrupt support
  arm64: dts: msm8996: thermal: Add critical interrupt support
  arm64: dts: msm8998: thermal: Add critical interrupt support

 arch/arm64/boot/dts/qcom/msm8996.dtsi |  10 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi |  10 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi  |  10 +-
 drivers/thermal/qcom/tsens-8960.c     |   4 +-
 drivers/thermal/qcom/tsens-common.c   | 188 +++++++++++++++++++++++---
 drivers/thermal/qcom/tsens-v0_1.c     |   6 +-
 drivers/thermal/qcom/tsens-v1.c       |   6 +-
 drivers/thermal/qcom/tsens-v2.c       |  24 +++-
 drivers/thermal/qcom/tsens.c          |  24 +++-
 drivers/thermal/qcom/tsens.h          | 104 ++++++++++++--
 10 files changed, 330 insertions(+), 56 deletions(-)

-- 
2.20.1

