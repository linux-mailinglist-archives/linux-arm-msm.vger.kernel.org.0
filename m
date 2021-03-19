Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D96834232A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 18:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhCSRYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 13:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhCSRYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 13:24:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E22BC06174A;
        Fri, 19 Mar 2021 10:24:22 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o10so11157258lfb.9;
        Fri, 19 Mar 2021 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yAppcMi6ZLbhOHE0DMEql9l8WSBLD/1L9P2TMyJ9tQ=;
        b=NtHzP1ri6FOTSuPWjICRDYuvzRJueks9YSW7cF5SNGHOt9KJBR2UFOK3Ya+7s3tE8w
         5AJkBLl/F40cgJjXjxeQgGJyC65oUivrZbpo4hJaIKXhzcmGWsfGhz3TnjxVorVZR0v6
         4UPIdtzfu63b+RC0PjrWnQaW9UOfEGKClaJtNk4z+AUWOYnTebgl2TFJNPUYJJZvob2o
         AjdlVAboHsWb87vz0PjxFghwiole+vfsQ4Q7yLWlMwKJszbyhV8rPsbbJPe+B5pzKXEf
         RsfUQKQidnsDoU0487fDLzcqAXcLQjzvdbJwjfnU34aahdXne8lkLyWn3J2nXOwO34fq
         8mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yAppcMi6ZLbhOHE0DMEql9l8WSBLD/1L9P2TMyJ9tQ=;
        b=hPhmHo+f0j3r9zdBfYCIoGAIucA5PsJVRBUk3pTnAu7ilDmvCRhUlIMD7OQm+RASyA
         dmQRUmOTorCWZxh0f/UBBUzksvTo6J4q5jwm9NvVpbQDIoN7N788vv3u0DFXVc4Pte5D
         FajBs8Wahn93aX1sllTFy4q/y3SSreUYt7J5VHfNyaMJgpxtPcifZlg5spMPwcM4e9gO
         FL0Oggmi4TEl1wD7GUhElq2KjqyqpvpWj4IWFH8W/vEeQxnuB1jDklBbCrMTjsTS217e
         fo0vy5TOlgEM4/Jcru0VA2dS8g6ADGyPm76hbpe8PWaVXb8j1vAle54NfasVpqrHFdAy
         4QRA==
X-Gm-Message-State: AOAM531K0obnUvjA3/Vwx2TYlPUyTpDI+v8/Mte91irJfF9TfcQVdrRS
        s5Z2x3/teBtX8iCIkeXQjIOXUoatTXoOJ+Px
X-Google-Smtp-Source: ABdhPJxTHUXY90LZDaIdwAzLhvNQCsNs7GaWyoI5aswYz5Vdoe3G5GTJjBgwqsCwC+dch7guY51n5Q==
X-Received: by 2002:a19:c3ce:: with SMTP id t197mr1352792lff.351.1616174660716;
        Fri, 19 Mar 2021 10:24:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:2421:e100:198e:5123:d77b:1e2e])
        by smtp.gmail.com with ESMTPSA id y17sm693237lfb.132.2021.03.19.10.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:24:20 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 0/2] soc: qcom: Add Qualcomm Memshare QMI service
Date:   Fri, 19 Mar 2021 22:23:19 +0500
Message-Id: <20210319172321.22248-1-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

This series adds memshare QMI service.
It receives messages from other subsystems (like modem subsystem) and
answers with a message that contains the memory address of the allocated
region. This is used on many msm8916 based devices for location service
which requests 2 MB region when the modem starts. If the memory isn't
provided, GPS doesn't work. Newer platforms may also use it in other
subsystems.

The driver implements:
 - legacy alloc/free messages (known to be used by Samsung A2015 devices)
 - generic alloc/free messages (used on most msm8916 devices)
 - query_size message (sent by at least one modem firmware for msm8916)

Downstream driver [1] seems to use dynamic memory allocation but it
uses concept of "Guaranteed Memory" which means that the region is
allocated on driver probe and not released even after "free" request.
It also seems to support memory allocation "on demand" without prior
client description.

My driver implements "guaranteed" allocation using reserved-memory regions
and does not allow allocation for any request that was not described in
the device tree. It also additionally checks that qrtr node that sent
the message is correct (to prevent, for example, processing messages sent
from userspace).

memshare_qmi_msg.c/h files are mostly copied from [1] (query_size was
added from later version of the driver) and cleaned up. Those files keep
copyright line from the originals.

This driver is tested to work on multiple msm8916 devices, including
devices that have dts upstream (with an exception of mtp; db410c doesn't
use it).

[1] https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/drivers/soc/qcom/memshare?h=LA.BR.1.2.9.1-02310-8x16.0

Nikita Travkin (2):
  dt-bindings: soc: qcom: Add bindings for Qualcomm Memshare service
  soc: qcom: Add Qualcomm Memshare QMI service

 .../bindings/soc/qcom/qcom,memshare.yaml      | 109 ++++
 drivers/soc/qcom/Kconfig                      |   8 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/memshare.c                   | 501 ++++++++++++++++++
 drivers/soc/qcom/memshare_qmi_msg.c           | 370 +++++++++++++
 drivers/soc/qcom/memshare_qmi_msg.h           | 228 ++++++++
 include/dt-bindings/soc/qcom,memshare.h       |  10 +
 7 files changed, 1228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
 create mode 100644 drivers/soc/qcom/memshare.c
 create mode 100644 drivers/soc/qcom/memshare_qmi_msg.c
 create mode 100644 drivers/soc/qcom/memshare_qmi_msg.h
 create mode 100644 include/dt-bindings/soc/qcom,memshare.h

-- 
2.27.0

