Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3B322CCC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 20:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGXSLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 14:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgGXSLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 14:11:46 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A189BC0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 11:11:46 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id l1so10674136ioh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a/UQvPKtYnZLZqgUn0XW2j5+SzCkzSp8vCmVb/ZBF8c=;
        b=F1o28rPE/Yt97GiWaWB9/CKFJi6S1upJ6Y7qvou0AM54OpXJJpdCfiE77LtsvCPLY0
         fCl2y9zr5v8H6+NloqxNx5sLczH6A38Lz7fc73HJFiqo7AYIdjd8D7R9SyeLVHMiPJ9d
         03PH4NltlvA8G6XTfjLIANfY8zQx2U6xQIhuZL/gJU69jx7J9MN0Tu4tKPvbTsW/Q0b+
         eSW/mVVwoB700ynQzxgJisaN0qhUC8VHi8svndt+Nw2C2WfDEq4U/VdnqsvyGnIfop3U
         GE1W0goa4UIrqpGbamvgy2e6qd2a5WABR7o7uGUOZMHg3KZn8boqYF9qp6Fqa1QNB14y
         QrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a/UQvPKtYnZLZqgUn0XW2j5+SzCkzSp8vCmVb/ZBF8c=;
        b=pab3A5pg6WVuua6gm9lV/pUlsmGQzR/vj+y7qLRe7HgxRok3ORZ+pD4ZWlyJysyoWB
         IevDUs0FyRKF4CzGifjCV/MyNWDLrA0fKHGrdFomd2odrKHr6WYwMZEdihM85SEBJLoq
         Nu5l0LtobyE7V/7xka2VT732xzU2Cc77nF0vxqsoxlz3tvJDBoq7AxGsJKB2sHAH4pjQ
         KLz/vhpEdKYIkOJjUmqNv//J7a+VSyzGdvkjxSpfmF7ndAGKeUY2zR4XSOfZ7jg603F7
         +FbrJdo3OM+QQnC26cZOascp2NuwUUFD1SnL3YLoHdzLZOgdyw9ztcFO4gHNvYJMLiMc
         7yrQ==
X-Gm-Message-State: AOAM530FdeO/TE99016yrtnYpAqhDH/5t6zxv9IOs+iB1+d+KtbprBK+
        6k3faux4eWGQzL/tmbXlC5rXOA==
X-Google-Smtp-Source: ABdhPJxKkoK9PhB+aL2g3ao8CwCGXNNySWGOpuO4MoByIZoOhHzUW/Bl+9bPSdtIJpjTUHONFFluCw==
X-Received: by 2002:a6b:6e11:: with SMTP id d17mr11924957ioh.102.1595614305764;
        Fri, 24 Jul 2020 11:11:45 -0700 (PDT)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id b13sm2407802iod.40.2020.07.24.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 11:11:45 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com, davem@davemloft.net,
        kuba@kernel.org
Cc:     agross@kernel.org, evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] remoteproc: convert IPA to use new notifications
Date:   Fri, 24 Jul 2020 13:11:40 -0500
Message-Id: <20200724181142.13581-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IPA driver needs to be notified about changes to the state of
the modem (starting, shutting down, etc.).  A notification mechanism
was put in place for that purpose, but a more general system has now
been accepted:
  https://lore.kernel.org/linux-remoteproc/1592965408-16908-1-git-send-email-rishabhb@codeaurora.org/

The first patch in this series converts the IPA driver to use the
new notification mechanism.  The second removes the temporary
system that was put in place for IPA use only.

					-Alex

  --> David:  Bjorn has agreed to take both of these patches through
      the remoteproc tree.  They should be merged together, and the
      first has a build-time dependency on patches in rproc-next.
      I'd appreciate an ack from you so he can merge it.

Alex Elder (2):
  net: ipa: new notification infrastructure
  remoteproc: kill IPA notify code

 drivers/net/ipa/ipa.h                         |  3 +
 drivers/net/ipa/ipa_modem.c                   | 56 +++++++-----
 drivers/remoteproc/Kconfig                    |  4 -
 drivers/remoteproc/Makefile                   |  1 -
 drivers/remoteproc/qcom_q6v5_ipa_notify.c     | 85 -------------------
 drivers/remoteproc/qcom_q6v5_mss.c            | 38 ---------
 .../linux/remoteproc/qcom_q6v5_ipa_notify.h   | 82 ------------------
 7 files changed, 38 insertions(+), 231 deletions(-)
 delete mode 100644 drivers/remoteproc/qcom_q6v5_ipa_notify.c
 delete mode 100644 include/linux/remoteproc/qcom_q6v5_ipa_notify.h

-- 
2.20.1

