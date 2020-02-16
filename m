Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7C41605A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 19:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgBPS7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 13:59:00 -0500
Received: from mail-ed1-f41.google.com ([209.85.208.41]:40301 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgBPS7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 13:59:00 -0500
Received: by mail-ed1-f41.google.com with SMTP id p3so17993541edx.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2020 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TpSnAm25wPH3VK0kJpyji9KLpcsDX0bDNOrEow0wYDU=;
        b=XnZuw9VL9yN1jLsAx6YdGK2KohRde5WRWCFPYbCRcnpz3Hax8NrMNebQ0lYwn9E+7z
         rsiNm3xPCjqwZWDDWetG/IFB1MWkU6CZWvwb4S3RzYfHCcBS5K8bB5+MmMSkpBQ13AsL
         wssgh9SbwPNL/dC0KgAo7cEOWFq2GKMlqJCcfuEqCcs3DWKa/3dWbPZl5GNoUANh97cN
         0z6t1wZYjV/lRRDvF05arfMlwc74YZPvukdLtdNL80ISzFyxvWMfSlwn9yl1nwx4zBmv
         e54ow2c8uLDPXu/wTd62NO6fCJJ0l+SbgL8HNMLUEI14g2urF3Vz0AMgtwvicHQy26j+
         L/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TpSnAm25wPH3VK0kJpyji9KLpcsDX0bDNOrEow0wYDU=;
        b=BK/uTICKDjs6cZ6Hu/7I2mvZgvmssHH0WURL9h37MYZbY3J+n/ao5eqXTZkmISWslQ
         wwXzxHWPg1pfa6HIu1n2bG51yfGpK6wEv3yamVj9/ZtVIK/zbYf8NzRG34Nmc5T02DGs
         RWhY6Z1wuVVMnk0BAkY0kZ+K5ERczO/g5Lx4gZNA5P+ErJ4KdVr7nuUeh1Pv8ZTePajZ
         1dTCpmnkqJIYxRaAcaxodZLQ+ItsMyxqMZlVeXkPtO1UJf0lIJPI7D/7VfgDDP5Zfazn
         xoGtbaTQ2gQwfsjGydDmI/nd5kEk9Cw+9ESCPgmUmNAEp4UcvSbnr2nwr6etLOXP+pRb
         uAwQ==
X-Gm-Message-State: APjAAAWGMuQFZKnkkJOA03HTktdBH441BbZldmQa5aLTeF3SJEC8mghr
        qKe9+14gH8kkpGbJtsF8998U06G17/D3YzKxDAc=
X-Google-Smtp-Source: APXvYqz4RNqAGJljIzya51CavkeE9kiK2ePBXoWIbclr9Eu1ewnwe7TGrR0E86C6CgQXn1SdrKQdTCu70fouurNH4lY=
X-Received: by 2002:a17:906:19d8:: with SMTP id h24mr11500861ejd.166.1581879538251;
 Sun, 16 Feb 2020 10:58:58 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 16 Feb 2020 10:58:48 -0800
Message-ID: <CAF6AEGshz5K3tJd=NsBSHq6HGT-ZRa67qt+iN=U2ZFO2oD8kuw@mail.gmail.com>
Subject: [pull] drm/msm: msm-fixes-v5.6-rc2
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

Got a few more fixes this time around, so decided to send a dedicated
-fixes PR rather than try to route these all through -misc like we do
when there are only a couple misc fixes.  It mostly boils down to
fixing fallout from new hw enablement (sc7180):

+ fix UBWC on GPU and display side for sc7180
+ fix DSI suspend/resume issue encountered on sc7180
+ fix some breakage on so called "linux-android" devices
  (fallout from sc7180/a618 support, not seen earlier
  due to bootloader/firmware differences)
+ couple other misc fixes


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-02-16

for you to fetch changes up to 8fc7036ee652207ca992fbb9abb64090c355a9e0:

  drm/msm/dpu: fix BGR565 vs RGB565 confusion (2020-02-13 13:54:12 -0800)

----------------------------------------------------------------
Akhil P Oommen (1):
      drm/msm/a6xx: Correct the highestbank configuration

Brian Masney (1):
      drm/msm/mdp5: rate limit pp done timeout warnings

Harigovindan P (2):
      drm/msm/dsi: save pll state before dsi host is powered off
      drm/msm/dsi/pll: call vco set rate explicitly

John Stultz (1):
      drm: msm: Fix return type of dsi_mgr_connector_mode_valid for kCFI

Jordan Crouse (3):
      drm/msm/a6xx: Remove unneeded GBIF unhalt
      drm/msm/a6xx: Update the GMU bus tables for sc7180
      drm/msm: Fix a6xx GMU shutdown sequence

Kalyan Thota (1):
      msm:disp:dpu1: add UBWC support for display on SC7180

Rob Clark (1):
      drm/msm/dpu: fix BGR565 vs RGB565 confusion

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 37 +++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 65 ++--------------------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c       | 85 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c    | 58 +++++++++++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c       |  7 ++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c       |  4 --
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c  |  6 ++
 9 files changed, 170 insertions(+), 100 deletions(-)
