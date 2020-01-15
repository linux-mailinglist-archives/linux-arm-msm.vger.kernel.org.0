Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B98613CE63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 21:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgAOU5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 15:57:21 -0500
Received: from mail-vs1-f98.google.com ([209.85.217.98]:35583 "EHLO
        mail-vs1-f98.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgAOU5U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 15:57:20 -0500
Received: by mail-vs1-f98.google.com with SMTP id x123so11342596vsc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 12:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brkho-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qHyeBb8P8MuXBOujO8Ub/x9es/mztS5rWLEPJQm2/Ko=;
        b=gemQ994QSr6JkWm5dYBVsYR1LIUE6WIVOW8OxEKlh9bU4AqNaICD0FbZpeOl6z/LAl
         vuC+aCpJJETBjSq2TECPu90Go2szUdkpo1gjupaHPIGJ9ZZooVYxI71Rirzmg6A4bu1L
         C/inqb7wdAsLxPei6JNCqpy1b5SAaEnWS23sMH6VFSBAKedca6LycF29bEiadY3uRsC2
         5pyd9Vh82G2+fmvOBf/aPdjBWU9KkWz+IfbKfdlYWoElECqklH7jr3veHq3W7vdY5cHF
         /ZlDSYv6Igq7WkuojeDl6YSvE69k3n6aCqYrLg13TbuutyCBl5JkOU/tEG1KzumGXC9M
         Tfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qHyeBb8P8MuXBOujO8Ub/x9es/mztS5rWLEPJQm2/Ko=;
        b=PHx3x9Nv9RnZVHum2xL8orPNNRDYPw1Kp5CZ6gb/KOqUt9WhPTXH7OIZMOqR8ln3Vn
         vb2XgZ9qOEL7RW3UFhpu8V3ytLBxtLth7Sx9sPetfhdF2V8DGTxgS26htnBHDzrkBCfP
         JccXRvSza8WBkKecKeAYfBR6w696nzKTAPYo7lmUk1q27a+aFMfOxriw0MN9VNvsuIhd
         kuIwwNkxwoJ9QEHbvOrC2e5HSBsxxegSdtjTMdJ0DsPaW+bE+aK58Bai2ZVpH8oQt8/K
         fNQ64AL7YETaER7d3cs4gN2d3oe2ryTlnOA42oLryn39zoRqxop3n5fs9OXAcQ8ZF2QA
         o69A==
X-Gm-Message-State: APjAAAVd9gIqjUjxmunbtflU0U7xcc/RuiDG9AeV4/TZ5nv+FlIAR8Io
        juAudqFPvciWCbkPnMPlNb86Fb6HdjRA29wn50Ev72wKym/vrQ==
X-Google-Smtp-Source: APXvYqwa4eobrkUlejkxbm2vmrBfah47TV7vVGHvbgpZIUMZp/IuDRvCLBzND9WHntaSOfLkMYAbMYa3NIun
X-Received: by 2002:a05:6102:3126:: with SMTP id f6mr5458988vsh.204.1579121838618;
        Wed, 15 Jan 2020 12:57:18 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
        by smtp-relay.gmail.com with ESMTPS id j26sm1472756uak.1.2020.01.15.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 12:57:18 -0800 (PST)
X-Relaying-Domain: brkho.com
From:   Brian Ho <brian@brkho.com>
To:     freedreno@lists.freedesktop.org
Cc:     hoegsberg@chromium.org, robdclark@chromium.org,
        jcrouse@codeaurora.org, Brian Ho <brian@brkho.com>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
Date:   Wed, 15 Jan 2020 15:56:47 -0500
Message-Id: <20200115205649.12971-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set implements the MSM_WAIT_IOVA ioctl which lets
userspace sleep until the value at a given iova reaches a certain
condition. This is needed in turnip to implement the
VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.

First, we add a GPU-wide wait queue that is signaled on all IRQs.
We can then wait on this wait queue inside MSM_WAIT_IOVA until the
condition is met.

The corresponding merge request in mesa can be found at:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279

Changes in v2:
    * Updated cleanup logic on error
    * Added a mask
    * 32 bit values by default

Brian Ho (2):
  drm/msm: Add a GPU-wide wait queue
  drm/msm: Add MSM_WAIT_IOVA ioctl

 drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 14 ++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.0.rc1.283.g88dfdc4193-goog

