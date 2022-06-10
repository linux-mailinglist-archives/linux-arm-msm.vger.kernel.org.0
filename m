Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EFD5469B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 17:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243344AbiFJPqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 11:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240913AbiFJPqV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 11:46:21 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DD22C110
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 08:46:19 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id v7so21226169ilo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5gwtupWPtnYNKyTXg+LeUPBFQAkfKZ5r5Zn8j7l7dY=;
        b=rsvaBZc/2eV3W/hqt/2R6TaglxS1NpGazxTwdH1EiRqRZjuOFHq4fcRsP28TCrr6n2
         y70IDwFbjt3ttye9H+DuJbzoALnjiE4t7ohskFyKdzguvX+aZW8DuYrmkeAqJ6G5dFL0
         DISA0/kvXco6tRkNdDPXJwkVyeSqR2M30ANzkB0wjNZEaDKzAGhlC1IMWFqxOYiwrAdk
         WDwQ6rARVLwrHfKVLFNXd0br6h0wR2dklUf3RKiiUd0dAyGkAhbJXbJPX+prgXaJ5YjJ
         TUs92Zb48/H9SQ219aXJdLr7IoolQOTMTvocnLrA/iIqP+uyFvNIVHAjPpn/wN4OXZB8
         4XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5gwtupWPtnYNKyTXg+LeUPBFQAkfKZ5r5Zn8j7l7dY=;
        b=dp/4vAoIgQftDkjDZyrjpZT7nAZrpCQC15VC16FT9G8GMFefb4Xoe3FKdbdP5yRt79
         PYyOXGfWo3xppWSgM9RgeiRvFGPbq6LhYqcBvfb1pc/uHMCIVN811BEQSQJutMdVG3Hr
         2WbBImmvqTEveQJsyW7RVG3q+xf4CP/nMlu+h/yB5AYUhd0ev64MqOH8RzkUXb5JEDtS
         3LtJJ3ISWBE4dw7btSA40aBe83BlT5rG0Wu/HMZ/hsml1Z3VMBl4keZwYtQPM2Qe6sA5
         9uBErMkfVjYRdXn1g29c8Er7FKZQsb0zODid3HSQNh/GwN9D7HS+UNgCoOG+J2Cb4CjR
         l9XA==
X-Gm-Message-State: AOAM530SVDU9tMeRaBoNR8e0x+czC/RHXwGc64RMzHUDan33xGLlw4RC
        +c3yJo0Dg2r+iO08636GC/aBFw==
X-Google-Smtp-Source: ABdhPJzJyzBadsuhUrO+FUS5bps+ZLxNpDz5T4mDQU2jOQ4HXXcOsXUtupRQocarpdtKZs7vxy7dPQ==
X-Received: by 2002:a05:6e02:12ee:b0:2d1:7bcd:f7cd with SMTP id l14-20020a056e0212ee00b002d17bcdf7cdmr24726885iln.173.1654875979092;
        Fri, 10 Jun 2022 08:46:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id y15-20020a92950f000000b002d3adf71893sm12100488ilh.20.2022.06.10.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 08:46:18 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/6] net: ipa: simple refactoring
Date:   Fri, 10 Jun 2022 10:46:09 -0500
Message-Id: <20220610154616.249304-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains some minor code improvements.

The first patch verifies that the configuration is compatible with a
recently-defined limit.  The second and third rename two fields so
they better reflect their use in the code.  The next gets rid of an
empty function by reworking its only caller.

The last two begin to remove the assumption that an event ring is
associated with a single channel.  Eventually we'll support having
multiple channels share an event ring but some more needs to be done
before that can happen.

					-Alex

Alex Elder (6):
  net: ipa: verify command channel TLV count
  net: ipa: rename channel->tlv_count
  net: ipa: rename endpoint->trans_tre_max
  net: ipa: simplify endpoint transaction completion
  net: ipa: determine channel from event
  net: ipa: derive channel from transaction

 drivers/net/ipa/gsi.c          | 107 ++++++++++++++++++---------------
 drivers/net/ipa/gsi.h          |  11 +---
 drivers/net/ipa/gsi_private.h  |  12 ++--
 drivers/net/ipa/gsi_trans.c    |  10 +--
 drivers/net/ipa/ipa_cmd.c      |   8 +--
 drivers/net/ipa/ipa_endpoint.c |  27 +++------
 drivers/net/ipa/ipa_endpoint.h |   4 +-
 7 files changed, 80 insertions(+), 99 deletions(-)

-- 
2.34.1

