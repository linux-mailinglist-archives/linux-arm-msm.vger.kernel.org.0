Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B747560E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 19:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403884AbfGYRsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 13:48:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43777 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403866AbfGYRsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 13:48:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id f25so23387769pgv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uPyttyuukrOTyss4ATYWgEvUft5R0VGROoogq8e3TtU=;
        b=uqJZ9lPiDh6lDJrwTHr7pHrkZYYsxkLlZrhZHZlGYYNuBIeM69qOefpd858bUSgUTS
         EZvvkiGFLtRo1xyovAUomFKaMXUM5X1Z6D6CQWYvEFFpVjdBPLK28jbBMgXG357oVrIL
         lh6nYvSs9bi8UlYPOURqLRRSXQ9+GcbAtIJmki61DrhoWtOttOkUPRC2DNGPSF+l/kw3
         vrYwxuOfRBxagbSyfDxzK8L5uMp/CBMxgwJxP06wil9LJH1ay0wbZP5PlYs/BpL3fsBW
         BLO32TDOn6+aFMRLSjoqOD66ponaqQ91dLs0hQ7ORps2bW4PInGOREH4t7IpVOC292NS
         41mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uPyttyuukrOTyss4ATYWgEvUft5R0VGROoogq8e3TtU=;
        b=Z0Lx8lQrv66F09MLrwNVBMV9AYuBDM96CnDb1UqRVgxO6gIOZSP+FMZu3uyE6ZFro0
         /+wrUjJamLd+9EfsP+EdWK1b0z9nGkqABKb+SmS8ndIEwwWoYfB+7QAfIN1kicD4oaeN
         f/8hgvF8Zi3GTYKxjdwNZy9B5MHzSn2pmxLc0S5doT71f2QYLQMxvMw9BA8qhX+Gwkn4
         /Td+oG6v72VAkY4URRB45LDdKJ4Ton02GWNvamCyIxp1g/I2/AxmwdFryyvfyIp39N/Y
         kFZxWQiBaaSGscfI98qgag2Rfbcr6AKobXDPVCy0EEdjUBKazWCcLFpHKNHG2daAW/8R
         A6Fg==
X-Gm-Message-State: APjAAAUPCwqm2s/yf5IIYtUlQBeWshENR8LiBmuI3lwqlQB2v6sSIJ/V
        WVSt6leqj1zCGtL9UdopuQgBvw==
X-Google-Smtp-Source: APXvYqxWJJdh2WpxR05u7uTV6jiYAW/aFCKSvCbDb97bOitI1MMffmACT2/OqB9WOLNoqFmGmLAUkw==
X-Received: by 2002:a17:90a:ca0f:: with SMTP id x15mr48139512pjt.82.1564076879249;
        Thu, 25 Jul 2019 10:47:59 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r2sm68103389pfl.67.2019.07.25.10.47.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 10:47:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>,
        Govind Singh <govinds@codeaurora.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] ath10k: Clean up regulator and clock handling
Date:   Thu, 25 Jul 2019 10:47:52 -0700
Message-Id: <20190725174755.23432-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first patch in this series removes the regulator_set_voltage() of a fixed
voltate, as fixed regulator constraints should be specified on a board level
and on certain boards - such as the Lenovo Yoga C630 - the voltage specified
for the 3.3V regulator is outside the given range.

The following two patches cleans up regulator and clock usage by using the bulk
API provided by the two frameworks.

Bjorn Andersson (3):
  ath10k: snoc: skip regulator operations
  ath10k: Use standard regulator bulk API in snoc
  ath10k: Use standard bulk clock API in snoc

 drivers/net/wireless/ath/ath10k/snoc.c | 324 ++++---------------------
 drivers/net/wireless/ath/ath10k/snoc.h |  26 +-
 2 files changed, 48 insertions(+), 302 deletions(-)

-- 
2.18.0

