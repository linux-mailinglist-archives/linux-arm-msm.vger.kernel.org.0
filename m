Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397B92FFBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 17:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfE3P7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 11:59:18 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37051 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfE3P7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 11:59:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id a23so4247821pff.4;
        Thu, 30 May 2019 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Y8nAAbKBo+GsjR2wR8X+b6EMGLV2z628Qb4JzCYHIQ4=;
        b=XLLCbKfwDGtQAZawpyoKQffPiR9Xf8Q7jYF7Uvvmr/cWUh74ThmPXC6oZCk7/PEAyF
         YzSquNHpQc7JGFV+Zp/4c/pAJWiRbSJdJU0n9zOTE8zsei+hjeIKCMEJcKyz+rShlXV7
         eZd0TKAe2c/GRvS6wBM/gDKpUDkY4bCUygPCwMrebyFAS1StIUXwGMvAkZ1rlWZv3eLM
         xp3FZbOLNED3XSOgQp1xOFe6THUw3PwQDIk4DSriRXwadZDES0iwTFnTPLJwhvaIJrjI
         FVpE3afKn+WFYW4Fyg1/STsHGL20fYxsSWuc126MZOyrruTOiQxsI0iIoGNmk7vWFAdd
         8wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Y8nAAbKBo+GsjR2wR8X+b6EMGLV2z628Qb4JzCYHIQ4=;
        b=Ib+mQ2DEvJCEvzRFj7ffOsj9uMg96ltMB/+ihxfTia8aWA/o0uFdTbXLu9WdI7chi+
         ZivmM09KQU4rn7TQ2tV6rEIfmltbeM9Sm/tv0QDEYT1ihMm3r7Fjst4cA/g/hbyLmxnT
         etlsfS1EyZfvENOhFRee8IkQo0Y5IOuMaacJ4Z6wk8cXPAx7y2FDvLaflaXekMwS8T7X
         cV/ZbNL9mEXyCY5GF9c+eTY1QiPdAV+7apYGnl+n5bn+fTBsDkcN+zywz6PU0wh8YfH3
         awLw8Q1DTOSIZq6GogCAOdQV4G4yBuxP4AjJgTO8P/rea+gJnEb+rsC6c0zGlYMeVIYw
         5v7A==
X-Gm-Message-State: APjAAAX85xH6k+dFNXaIMq3v0zRWGVAqyrRBORBi477FKkcuAJlFww8X
        13ygyt8q/g78eERVQ3L5njE=
X-Google-Smtp-Source: APXvYqwr8GMJVp3pLyVMxK1wV0ENCJ3tZpw/SGabGJp9Pyp7Pfnzkhra0qVRagJdDgUjO9dbrjeSig==
X-Received: by 2002:a63:c20c:: with SMTP id b12mr4155982pgd.3.1559231957162;
        Thu, 30 May 2019 08:59:17 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id e184sm4213045pfa.169.2019.05.30.08.59.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 08:59:16 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
        sibis@codeaurora.org, chandanu@codeaurora.org,
        abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/4] MSM8998 DSI support
Date:   Thu, 30 May 2019 08:59:09 -0700
Message-Id: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabling DSI support for the MSM8998 SoC is another step to getting end
to end display going.  This will allow the SoC to drive panels that are
integraded on the device (ie not a HDMI port), but won't do much until
we have the display processor feeding the DSI blocks with lines to
scanout.

Jeffrey Hugo (4):
  dt-bindings: msm/dsi: Add 10nm phy for msm8998 compatible
  drm/msm/dsi: Add support for MSM8998 10nm dsi phy
  drm/msm/dsi: Add old timings quirk for 10nm phy
  drm/msm/dsi: Add support for MSM8998 DSI controller

 .../devicetree/bindings/display/msm/dsi.txt   |  1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 21 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  5 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 30 +++++++++++++++++--
 6 files changed, 57 insertions(+), 3 deletions(-)

-- 
2.17.1

