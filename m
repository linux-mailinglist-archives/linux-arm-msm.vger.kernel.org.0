Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2359632CC50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 07:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbhCDGGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 01:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbhCDGGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 01:06:13 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DACC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 22:05:32 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id a4so18180082pgc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 22:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=H5IvtVELze0Vps97HY3+xay/OMS7k0lqk9oX1eLUgxM=;
        b=Nf25MtOTwgKdfgKuUD5Uj/P2ko0klUhukmMswsRgw4Ls4pyksvSMt+RMIF7UgyTtzU
         gmHqL23+P5RnrRN8QArwhamCVTSC2nZGG0sbn0uMNKwYwS+Uxuh5IyIALaujXV4SGabd
         osL/qqt7RoMKHbwhJMhe3FgERhETu+cX/3BQvnDR0xg8FRxxa2QsWCtdqjXV9R70OCpA
         /8TCOMWNEgNTzUZbjG74yOBFzhYLHvP5tr6+GRnuM7C40Mbo9K1ZMmBntEWMEJeLHIUO
         Z9acM+LR2ys05tkqYwaYUcAGZvaxN7F4wI/7dtnqZP93maklT8Mj1eIzXv+YjNp8M/IA
         zAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=H5IvtVELze0Vps97HY3+xay/OMS7k0lqk9oX1eLUgxM=;
        b=Wt0UQtI8X8kzkob2bWSFRz3OaRtwg2XLyWhPctTtjZdgp2fEyn2TpeQr8H+nvZe59N
         F/c2ud4di+Up0s/CUz32InHLw9oOujpye3Lczoukm/3ZzPkifUJOHrS6nzLRL11npTPh
         QJX3o9WcxRfRAYwDcqPnknuxB5UejxF6GEg4uirNYng27TH3wRM98fQ4vgJsnmeR4lPA
         uGyjVPvIz2RoRj0GALrLzd6fQcTj+UAapC+/+oxAiNpUOtixcQ9oT1MVdQzxykgNbgi7
         VCtV+e3Qp0hbb+fhsCOZI1+Ud1jnmi7nQ6MHyXZ0cF0sI+0qVQ++IEpBwXK6obcqrGlT
         DRWg==
X-Gm-Message-State: AOAM530R6DIioYhR4RB+ZS5UKztUbkuDowV/7afPlD8sKbP2c1QzWMnx
        kUzStHH4JbP/1o8ZVezVYNPbDg==
X-Google-Smtp-Source: ABdhPJxy+sK3LmlveOTf93bVWrCj3HQk4a1gnnqS69S6FKye1xvLI5ivdE/tyVrGp/0egq18vsaajw==
X-Received: by 2002:a63:6642:: with SMTP id a63mr2306114pgc.333.1614837932366;
        Wed, 03 Mar 2021 22:05:32 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j2sm776386pgh.39.2021.03.03.22.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:05:31 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add ACPI support for SC8180X pinctrl driver
Date:   Thu,  4 Mar 2021 14:05:18 +0800
Message-Id: <20210304060520.24975-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a couple of patches that enable ACPI probe for SC8180X pinctrl
driver.  It takes pinctrl-sdm845 driver as the example to remove the
use of tiles, so that we can align memory resource description between
DT and ACPI, and simpfy the driver code.

Changes for v3:
- Remove the use of tiles.
- Drop unneed include of <linux/acpi.h>.

Changes for v2:
- Pass soc_data pointer via .driver_data.
- Drop use of CONFIG_ACPI and ACPI_PTR().
- Add comment for sc8180x_acpi_reserved_gpios[] terminator.
- Add comments for tiles handling.

Shawn Guo (2):
  pinctrl: qcom: sc8180x: drop the use of tiles
  pinctrl: qcom: sc8180x: add ACPI probe support

 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 80 ++++++++++++++++----------
 2 files changed, 52 insertions(+), 30 deletions(-)

-- 
2.17.1

