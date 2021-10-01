Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99CD541F3F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353901AbhJAR4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235320AbhJAR4D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:56:03 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1E4C061775;
        Fri,  1 Oct 2021 10:54:19 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t4so6830759plo.0;
        Fri, 01 Oct 2021 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQDbBJS+Pg0d4LIaXfAoFYyb0c7LTGnDvYbDlrtg5qQ=;
        b=ip3wXWNQS0Beu5UYJVUfLISQqUHBt9SoJ1Lw108jWrfwlRHK0QpgGfi0XaAV/ENwoL
         RtDjAuYPId2c8bbs7XnMwdXMabgSCga9rIi9aVCKf4akB7n3QIaxpb48572/CV2rbVEG
         1rp40J3QXGa0CwaTgzPnoU04TWa1Vtwp7qPDDWQX+gWACtpM3e3xGw4lDAuVn41mfZ+S
         wR+fB2JUEXCFH+uH1dvnQl13S2GxGBcWE48eI/zKGdn5L/iIb8YZJG4Fu49Yg3ZJTWjs
         2maFNF+acIO6A2b/oSJ/1htS0wYnbHNn6pJOibAD6YE6RRoGmAhpC0wNQpeivOc1mMuz
         YGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQDbBJS+Pg0d4LIaXfAoFYyb0c7LTGnDvYbDlrtg5qQ=;
        b=T7Ucb1OtFMmFdz8ClEA97xW2tnyPSIlI1RkuNd+i1yslZRJaTjKrE8aplKSAAsrJKk
         NuNAWrAw/iWb5CGqC77IUb5asuaFGzz7yQsgyGaqtUUO1fCeOhpFtXaYtqHvU/gDA8qe
         lblKRORbMoYGojCUO3rDkoyXtkidxpvYJAxIuk6BnC1W83w5AjeUvFeDNRHnNNRl7qLs
         rEHLKtyf+FoDT904ceqgdSSyZI+R8tLvl//EeVXSoHXLlZAED83204ImAg8rHJFOhOIE
         SH2NkGAxvFLperdCZltfeV6yBR31PhsSkEQvToYDXnU/MLfnxwd4rBFRhWIpODITYRGc
         8ZQg==
X-Gm-Message-State: AOAM531waEwFOjp84mpJ7O9L9QXmc05HR0/zX0DhsFQqURUAck+m9iIY
        +o834Xgh515IoEQoNwaaRWw=
X-Google-Smtp-Source: ABdhPJzgQWrQm0kP46xsgXTsNbipifbZEqXJ0hDQmhTkph+E6DAYD3ldqDDklx6m+tOiQ7y+GaslBw==
X-Received: by 2002:a17:902:9895:b0:13c:94f8:d74b with SMTP id s21-20020a170902989500b0013c94f8d74bmr11916097plp.20.1633110858434;
        Fri, 01 Oct 2021 10:54:18 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x7sm80480pfr.58.2021.10.01.10.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:54:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] drm/msm: Un-break multi-context gl
Date:   Fri,  1 Oct 2021 10:58:54 -0700
Message-Id: <20211001175857.1324712-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Userspace is expecting that a single thread doing rendering against
multiple contexts does not need additional synchronization between those
contexts beyond ensuring work is flushed to the kernel in the correct
order.  But if we have a sched-entity per-context, and are not using
implicit sync, GPU jobs from different contexts can execute in a
different order than they were flushed to the kernel.

To solve that, share sched-entities for a given priority level between
submitqueues (which map to gl contexts).

Rob Clark (2):
  drm/msm: A bit more docs + cleanup
  drm/msm: One sched entity per process per priority

 drivers/gpu/drm/msm/msm_drv.h         | 44 -----------------
 drivers/gpu/drm/msm/msm_gem_submit.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 66 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_submitqueue.c | 68 +++++++++++++++++++++++----
 4 files changed, 123 insertions(+), 57 deletions(-)

-- 
2.31.1

