Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73757612694
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 02:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiJ3ASk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 20:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiJ3ASi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 20:18:38 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9791D24BE7
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 17:18:35 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id z3so7385408iof.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 17:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjHQrp4EVDI8n+t1cgspBMWy1K3NeCgFafwd7Mct33w=;
        b=vCQsA14K/mjpp2iHhDOvehLXBhPnOJE5yfjbmYukbJmldzsXZg5Ob+hZpg7w4CNk5h
         2SP6Yn6oKCNVMOtvspxTUWH+6Q+MrUDnrYwcOip8qrCyTkVI+30atqUYKO3XQ6pU0m85
         il37XGg4p3gGb3YLQ7nq9pi4BaZWZZjEu3aa+8OhiyTWnqF9LbT13Gv3HdVJf8p/jclx
         +K8EofOj0HrxPmOJNPkFla14pL5l0b2Q2hklgV1TW7lBK2+RJiQEPtVH2BvxlKMeGre4
         P3VEwq3Vym7GzQ+XZ7hwuxCBxSKFW/r4dk19E91KCCm4SBdJPu+LelMIc78flMJM+SqT
         Ur0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjHQrp4EVDI8n+t1cgspBMWy1K3NeCgFafwd7Mct33w=;
        b=jZhN8fy7lIpiOiWNDqRzd2EQvHGmrQPiMu83RfYb83ILsU5/XffmZ5k/f8OVwg8MoJ
         HK14/ePEDamvobpZx9O9ov5fWEjBbsh/iSKxXKMdOqnJ2TcMGKh3JRbgVBM9eNhUGWTx
         FAQzdLkT2XpLlonTwNoyCgBbDHDXgUwqD7KxQqcPw+x6w2qhe+f9uyvqk9FBRTfsmy+g
         Bwi9w1MvgudWumRlStJtxi7KOYYTGNmi1RLWT5hWu9s9ZRg6MdHnCsjEcLaeFwzLpd41
         mjY6NmSnHnHURTBQ15jcVk3oASiFZtUhc5TIm//SMBST2kPutrErjKTmD3+bS6RUuCeo
         2JEg==
X-Gm-Message-State: ACrzQf3ebrBi1lU/eA4q261bRufEUP392RRlHC4j/kS2W1t03juGI9o2
        HdF+2yIgugnd0JWOosLK3yuu6g==
X-Google-Smtp-Source: AMsMyM69iz8ar9hrTlPrBc/7GyLn4sJGahSZmxtstIe7fbX8B31jkeC3PuHTrP3YZ8V8PSSvFqXbQg==
X-Received: by 2002:a05:6638:2646:b0:374:f6f6:2e12 with SMTP id n6-20020a056638264600b00374f6f62e12mr3298217jat.182.1667089114811;
        Sat, 29 Oct 2022 17:18:34 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id co20-20020a0566383e1400b00375126ae55fsm1087519jab.58.2022.10.29.17.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 17:18:33 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/9] net: ipa: support more endpoints
Date:   Sat, 29 Oct 2022 19:18:19 -0500
Message-Id: <20221030001828.754010-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Signed-off-by: Alex Elder <elder@linaro.org>

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

 drivers/net/ipa/ipa.h                |  26 +++--
 drivers/net/ipa/ipa_endpoint.c       | 167 +++++++++++++++------------
 drivers/net/ipa/ipa_endpoint.h       |   2 +-
 drivers/net/ipa/ipa_interrupt.c      |  34 ++++--
 drivers/net/ipa/ipa_main.c           |   7 +-
 drivers/net/ipa/ipa_table.c          |  88 +++++++-------
 drivers/net/ipa/ipa_table.h          |   6 +-
 drivers/net/ipa/reg/ipa_reg-v3.1.c   |  13 ++-
 drivers/net/ipa/reg/ipa_reg-v3.5.1.c |  13 ++-
 drivers/net/ipa/reg/ipa_reg-v4.11.c  |  13 ++-
 drivers/net/ipa/reg/ipa_reg-v4.2.c   |  13 ++-
 drivers/net/ipa/reg/ipa_reg-v4.5.c   |  13 ++-
 drivers/net/ipa/reg/ipa_reg-v4.9.c   |  13 ++-
 13 files changed, 227 insertions(+), 181 deletions(-)

-- 
2.34.1

