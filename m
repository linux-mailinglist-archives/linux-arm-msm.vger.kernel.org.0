Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7C4449A14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 17:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240119AbhKHQrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 11:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236528AbhKHQrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 11:47:41 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E909C061570;
        Mon,  8 Nov 2021 08:44:57 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id g18so11804351pfk.5;
        Mon, 08 Nov 2021 08:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v6tzK+1zOq/v9nDcWdhPdWgczhf8lOmT2M5fBp/8qM4=;
        b=DkvfTZMWSeF94X5CWqIfaLbE16dqGX+Hi06SDdQSwxVXwODdoiQhPEIcKAOjcdqhuI
         LquVkZsC3cqU1UqQC6TqjcpSglEV8lRClfZXWHdIGrkcqT7a5dcFpgc2NvIiz/en0fDi
         3l7Fx+9IPoAwAOEXar/GCYfQM4fSN8Io+a9dtu0CpmSMD3/U1I+5dVtcIgG9WfetSTrO
         DMtCVgCPjWi5TG6Cy87KCfsMzKb1A6ZCy0sJnFxeF36ZKVYAV/CMcByxFTfDm4RcIjx/
         y0/NaEKQdIVZIy79/yol05We6dw2CojZ7M5qBFwThyFkNhd8CmTkiddRJ7glTMRf/fmk
         enYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v6tzK+1zOq/v9nDcWdhPdWgczhf8lOmT2M5fBp/8qM4=;
        b=AfLAlDdyjaODSgFKtVGTjsNXvqLHMZ34wO9x1hTvX/CfeDnhTRa3jj7gM4zqQNnlWn
         jn+u3XCruxeo4GqFgELQVnwSatRD6Z0egeGJCv0sQYI3xLgO6iKuc8TEXGJ5jZ4iUrH4
         /SNSc0khOzfoOJM7qZBlwxbV0Qye/wAHLvhH9un88XuxtOwYxaHS1MQX8QtiBGZQHMVa
         gMBVkNQ2t8yvcqhJ0kGvxoKIicwBKnYiO/r3one8t4WLQ5FAXotZAd6CSDxOIyuu2Vm3
         Zs1iQ5t7xw6VJMqI2tcq6C79y09TF+pLF3hXFeJjN3X9jWQOVWijgeSzZCamPZT+54Bf
         cOdA==
X-Gm-Message-State: AOAM531Vawew6NbXFExAazQ2WaZTlCt6Uyv7lwl4//iFsfc5K0RmWfn/
        Pz9KINKS+CpKJGIy0LH8Guy/SqWoutE=
X-Google-Smtp-Source: ABdhPJxV5Pwd6m1d2CnKF0YOJ00nwSP+XQC2TgNOZEzcj+XInLZhyjCL92OfgoIvxbtcFsjHMyhMOw==
X-Received: by 2002:a05:6a00:21c6:b0:44c:937:fbf3 with SMTP id t6-20020a056a0021c600b0044c0937fbf3mr572059pfj.2.1636389896975;
        Mon, 08 Nov 2021 08:44:56 -0800 (PST)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:36:87e1:381d:5b89:8aef])
        by smtp.gmail.com with ESMTPSA id 145sm15980974pfx.87.2021.11.08.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:44:56 -0800 (PST)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultz@microsoft.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH v2 0/5] platform: surface: Introduce Surface XBL Driver
Date:   Mon,  8 Nov 2021 08:44:44 -0800
Message-Id: <20211108164449.3036210-1-jaschultz@microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the Surface Extensible Boot Loader driver for the Surface Duo.
Exposes information about the driver to user space via sysfs.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

---

Changes in v2:
 - Per Maximilian, added patch 2: propagated ACPI dependency from the
   directory as a whole to each individual driver
 - For the yaml documentation:
    * Removed json-schema dependence
    * Elaborated on description of driver
    * Updated example
 - Changed target KernelVersion in sysfs documentation
 - Updated MAINTAINER changes to be properly applied across patches
 - For the driver itself,
    * Added types.h inclusion and removed unused inclusions
    * Minor updates to code and acronym style
    * Remove __packed attribute on driver struct
    * Use .dev_groups for sysfs
 - Added more in-depth description of driver in Kconfig
 - Modified dts to reference a newly added section in sm8150.dtsi

---

Jarrett Schultz (5):
  dt-bindings: platform: microsoft: Document surface xbl
  platform: surface: Propogate ACPI Dependency
  platform: surface: Add surface xbl
  arm64: dts: qcom: sm8150: Add imem section
  arm64: dts: qcom: surface-duo: Add surface xbl

 .../ABI/testing/sysfs-platform-surface-xbl    |  78 +++++++
 .../platform/microsoft/surface-xbl.yaml       |  57 +++++
 MAINTAINERS                                   |   9 +
 .../dts/qcom/sm8150-microsoft-surface-duo.dts |  10 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   8 +
 drivers/platform/surface/Kconfig              |  24 +-
 drivers/platform/surface/Makefile             |   1 +
 drivers/platform/surface/surface-xbl.c        | 215 ++++++++++++++++++
 8 files changed, 401 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-surface-xbl
 create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
 create mode 100644 drivers/platform/surface/surface-xbl.c

-- 
2.25.1

