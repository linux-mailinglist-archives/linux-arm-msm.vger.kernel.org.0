Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932EC43F171
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 23:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhJ1VU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 17:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhJ1VU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 17:20:28 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CC0C061570;
        Thu, 28 Oct 2021 14:18:01 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id s10-20020a17090a6e4a00b001a5f4da9892so1777540pjm.3;
        Thu, 28 Oct 2021 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jou6sI/KcnOeQv+a2iral3PpAFCWpJuyKMRKWua0a48=;
        b=C6Umwyu/hmjCCvlZmL3dD7PlIrwJchxY/lFJEMj3Hszi67ofJcX3ibK5DCn4t4eNYu
         Y3NvzuK4AswCwzda3y49jxcZ5tnZ0rdFZ0atVDd/Tz/A1VDOC1yJqEfGK+X0ptpuRJeX
         t9XPf2DjI0izRG5zPUmmFhhEs1ycZTeA74QJ5ceJ9qvCVKMCOJrzv0/bYLmeeFthrGyZ
         Uto+7TQH6gdJ+xAho4a5woegYgsNlynwl8HfN2TjS0kZ6zyx70Vjz3InVS7B7pgmRifs
         5CRpEVhS9S/EqpbMhZcFph2+jw0+aYztXZbtUJOujNZi5myt9B5vY4/mdw7ffzMapoLn
         KDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jou6sI/KcnOeQv+a2iral3PpAFCWpJuyKMRKWua0a48=;
        b=DhwYg53M0jnDgzAFMWSm3YvE/FJW0krPYE5X5veu4m8hSg3u32s/hxoBqdDWlvmHyZ
         TV1SX2c8OtGYN5tey8yIGy0ZoQCNnSG1TetBwnpogT5CE5IzOp4atgG7VQSKDRc9qX3Z
         JbUHglKLiTi8v9XiaYjBItiaRTdfyIdrUg5P8Nl79R38PX7zDtE0B1Vl+HEh5s42Rkpj
         Cn5ru7M2cExEPUJGHzjQqZwbzzMFU0VF1Qyk/0aVevEtCm5t1OWkRotZB4KK+RhUZth1
         807+AWuXYalcAtrFAUcGz/U8FJZExn7zcqWa7JHKQEvSxsLfj8TgZaH8xRTvrXKLf/bw
         NWoQ==
X-Gm-Message-State: AOAM533EHiXHxac/WmIiQD3EG2TTgFXZmx2aUwuX1fpcutI0pvmA8IIq
        quOF33BLH0aZpjEnqpL8icuhpcY9dMg=
X-Google-Smtp-Source: ABdhPJxMEnAJGc9z70QJHr5gbVot/6vvEJLopcBpATJ+S8l/YxnukPHRFF0BIgzfQCOpRnsczcxE2g==
X-Received: by 2002:a17:902:d202:b0:13a:709b:dfb0 with SMTP id t2-20020a170902d20200b0013a709bdfb0mr6143389ply.34.1635455880925;
        Thu, 28 Oct 2021 14:18:00 -0700 (PDT)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:0:1173:767a:1b1e:f6a4])
        by smtp.gmail.com with ESMTPSA id t14sm3506610pga.62.2021.10.28.14.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:18:00 -0700 (PDT)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultzMS@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>
Subject: [PATCH 0/3] platform: surface: Introduce Surface XBL Driver
Date:   Thu, 28 Oct 2021 14:17:50 -0700
Message-Id: <20211028211753.573480-1-jaschultzMS@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the Surface Extensible Boot Loader driver for the Surface Duo.
Exposes information about the driver to user space via sysfs.

Jarrett Schultz (3):
  dt-bindings: platform: microsoft: Document surface xbl
  platform: surface: Add surface xbl
  arm64: dts: qcom: surface-duo: Add surface xbl

 .../ABI/testing/sysfs-platform-surface-xbl    |  78 ++++++
 .../platform/microsoft/surface-xbl.yaml       |  37 +++
 MAINTAINERS                                   |   9 +
 .../dts/qcom/sm8150-microsoft-surface-duo.dts |   6 +
 drivers/platform/surface/Kconfig              |  10 +
 drivers/platform/surface/Makefile             |   1 +
 drivers/platform/surface/surface-xbl.c        | 223 ++++++++++++++++++
 7 files changed, 364 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-surface-xbl
 create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
 create mode 100644 drivers/platform/surface/surface-xbl.c

-- 
2.25.1

