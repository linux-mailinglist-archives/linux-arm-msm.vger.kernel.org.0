Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3A33FF0A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 18:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhIBQBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 12:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhIBQBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 12:01:19 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F838C061575;
        Thu,  2 Sep 2021 09:00:20 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mj9-20020a17090b368900b001965618d019so1775015pjb.4;
        Thu, 02 Sep 2021 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i2sUtpSLgV2NfNkerlODfWXBzMlFhnFRaVTxnhqZHTs=;
        b=PvHrgsg6Xh0Nlquhj+NfeC2AlgVgRF+fqPBSedN6fowI+pEeR++wAwZfzlrPYWeJCV
         ecLEsjwig1wo37v7rAesQnGTCkmsmGnsG3upK+6AKNDGwnLCC4XSFpicXVspVuGi4R03
         DRxUknCYvORT5ndHwhGenIylHA8WL+o5sm8/pUBfRmmHWldY0NxbQKrhFWMq0nloRadm
         9snhOvUBwHzIa57gh6xdJkq5iafNmD06GiPyBuxDnFK7J7qvKECsx49BRDkWJm9J5j/m
         UjWhM7WJ+6S7RlE3gxYWnOmSrt8NaJYdiAzH1QVyDypdczIKqGh/AyxuivW6vCNm4R/r
         NpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i2sUtpSLgV2NfNkerlODfWXBzMlFhnFRaVTxnhqZHTs=;
        b=SWSbVn62OpdNPnLFL3bwpZxShyrydlhHDi29QL5UiHP5Cs2q9Dkwu5DKUAe195sV3W
         pFtkQsbv2uJEaHh3cUS0irK8SuH7hS2vi/bPs4wnF1Gjq3DbMZfPLF/QX7nPslU8vLXv
         +6KzLthi5GUVOYJsT54nY/krKzFW6hch7f8merkrwvqkcCuBa3oWqEjewxkvutJNNBm5
         LdQPZtjHjXaiDvtqaarVtA1h5sZ3DRG7CMyy2rqfZKz8hcQPdAvH7oyXcsysyRnqDEJ2
         9GgHaHbZpM8u6EXWmfJ4KCX+cO0KGR3LwXtjNHMbnkTIehYY3bGznWJJJ4sOOnRQ2arX
         nLPQ==
X-Gm-Message-State: AOAM532q2mlbRpqfCrtf1bDsOXRWy/RqM9zlCfPXOfLMkvR1do9b34QU
        JA0JtaWigkASQMCQ01CObcj7M+5WIKw1obQk
X-Google-Smtp-Source: ABdhPJybKGJKm4mopOmE/lwiDN5iiviwDKWEduGO1PdaspmiazPfOhc6yufIxi4H/ewKaBoYbTPOTA==
X-Received: by 2002:a17:90a:a88b:: with SMTP id h11mr4586157pjq.44.1630598420051;
        Thu, 02 Sep 2021 09:00:20 -0700 (PDT)
Received: from skynet-linux.local ([106.203.214.216])
        by smtp.googlemail.com with ESMTPSA id a15sm3528540pgn.25.2021.09.02.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:00:19 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     sireeshkodali1@gmail.com
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] MSM8953 MDP/DSI PHY enablement
Date:   Thu,  2 Sep 2021 21:29:49 +0530
Message-Id: <20210902155951.6672-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for the MDP and DSI PHY as found on the
MSM8953 platform (APQ8053, SDM450, SDA450, SDM625, SDM626). All the SoCs
on this platform use the adreno 506 GPU.

Vladimir Lypak (2):
  drm/msm/dsi: Add phy configuration for MSM8953
  drm/msm/mdp5: Add configuration for MDP v1.16

 .../bindings/display/msm/dsi-phy-14nm.yaml    |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 89 +++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++
 5 files changed, 114 insertions(+)

-- 
2.33.0

