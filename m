Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3C6530021
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 May 2022 03:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347542AbiEVBAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 21:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbiEVBAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 21:00:05 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA9B39820
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 18:00:03 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id z16so1536382ilp.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 18:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3DYtEGQTzZvi1A4S1uBZ9fxUeN5xjNbN/cQ8OVKWFZo=;
        b=Xv87cvPO2H2UNr3ucH+UOLEI/XDgeZ0NFghtFlxZw0gFhnfMP3jE5opSVhewtEssRr
         5cr0ZY6us8S9HMzcPk7DcoTNEG+70my2Ri/bGgn9meyFB1/P1noWQhAZuJiegCd8POfx
         7wxlW4Ix4PgrJodQvJ3ZUI6cgpOhNAf8aS0xqyElmb1/DByTQQcaNvWImc2dLAuZEhfq
         ZAZfLnQNoCg4We7dUvyOm2sX9T0V+xMCrXzIXRBySkfoT9Ae0yh0aAolQjXzmBcx5Wos
         qpD3Qph9/5uku47hhx/xp305xTuW51xaXaCf15Rk8zJHfICEVCERFSTIsYCxE9A0lyzU
         IZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3DYtEGQTzZvi1A4S1uBZ9fxUeN5xjNbN/cQ8OVKWFZo=;
        b=27nKu/Ytx7Btjz2dYNOyWINZCFYfx6IUiq30JS2W83jXpvvpVpZ0n+zbrvXTsSHZXx
         ozcbJekXrKMkC8S8nSiHpogQAtZ3y9dZTDLbBOHbT++lN2Xx37+DYRhFENTAp1gnszzT
         bRduQNKe34IPmZva1KtwF9eQXAiNHb7aVKcJS1dgyXcxLtD3PMQfLvtRmDGY+p9s6LuA
         Nlam/HyMoTZwv3lHEQMmuukMtElW6nZZNUFCuyzCSvR5qPnd1pdfDrZknSa1sfWfk8Pq
         gxBBVm68hj/UzERRF+KceJ5qwItXG9s1ghaIqXW2GEKsP8HCqgSRj9dHWv85KbKpE22h
         QNPA==
X-Gm-Message-State: AOAM5303nkLBqnw+mMXpkwJ8UVG3jZVZejai+qqTvPjFbtKTXqfh/6gr
        FiMZs5gnR1WQqhN7+1vA8PDIZw==
X-Google-Smtp-Source: ABdhPJxlApPYWy/uTHm10OGIiNGTelkTBlw8UxIizWZv44ke5ccT70BBYSUtRxrCLUNxUUnwNsNkLw==
X-Received: by 2002:a05:6e02:194e:b0:2cf:9d32:fefc with SMTP id x14-20020a056e02194e00b002cf9d32fefcmr8980615ilu.217.1653181203189;
        Sat, 21 May 2022 18:00:03 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id t21-20020a02c495000000b0032eacab7e07sm939366jam.93.2022.05.21.18.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 18:00:02 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] net: ipa: fix page free in two spots
Date:   Sat, 21 May 2022 19:59:57 -0500
Message-Id: <20220522005959.1175181-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a receive buffer is not wrapped in an SKB and passed to the
network stack, the (compound) page gets freed within the IPA driver.
This is currently quite rare.

The pages are freed using __free_pages(), but they should instead be
freed using page_put().  This series fixes this, in two spots.

These patches work for Linux v5.18-rc7 and v5.17.y, but won't apply
cleanly to earlier stable branches.  (Nevertheless, the fix is
trivial.)

					-Alex

Alex Elder (2):
  net: ipa: fix page free in ipa_endpoint_trans_release()
  net: ipa: fix page free in ipa_endpoint_replenish_one()

 drivers/net/ipa/ipa_endpoint.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

-- 
2.32.0

