Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBC43A719E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 23:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhFNV65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 17:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhFNV6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 17:58:17 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D14DC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 14:55:54 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id j17-20020a0568200231b029024900620310so3016737oob.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 14:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf+ubk5dO3qWw7TN9/qRwxXr2oNPOTNaRKSsNGShNAA=;
        b=GDqbFuweeTGZ2a1SSvdb2YxqmPw22uySKFenjY118WSwDgtend8M/LDZYCO+EW8lNk
         9WQWvr33aABEtxB+jhvAR1guKvaWaSn87URRr1Kb3HFJaYMgSzHlX/6BMD6FdfzEuRt1
         G2uCVV/zmkISVT+PNPdagwrfKLV9ewWQNZah4d9a7P5LMbIm3ig8FwGUeDBKBykO//5y
         M0wZkhw80DM124JUnmIHTpOXIEMF4GIuoqx7xYFDnlXS+hhF2pRGCK13Vj9VcQ2q9C8X
         J2zCl4XEvB0iEDONZOE4gfur+jcGqfFNHyQy6L8ZbWKRWOLAA796+RxPAGWRBFruKuiD
         lJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kf+ubk5dO3qWw7TN9/qRwxXr2oNPOTNaRKSsNGShNAA=;
        b=TWsvxu3ZxI4OhLNpv4PXWPhaEtHrgV0hW8+holyMkiITvmQLLpWcDFO54PxShhYonp
         VuK1OOttHblsPvc4JqZ5QyzSfYDdXDkje5MaYJra/e6LKnEwvinZcq5vrr76OwZ1dNlB
         9gSRkTulNSM7BnvoX+d/3WGFzJLPIbxtdYJqM04UsTZ7PF66ER5vXPMoDEqEgcpD/3/T
         RQ6DWhWqSAhwBnKaKAM5S9yGv9xEvVVJP4117oPM3ZoFF9sIz+HUxYsPpBKBIfAUGwpq
         isOAcKozy9ByJy3FiNj7ga6MQr/j/MTMMwbWbUerLcXN10WEGFwWbJHdvctqvCT6myhZ
         yT/A==
X-Gm-Message-State: AOAM532V90ueB1OQi7CR47qz2o4K1f2FTAeiXqoMoGmZ7oMdVkjYmM6d
        +KlU4iLXyq4SAMqBK2CEXsOeiQ==
X-Google-Smtp-Source: ABdhPJze60kY0BnVIC/EqWz/84ZLD/HN9a08aQnVqGtT9Kobfrdym6lfnyDs9jYH3P0ec10qMMDv4w==
X-Received: by 2002:a4a:a744:: with SMTP id h4mr14827938oom.26.1623707753931;
        Mon, 14 Jun 2021 14:55:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 3sm3362790oob.1.2021.06.14.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:55:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm DTS fixes for v5.13
Date:   Mon, 14 Jun 2021 16:55:52 -0500
Message-Id: <20210614215552.391887-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.13

for you to fetch changes up to 0fa1baeedf06765ec6b441692ba2a2e83b7d17dc:

  ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements (2021-05-29 11:24:27 -0500)

----------------------------------------------------------------
Qualcomm DTS fixes for v5.13

Failure to properly define "secure-regions" as 64-bit ranges prevents
the two SDX55 boards from booting, so correct this.

----------------------------------------------------------------
Manivannan Sadhasivam (2):
      ARM: dts: qcom: sdx55-t55: Represent secure-regions as 64-bit elements
      ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements

 arch/arm/boot/dts/qcom-sdx55-t55.dts             | 2 +-
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
