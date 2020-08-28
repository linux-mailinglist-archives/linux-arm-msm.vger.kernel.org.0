Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B443725543B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 08:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgH1GIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 02:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgH1GIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 02:08:17 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E03C06121B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mw10so53198pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wkk0kqQojZrEOjifkrPuQd7LDxgIRSjnsXOzLYLA0o8=;
        b=dQYbjhElGdyqNV6ZV4eRZLnjn+zjUbF+jtnas/LabHDnJ+Bjn0HtzNQmB320LDS+96
         fhlB4zaGpJR3quVew2N2RhJDZht63NvQK61dKvUxIdfZNQr5KwhfqvJE+FSUJjkHylGV
         PC5K5iEgtt/x33wvKqqocbVo9geCyxNA+eFluF5Sjx/AwofF1lbAbX0nadTZmF1OliRg
         Z3+2f7jPjXKbtXdaj8DMQOeqbpZsxGr89tRXm8wbD7Z7MCIMpyZv6OdZAIBZulWbkBZa
         4jvONY/qfEHHjj4vLYdK5/UAxUyH3Wn35F3H3242AshY2o6tOPC7VyXzMc9RqWL3ZJ+4
         Be1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wkk0kqQojZrEOjifkrPuQd7LDxgIRSjnsXOzLYLA0o8=;
        b=dYT0jE/ml/Snb6LgKX+5YZ8glwU6AHNB5HlhePJ1cFCSA6/iLuXVBpelBSJIHisWWl
         hMkFNqpnZuZe7e4VTXZUlP2ayoYRNGh+PAq6e52dqe1UCvsUz5Xlyv6FknuRK9NTxXl4
         7aSwKYUMaejO5lVyS4YHiZoH+oyfmsy1NbB66fDmmdv3QV4yl6sEXDb9Yhp1jya9+iVX
         zw38wVxi0Qc9uU5UZWbONuJHz+oDtXq6+DO1fJT7lFQ1h7kt2HBlnXMl7hmEYZeC1lSj
         xH1iLPlcOHAHQQMzl1GyYsnLUqCeZLexrHDXm4ap4nmie5xDgnUKs0wS9POoKhqEd410
         1B1A==
X-Gm-Message-State: AOAM532O7KRkRjX0ZrvxMqDuQimlRzKnElcIpqZ4YphxqLPZioydneZR
        h0RMRiW+jDJe43u1sNiMZJbcGw==
X-Google-Smtp-Source: ABdhPJwbf3i6rXPmZ0ExE+Q7jiAQQHIVdD9AnhEKARQdQY7dJTgP0tK4U6F2U2zkZN0+YzfEAQJ7Bw==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id d2mr303366pjw.112.1598594894529;
        Thu, 27 Aug 2020 23:08:14 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id n17sm304177pgg.6.2020.08.27.23.08.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 23:08:13 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rnayak@codeaurora.org, Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Clark <robdclark@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>, Shawn Guo <shawnguo@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        lima@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH V2 0/8] opp: Unconditionally call dev_pm_opp_of_remove_table()
Date:   Fri, 28 Aug 2020 11:37:45 +0530
Message-Id: <cover.1598594714.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This cleans up some of the user code around calls to
dev_pm_opp_of_remove_table().

All the patches can be picked by respective maintainers directly except
for the last patch, which needs the previous two to get merged first.

These are based for 5.9-rc1.

Rajendra, Since most of these changes are related to qcom stuff, it
would be great if you can give them a try. I wasn't able to test them
due to lack of hardware.

Ulf, I had to revise the sdhci patch, sorry about that. Please pick this
one.

Diff between V1 and V2 is mentioned in each of the patches separately.

Viresh Kumar (8):
  cpufreq: imx6q: Unconditionally call dev_pm_opp_of_remove_table()
  drm/lima: Unconditionally call dev_pm_opp_of_remove_table()
  drm/msm: Unconditionally call dev_pm_opp_of_remove_table()
  mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
  spi: spi-geni-qcom: Unconditionally call dev_pm_opp_of_remove_table()
  spi: spi-qcom-qspi: Unconditionally call dev_pm_opp_of_remove_table()
  tty: serial: qcom_geni_serial: Unconditionally call
    dev_pm_opp_of_remove_table()
  qcom-geni-se: remove has_opp_table

 drivers/cpufreq/imx6q-cpufreq.c         | 10 ++--------
 drivers/gpu/drm/lima/lima_devfreq.c     |  6 +-----
 drivers/gpu/drm/lima/lima_devfreq.h     |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 -
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  8 ++------
 drivers/mmc/host/sdhci-msm.c            | 14 +++++---------
 drivers/spi/spi-geni-qcom.c             | 13 +++++--------
 drivers/spi/spi-qcom-qspi.c             | 15 ++++++---------
 drivers/tty/serial/qcom_geni_serial.c   | 13 +++++--------
 include/linux/qcom-geni-se.h            |  2 --
 11 files changed, 31 insertions(+), 66 deletions(-)


base-commit: 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5
-- 
2.25.0.rc1.19.g042ed3e048af

