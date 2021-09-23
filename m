Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCDB415614
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 05:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239054AbhIWDeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 23:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238949AbhIWDeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 23:34:21 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBA2C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 20:32:50 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y4so4485609pfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 20:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tcoYfX3/98y4K9KP+mnZIxRToGjbL4tIkZ9GEops4pw=;
        b=RZgWl3hQXEjvAdU3p2jzbQT16CDGzlKWYXooN+FjXrbd1aoXhfmT4ZD2klD1qLq//N
         RE6ZvLN2ynlk0TjbNkoxZSKfRKbVEocGLYh/mM6jGOIzRUINix5nsSM6YzzqzUUEHobx
         zQxOtAHn9bJ8xuN4lJOqnGYdCRZadsdCdUrM447wv9vSBCq9/VJFemfWU370q6YJkNeM
         Sk3oY4OTwIhq0/Ee5GWTkU8FIlWNba3JdDuF8ttcbtjcrvvUjXP0Io7uzeURpPgw7iyQ
         J/LHrCoLfuQuNVnCNsBMTzYhzPSlybpF0+c+NGr7SMiCCbhsby55SKgO7qKfw9ZcEEzy
         lEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tcoYfX3/98y4K9KP+mnZIxRToGjbL4tIkZ9GEops4pw=;
        b=QEDHUfpFB+PMCfRQ/BB6WdLJZ2Ft7rgH/0Ts/ObdC2/Kmd1qKLRMi03kujq2hkDxBd
         MGksXshgPQCPnbp3JP8rFxSJCp53Y7dutLbTj7nPPkuKXZ2iESXxKymX/vJFqCF5c/RJ
         /yaKONZUpbzrYsES+mebW/K0HRqUHTf7u6I/2uTruMPEFLI6qH9B0POl1lOt2FX+nxwY
         Kbvis4SDC20xkXZBhGrESlrNgXip845XmXngCbXASOrdRVzmwkox/SflliMTTbLSsFkI
         i+nxAN36rVh9mEEatDP0LjS4DADsylg8ARdCDDdzSGJdSmk/LBgYEpm89D8ImiXT43P6
         50FQ==
X-Gm-Message-State: AOAM532ajB4x8OPXRKwZx/+nYHKl4QeKSSIfD4OnrVhA4ZS0v1XT8/i2
        6cKYNKtrnE7IWYfGSYppfxLj3PwTEb4pcw==
X-Google-Smtp-Source: ABdhPJx8sndiakc68NZLAYAF+UxgdFttx7aatNehrNRiGc44cHSt/HsgAQ0XtTE8YBkTVulzxfjJnA==
X-Received: by 2002:aa7:8298:0:b029:338:340:a085 with SMTP id s24-20020aa782980000b02903380340a085mr2371502pfm.46.1632367970017;
        Wed, 22 Sep 2021 20:32:50 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h18sm3817168pfr.89.2021.09.22.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 20:32:49 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add pinctrl driver for QCM2290
Date:   Thu, 23 Sep 2021 11:32:22 +0800
Message-Id: <20210923033224.29719-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds QCM2290 pinctrl driver and bindings.

Changes for v3:
- Update function enum table in the bindings doc.

Changes for v2:
- Update pattern in bindings to cover entire GPIO space.
- Sort qcm2290 functions.
- Group phase_flagN into a single function, and same to qdss_gpio, atest
  and dac_calib.
- Correct .compatible to be qcom,qcm2290-tlmm.


Shawn Guo (2):
  dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings
  pinctrl: qcom: Add QCM2290 pinctrl driver

 .../pinctrl/qcom,qcm2290-pinctrl.yaml         |  165 +++
 drivers/pinctrl/qcom/Kconfig                  |    8 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-qcm2290.c        | 1129 +++++++++++++++++
 4 files changed, 1303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcm2290.c

-- 
2.17.1

