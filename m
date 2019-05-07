Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7F4169C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 20:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfEGSCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 14:02:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52534 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfEGSCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 14:02:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8513760E3E; Tue,  7 May 2019 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557252132;
        bh=IwYIMrt5BrwMIHRzEOkGLNPJlO73nFmvHWeK/JO4d/s=;
        h=From:To:Cc:Subject:Date:From;
        b=QBeSyFd/GACWJ2aoNE+BdSSYjZBpiaYyDANObPD7yH6hLnk+aAPatvi8mP3cbD5YE
         GPzdna/xD272+Yum0HqB4PzydyokWvn9YzGV2HqVHoh2yjJdIfKJ43Mw2QI8sogoiI
         YMSff5B7zgmV9eMtiwqycUb/wqwjOmQBD86DrAMU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC1E160AA2;
        Tue,  7 May 2019 18:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557252131;
        bh=IwYIMrt5BrwMIHRzEOkGLNPJlO73nFmvHWeK/JO4d/s=;
        h=From:To:Cc:Subject:Date:From;
        b=G7FGJSz6bupthIf01bH+AJFT1hYJBsDeNPZZZJcPjmVdtyaL8XZVcpyr06moNdWsf
         DGq9yAQlvcVQatfj4u+GG1raCB1ItDHmHBhvUx2n/FWSeRUawr9fMXI8pcQuZXKSER
         NJ37ZPFlrqyKfLVLD3SVyAZ63ZmyVrgR2qsbS6/0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC1E160AA2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 0/3] drm/msm: Add dependencies for per-instance pagetables
Date:   Tue,  7 May 2019 12:02:04 -0600
Message-Id: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These are a few support changes in advance of per-instance pagetables. These
can be added to msm-next immediately since they don't require anything external
support and they are mostly benign on their own without the more aggressive
changes coming up later.

Jordan Crouse (3):
  drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx targets
  drm/msm: Print all 64 bits of the faulting IOMMU address
  drm/msm: Pass the MMU domain index in struct msm_file_private

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         |  2 ++
 drivers/gpu/drm/msm/msm_drv.h         |  1 +
 drivers/gpu/drm/msm/msm_gem.h         |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c  | 13 ++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c         |  5 ++---
 drivers/gpu/drm/msm/msm_iommu.c       |  2 +-
 8 files changed, 43 insertions(+), 9 deletions(-)

-- 
2.7.4

