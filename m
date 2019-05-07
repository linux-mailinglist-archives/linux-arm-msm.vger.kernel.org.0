Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4FA916B28
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 21:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfEGTST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 15:18:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49900 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfEGTST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 15:18:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E702C611CF; Tue,  7 May 2019 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256697;
        bh=D9Kd2zxAWJ5KTUC7BKdUtpmmcLWPJaFJ8dfoo6VXoG8=;
        h=From:To:Cc:Subject:Date:From;
        b=DakORPlYuaZKmQjO+kxM5s/lNWxbM499Lkw20ZDGpxjNVZ3y6PDF8vw9oA/O7IYQR
         CP/d6YI/9rn8OPubpzluMcSIP9KOc2mfbBeGSBsjmOkkovTylMD1TiMEpw6UBDSx3a
         /OAC8kwl3Ak9zf49CHXmREFdmgd32eSiGqxk8ccY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3544B61112;
        Tue,  7 May 2019 19:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256696;
        bh=D9Kd2zxAWJ5KTUC7BKdUtpmmcLWPJaFJ8dfoo6VXoG8=;
        h=From:To:Cc:Subject:Date:From;
        b=nSsbEPNT5XMJGYCYYKzFXWHkzfqZ1e+RCuNqOK+sg2rrZt4hD1XDRJ8mqwbnwnYpz
         vhRm2Livl9+PVbmp2kOJrlF+VyWmwUJlQ4v2mfcfhvhJ7qglf2gvEh5cRb/sSSOQQq
         5scjGJ84IOp+15GOlKd+lRKNApENzcy/5XreDRTw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3544B61112
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Mack <daniel@zonque.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: Handle component bind failures a bit better
Date:   Tue,  7 May 2019 13:18:08 -0600
Message-Id: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I somewhat accidently injected an error in the DPU KMS init that caused it to
fail and a handful of NULL deferences and errors ended up popping out. Here are
some fixes in the interest of robustness.

Jordan Crouse (3):
  drm/msm/dpu: Fix error recovery after failing to enable clocks
  drm/msm/dpu: Avoid a null de-ref while recovering from kms init fail
  drm/msm/adreno: Call pm_runtime_force_suspend() during unbind

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 4 +---
 drivers/gpu/drm/msm/adreno/adreno_device.c  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 9 ++++++---
 4 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.7.4

