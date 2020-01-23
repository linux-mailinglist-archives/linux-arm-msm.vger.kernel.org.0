Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E16D147527
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 00:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgAWX7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 18:59:36 -0500
Received: from mail-yw1-f98.google.com ([209.85.161.98]:34215 "EHLO
        mail-yw1-f98.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729191AbgAWX7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 18:59:36 -0500
Received: by mail-yw1-f98.google.com with SMTP id b186so80149ywc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 15:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brkho-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xrSo2+pGduAw292a0r+TdBhJS9mLgXGxwVlVbyCbpLg=;
        b=D7OYHpFLgk97teU0zZSRPPccfqMZUapF8TpobPPhIx/gWfpISr+LuVI6MDdnJDhbs4
         apMzxOnEd3+jzgIMs070Vk+xjc6o+5gb0ZBitQOL2ahu20wsHITfv4+aW8aRmiJmh1wc
         X8RIjb4s+cPG5CghTJHdXKgkuR5GSh1hrb9/twhckyMLrxupMtCJ0/9IkEIn6l0I3xXc
         LSx1unKEneXQbbOETIQOHpnbCvX+y5yyKBvVoAvwQbe/AxUJ/cnuLNMKDF1FklNC3hsf
         zYj6M9WePrwvnY+mhcncUZYDXnAXRSxHgb7XVYlLn3kGv7uWwXRruiT8Y0GO4JFyzjUv
         1QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xrSo2+pGduAw292a0r+TdBhJS9mLgXGxwVlVbyCbpLg=;
        b=ZUdhFukaL4sU+RAjzj9iG1BuwImakC+VWqWFIsCUYORGwyPtVJfGid89EwDtbn2aR6
         VMSNdyX96jBEgZSiuGW/HJf99q4UUjEPfQ4X2Fw+4GX16d9yV0ICGgY5CUdAN6pn9hch
         ieXiaKQQ7m4jrEUih1ZFdxlzmh0ADHtz7Ab8uPj38iV/raikECUzITdsI7+a/vqv5/Ny
         yXGfZlagrD+RiNCKfjsrRMPtqBQMyVnLq3dH28gvAMdPKGFIoY2Z5yVvV2OwohUwrE3p
         +TEpTTDPGMBULPZtu0CvN2ob9fnV3Mjuk2Eb4XMO7wU05rJRh1kjmkz11K5US2pgFE39
         0AQQ==
X-Gm-Message-State: APjAAAXpEySG39xwzfVjxvU53C/IkpsORelnPEC7LV7mxzqae2kFrzDt
        nFZqpCXSOf5AcuWC77eXOoFKfmtfHopInWwkCsBsveV0pUZvWg==
X-Google-Smtp-Source: APXvYqyitskCyEXAQcqS53IPFPyVLU9xyT5Uc39138IvOAogcA8kZveFb67zLpleAblvQ8kXm3+zAJJzhtKV
X-Received: by 2002:a81:9c14:: with SMTP id m20mr163298ywa.143.1579823974817;
        Thu, 23 Jan 2020 15:59:34 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
        by smtp-relay.gmail.com with ESMTPS id i82sm591239ywg.11.2020.01.23.15.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 15:59:34 -0800 (PST)
X-Relaying-Domain: brkho.com
From:   Brian Ho <brian@brkho.com>
To:     freedreno@lists.freedesktop.org
Cc:     hoegsberg@chromium.org, robdclark@chromium.org,
        Brian Ho <brian@brkho.com>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
Date:   Thu, 23 Jan 2020 18:57:36 -0500
Message-Id: <20200123235738.48182-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
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

Changes in v3:
    * Fixed a bug where the mask was being applied incorrectly

Brian Ho (2):
  drm/msm: Add a GPU-wide wait queue
  drm/msm: Add MSM_WAIT_IOVA ioctl

 drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 14 ++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

