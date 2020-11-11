Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E72B2AEBF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 09:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgKKIbw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 03:31:52 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:47096 "EHLO
        m176115.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKKIbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 03:31:52 -0500
Received: from ubuntu.localdomain (unknown [157.0.31.124])
        by m176115.mail.qiye.163.com (Hmail) with ESMTPA id ADB9D6672A5;
        Wed, 11 Nov 2020 16:31:47 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bernard Zhao <bernard@vivo.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] add KERN_LEVEL to printk
Date:   Wed, 11 Nov 2020 00:31:17 -0800
Message-Id: <20201111083131.39817-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSU5KSRhNSR0ZSRpKVkpNS05LQ0hOS0NKT0NVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS09ISVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Phw6PSo5Dz8aNxcsSwguCRYI
        MUoKFCxVSlVKTUtOS0NITktDTk1PVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBSU1PTDcG
X-HM-Tid: 0a75b66ead6d9373kuwsadb9d6672a5
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi:

When call printk, set the KERN_LEVEL is suggested by the community.
This patch sereies add KERN_* level to printk which do not set
this level.

Bernard Zhao (5):
  adreno/a2xx_gpu.c: add KERN_LEVEL to printk
  adreno/a3xx_gpu.c: add KERN_LEVEL to printk
  adreno/a4xx_gpu.c: add KERN_LEVEL to printk
  adreno/a5xx_gpu.c: add KERN_LEVEL to printk
  adreno/adreno_gpu.c: add KERN_LEVEL to printk

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++------
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.29.0

