Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C382197A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 07:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgGIFBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 01:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgGIFBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 01:01:41 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD7CC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 22:01:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t6so454966pgq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uN2T4CF/tRygg+rOfQBDGtucvrJg7l2si9rKgMZR/j0=;
        b=BXPSxo5VbjQ5clTT5R39r8mnuahuMmSnFAX8dVZrldk0UdIVgqWclLWUaFgB9EEvGs
         5iz3KpwAkAgn90jBHAhrbXixnEOIEYtjcRThFOHPaMP1iW7G5A9VtiBNmc4MAkl+PePn
         X8Qxrz9Owin3O+N62O6MOn8S4A+iGJ6Wxb9sX2WIiLAY51C87Q29o3eXidoSP6ooqh+D
         qS6uu3fHwmtVABvqz/lvBdCP/QxOAANNR/YrgTRHreSoizLsqM/gfFPjeLgGJoCsorW3
         bcPBMKwdryQ+Fp3uaE4IZn7ZWggNMNBSXgKfxkkYCqUvqDoX7YBNX084BbbLThuTS7Ou
         LIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uN2T4CF/tRygg+rOfQBDGtucvrJg7l2si9rKgMZR/j0=;
        b=g9OA7CE8EDw/rB4V+VYb9pzVYswpVbCHdggWZZUjfGcpPuOWYPhRBjqjiASgDWill0
         g3hZkP742lqidp0RLhoyf5e+hwzqslAo0lkps87JTGbF7zDHdNmhPz+H3qke+hRg6uDp
         yD0scjLeJQ2xVOx1AdBFQf0+5ZGyXp99TGrCG8rNpeduHV6tKEOkyyZ9fteyAv/0Pk6H
         9nAHYX5u1/6+3ruHMrr27EC7oEHGUVF/YNyY5cROKbF7NFm33AI0w+5A7Bq9RhOr2+eC
         PrTvJY7E4GDj7kjVVCkyy2tSSyq9TBdiQMyNZtLV6HNWYYzig5ddR6db5SW0WXniIPw1
         5BkA==
X-Gm-Message-State: AOAM531TNQz2yU7jRXSxLzfAKEhYV+PpEJ8gKdGHLwAPDqaMx+XyhW0I
        Lma+d4sdjo4qbE2oOXeEc45VOw==
X-Google-Smtp-Source: ABdhPJyYxb2sGMCNEAHm5ala37cPOSV+iadH/fkL3XmUf96HbWpfFw5r1l8q9UAC1q8UkeO/UH2wlA==
X-Received: by 2002:a62:346:: with SMTP id 67mr14522608pfd.111.1594270900163;
        Wed, 08 Jul 2020 22:01:40 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h15sm999974pjc.14.2020.07.08.22.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:01:39 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] iommu/arm-smmu: Support maintaining bootloader mappings
Date:   Wed,  8 Jul 2020 22:01:40 -0700
Message-Id: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Based on previous attempts and discussions this is the latest attempt at
inheriting stream mappings set up by the bootloader, for e.g. boot splash or
efifb.

The first patch is an implementation of Robin's suggestion that we should just
mark the relevant stream mappings as BYPASS. Relying on something else to set
up the stream mappings wanted - e.g. by reading it back in platform specific
implementation code.

The series then tackles the problem seen in most versions of Qualcomm firmware,
that the hypervisor intercepts BYPASS writes and turn them into FAULTs. It does
this by allocating context banks for identity domains as well, with translation
disabled.

Lastly it amends the stream mapping initialization code to allocate a specific
identity domain that is used for any mappings inherited from the bootloader, if
above Qualcomm quirk is required.


The series has been tested and shown to allow booting SDM845, SDM850, SM8150,
SM8250 with boot splash screen setup by the bootloader. Specifically it also
allows the Lenovo Yoga C630 to boot with SMMU and efifb enabled.

Bjorn Andersson (5):
  iommu/arm-smmu: Make all valid stream mappings BYPASS
  iommu/arm-smmu: Emulate bypass by using context banks
  iommu/arm-smmu: Move SMR and S2CR definitions to header file
  iommu/arm-smmu-qcom: Consstently initialize stream mappings
  iommu/arm-smmu: Setup identity domain for boot mappings

 drivers/iommu/arm-smmu-qcom.c |  48 +++++++++++++
 drivers/iommu/arm-smmu.c      | 124 +++++++++++++++++++++++++++++-----
 drivers/iommu/arm-smmu.h      |  21 ++++++
 3 files changed, 175 insertions(+), 18 deletions(-)

-- 
2.26.2

