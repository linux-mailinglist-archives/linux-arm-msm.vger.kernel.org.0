Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D312B1DC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgKMOx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMOx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:53:29 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C25DC0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:29 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id r17so10242459wrw.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=x8VcIegIRkslNA382JSNnZzBgiq98EbovbVfhX5Iy4c=;
        b=N8JCbkXAWv04+I1DcszvON7lo8BoB6OMnr/JQm5IjATN11vm+FewnpYySJGOf5GDOH
         OigUacLk6p3wchfcg56mJeG3cTERvXpI4LpjMXiToRl06IQxikEa99DEJ99dOgI8Op9X
         jpN7t65g0LqbK0Hnxs1Q1V3fJDWEUZ2IcYIXp/s5Fneu6iod1i9Tht+jt6w2gZ/XhZYt
         nLxwlct8+DaBuFT9xdQP4IYpuA8gBlyYvmytF+bMrGp2y/OealmEp4VoQICqNSQ/iBpn
         LRq5r9uF+pPOoxYjcQ6HWubk5rlZJe07HbygW5xmlKtZ67YNMVVBC7CVEzcnogiNr9ho
         Gbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x8VcIegIRkslNA382JSNnZzBgiq98EbovbVfhX5Iy4c=;
        b=AOscW3uhWrzSF8+sXxmxMWkD1BQ96NLc6+FRoUjsc+MMipy0gTTkKCAeat5UULmnPP
         P2dBs9tZ247XI5RVgcTOJymFe/hLdWBlEctE5tIbvlNNwNliFnFJcZFUD5HrXMuA2dub
         XkA5Bxc90kQIVo0PkMALjH0SA8tW3gIG8kDDBbfIEzNSQOBn2GPEjNFr72dY0NHz2Bb7
         6nRWMufcB8ySqQcZMWcc+5ltMAXXrpSzHqI5lWu9FzHHF8vZGuFG4aT7D9fbGB4rAy/2
         4VZDNmuBb+7YcHsWY1JocWuZBZFdWkiRMbX93EljG7g2vDw7RtSS1WsWJRjk2pGhRUVU
         m19w==
X-Gm-Message-State: AOAM531UvA2siLpsKiva1p+r1VcxqYPGZ8An20qQuJB5sORbdBcFMyOK
        7o2Ud0bZ3jrLgHeeGVADX4CI8aXcoQSXByDf
X-Google-Smtp-Source: ABdhPJxqBJ3QqObCQTrK8bfn80GUAvRMhverabB0tnwrb69oKaGz0aRv0g5t9LqIhANMfe9q18bRog==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr3981189wru.80.1605279208163;
        Fri, 13 Nov 2020 06:53:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:304f:e9d4:6385:8ac5])
        by smtp.gmail.com with ESMTPSA id i6sm10729341wma.42.2020.11.13.06.53.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:53:27 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 0/8] mhi: pci_generic: Misc improvements
Date:   Fri, 13 Nov 2020 15:59:54 +0100
Message-Id: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adjust some configuration values to ensure stability and
robustness of mhi pci devices (timeout, number of events, burst mode).

It also includes support for system sleep as well as a recovery procedure
that can be triggered when a PCI error is reported, either by PCI AER or by
the new health-check mechanism.

All these changes have been tested with Telit FN980m module.

Loic Poulain (8):
  mhi: pci-generic: Increase number of hardware events
  mhi: pci-generic: Perform hard reset on remove
  mhi: pci_generic: Enable burst mode for hardware channels
  mhi: pci_generic: Add support for reset
  mhi: pci_generic: Add suspend/resume/recovery procedure
  mhi: pci_generic: Add PCI error handlers
  mhi: pci_generic: Add health-check
  mhi: pci_generic: Increase controller timeout value

 drivers/bus/mhi/pci_generic.c | 352 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 335 insertions(+), 17 deletions(-)

-- 
2.7.4

