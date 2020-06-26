Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16AD20B490
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 17:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgFZPcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 11:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFZPcO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 11:32:14 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887CBC03E979
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 08:32:14 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h28so7278887edz.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=sisD+mlHl7C8CYQosxE2yZqCg+4na6/akZrccMrgES8=;
        b=M9rOG1iqUTGJfLzsMRU+uKmHxbYt6WXxk/ygFmzH1wC1TriYfTuDdqJ7SVki63sOWu
         lsp6STtO0LgJWFyJC+3GHqWiq90oDclHc1sLZ+PuZanQNSTeFpg8T8k1yo5tyxkrGh1C
         xlJfLdus2IGu9qL19iCWlnh1x7so34u/cT+7mfGAGwCwQASVnS3UQq4B7waxzmvfwMhw
         LU7xJl85nYcLRKWYKzmC/4JM9wWjY+UsLpt4xpI35Pcnk7MySppPH+Mn5Nirw4wMDoX3
         uKrT9DojirIOzcEEBN5tG7sfaubVr0NYtFmZZB9lpWuwY4U9EDPyQ7ZXF8tCN/5UkdSU
         YA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=sisD+mlHl7C8CYQosxE2yZqCg+4na6/akZrccMrgES8=;
        b=eE9omGXoPOLcGN7FQ/eXhiAHShoBg44teNhekSWKGG8IJj1GraZmDldrOlg8CneTQt
         763qeGK77zi5VoXdX223V4kiaa6zyhf6FHdxl0zh36LgwgH4VVshwfshnjNlBWP15z5K
         uo6X0/nMAT2m4VjtU1PwRQgmPMI2MsP3vKEmiJyRzNA5e8lRaqKloe2+RnTEqiBJHIx3
         D2/6L5ryG23n4ydOwhmgFSPrbm9zBT0ztF+5xsDkZR/3OxPvkUBcHtNR1aqleKHOtddo
         7qnRpIRL0aFa+BW+jXCHXV5+KumdDaAAq2ZWVG3yjMxiZCesn8SGST3PoGqJhgcAuRfK
         HD6w==
X-Gm-Message-State: AOAM531gAgUNMv5dLR7E/JZBMJ3+aR30lNtYZ6MW1hNQaVRosg63PBjU
        TbBr0JPvgujwyj1PmWK1ivgGw5PepdTJtt+6Hv8=
X-Google-Smtp-Source: ABdhPJwT1TINnsmEQHyFt81RhldxZNYfXLU69wEptxxMIBuc4S3lt+KRGyfgPnzqlOmQWT3BolOB8DQQOuf4mXXYlc4=
X-Received: by 2002:a50:eb02:: with SMTP id y2mr1398536edp.281.1593185532634;
 Fri, 26 Jun 2020 08:32:12 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 26 Jun 2020 08:32:42 -0700
Message-ID: <CAF6AEGsYHgxo0+Nwr0Wq3A8W6LW69SmbpDN4ckpTqxPtAW3vww@mail.gmail.com>
Subject: 
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

A few fixes, mostly fallout from the address space refactor and dpu
color processing.


The following changes since commit 1cb2c4a2c89b2004a36399860c85a1af9b3fcba7:

  Revert "drm/msm/dpu: add support for clk and bw scaling for display"
(2020-06-01 20:56:18 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-06-25

for you to fetch changes up to 30480e6ed508e3ff7a3e03c975696aa5196ffe8a:

  drm/msm: Fix up the rest of the messed up address sizes (2020-06-22
12:12:29 -0700)

----------------------------------------------------------------
Bernard Zhao (1):
      drm/msm: fix potential memleak in error branch

Chen Tao (1):
      drm/msm/dpu: fix error return code in dpu_encoder_init

Eric Anholt (2):
      drm/msm: Fix address space size after refactor.
      drm/msm: Fix setup of a6xx create_address_space.

John Stultz (1):
      drm/msm: Fix 0xfffflub in "Refactor address space initialization"

Jordan Crouse (1):
      drm/msm: Fix up the rest of the messed up address sizes

Kalyan Thota (1):
      drm/msm/dpu: request for display color blocks based on hw catalog entry

Krishna Manikandan (1):
      drm/msm/dpu: allow initialization of encoder locks during encoder init

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c    |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c    |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c       |  4 +++-
 9 files changed, 21 insertions(+), 15 deletions(-)
