Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A448335A2E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 18:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbhDIQUS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 12:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbhDIQUR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 12:20:17 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1344FC061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 09:20:03 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so6230626otn.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPSRX8zaxgtNoiiCZFNVozRTcGnADGai3Y004Te7wk0=;
        b=aVZpBRiKxfu6o8bbFEYy1QbykTLEAErhJvGuCGgjOX3Fa2GEwD26OMKFfc8NiMxtA3
         k2qp8MDK5mH4lQcx2rXxcAwcZZ9iZuMSE6s55NZs3EYvWxk3xqYdosBonhAsboVhQk1l
         vK7AG4OdJsZbJXeXrxE4Jhe8vnZOhrydv+yMeFdohKtekcWWCSZaWcZDFxcrPfuJcUT9
         SOw/jdFcwG6ypFIGJ4w7ODC5ednYlQCDiqgQ26Q/DBoGDJVoLiIqFOxZH5z1YLzpExop
         T7yicxidbYcFTjxVzS10SWgQq2Y+jwjvrf0Y1TxTw0zdl+CsErSQOkDZ1GY7uK7TqDxc
         0wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPSRX8zaxgtNoiiCZFNVozRTcGnADGai3Y004Te7wk0=;
        b=j+OxNlaIlMZsFV4PTGWgOpSifVEDYQ5eVYYUro2Mzp4f7OrXMinmFYno1CkYDArD1X
         CV1zlNHxzK7F2taJpIog1BjIMxSWgwEutZlqGCcciaU/CsEMJIsHDaYueni/gHGETsX7
         Y80DdLnDSzEKTHHEfyxUJcaut4Wa2G4Zd17sDRvgddh4KMy1njenWdHKp9cdJ1X2XFnW
         M2pZ+i8zcgzEIdX9U2QqZaZJm815OyornaOpVA0JPDj9RtXR6hEMcIe82kUBhdrK5Wgc
         rtBuTYO/DTDle0HU327uN+U84ETURrtJVq0RH/PtigIPPwOlRtlf2E+MgBjclrbFaxZU
         fhcw==
X-Gm-Message-State: AOAM532hrRMgbACDwwboZZ1CBs/ulXLmRsv061R74PXXeogGQvil/ol0
        rBys/dBDOILgFZRdmBEMtoqfHQ==
X-Google-Smtp-Source: ABdhPJyDIHwsloXBmHm5h0+dFlF4DCbzbUar8r1DMnB35mHiyaOrEdxe+e8jsdjUofCoC2sCmRqOWQ==
X-Received: by 2002:a9d:7288:: with SMTP id t8mr13278669otj.132.1617985203262;
        Fri, 09 Apr 2021 09:20:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l71sm594235oib.30.2021.04.09.09.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:20:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [GIT PULL] More Qualcomm driver updates for 5.13
Date:   Fri,  9 Apr 2021 11:20:01 -0500
Message-Id: <20210409162001.775851-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit ac6ad7c2a862d682bb584a4bc904d89fa7721af8:

  bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13-2

for you to fetch changes up to 0648c55e3a21ccd816e99b6600d6199fbf39d23a:

  soc: qcom: mdt_loader: Detect truncated read of segments (2021-04-08 10:28:59 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for 5.13

This improves the Qualcomm SCM driver logic related to detecting the
calling convention, in particular on SC7180, and fixes a few small
issues in the same.

It introduces additonal sanity checks of the size of loaded segments in
the MDT loader and adds a missing error in the return path of
pdr_register_listener().

It makes it possible to specify the OEM specific firmware path in the
wcn36xx control (and WiFi) driver.

Lastly it adds a missing path specifier in the MAINTAINERS' entry and
fixes a bunch of kerneldoc issues in various drivers.

----------------------------------------------------------------
Bjorn Andersson (5):
      dt-bindings: soc: qcom: wcnss: Add firmware-name property
      soc: qcom: wcnss_ctrl: Introduce local variable "dev"
      soc: qcom: wcnss_ctrl: Allow reading firmware-name from DT
      soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
      soc: qcom: mdt_loader: Detect truncated read of segments

Lukas Bulwahn (2):
      MAINTAINERS: add another entry for ARM/QUALCOMM SUPPORT
      soc: qcom: address kernel-doc warnings

Qinglang Miao (1):
      soc: qcom: pdr: Fix error return code in pdr_register_listener

Stephen Boyd (5):
      firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool
      firmware: qcom_scm: Reduce locking section for __get_convention()
      firmware: qcom_scm: Workaround lack of "is available" call on SC7180
      firmware: qcom_scm: Suppress sysfs bind attributes
      firmware: qcom_scm: Fix kernel-doc function names to match

 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    |  7 ++
 MAINTAINERS                                        |  1 +
 drivers/firmware/qcom_scm-legacy.c                 |  4 +-
 drivers/firmware/qcom_scm-smc.c                    | 12 +--
 drivers/firmware/qcom_scm.c                        | 89 ++++++++++++----------
 drivers/firmware/qcom_scm.h                        |  7 +-
 drivers/soc/qcom/mdt_loader.c                      | 17 +++++
 drivers/soc/qcom/pdr_interface.c                   |  2 +-
 drivers/soc/qcom/wcnss_ctrl.c                      | 15 ++--
 include/linux/soc/qcom/apr.h                       |  2 +-
 include/linux/soc/qcom/irq.h                       |  2 +-
 include/linux/soc/qcom/llcc-qcom.h                 |  6 +-
 include/linux/soc/qcom/qmi.h                       |  4 +-
 13 files changed, 107 insertions(+), 61 deletions(-)
