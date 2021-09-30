Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4AB41D1A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 04:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347913AbhI3C4k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 22:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347912AbhI3C4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 22:56:40 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2CCC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 19:54:58 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id e24so5476209oig.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 19:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrZGk2QOLZiDDnxEGsK8VY3l94CVFkmXU/tTSNEJU5c=;
        b=eW+wTbYrNGMl45NShdlQuxzDg87x8LpSLA1rG772OS/NKKxetSBTmb25huclVkG89r
         9mZorpfWFhI8QPeLvyE5rkHK8ufwvyXRFXYC0/e1yIIkBKfsL/+2ssGsYJLZTu+ExE2X
         Xrt6y/h8ZNB+ITrhDOAhUoi+5A9kLkuD9bvBWu7NcOOQDD+xWt56X0Zm9+Py5Vag4/yI
         6F4BPEIdrfbs1vlnfEUahq8NyEKvq+RzYeU0Di0SWsm+8ptELma1pTBFR/D5bUxt1Gbb
         fZp790wr74SHF+Au3rRR0BJ1xgDurfqNg0DDLpsMLC2616YYD9EA1ETulb2acTgW+szi
         muoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrZGk2QOLZiDDnxEGsK8VY3l94CVFkmXU/tTSNEJU5c=;
        b=mWGDC9uSYBdZqFGrHGjfryB7zM+qiJ/l3oh8Xcs0mEHfUABsUcds5BdgV4Q3BJVKql
         mBYdKZfW0FEVx7wlcPTCcLfucG1SbJcsi+hkEgY8QrE5q7aKgjNodPdCdBNK5OusZ2UG
         R8hWKRfX7NkN4qIw/dBlKFuXQdd5OtroIx35Nq4GdpW221SAn4XMcGclxdHWrfx4zrqI
         DYqjR29ie4mvlV5GGdBPN1OMOkWVNt6SZIlJT7MX6lawPxplMZT4BBFSKCLremrJMK9i
         s3FXl2BCAF0YlwwQ9F967+x1xk52MfGlObY+ELuF0LFw8Topnn0zQwb49oei9p7I2pSN
         dgWg==
X-Gm-Message-State: AOAM531DxPz6NLxLCl1L2dR7L0jpbBu5jgVuUwhBhUwOh9Uy+SsWKpI2
        ai31+dz128wfluY9W21NyWiUxg==
X-Google-Smtp-Source: ABdhPJy0xUaZRc5TLnjtayBdipQC+LN8oEs9vSvCM+u98Rmys2chB+z3XjoVGD6Ekc6DU6sNPcXzdA==
X-Received: by 2002:a05:6808:178a:: with SMTP id bg10mr582638oib.43.1632970497371;
        Wed, 29 Sep 2021 19:54:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u2sm346181otg.51.2021.09.29.19.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 19:54:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Antonio Martorana <amartora@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm driver fixes for v5.15
Date:   Wed, 29 Sep 2021 21:54:56 -0500
Message-Id: <20210930025456.1035-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Arnd, I noticed that I've had the QCOM_SCM change from Geert in linux-next for
a little while now and would prefer not to rebase my tree. I do believe per our
other discussion on this subject that QCOM_SCM becomes hidden and therefor
shouldn't depend on ARCH_QCOM again.

Would you prefer me to respin this with a revert of Geert's patch, or can you
effectively revert this as you're applying your patches on top?

Regards,
Bjorn

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.15

for you to fetch changes up to 4382c73a12b4cab537176011a36a3c019cb2a04e:

  firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM (2021-09-19 19:58:19 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v5.15

This restricts the QCOM_SCM driver to depend on ARCH_QCOM, to reduce
it's presence after becoming a loadable module.

It then fixes a regression in the mdt_loader, where firmware with the
hash segment marked as PT_LOAD would no longer be accepted, preventing
several MSM8974 and SDM660 devices from loading remoteproc firmware.

Lastly it corrects the drvdata associated with the socinfo device during
probe, to match that expected by the remove function.

----------------------------------------------------------------
Antonio Martorana (1):
      soc: qcom: socinfo: Fixed argument passed to platform_set_data()

Geert Uytterhoeven (1):
      firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM

Shawn Guo (1):
      soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment

 drivers/firmware/Kconfig      | 2 +-
 drivers/soc/qcom/mdt_loader.c | 2 +-
 drivers/soc/qcom/socinfo.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
