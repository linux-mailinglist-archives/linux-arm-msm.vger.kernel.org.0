Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA24D3BA68E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jul 2021 02:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhGCA6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 20:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhGCA6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 20:58:09 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E10C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jul 2021 17:55:35 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id m6-20020a9d1d060000b029044e2d8e855eso11850651otm.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jul 2021 17:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BSN4NpwzPNIt1mNyzpr5se40nrpqAjTRaLMTa3+Vg88=;
        b=OiVrSUm5i75uvuLaPF6sYbT7kQWhSfUMs42rL2EgmxM9hjKC4H+PnfgSKrrqOu/JGA
         DxT72MI9z/39hID3gqoWbjAnCdkAjrJWUUYsL2mDg2gPTCmMQN21Ef6VHGy+WqNNCmkn
         mvuW6aX05hICSvoW6ezcetENdh9jhAiqmeTVuAqrPAr+uz7FfRiI9eOHkLtcHdn9Oqq2
         Su6egtnqPXsQrfou+Q3BbZfQN7vbCXfbKq+RZ/WqCuCNQ9VormpNMyqDmucCt0eSwDZZ
         3n2pLYAMzCsOQYnnszjPXLv5UmSN0MulT0KepOJ7ODXt7T6VfcnG5J0E2zkjygdIPsdZ
         QoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BSN4NpwzPNIt1mNyzpr5se40nrpqAjTRaLMTa3+Vg88=;
        b=jYJ3I4qY6ELCKa8X0clvMJTunO59xpnY7ImHCeT1K2pOinC5sG1qkrqXsF7jMy8l3y
         nO1C7tfeCXUgk1WnbeoLgYgeMNNwu/yq+0oFOJwwmd2VKojLJ11aBaeuCQWiE2hRZbZv
         tKv7zw69/0a1RnE7KE03mEqQR573QE/9g32+9odEhO0aIa8d0t0t9fPA1QR7cStYg/bf
         H6wWNh0xEz+boIaHXRV8VsClaWtltTV45ejJhfORgw4JH1fwAJz75eYUsIGE0nrhiLmL
         zszITZT2kEbDoqtHdmHePhUvjf2fBJ8X1cI6p1hfu2HjIREu1rLCKPUm+4FHslpFiBQx
         i8Gg==
X-Gm-Message-State: AOAM5302K28RFQphexLykSEKsaK7FTWRTL09ytdybJ2xpFb0XIwKT5l+
        DUT2TxmaXV4F8BQvbupj7C4Weg==
X-Google-Smtp-Source: ABdhPJy74/c2Z7bPoAs4kHp2FPGKIEP0t9a4o6BVfdY+NSl5FDfE9WWHkmOEUbOTUdnc9W+1+K+aHg==
X-Received: by 2002:a9d:a36:: with SMTP id 51mr1550507otg.111.1625273734909;
        Fri, 02 Jul 2021 17:55:34 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o6sm1057170oib.3.2021.07.02.17.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 17:55:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soc: qcom: rpmhpd: Improve rpmhpd enable handling
Date:   Fri,  2 Jul 2021 17:54:14 -0700
Message-Id: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During the discussion and investigation of [1] it became apparent that
enabling a rpmhpd, without requesting a performance state is a nop. This
results in a situation where drivers that normally would just describe
their dependency on the power-domain and have the core implicitly enable
that power domain also needs to make an explicit vote for a performance
state - e.g. by a lone required-opp.

[1] https://lore.kernel.org/linux-arm-msm/20210630133149.3204290-4-dmitry.baryshkov@linaro.org/

Bjorn Andersson (2):
  soc: qcom: rpmhpd: Use corner in power_off
  soc: qcom: rpmhpd: Make power_on actually enable the domain

 drivers/soc/qcom/rpmhpd.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

-- 
2.29.2

