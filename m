Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE54827677D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 06:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIXEFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 00:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgIXEFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 00:05:09 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B8BC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 21:05:09 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id 185so2235243oie.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M4ZgHoIMTCwM82rUfPZYHDsr/Zc40DXRJUJP74ZSkFs=;
        b=hUOK0MkQqwe3x8JZjGMu051F7qQTdZwYTbmS8vdyqAzQ0dYb/7Hg4wyK2b+Tfb1Ikc
         uStNTDcGQZYfFCIxctYAmEiuGXMkD027HOjzxn3eaIbicTKsgsSdfB/WxF5Ag0YDfylp
         TQo+vucQ7bhHeI2HXuSrxP2ES+BCzo/rdgaMWzXklKiU5xhbv2bDLbeDkIogmUots3gn
         tGF5Vii9fjmc+3WFz/XGS5FFSl9jd8ru2BHK0lqoDTct3CA1cFUbn8ZhBcuiNEVbBjhJ
         ITaeJ8mNfKwcOh+KXB1grP3DTEk7vwAY+Efo+5Y86D8OQOCGC5Xk5r+Ka2yD7EsFRX8a
         5XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M4ZgHoIMTCwM82rUfPZYHDsr/Zc40DXRJUJP74ZSkFs=;
        b=f90wuIfTFBXbHxvEIbYH45BeBgfETQ4ZWDaGyd01OFoufhutWENHMtS5SnadbTuUgA
         n9QjoafGNoFkAdMib5fAySMBhirXuuV47KM4hUt2o9AG/A5VL8rZj/cjbD4Y3PSQdvvn
         k+iJIjZUYb/Er2QUZ+5phDUz7Qr1PoVDPk0YIZdE6mZa0IwaUM6m1K5GfGMoU51bLHE3
         M9wZE6x94IGZX04fCOOuQhMW6f1zCPoIj+u47wNBUl20QtJI8StFRny3EcUQUeaFSti4
         kxr7Tb5+eTYgI2XqSXa8cxx8IONqHXn0DZSR/CYcnkUJjxHPuAap/qeCUKGLZqeFfKie
         igXg==
X-Gm-Message-State: AOAM532y3J32by4YrnR6WLUCPLn33RXT8rZ2ev146nlRIoABkzFtMCX2
        qY6ljHVj8uds1fsubmcOweusew==
X-Google-Smtp-Source: ABdhPJxEesqr9iroSLBgw1JGE5LbSm2imzDkb3c45KYyBpYdAoJa73+J4zB3Si9PhAvdjNrlwgiWsQ==
X-Received: by 2002:aca:5110:: with SMTP id f16mr1527502oib.30.1600920308349;
        Wed, 23 Sep 2020 21:05:08 -0700 (PDT)
Received: from localhost.localdomain (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id r3sm520110ooo.16.2020.09.23.21.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 21:05:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Douglas Anderson <dianders@chromium.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Qilong Zhang <zhangqilong3@huawei.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm driver updates for v5.10
Date:   Wed, 23 Sep 2020 23:05:04 -0500
Message-Id: <20200924040504.179708-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.10

for you to fetch changes up to 2899347249fe7567cb04bb810a85f848fc0ce475:

  soc: qcom: llcc: use devm_platform_ioremap_resource_byname() (2020-09-17 04:24:49 +0000)

----------------------------------------------------------------
Qualcomm driver updates for v5.10

Replace the busy wait for free tcs slots in the RPMh driver with a
sleeping wait and use memory barriers when writing the command registers.

Add a bunch of SoC ids to the socinfo driver, fix an erro printin the
apr driver and migrate llcc to devm_platform_ioremap_resource_byname().

----------------------------------------------------------------
Douglas Anderson (2):
      soc: qcom: socinfo: add SC7180 entry to soc_id array
      soc: qcom-geni-se: Don't use relaxed writes when writing commands

Kathiravan T (1):
      soc: qcom: socinfo: add soc id for IPQ6018

Konrad Dybcio (1):
      soc: qcom: socinfo: Add msm8992/4 and apq8094 SoC IDs

Qilong Zhang (1):
      soc: qcom: llcc: use devm_platform_ioremap_resource_byname()

Sibi Sankar (1):
      soc: qcom: apr: Fixup the error displayed on lookup failure

Stephen Boyd (1):
      soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free

 drivers/soc/qcom/apr.c           |   2 +-
 drivers/soc/qcom/llcc-qcom.c     |   7 +--
 drivers/soc/qcom/rpmh-internal.h |   4 ++
 drivers/soc/qcom/rpmh-rsc.c      | 115 ++++++++++++++++++---------------------
 drivers/soc/qcom/socinfo.c       |   5 ++
 include/linux/qcom-geni-se.h     |   4 +-
 6 files changed, 67 insertions(+), 70 deletions(-)
