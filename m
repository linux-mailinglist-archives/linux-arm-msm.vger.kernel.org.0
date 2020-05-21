Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3441DC48A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 03:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgEUBVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 21:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgEUBVV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 21:21:21 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF07C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 18:21:21 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id f4so2311495pgi.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 18:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rg9l5ozOZpLTZwGJd6lPleCwU4Ff0Q749YYJ3OhvIuw=;
        b=VIK4ZnT7t+sq+aV1O/eTvjikSgDISFIaNBCXJziHC+LUQoNCV4t5SIS+jNrXt5Fgvt
         UudQbH2K4iK3Svax6ypVeHa6TLwfFqZiHgUVNFIpmHbb6WqgjWkHLI0CUcDYh3upaDSZ
         l74yHDPBasgCiKeZK3lnhe54IrWh+BqWOGlZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rg9l5ozOZpLTZwGJd6lPleCwU4Ff0Q749YYJ3OhvIuw=;
        b=g2Fm6YMRbfea3JOGJGskH8FeFOcuYQ+VNTjE8dzcll4FV1M6sMnl2Rw1aR1lkntx2o
         taHbpuBcJ6GwX0MUeyGZ2cgFQsQX/2GUCag2jVGnnTu9CwlSdskgrjL6m/KSKkIgm9CP
         VAXoZ/oZAtAjh3Z1qmqNJzBpc6i+svDS1q+hCD2VaSuHZHACVyUzp91OGH/i17UM0pq7
         3uzubtQiASQhBQV7j+8I3uJjptPXA0zja05Us++4kIqTv8CGOFijr5iWpjYBUhiMpQo6
         fdCAfy0ulM4yM1p5OZhCOuC7coGWMKQys96VVb2ss3jR2kJrlv61e6q+cwqZRkQqe5Q7
         07Ow==
X-Gm-Message-State: AOAM531d3ayXx3M9ToPpbwChU/1kRa0HCqUJmXyd3nwD+XOCTso2zVz1
        Fys5lZu63IvPW0HYDxQHBFqBAw==
X-Google-Smtp-Source: ABdhPJxw6z0ZnPz6Owai2RQzOlIuxErIPT4YFmd2gs4euqe51xYtt2JqEKYALVjvUJlG6brVWjUhVg==
X-Received: by 2002:a62:6d03:: with SMTP id i3mr6711085pfc.249.1590024081026;
        Wed, 20 May 2020 18:21:21 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a6sm3081020pfa.111.2020.05.20.18.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 18:21:20 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 0/3] Even moar rpmh cleanups
Date:   Wed, 20 May 2020 18:21:16 -0700
Message-Id: <20200521012119.238270-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We remove the tcs_is_free() API and then do super micro optimizations on
the irq handler. I haven't tested anything here so most likely there's a
bug (again again)!

Changes from v2:
 * Went back in time and used the v1 patch for the first patch with
   the fixes to make it not so complicated

Changes from v1:
 * First patch became even moar complicated because it combines
   find_free_tcs() with the check for a request in flight
 * Fixed subject in patch 2
 * Put back unsigned long for bitmap operation to silence compiler
   warning
 * Picked up review tags

Stephen Boyd (3):
  soc: qcom: rpmh-rsc: Remove tcs_is_free() API
  soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
  soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition

 drivers/soc/qcom/rpmh-rsc.c | 65 +++++++++++++------------------------
 1 file changed, 22 insertions(+), 43 deletions(-)

Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>

base-commit: 1f7a3eb785e4a4e196729cd3d5ec97bd5f9f2940
-- 
Sent by a computer, using git, on the internet

