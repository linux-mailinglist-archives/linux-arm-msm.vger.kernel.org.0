Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662731B884C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 19:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgDYRxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 13:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726387AbgDYRxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 13:53:16 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A384C09B04D
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:15 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x77so6462549pfc.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxsCUHvJidJhiJJhJNMycjU39aOd/yCTxZfhtIy2qU4=;
        b=UpgWcg9eIyBGCuU1flBlioxSkBNuuizyQvlSNx1MvIPLntXpuLCT6/gnOyi4Q69Il8
         jiMbElEjkB9TYlgkP2MyrFJNKaVP3avr1NidYBSz3HR2XZUoSF7KB1foYIekSTvpzQMt
         XPkv+5EqsvGkb0KD7GTMauLLxJ55e+ZgfOM7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxsCUHvJidJhiJJhJNMycjU39aOd/yCTxZfhtIy2qU4=;
        b=cXXi1lM2J8K+HMM1AqfXUWKCBx83P6jsw/w/vVjhbEDYzxe5866Cxfk6+MlRGuxztA
         H/PmWL+ywIwPbYW93gGmDvUPKcJ7lbDYa6e4QvLpKoa8WlH0Y9nEDcWkVqxtQyip+VwR
         rs7iJBtcmM5AVMQzfy4AomOTjy3QifoKDfB7iVdw4N+563dV7YymZobrgwi7wrAOFee6
         /wz2lAKfncPIMqgMHaQD3N3mVBKm+W5mLBMLHC5nHD7jIOJIClk64KTSrr2p8gin8IWP
         41QRe5l4XUiqOrBZ0VAZFLWkgkllKKu/KBNoyaRwRtsZHJ/qtHFKqdRX62YGXpa0WV9K
         IPSg==
X-Gm-Message-State: AGi0Puba7P6kY9do7/hd5dWspjnjhaeVZ18GRMbLLoRt/CNIhDEik98Q
        ZoVDbLm0zvsrDmnuSoT2Hd00TRyR5Us=
X-Google-Smtp-Source: APiQypLWC1/oB1xiCcvxiHfUPr1phpNzdnJKfr8nfxRQ3K6A4nRs9gSTe2ahMKHe/bAreT3IAEEGNw==
X-Received: by 2002:aa7:985e:: with SMTP id n30mr14586895pfq.163.1587837194732;
        Sat, 25 Apr 2020 10:53:14 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v127sm8342148pfv.77.2020.04.25.10.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:53:14 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/3] Even moar rpmh cleanups
Date:   Sat, 25 Apr 2020 10:53:09 -0700
Message-Id: <20200425175312.124892-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Patches based on Doug's latest series[1] on top of linux-next. We remove
the tcs_is_free() API and then do super micro optimizations on the irq
handler. I haven't tested anything here so most likely there's a bug
(again)!

Changes from v1
 * First patch became even moar complicated because it combines
   find_free_tcs() with the check for a request in flight
 * Fixed subject in patch 2
 * Put back unsigned long for bitmap operation to silence compiler
   warning
 * Picked up review tags

Stephen Boyd (3):
  soc: qcom: rpmh-rsc: Remove tcs_is_free() and find_free_tcs() APIs
  soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
  soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition

 drivers/soc/qcom/rpmh-rsc.c | 115 ++++++++++++------------------------
 1 file changed, 39 insertions(+), 76 deletions(-)

Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid

base-commit: 02d8ecc18b8f392389ac9e7b785b0230ecb80833
prerequisite-patch-id: 0d383ea46ef52ab4044886a7d88d85c3c506f4ed
prerequisite-patch-id: a02b0b018404d1a0c79270ab567051656f123b23
prerequisite-patch-id: e59d990462b004a9f8335e87c2d0d747afec49ea
prerequisite-patch-id: 20cd04c9dbed8937de5d61f486616c5961b8ef99
prerequisite-patch-id: bb479b9adbe28c58b3ac8f363a306de80b6dcb74
-- 
Sent by a computer, using git, on the internet

