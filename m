Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF1D6BBD56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 20:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbjCOTgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 15:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjCOTgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 15:36:00 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BD389F38
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 12:35:58 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id r16so17447170qtx.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678908957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRD8NgEN/2xMDJaIifHiAB1EaiS+DmHgSj8/md0pHg8=;
        b=CmOpWXQ2K/Z3Cnfqvvaj8KMNOtuU+3KOAomRx76CMAdc9hV3od7Ix3EXd7lt3v1aCg
         quyBuXk6dlhcKIaU9/YP2DouDib9HFf3A/tyadabjAgEN8xdccth5oiVgvBjIyolNWbM
         owG4dEmR5Aqo2h1lQZ7lqJGDSsvZtLJuczogXTklZIRnb6/7sLbOJJZJOFsf+NLQb+H5
         sLlODqcPKoafDN9SznODbLHxSOtPPeLJbL9tRIVio9Gk6qQ25AYP2jcvATo6y7+OpfJo
         +1O6WQnxFcli7P3pdMI6ILSqO4nU4WoZgLpNFewR4BejrT/BpaRORc14CoipR/8V3rHz
         BZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678908957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRD8NgEN/2xMDJaIifHiAB1EaiS+DmHgSj8/md0pHg8=;
        b=F01pglC5bQ1j0UePh2bIgs6XVOFbUqoPsQFIPPGOY5QAW0FofmTJok8ASGc5t0ouNO
         rKzVanIAv75EPXFEZvI6NdwcARiI9JYVqp/XoVOVUa/K/64SzQ7pd1cIs9+a3rqaZ50g
         melxOL8P6xxr/8aDAR19sI3eOWTVNnDXPZsC/eWBmBQShEAylI2CcD4QgrzIFhasZEKG
         bZchpGCF+DSnfcaQAtDrdhSEs+XNKszm8mXWUPgNZ/QPvHkGY2mKdwT9Q73LNypMZFBw
         x9ogpu4nHAyNQtW56IHbcd+yV1QKw6MnDe7kPl9AzMyn3lGZtCOuHZRlTNzYkFKJYddx
         tkgg==
X-Gm-Message-State: AO0yUKU4Yvz7owYFmYuxuFmlJaYQuA9ihLcJmU9N0Yi5A2mfB+z8f3/F
        Tht5ZCKo1w7w2sUmuG28rE1kgQ==
X-Google-Smtp-Source: AK7set/im7ReWlbjUTTel/CadvtzywtBv/u+FOd9kH8CWrLzc78P9mWW7EPTdeZgGLZ/JVPe9OI5cw==
X-Received: by 2002:a05:622a:1309:b0:3bf:d366:50e1 with SMTP id v9-20020a05622a130900b003bfd36650e1mr1659021qtk.45.1678908957392;
        Wed, 15 Mar 2023 12:35:57 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a024900b0071eddd3bebbsm4369462qkn.81.2023.03.15.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 12:35:56 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/4] net: ipa: minor bug fixes
Date:   Wed, 15 Mar 2023 14:35:48 -0500
Message-Id: <20230315193552.1646892-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The four patches in this series fix some errors, though none of them
cause any compile or runtime problems.

The first changes the files included by "drivers/net/ipa/reg.h" to
ensure everything it requires is included with the file.  It also
stops unnecessarily including another file.  The prerequisites are
apparently satisfied other ways, currently.

The second adds two struct declarations to "gsi_reg.h", to ensure
they're declared before they're used later in the file.  Again, it
seems these declarations are currently resolved wherever this file
is included.

The third removes register definitions that were added for IPA v5.0
that are not needed.  And the last updates some validity checks for
IPA v5.0 registers.  No IPA v5.0 platforms are yet supported, so the
issues resolved here were never harmful.

Version 2 of this series changes the "Fixes" tags in the first two
patches so they supply legitimate commit hashes.

					-Alex

Alex Elder (4):
  net: ipa: reg: include <linux/bug.h>
  net: ipa: add two missing declarations
  net: ipa: kill FILT_ROUT_CACHE_CFG IPA register
  net: ipa: fix some register validity checks

 drivers/net/ipa/gsi_reg.c |  9 ++++++++-
 drivers/net/ipa/gsi_reg.h |  4 ++++
 drivers/net/ipa/ipa_reg.c | 28 ++++++++++++++++++----------
 drivers/net/ipa/ipa_reg.h | 21 ++++++---------------
 drivers/net/ipa/reg.h     |  3 ++-
 5 files changed, 38 insertions(+), 27 deletions(-)

-- 
2.34.1

