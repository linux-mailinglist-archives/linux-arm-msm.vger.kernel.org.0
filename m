Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B905321C09F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgGJXS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgGJXS3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:18:29 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB97C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:18:28 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so3194899pgf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+59TPEQHEkQFZ55j35W3RLahGS4swop41zFjG28sQlI=;
        b=I9cW5ytw2dorAQZ66yCowEnQV62rnN/AoriJkdNr7cJgAwgRwj3foDLRAYlJONTScc
         BbvyMYrLXf4Ma+zp5w4jFN/HIONJxoJdg+7OmGipXEHe7gisS66qKVfKRlBoqOUH31qn
         wdlM3M75kl8HdNZUVzn3N+FGPD2h4fOGQLnbpRVvuMrTmgYQrVAJE5f0IWajIogniJeT
         WwHdWIIcRORBivihxFVnImhznJPtFQQkhPY2YeO0CDHXFqsgfkPHMNtsPcAWlceEH7wV
         ypAqdA3/qsYYS4O8WWsdFHUqG0aYvqC7uFPkyzPtm3uT153Tcyn4kzKbLFUcmyeWclPu
         PvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+59TPEQHEkQFZ55j35W3RLahGS4swop41zFjG28sQlI=;
        b=OCt+Js5rxU5J+QM5obgyikgxxcohIE8gJldDa6aGQ2HhTOXEHkeXCJOWvVdAxtdavK
         xs7BnPWunf+xGnQ9PvqBwzGfPmsmhPkL0Oikkt6zDj0iihakBYmfdRFCO+GwxwG7MsGP
         Z61SYHN+uZsp3VuHeG6KsbPMAi3xdrfOR4oI50KUKOblNH9J58YM9eAHAj6xnV87qkhy
         exHywjAsitMiJBGumRQmNowZ+RR5GriJak3m4ZAIRQc2UvHWsDqq9q6xoU3ATT8Nj5g/
         YjzaxiwLQZQes8py6reiuIpB65Y2LOpmxl6ql4hpP+Hm7FO8WYQulVX3l2/Db7m6AEfC
         DN2A==
X-Gm-Message-State: AOAM532jFdSo8Ir18BGTaEEeMlheRX1Kr4FTRjSgKGFcfa1DN89cgHWL
        ex53XWXLqvG17JaD5xw7vurBgQ==
X-Google-Smtp-Source: ABdhPJxusBkc/oj8NBCk1Oz/2pCV5zkZFfQeGkUp9I+VXwSkN8aJ/nKOn8xnoY32VVj2OMigYe1yUg==
X-Received: by 2002:a62:1c13:: with SMTP id c19mr48626163pfc.52.1594423108114;
        Fri, 10 Jul 2020 16:18:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id c14sm7296382pfj.82.2020.07.10.16.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:18:27 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/3]  Allow for qcom-pdc to be loadable as a module
Date:   Fri, 10 Jul 2020 23:18:21 +0000
Message-Id: <20200710231824.60699-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series provides exports and config tweaks to allow
the qcom-pdc driver to be able to be configured as a permement
modules (particularlly useful for the Android Generic Kernel
Image efforts).

This was part of a larger patch series, to enable qcom_scm
driver to be a module as well, but I've split it out as there
are some outstanding objections I still need to address with
the follow-on patches, and wanted to see if progress could be
made on this subset of the series in the meantime.

New in v3:
*  Drop conditional usage of IRQCHIP_DECLARE as suggested by
   Stephen Boyd and Marc Zyngier

thanks
-john

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org


John Stultz (3):
  irq: irqdomain: Export irq_domain_update_bus_token
  irq: irqchip: Export irq_chip_retrigger_hierarchy and
    irq_chip_set_vcpu_affinity_parent
  irqchip: Allow QCOM_PDC to be loadable as a permanent module

 drivers/irqchip/Kconfig    |  2 +-
 drivers/irqchip/qcom-pdc.c | 28 +++++++++++++++++++++++++++-
 kernel/irq/chip.c          |  3 ++-
 kernel/irq/irqdomain.c     |  1 +
 4 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.17.1

