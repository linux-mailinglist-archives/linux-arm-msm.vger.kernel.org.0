Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AC04003DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 19:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349985AbhICRKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 13:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235689AbhICRKD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 13:10:03 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2974FC061575;
        Fri,  3 Sep 2021 10:09:03 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id i24so1895508pfo.12;
        Fri, 03 Sep 2021 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32EQLdfDTCRCdMRemhZOmZoqSg85NLCnv9qxhDUzup4=;
        b=FqSavnJkeVM8xIg3hQ3VVqpS0xthnfgZNfDX1AaGl4kDvEWoAWI6FMOVP2ZfcE/4YB
         yFJb5mV4nUddkUN7SopNeCSjlC0p0SP/5ziSfVN/lNXcNDDrxsmTqR6T+/YcTJX6iZQC
         JfHRJ0FW3e2GnSVXSTKIaEnh8KKsI29iKqEuaPrGY/WULmyy7Ld652r4njvRLASYbpus
         18hjU2DfMeiRikDvKf37MVRgGI5QMZakziM1PHWWqZ84ueQNbd/fVx8wM0dV6+BXm3l+
         G2uq+SAAMPJHqxwU3+Ikg8KFOBjxzyTrkgHwaEDMyeibWl/JCq8ut2ElRovtO/3bF9Mz
         P9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32EQLdfDTCRCdMRemhZOmZoqSg85NLCnv9qxhDUzup4=;
        b=ZVkLWV6kJHyLme1vs08Hr/QOAk0S12ALiAIYSGwL/XxrtO2Jj4obWnfkP3vJyf3xx2
         MSwjpW+3H73ncU9wvSpgCdl/iZS1LSVNp6QBW6IW5teQ8dw2NiS9Dm39KOrfBON2BD4j
         piaSrxL/9YUqU4vIWD0qUmCwn2x0TjnXDUmvy79Dj2QF7NwGj7nc5gb1iy9iYp5GvUMd
         08nzkeAbeMCRgY6Mx316plfW82tJZRIdKlPoDXCxL18nPmOkmim/iIDZccZ8r8axqBLo
         dwDucc47u1LHNPBXQT6xadyzsXCLYG3WZYj5W2/fiwMLyKspwkiJH4z5Wz3DnHlk9sft
         l4Yg==
X-Gm-Message-State: AOAM532Doj4hOf8+U68DJqwxNpMmRBSOmLgM5+V5zfXoIZu5J+EfgV25
        WIkan+eQl4+xowZVa5colPOAvC6iE+KvTg==
X-Google-Smtp-Source: ABdhPJxGolyM7co+r0l5xbZhBkdb1JccCKzpw4VmeIZgvlpyTIIH08eZkbmaP+kzlokxfvXmvjxMQw==
X-Received: by 2002:a65:5a49:: with SMTP id z9mr47166pgs.121.1630688942457;
        Fri, 03 Sep 2021 10:09:02 -0700 (PDT)
Received: from skynet-linux.local ([122.171.5.147])
        by smtp.googlemail.com with ESMTPSA id 130sm5905361pfy.175.2021.09.03.10.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:09:01 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH v2 0/3] MSM8953 MDP/DSI PHY enablement
Date:   Fri,  3 Sep 2021 22:38:41 +0530
Message-Id: <20210903170844.35694-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for the MDP and DSI PHY as found on the
MSM8953 platform (APQ8053, SDM450, SDA450, SDM625, SDM626). All the SoCs
on this platform use the adreno 506 GPU.

Changes since v1:
- Split the dsi phy doc changes into a separate commit
- Add Reviewed-by tag to patch 2

Sireesh Kodali (1):
  dt-bindings: msm: dsi: Add MSM8953 dsi phy

Vladimir Lypak (2):
  drm/msm/dsi: Add phy configuration for MSM8953
  drm/msm/mdp5: Add configuration for MDP v1.16

 .../bindings/display/msm/dsi-phy-14nm.yaml    |  2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 89 +++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++
 5 files changed, 115 insertions(+)

-- 
2.33.0

