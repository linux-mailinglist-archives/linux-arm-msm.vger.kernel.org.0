Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D14219EC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 13:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgGILHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 07:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbgGILHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 07:07:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79D4C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 04:07:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r12so1855744wrj.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dj6DLJ5JhwDTZpg1cYa8Jkc5nI2WU1SZemCOoY6JQX8=;
        b=OqrgBYRSXu4WOjIThWIY9Klk6Hlc6dgDpPB9PYoq4FN8And4dQWC6+puoCGj3yaq75
         j9q0lGCyqBZQAkZwJg6iiss5/kkNG0TMRYOMDn2LRE9RL0Fe4cbltQomN4Q6xNZ8XM1y
         re+ahL/J+J6C2CSXl1lvfk3EanLYT8zGvPefqudhF4HJ6ITNyEid5gMvuSetJy9BPj2p
         3GgCPuRygIdzH8PlHJiavWAC7FfCR4oIxpqWyH1ppd0AiZBBPlD9OJDYggTka8+Dn1Gi
         U9VYl73QdCyTZ7t6ZlYL5H95Kky8L+P+kd+nXkQdlWraeb6wVviZK9S6pqLqQjH6EMp4
         hu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dj6DLJ5JhwDTZpg1cYa8Jkc5nI2WU1SZemCOoY6JQX8=;
        b=fweg3ttzmsUbV4lWdFpsEkMdZO+qe4ST+3LpJDI5pO4S/gUjvjGQcVw/QWoiJbeWwg
         ojRw0RMYDTlCgbdq3iPuldZcY+7VYKExuGXWTlf7OLU7MtIWZsxNr3Bv0RGKCAzboJJ6
         UmeOlimziAZm4FmWatKPYY3dLRkUXa8ex160XGrv9y/DALa0PfILvHjrKwDxcMZtYYQ9
         3/N53CndiIygS/Je2la0hmw0vYEA9LFdEtgvo3xdqdep53KVy4HosxawZj7BWuXo68Ph
         9AdmdfluNCOrlihOEjRBd/VwK0D6KT8k872+HIEVc6qtejLtetstT2RSgj90lvEfS4YL
         CvoQ==
X-Gm-Message-State: AOAM531VbSRZ0ZTNO+eS61r9JUcEQ6k8Wy2tmxjfUL+JiXfOgHQeaNni
        mTf3n4tsnZ2ymUm+e+Xqqug+Lg==
X-Google-Smtp-Source: ABdhPJw0n0b9xmJ1DTGx8Qu+06hCLhlnCq+s0l6b+Go1hvpg1cmoxac2TKGjZrYL69bFn2sVkH5Nbw==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr61842492wrj.273.1594292829308;
        Thu, 09 Jul 2020 04:07:09 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id q7sm5375578wrs.27.2020.07.09.04.07.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:07:08 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     saravanak@google.com, mdtipton@codeaurora.org,
        okukatla@codeaurora.org, bjorn.andersson@linaro.org,
        vincent.guittot@linaro.org, georgi.djakov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add interconnect sync state support
Date:   Thu,  9 Jul 2020 14:07:01 +0300
Message-Id: <20200709110705.30359-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bootloaders often leave some system resources enabled such as clocks,
regulators, interconnects etc. We want to keep these resources enabled
until all their consumers are probed. These resources are often shared,
so we must wait for all the consumers to come up, before deciding
whether to turn them off or change the configuration. This patchset is
trying to solve the above problem just for the on-chip interconnects.

The problem is solved by allowing the interconnect providers to specify
an initial bandwidth value, which is enforced during boot as a floor
value, while the requests from all consumers are being collected.
Then the sync_state() callback is used to signal when all consumers have
been probed, meaning that the floor bandwidth is not needed anymore and
the framework is ready to re-aggregate and process all requests.

Georgi Djakov (4):
  interconnect: Add sync state support
  interconnect: Add get_bw() callback
  interconnect: qcom: smd845: Use icc_sync_state
  interconnect: qcom: osm-l3: Use icc_sync_state

 drivers/interconnect/core.c           | 57 +++++++++++++++++++++++++++
 drivers/interconnect/qcom/osm-l3.c    |  9 +++++
 drivers/interconnect/qcom/sdm845.c    |  9 +++++
 include/linux/interconnect-provider.h |  5 +++
 4 files changed, 80 insertions(+)

