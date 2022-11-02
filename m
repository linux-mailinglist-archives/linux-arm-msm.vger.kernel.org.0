Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33625617066
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 23:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbiKBWLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 18:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiKBWLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 18:11:44 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28504BC32
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 15:11:44 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id r81so7547539iod.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5zf4BfWxsrDUYLhb7q93mknimu8krloJstjYUK3YOg=;
        b=BA1YDn9zjWt9tbdROSCISHSci40MZSWjxbtxQLDYR8YQQChxjwSEejm76YBvuh/LB0
         EnQfii5UZHPVJ1lrhWW6Ed+OzB5MTio6PK+kDyhDEyHgbo/ehFbM6/tp+A/Jvgwv44KL
         rn5BXzB6LIIZ6YQdwXOoRmLKlJeMV+JkzYnze928eNIsxEn5Svf4DXJ/vNTYpiXtIEqy
         fK9HNE+vuJbeZDf52vWP0/nAfyjhDlCS4JXUz5z/Qit/XqkoSlNrpwUcl+znj6jQJ7WU
         Ls+pX5LExESZHa3J6WyQc8iMkNJjEY9aygYyjYClL+lr6Pdga78jMPX8ET5WbvC7rb7E
         vaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5zf4BfWxsrDUYLhb7q93mknimu8krloJstjYUK3YOg=;
        b=SsQuQW7DCGqc/7Q9+Dovyepfe8WsddSq7rixtIV/4GgkQz2pDJpWkSr74mA8RWLj6+
         TP41Szo64XXDJFUkd7aBG8391Y58FV6YXCY4CtjjmfmiPuxj966YpZek+SFAk9z8HQSD
         0Q+71OGw95k11uDhQp8xis1NHI1bZOrV5s0gNiJuVYY4Wk9f/Z2mEpt1Ev0b65zE2T3r
         nx2d+gJBKPEpatnbSH/xZztWNxj0bEH78xMFtZEb8PSOuWL6l0jCwgafJl1w8sRzn4Ls
         ebo1sjwjeo/Vga2kDEY5nUUqigK7Dh0R93Ig94iic75aIxY/V1CfPV8ey3Z6otrAPG+Z
         oODQ==
X-Gm-Message-State: ACrzQf06d/4kGPI/unJES2pxwwLGFRTuSdgf8fc6DtYEIDtixvGNy9X2
        x3JbnHIq03HnGvG6198OBWWdGQ==
X-Google-Smtp-Source: AMsMyM4wgMyzwALx6FoyjgfkPTCl8n44m7mkijETYILXovWiyHzKU8hn8GsH8nzlacGV/5oVdBixxw==
X-Received: by 2002:a6b:3b10:0:b0:6cc:70d6:b8c0 with SMTP id i16-20020a6b3b10000000b006cc70d6b8c0mr15820657ioa.179.1667427103507;
        Wed, 02 Nov 2022 15:11:43 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id f8-20020a02a108000000b0037465a1dd3fsm5073974jag.156.2022.11.02.15.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 15:11:43 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/9] net: ipa: support more endpoints
Date:   Wed,  2 Nov 2022 17:11:30 -0500
Message-Id: <20221102221139.1091510-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for more than 32 IPA endpoints.  To do
this, five registers whose bits represent endpoint state are
replicated as needed to represent endpoints beyond 32.  For existing
platforms, the number of endpoints is never greater than 32, so
there is just one of each register.  IPA v5.0+ supports more than
that though; these changes prepare the code for that.

Beyond that, the IPA fields that represent endpoints in a 32-bit
bitmask are updated to support an arbitrary number of these endpoint
registers.  (There is one exception, explained in patch 7.)

The first two patches are some sort of unrelated cleanups, making
use of a helper function introduced recently.

The third and fourth use parameterized functions to determine the
register offset for registers that represent endpoints.

The last five convert fields representing endpoints to allow more
than 32 endpoints to be represented.

Since v1, I have implemented Jakub's suggestions:
  - Don't print a message on (bitmap) memory allocation failure
  - Do not do "mass null checks" when allocating bitmaps
  - Rework some code to ensure error path is sane
      
					-Alex

Alex Elder (9):
  net: ipa: reduce arguments to ipa_table_init_add()
  net: ipa: use ipa_table_mem() in ipa_table_reset_add()
  net: ipa: add a parameter to aggregation registers
  net: ipa: add a parameter to suspend registers
  net: ipa: use a bitmap for defined endpoints
  net: ipa: use a bitmap for available endpoints
  net: ipa: support more filtering endpoints
  net: ipa: use a bitmap for set-up endpoints
  net: ipa: use a bitmap for enabled endpoints

 drivers/net/ipa/ipa.h                |  26 ++--
 drivers/net/ipa/ipa_endpoint.c       | 185 ++++++++++++++++-----------
 drivers/net/ipa/ipa_endpoint.h       |   2 +-
 drivers/net/ipa/ipa_interrupt.c      |  34 +++--
 drivers/net/ipa/ipa_main.c           |   7 +-
 drivers/net/ipa/ipa_table.c          |  91 +++++++------
 drivers/net/ipa/ipa_table.h          |   6 +-
 drivers/net/ipa/reg/ipa_reg-v3.1.c   |  13 +-
 drivers/net/ipa/reg/ipa_reg-v3.5.1.c |  13 +-
 drivers/net/ipa/reg/ipa_reg-v4.11.c  |  13 +-
 drivers/net/ipa/reg/ipa_reg-v4.2.c   |  13 +-
 drivers/net/ipa/reg/ipa_reg-v4.5.c   |  13 +-
 drivers/net/ipa/reg/ipa_reg-v4.9.c   |  13 +-
 13 files changed, 241 insertions(+), 188 deletions(-)

-- 
2.34.1

