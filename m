Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57B34A8955
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244516AbiBCRJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236960AbiBCRJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:09:33 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650BDC06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:09:33 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id z18so2660723ilp.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0sm9twsYFfUl1R441+dZUp0hhjan8fnG22qNYzem82s=;
        b=K+67PkiyounXfx3XxuFDqeMRI9AsURutUzG0sKB4ty9jFEZfY7ApL2ijfwu1EmiTp7
         /bmeqBzbV9FzNgFAquA4o5Uut8m3JIiZdX6rCgiVvG09mjRyicRDAwjdp7JgX81X+8zE
         KcqCjlfQBjl7rpy203itqWJqjnnf7vT0G2k8E5EOLDEelqOHTtCQZMghThvHl35fX9c/
         hUPADzN/Wftr+GJbmG1esy6dIJAhd1ftiCKQynFhZm3UkQ9XirdThOj1tgp7S1OI6ke4
         rhnchifGkdstU5jlVX3MqRbJy5D7zyMzWtTuv3Crh1SewOMYjeJ0iw9mPZUuoK4KFiGB
         ll6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0sm9twsYFfUl1R441+dZUp0hhjan8fnG22qNYzem82s=;
        b=NEsWfj2HvEv/T2gC467SSxoJOBo2HChfcqURwc15dYlI7xYT/kp8bQy+Q+dl0uW3oW
         Zm2DGUKRNc7IHMtLAS0edCeQB7Qoa5jkmFkragCmO98HJHXW3yC3YQPezXqGqTE4yPX+
         bXSiEleWWHnaI5Dz9RB/cnLw/T0HmqQ8uBEDK0bdpIdYv7przVnOUbRP9maCuUq9dp8T
         kaDG8uqOmCwP3pk2mbVyWWw2N8fwk6hyX3OAWmy7HiabIeCbszGZcEyWN61xn2H+fuPZ
         zrFjyP+4nCfIKykVPGNbppFc835YhvB9kA0OAST5IqRwgtsStkaKtjyTs6R62bpjvKMD
         ZpLw==
X-Gm-Message-State: AOAM5306SloI8tJvnp2y1jO1kTBrYF+VhfBNm2woe77Fsk0k2+PdZqFL
        bz/BXYbcC2oNQrb36iKFsP5O7A==
X-Google-Smtp-Source: ABdhPJwaQ52DTaKWHABJgB2ZMw/+Zx27WmRxJoY1MVrVdTPkQZCnfV42JqEEyHdQfZXOsuRhEBP5BA==
X-Received: by 2002:a05:6e02:188c:: with SMTP id o12mr11555055ilu.44.1643908172619;
        Thu, 03 Feb 2022 09:09:32 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m12sm21869671iow.54.2022.02.03.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:09:31 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 00/10] net: ipa: improve RX buffer replenishing
Date:   Thu,  3 Feb 2022 11:09:17 -0600
Message-Id: <20220203170927.770572-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series revises the algorithm used for replenishing receive
buffers on RX endpoints.  Currently there are two atomic variables
that track how many receive buffers can be sent to the hardware.
The new algorithm obviates the need for those, by just assuming we
always want to provide the hardware with buffers until it can hold
no more.

The first patch eliminates an atomic variable that's not required.
The next moves some code into the main replenish function's caller,
making one of the called function's arguments unnecessary.   The
next six refactor things a bit more, adding a new helper function
that allows us to eliminate an additional atomic variable.  And the
final two implement two more minor improvements.

					-Alex

Alex Elder (10):
  net: ipa: kill replenish_saved
  net: ipa: allocate transaction before pages when replenishing
  net: ipa: increment backlog in replenish caller
  net: ipa: decide on doorbell in replenish loop
  net: ipa: allocate transaction in replenish loop
  net: ipa: don't use replenish_backlog
  net: ipa: introduce gsi_channel_trans_idle()
  net: ipa: kill replenish_backlog
  net: ipa: replenish after delivering payload
  net: ipa: determine replenish doorbell differently

 drivers/net/ipa/gsi_trans.c    |  11 ++++
 drivers/net/ipa/gsi_trans.h    |  10 +++
 drivers/net/ipa/ipa_endpoint.c | 112 +++++++++++----------------------
 drivers/net/ipa/ipa_endpoint.h |   8 +--
 4 files changed, 60 insertions(+), 81 deletions(-)

-- 
2.32.0

