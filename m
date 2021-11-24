Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EDA45CD72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 20:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbhKXTrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 14:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbhKXTrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 14:47:31 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539CBC06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 11:44:21 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id k21so4701908ioh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TVY0xbbNHGxOoTnm29wKJKABb+CBuNHDgBMwoMorQ2g=;
        b=IDGj76q2VEC2WdGF9jr62e6uYamT9DHKLSk8HUTszRtO/fvegN5T6t6alvqlzZGJLv
         k3eGKKCfDj9MuJiowcN0nzQlexrBpkv3mnYfkn8V2jnXpFduH1yAk2yw1DpF2XPOVRyC
         YVqa3ZgzhcdsnD80Lec3EX2uFl/RlaS/d8IAYT0+EXaCmCaBkmsGVTbkmqLP5RbpGhgI
         7jZjizXNHUh5Pz0nr/U2mz5oc9JJwhi5PJKCs/Gmzh7fgqfKUTahpZAiw6Zhf0pbyBy5
         g1lD3l5cTvfAwQH2a0xMhPZBQNIbftQCc6hxWho0K5WYUNdfwnxi5UqhLra0Incfibt5
         rhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TVY0xbbNHGxOoTnm29wKJKABb+CBuNHDgBMwoMorQ2g=;
        b=BrxxRyoa8U4q2g6PPCoeOtv2KAne3kF1T2Ut+lt/ui35/jTu8/ae7r7xqpQfb8NcZL
         ZLAWpKaudyImUnKuewE8wxrWDxbaxbjBU/hPvNLMx1yw2ZC5YL+LO/K3BxkxHve8jzLJ
         kBEDHeDnNgMXEAwfFGhsq31PgHthomuVdeE09PkxXT+S8O6IctnS1CA4KqXw1zryTTu8
         8O/I4bHl2iRlHpdN4MiBmQuTWkfto6JwB6cukoLXoRF8RTT0xl/WBThLo7qL6WN6YJHX
         KsFsS3wfvojnNdTF/oPJKx6WRJzFYAjpxW5zNFUQlhFeCo4U+JxSqnTIoRcgg1BZaz/e
         YE1w==
X-Gm-Message-State: AOAM5339fBRaYrn7+kZHPYgR2MJopNipS7wpXs95gWLioLdhGfa57YpV
        +IPXc8E6gqAasAMw1KSmMeiF4g==
X-Google-Smtp-Source: ABdhPJzSvYeWShlZpzbONR090fnXMSi5s3F8BjV1BxpHOETC4EcWCjEhxVc0xZ1ZcHQs4HImdxpapQ==
X-Received: by 2002:a05:6638:12d6:: with SMTP id v22mr20175309jas.6.1637783060762;
        Wed, 24 Nov 2021 11:44:20 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id r14sm490145iov.14.2021.11.24.11.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 11:44:20 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     pkurapat@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: ipa: GSI channel flow control
Date:   Wed, 24 Nov 2021 13:44:14 -0600
Message-Id: <20211124194416.707007-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Starting with IPA v4.2, endpoint DELAY mode (which prevents data
transfer on TX endpoints) does not work properly.  To address this,
changes were made to allow underlying GSI channels to be put into
a "flow controlled" state, which achieves a similar objective.
The first patch in this series implements the flow controlled
channel state and the commands used to control it.  It arranges
to use the new mechanism--instead of DELAY mode--for IPA v4.2+.

In IPA v4.11, the notion of GSI channel flow control was enhanced,
and implemented in a slightly different way.  For the most part this
doesn't affect the way the IPA driver uses flow control, but the
second patch adds support for the newer mechanism.

					-Alex

Alex Elder (2):
  net: ipa: introduce channel flow control
  net: ipa: support enhanced channel flow control

 drivers/net/ipa/gsi.c          | 70 ++++++++++++++++++++++++++--------
 drivers/net/ipa/gsi.h          | 10 +++++
 drivers/net/ipa/gsi_reg.h      |  4 ++
 drivers/net/ipa/ipa_endpoint.c | 50 ++++++++++++++----------
 4 files changed, 99 insertions(+), 35 deletions(-)

-- 
2.32.0

