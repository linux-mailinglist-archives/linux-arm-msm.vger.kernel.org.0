Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3F95AF280
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiIFR3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbiIFR2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:28:03 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5101EED0
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:19:46 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id b142so9450590iof.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gzyOHmyEwcUpmMysME9KHn4+PV23NPixwgHPKgsB/oY=;
        b=MvxONyw1ebqpEt5Lt7LRNWus5vuNJaskfmaB4vSkZDiH39G6HCVF5FWsakBlve0GG+
         7pGoFFqC4A4NT2wFdXyPIcDcsj3y1iyE+fpsytjN6fJRq01mA5uWPTUXqZTGvIvAW4NH
         Z/rKAoL9pd+0LfqZdeBKfJpzkODdCCBphFy2x7bX98L6cT/iJ+GchW8Qwke2cGOe0Q2p
         jfJEnZcrTIUTUPFZ/2xFcunIxnsmJyGIbHRhoBLDPU7Gu2oaohJaxV7fB8PtWoSGgtEI
         rR42PeGW+4pSqnNLxCPaz8Aybcqcb1D45SPHT1evh49FVAkNziqESlFQ3Gcu3QcYE7js
         PHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gzyOHmyEwcUpmMysME9KHn4+PV23NPixwgHPKgsB/oY=;
        b=71nRjqEMGhbNDETPYaSGaxYpBlNqnNzIgfpwbk/DX8sXdA50hz3iHwWWQTU/dU/z5X
         b5hI0SS0rkGcUWAzQZQUfNepIWFMV6OUlDIYSr5rXyjHN2lK32RsyGwvJi4ILVjL9zrr
         30uMvxiciu3v+ql/vbVrawIdbko0jteLXok8dsFWCPB3t8jTkpoYR0N5Eqm+79b6w3mj
         rafkEUdQupE/Z7XMvnvzDQapjkXiak7HW44cf2MtdxbLfwIS+g8Ci5xphMa6UD4sUdYA
         N+s3nysOTF8+UEThYRIdrlz/LRFxZYxPRsYeXJgbn6KkWDN4Xjwkgav1hm+5gp7X2VIj
         /zwQ==
X-Gm-Message-State: ACgBeo0WIg+Plo/hKFDCVOGdwKM0JmH5a0upBdgDqs1iOCpM5tAEw+U7
        EGjFVVy8a7gRiSiyRvjspfG6aw==
X-Google-Smtp-Source: AA6agR7Fs99/hGR+0innvdYwh8CnCaj0R559sZtpqkxnyZvq/AZfFVe2BhuEvJFHkgFMCm8iM4CTiQ==
X-Received: by 2002:a6b:7d05:0:b0:68b:7243:63ff with SMTP id c5-20020a6b7d05000000b0068b724363ffmr19789524ioq.191.1662484785991;
        Tue, 06 Sep 2022 10:19:45 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id q10-20020a056e020c2a00b002eb3f5fc4easm5292204ilg.27.2022.09.06.10.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:19:45 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/6] net: ipa: don't use lists for transaction state
Date:   Tue,  6 Sep 2022 12:19:37 -0500
Message-Id: <20220906171942.957704-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is the last series of patches to convert the IPA code so
integer IDs are used rather than lists to track the state of
transactions.

A first series of patches added ID fields to track the state of
transactions:
  https://lore.kernel.org/netdev/20220831224017.377745-1-elder@linaro.org
The second series started transitioning code to use these IDs rather
than lists to manage state:
  https://lore.kernel.org/netdev/20220902210218.745873-1-elder@linaro.org

This final series finishes the transition, to always use IDs instead
of the lists to manage transaction state.  As a result, the list
fields, links, and a spinlock to protect updates are no longer
needed, so they are removed.  This permits a few other improvements
to be implemented.

					-Alex

Alex Elder (5):
  net: ipa: always use transaction IDs instead of lists
  net: ipa: kill the allocated transaction list
  net: ipa: kill all other transaction lists
  net: ipa: update channel in gsi_channel_trans_complete()
  net: ipa: don't have gsi_channel_update() return a value

 drivers/net/ipa/gsi.c         |  11 +--
 drivers/net/ipa/gsi.h         |   7 --
 drivers/net/ipa/gsi_private.h |  22 ++----
 drivers/net/ipa/gsi_trans.c   | 136 ++++++----------------------------
 drivers/net/ipa/gsi_trans.h   |   3 -
 5 files changed, 35 insertions(+), 144 deletions(-)

-- 
2.34.1

