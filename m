Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4314648B742
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 20:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243974AbiAKTVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 14:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243254AbiAKTVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 14:21:55 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CCCC061751
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 11:21:54 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id h23so218118iol.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrCLIqtuYbgNVouuG5ORa+RN8I/f0awMF+AbmNAh2sk=;
        b=pSL5HZQewq/WzDPLOeto5UPBPzkn94wdZDYMp6RSz3Kq2GpL+nCeyddASBCwKcJCPi
         2c4GmU+Z3dtTZgrwOw6V7exesG7M7EBxumJpPADTlCpZjABBNkG1MaSpCeI3sl6K1tAF
         VYnFUunoe2DC7rzi7DiKrKBb8RCFKR+ndMQFgCoAitZYO1m4fFKbs+AgZQtYkRXL6qHC
         B3ZkA8gzEY4vrN3/t8OXYJytf5KcCebC4sm1bQkykTvwC0yL/BpVxtlSP7w5i7dw+H8N
         L0/X+tw50ia2e5x6eYy5SZKxHyFp9CVKJTh9r9XHUUH59qWdT0AHZX1suMG6xPK/mkty
         CZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrCLIqtuYbgNVouuG5ORa+RN8I/f0awMF+AbmNAh2sk=;
        b=WfoCKhk8WlN9saQ5T40fzwJ5oY4Sf0ynZYotoX0UW7VGgTSmFR/t3Srh5cWwLVfayI
         UsMb5YS5PCijzTb4dDbjUxwc9y8R0QywcFGZmS6TeVUjFjq5j2xxr3yqfGqrlkkFSMFI
         28q2Nb9Hux24CvENlRzNXggh2N3O11MEWrLTdG0D77gKlbVFHqnpU7wFREELI1j75j01
         ox/2u+S96bTovro1QCq6uJ6oOdHmWAL8YAg02kQlBoISfyQ392oLTOdIoeo/FuIDUXhQ
         EKaabWLNFRtHDKO1aHLU6dJ6HpiBrFdV8Rh5k+IJ57yUpy25p9EGXQ2Qv+bLD88b105d
         GvMQ==
X-Gm-Message-State: AOAM532apvMTrHO6h3ZL2xC9VKFektZgbV6A+z+kOeadWQxY+BVTmQku
        smc1vhffMp5prjiwjE5IjdtIdw==
X-Google-Smtp-Source: ABdhPJyXCYjzn51tldUZtmuYgDix5KVd3x4gm85mkWgmJtlp6p8R3UGyMprSM68WdtVEjftIEy+D7w==
X-Received: by 2002:a02:7f97:: with SMTP id r145mr2982013jac.319.1641928914209;
        Tue, 11 Jan 2022 11:21:54 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id e17sm6264544iow.30.2022.01.11.11.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:21:53 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] net: ipa: fix two replenish bugs
Date:   Tue, 11 Jan 2022 13:21:48 -0600
Message-Id: <20220111192150.379274-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains two fixes for bugs in the IPA receive buffer
replenishing code.  

					-Alex

Alex Elder (2):
  net: ipa: fix atomic update in ipa_endpoint_replenish()
  net: ipa: prevent concurrent replenish

 drivers/net/ipa/ipa_endpoint.c | 20 ++++++++++++++++----
 drivers/net/ipa/ipa_endpoint.h |  2 ++
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.32.0

