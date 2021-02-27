Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945B2326AC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Feb 2021 01:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhB0A1F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 19:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhB0A1E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 19:27:04 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD02C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 16:26:24 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 17so6142062pli.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 16:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPMHMPCXzSuxLIFTtD345UsCc5XGfr7wNzeChZhcfKY=;
        b=TWAjXFo23zzD0FdqXg37IGKQSx/NBwMUeTqxWkF5wKx1nhJxg1Yc3Yr3djNYtNXHMB
         rv6zxLRP681F6KAjl6dZiqQAqsFhgcxoOyed6YqhE1Yc0S419y2h+0YU90GdDpryLVqW
         Qe8xrKW7HpvwGCM4oA153EPld0kv7keo4NOVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPMHMPCXzSuxLIFTtD345UsCc5XGfr7wNzeChZhcfKY=;
        b=mj+wg4NDY3IMceubtd8xhKirYqkoZXaCptI1gPN4MNu1H9Pb28vWGqrC+oL6dEBDah
         RyTAODvTEqKSd6txac/KfvNQM/jdnWqD8lQJrnw53W8j3ROf7xP117V7Gz+raWx9Zba9
         cEfj6NH4Wglyn5v6PfEs51FKNi/EozCLqjsaUsTJpoI6LzGMSWd8d8fr5fWQNyNLN1kg
         IenTNWOdCvyZOwgx6HUw9zL9U7akZDHtrHP6rYWHrT3gcfFqlK6Us5CFZK1KDoCV9e0C
         c5QC3UOVvjVDyS20LfU1EYkcfRqMYNz+NKasY7PWevnjrT6KC8Hc9wpDCRYVU64O5VrQ
         VU/A==
X-Gm-Message-State: AOAM533p7cccdV0SaHgZdWxQbDDYUpgL0MPPHU74i3LB+nIcsSSTgj3v
        Q+Xr6+pBI69Lr0J71VDs8Xqczg==
X-Google-Smtp-Source: ABdhPJx7A9Qm+a3u9y2rVrEMPrI01HocE65ALEkSTBLCuLvDAyquykOSg94ZkF0WArrG5JilcgWQoA==
X-Received: by 2002:a17:902:e8d2:b029:e3:c3e5:98ae with SMTP id v18-20020a170902e8d2b02900e3c3e598aemr5586251plg.78.1614385584353;
        Fri, 26 Feb 2021 16:26:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:7525:b50:4b48:1a6d])
        by smtp.gmail.com with ESMTPSA id t6sm9793744pgp.57.2021.02.26.16.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 16:26:23 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Niklas Cassel <niklas.cassel@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] nvmem: Bring a tiny bit of sanity to reading 16/32/64 bits from nvmem
Date:   Fri, 26 Feb 2021 16:26:00 -0800
Message-Id: <20210227002603.3260599-1-dianders@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series was inspried by a KASAN warning that I got at bootup caused
by the GPU driver on my system interfacing with the nvmem API incorrectly.

I have posted a fix for the GPU driver but looking at this nvmem entry
made me question how the nvmem API was supposed to work. I've proposed
some improvements and these seem better (to me) than any of:
- Open coding logic like that in "cpr.c" in the GPU driver.
- Ignoring the problem and just forcing everyone in the future to
  always specify a length of "2" for the GPU speed bin cells.
- Ignoring the problem and specifying a length of "4" for the GPU
  speed bin cells.

About applying the patches.
- GPU patch can land on its own.  No need for the nvmem patches.
- nvmem patches can land on their own too.
- If the second nvmem patch lands without the first, however, it will
  break the GPU patch.


Douglas Anderson (3):
  drm/msm: Fix speed-bin support not to access outside valid memory
  nvmem: core: Allow nvmem_cell_read_u16/32/64 to read smaller cells
  nvmem: core: nvmem_cell_read() should return the true size

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++--------------------
 drivers/nvmem/core.c                  | 30 ++++++++++++++++++++++----
 2 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.30.1.766.gb4fecdf3b7-goog

