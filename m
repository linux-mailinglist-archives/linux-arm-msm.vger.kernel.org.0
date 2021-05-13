Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5160937F08F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 02:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbhEMAnN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 20:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbhEMAka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 20:40:30 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF841C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 17:39:00 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id x8so24141277qkl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 17:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fpaQ5hUDMlQfsG0EH4pHt8PmhSpDBypKIHC4jY8sAL4=;
        b=Ci6WPM/MI3tUHmjkH6us9JM9QQH7+l+yVKYUjvM5yh+Fsiu0cHplcKlKtlLI5kSzzj
         JLwVDzmLTjYIUaShhM24HBfC1wK11jY2D8Mn/eKJo4g6osW5Zp984Jio1l0sbcFPla+o
         z/DKJ6APH7/LGvoIGeBIisEpfd11G6AHh5v/6U7pwzQnBPpjxTI8z1i3X52SZqhsXlmF
         FC31gNnZxxCk+XEq5/5/1RbIaaJAQyy0wc/lClwizGDXyrdizdZh3JkCrwjg2bOpR7E+
         II3+8MC+J460JA8lW9IqNuVVEf5C17iZjSgoxRvfUSaFTSNIRy95Y1AAyBHtJK/IXaVa
         BKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fpaQ5hUDMlQfsG0EH4pHt8PmhSpDBypKIHC4jY8sAL4=;
        b=sgSthZxqH7fLFEG8H2AOJ7sN8SvX7mseoQ1OtmLzfK7frcu5gLP6kBbN3opou42i9Z
         3EdxEpaI/pqUmYPzWqleptLux6Xlkp+leroONIBy82SOoD5Im8N9uHhf9HOqGXPc2inX
         2R3rqHVy9iTuGHbP5/SX0WAyYOF4nJCVsX4kuj7expRGBx6F0ZjXMsAImfSU70Ab8mUY
         mQgVsIjxGRg1Q+2UPBff0b0b2weBZKp/odx5OChGNO44pzc3Pu9SEUIyIlZ3fv19Jzg7
         kUUT6wwJn1dhaBHXREzdGgCYjQTbc+7K19+plgkewHXGnrgsJPpHrd9pEjpVJyoNPd22
         ADWw==
X-Gm-Message-State: AOAM530AWL4tjsRBXKEwCz9bjiNFMGYHC14iq6z1286QpoC5QdtTIWZf
        ncpGwXZyyiDatmNlYn9GrJH7ng==
X-Google-Smtp-Source: ABdhPJzeXxYFHXADz5y/uwXcsiFsr488IEe98cMBVvUCBZ7+DFPHBQDjnQf20QToRZ3i6CYBm4JQRw==
X-Received: by 2002:a37:c0e:: with SMTP id 14mr3526092qkm.255.1620866340036;
        Wed, 12 May 2021 17:39:00 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 17:38:59 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Eric Anholt <eric@anholt.net>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        kbuild test robot <lkp@intel.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rob Clark <robdclark@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/5] drm/msm/a6xx: add support for Adreno 660 GPU
Date:   Wed, 12 May 2021 20:37:44 -0400
Message-Id: <20210513003811.29578-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Adreno 660 to the drm/msm driver. Very similar to A650
on the kernel side.

Jonathan Marek (5):
  drm/msm: remove unused icc_path/ocmem_icc_path
  drm/msm/a6xx: avoid shadow NULL reference in failure path
  drm/msm/a6xx: add support for Adreno 660 GPU
  drm/msm/a6xx: update a6xx_ucode_check_version for a660
  drm/msm/a6xx: add a660 hwcg table

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  32 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 115 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  33 ++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  13 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  14 ++-
 drivers/gpu/drm/msm/msm_gpu.h              |   9 --
 8 files changed, 176 insertions(+), 49 deletions(-)

-- 
2.26.1

