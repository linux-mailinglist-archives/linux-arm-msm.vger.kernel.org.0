Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6253995A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 23:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhFBVzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 17:55:44 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:44895 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhFBVzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 17:55:43 -0400
Received: by mail-pf1-f181.google.com with SMTP id u18so3263189pfk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ntQT2pZR3LJHS6LUFfJ+Qm+vXWzrrp5nCQGAwU1JB0=;
        b=hcmQBsf5LoocnIf8a/0Ca0mlBQCzY7GjMf15ueTI3PEpj3E/TBi5Q4d6mn33d2MJoP
         o9USDMmnfkAKRC+HQmjPpNpm9ItolNHZ1gLqyQzuO6A7JT97S8N4Sxu9N2mExjgaVVfG
         /6iv9Wdl/GeNVu3eeoA7T88o2yYmvWwncmi+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ntQT2pZR3LJHS6LUFfJ+Qm+vXWzrrp5nCQGAwU1JB0=;
        b=bH0am2bjwMoUxXZD1dqCxcyRMUrZkaV4CN7b9OAPMc1sjXT66smTPxZzghGvyniTkw
         5svDo9DRKJMZnK1w0yqCMxgCHez2Qzod3euk/oaQVV2W7dVOvxdRZ7KpKbYx+S3bL242
         VEuzS/lQIlzzeye+zFMK0lWe+FHU/YZfTHRZyBCDQk3RDc1fmkKfZnOpdXptLzYcQo+c
         GS5aaHJjbjiGv61klb0Z8RFsjvYCN3p5DmBIQgKespzDE1/QjwxroAusV8JTdR+xQACY
         yUUD8Q6zIpzFko8d+1r7PDP5Bvh4EWUfNohn95F4L9LucRxtoV/yJ7RlR2GNRoUNufJk
         erpw==
X-Gm-Message-State: AOAM53193HA/lJlZ9jBjyvh5qemeQ9os+240fB6QFAPbIWO80pjibz0F
        V4510bPA9C9YawnH+DY1Lg/lGA==
X-Google-Smtp-Source: ABdhPJzeQ5qvww5ymAg1YzwWIo2ptK3WZmfCNVj/MFd8/a2Itlvi0o2veU1w5SbMD5HCoN+TggIUFg==
X-Received: by 2002:a63:1b52:: with SMTP id b18mr8618637pgm.263.1622670780419;
        Wed, 02 Jun 2021 14:53:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 60sm338761pjz.42.2021.06.02.14.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 14:52:59 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Dave Airlie <airlied@redhat.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Arnd Bergmann <arnd@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Emma Anholt <emma@anholt.net>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm: Fix randconfig link failures
Date:   Wed,  2 Jun 2021 14:52:49 -0700
Message-Id: <20210602215252.695994-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

While tracking down spurious "orphan section" warnings on arm and arm64,
I needed to fix several other issues that it seems other folks have
tripped over before.

Here's the series that fixed everything for me...

-Kees


Arnd Bergmann (1):
  drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency

Kees Cook (2):
  drm: Avoid circular dependencies for CONFIG_FB
  drm/pl111: depend on CONFIG_VEXPRESS_CONFIG

 drivers/gpu/drm/Kconfig       | 2 +-
 drivers/gpu/drm/msm/Kconfig   | 3 ++-
 drivers/gpu/drm/pl111/Kconfig | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1

