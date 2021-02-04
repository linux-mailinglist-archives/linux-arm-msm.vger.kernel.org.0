Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5EE730EBD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 06:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhBDFXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 00:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBDFXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 00:23:40 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25687C061573
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 21:23:00 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id k25so170236otb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 21:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdzXXZfVky7bYs1orc7IE9J5miYIkRPeW5sycyboBg4=;
        b=uVJcATAX3yR8sE2iv4IogQa2vjXQZmYJD0O0xkvyPwuEv3zpcSiA4tnXqAL4K7nzWv
         Ue1FamtLQDRenEvvpPTUOl0Wv24mQOMtu6+DrAiMPc7wxZPEKTpojIkKYXi9B9kZx6Q4
         igaisY69MdQ/lbxC3gJ8KCSizPAPP9s/nDHAhqj+3O5pwDEL/4veR+CLTu7nfRYtRSNt
         y6xwWZXVqzPan1s99Y3NF016EGPYpS9Gp/JCGAZKJpmeklwWbODeT7O4Hhs7a3YB039X
         JiS5DVp23Y396DYG/ptmdUcwFIbJXRasuBcE/iHTznHHuw0xaWPWZLReNFR6RpvHG23v
         gTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdzXXZfVky7bYs1orc7IE9J5miYIkRPeW5sycyboBg4=;
        b=FaLSad1Y1YJKxgmpsgt35VwDJX112KzbEkVkrm4gtvioYvSIkIqMvGHonjh0C4wkwF
         Qa9MlplAaAYWVfj8dztfKOeSXEFhyMmjN27yvrmH6ybfrhzU5sVQO99Tz15YKp4DnHF+
         bAID0ClBJBo9mXGuTGJqumB5/lSr0utaqMz7d4TexahyFx9iFqtz9PkcxYWi1nVPWh2g
         NLsEQU4pYIYUikPj5jBSYVU/oCfiFQzzXvnyKDt9U97E8S5L3vwG5Cz+qmLqcyn7irbq
         nzEwC6jDKquAoEa8xdpf6uUMsbNQgqtumW9ZF/Gui7ixOEpaWzEuUUZaw4P4iictdhxa
         FgyQ==
X-Gm-Message-State: AOAM531YfIBt15431bfOMXuxSmgP1oeOGpIU/qB5QSKU0F6VCXtTYQQj
        ppfo2sw/mSp98RwMjb3HP42+hg==
X-Google-Smtp-Source: ABdhPJypjdhXu0KOvBqfelMNks1LQHuv1Qj7pBpGFvYqrFrTANF7iRIX7aiVoacmiEWCNBaIO9FzVg==
X-Received: by 2002:a9d:21b6:: with SMTP id s51mr4448172otb.13.1612416179580;
        Wed, 03 Feb 2021 21:22:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b7sm934193oib.53.2021.02.03.21.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:22:59 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm driver updates for 5.12
Date:   Wed,  3 Feb 2021 23:22:58 -0600
Message-Id: <20210204052258.388890-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.12

for you to fetch changes up to 01f937ffc4686837d6c43dea80c6ade6cbd2940a:

  soc: qcom: ocmem: don't return NULL in of_get_ocmem (2021-02-02 15:39:13 -0600)

----------------------------------------------------------------
Qualcomm driver updates for 5.12

The socinfo driver gains support for dumping information about the platform's
PMICs, as well as new definitions for a number of platforms. The LLCC driver
gains SM8250 support, AOSS QMP gains SM8350 support and the RPMPD driver gains
support for MSM8994 power domains. In addition to this it contains a few minor
fixes in the ocmem, rpmh and llcc drivers.

----------------------------------------------------------------
Andy Shevchenko (1):
      soc: qcom: smem: use %*ph to print small buffer

Colin Ian King (1):
      soc: qcom: socinfo: Fix off-by-one array index bounds check

Dan Carpenter (1):
      soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()

Dmitry Baryshkov (5):
      dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
      soc: qcom: socinfo: add qrb5165 SoC ID
      soc: qcom: socinfo: add several PMIC IDs
      soc: qcom: socinfo: add info from PMIC models array
      soc: qcom: socinfo: Remove unwanted le32_to_cpu()

Konrad Dybcio (4):
      soc: qcom: socinfo: Add SoC IDs for 630 family
      soc: qcom: socinfo: Add SoC IDs for APQ/MSM8998
      soc: qcom: socinfo: Add MDM9607 IDs
      drivers: soc: qcom: rpmpd: Add msm8994 RPM Power Domains

Lina Iyer (2):
      drivers: qcom: rpmh-rsc: Do not read back the register write on trigger
      soc: qcom: rpmh: Remove serialization of TCS commands

Luca Weiss (1):
      soc: qcom: ocmem: don't return NULL in of_get_ocmem

Manivannan Sadhasivam (2):
      dt-bindings: msm: Add LLCC for SM8250
      soc: qcom: llcc-qcom: Add support for SM8250 SoC

Sai Prakash Ranjan (1):
      soc: qcom: llcc-qcom: Extract major hardware version

Stephen Boyd (1):
      soc: qcom: socinfo: Open read access to all for debugfs

Vinod Koul (1):
      soc: qcom: aoss: Add SM8350 compatible

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smem.txt     |  57 -----------
 .../devicetree/bindings/soc/qcom/qcom,smem.yaml    |  72 ++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |  50 ++++++++++
 drivers/soc/qcom/ocmem.c                           |   8 +-
 drivers/soc/qcom/qcom_aoss.c                       |   1 +
 drivers/soc/qcom/rpmh-rsc.c                        |  24 ++---
 drivers/soc/qcom/rpmpd.c                           |  28 ++++++
 drivers/soc/qcom/smem.c                            |   4 +-
 drivers/soc/qcom/socinfo.c                         | 105 ++++++++++++++++-----
 include/dt-bindings/power/qcom-rpmpd.h             |   9 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   3 +
 include/soc/qcom/tcs.h                             |   9 +-
 15 files changed, 273 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
