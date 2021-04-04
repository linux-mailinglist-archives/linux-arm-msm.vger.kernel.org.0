Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154503538B9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 17:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhDDP4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 11:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDP4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 11:56:12 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DB3C0613E6
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 08:56:06 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso9273002ott.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fbqTwDylyQbugrnO0aQEo4nKDcOq7w1OVDLL3nd4tOY=;
        b=izMvhpc1jRXqC7dJ9KVU9+snFnElat3KvdJSeLOkEbshx72AkDcQNZcVwpzfbQ6yhe
         KlMNIbun/WamNmPPEnTDnoazzQA5P7IsVp26Kic5NOatBCS7+DTwxLNA99ozkhgNy5Xh
         Ku/LO9Jl6nkpSjlTUq8ouQi5e5HGwHEMzBuqsB8M9u6CsBUec7Ee9pvc4lnvqxE4lBi+
         UJpCpIbl6vESIl5vJDmctkaL0EJxc8g4uVx1frR5/aYsRs+vj1ezfknwm2ocZF01dE/L
         2dXjxOtuAAUBmCZTCkWKunpvjSlTUX2lrcGT8b4/PHwKOWgrxsL+1iWXksbtfj61J6wQ
         U5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fbqTwDylyQbugrnO0aQEo4nKDcOq7w1OVDLL3nd4tOY=;
        b=lU2qhf2sEdFJaDtYle+51JsPceeNH8u2a6v7Hkdjl45YK4Un1flqxyBH+2MdUwGXwN
         buHK7Pcs88fPG7QGSaNuFi1Yod+IdVswEbFedtDIK9+RSj7j/RVpeeljEqaPIBG+j/Fu
         lLXwao/5hi7IeVKTa1b/7ardfMuWFLFHqSLX6TvLmmLvLbUhVrXj+GfMgYwPRqX+Ln+1
         jiLcrjD6nLsN6Jm3uMabdZ1Xg6hU4Vee3PHa0ZEena6mckc0xnrdelIXS65u43fjZzKd
         O6W+pFKOV1bwDseni5g2ajWp/wX34pH7b385HNkULbV4HjyxRPKc1l+itFXWMfG2TWqQ
         Vllg==
X-Gm-Message-State: AOAM533hCbuaHj46QfwKPonobDq25RoT8fciKSsOlLM3ESFy24b9B88Y
        zxDO44KD4ZCcFRTyOsp0PZfiaw==
X-Google-Smtp-Source: ABdhPJyk6ebShuSTV1/Q5cVzDmoFP2NCnMoCHGwvY0MhfpEF3h+7b6/EUlW5vRxX6hA8hM4HAVl+fQ==
X-Received: by 2002:a9d:75c5:: with SMTP id c5mr18618113otl.334.1617551766232;
        Sun, 04 Apr 2021 08:56:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i4sm2609848oik.21.2021.04.04.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 08:56:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm fix for 5.12
Date:   Sun,  4 Apr 2021 10:56:04 -0500
Message-Id: <20210404155604.712236-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.12

for you to fetch changes up to 0c9fdcdba68208270ae85d39600ea97da1718344:

  soc: qcom: geni: shield geni_icc_get() for ACPI boot (2021-03-11 20:22:05 -0600)

----------------------------------------------------------------
Qualcomm fix for 5.12

This bypasses the, recently introduced, interconnect handling in the
GENI (serial engine) driver when running off ACPI, as this causes the
GENI probe to fail and the Lenovo Yoga C630 to boot without keyboard and
touchpad.

----------------------------------------------------------------
Shawn Guo (1):
      soc: qcom: geni: shield geni_icc_get() for ACPI boot

 drivers/soc/qcom/qcom-geni-se.c | 3 +++
 1 file changed, 3 insertions(+)
