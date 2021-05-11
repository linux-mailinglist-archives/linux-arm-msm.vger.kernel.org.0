Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6015379E4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhEKEV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhEKEV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:21:58 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE25C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:20:52 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id d21so17849178oic.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3sAnreHKyEqLrxBWePiwhRu930iTUs8+45ufhMRReXo=;
        b=zH6hgGNYjGqj2IMIUj5mNl+3TVZadxNEV50zVtX+0J6nuVggTisVFFsYuN3EHs4u0z
         21UOgf2M3zYl7eB7JIStzDf4Q8V3hoMWES4S3L9PLuG5S3cAiueFXZJFnwDe/ozFoQ2F
         ocqEPPY9E4EiMsLr3PESgaSifyp4zDW6DbkcqDwr1On0rlb/Rw/G4tpEj8DPilF8EUVc
         TVIxN42CAf5ndDM677Hb92pXr+3bHwG9xi6MRrRG/xwgjvxWdkGlrfZL8mklS7tRiZZV
         LctmGTxJ8w34HuduKQPjX/POXOUVnkWrAqdYNAlPtsMbBGzMnni7B+f969XFI79k7a+5
         5rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3sAnreHKyEqLrxBWePiwhRu930iTUs8+45ufhMRReXo=;
        b=pKdJWboqsZTzkU7UW2suhISjlwHITdNNBo4XeYMdDw2T6b9PEmkzYd61PMR9uIGOoT
         09Pr6FjMbZrjseRaoKACHDHmHKLi2Ab39XJdVOo/klrgW6eHcLOtplUzIJ1BsmhtsuXv
         ChhbpaeQJ1wgQpObyPtSG29P0qNZ3PgekwqE7tTOKgwwkyEFIdi7Y0heccDOPeGdzDOD
         1Rc861s6B0w62aRlm7p5oRuLJwsDEPXl5tvD8Nr5T8R43JL5nd1PXoSVVsY2aYv9R3ho
         52d9zz4h3TFQcaCNKOuUc7Pv4lO6wt/ICYI+iznJ2Wb1vnGUELeAgsCjOLpTN/tA9xnc
         oS5Q==
X-Gm-Message-State: AOAM531XNIxwTCgmSdBvL9PFkc51+BGcR5/hDJZI04a4sV9fo9TK/Afb
        qnj2NaqghZVbrJTT1UyfeDegYA==
X-Google-Smtp-Source: ABdhPJwojnmqufg0lJ4akmfDWkkObUb4HRQ0v8GMtG0dAG2Vf9ooU4W4IGX+N8IzuFQ1r8r8SyJnsQ==
X-Received: by 2002:aca:d8d5:: with SMTP id p204mr1967717oig.151.1620706852170;
        Mon, 10 May 2021 21:20:52 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:20:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP controller
Date:   Mon, 10 May 2021 23:20:39 -0500
Message-Id: <20210511042043.592802-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first patch in the series is somewhat unrelated to the support, but
simplifies reasoning and debugging of timing related issues.

The second patch introduces support for dealing with different register block
layouts, which is used in the forth patch to describe the hardware blocks found
in the SC8180x eDP block.

The third patch configures the INTF_CONFIG register, which carries the
configuration for widebus handling. As with the DPU the bootloader enables
widebus and we need to disable it, or implement support for adjusting the
timing.

Bjorn Andersson (4):
  drm/msm/dp: Simplify the mvid/nvid calculation
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Initialize the INTF_CONFIG register
  drm/msm/dp: Add support for SC8180x eDP

 drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
 drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
 4 files changed, 53 insertions(+), 77 deletions(-)

-- 
2.29.2

