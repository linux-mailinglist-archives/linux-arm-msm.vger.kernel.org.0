Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E8B1F386F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 12:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgFIKrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 06:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728206AbgFIKrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 06:47:37 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE6DC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 03:47:33 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o15so21788486ejm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=p+3qxG4IVGjzzVjW9GQuIsYW/5Su4XmyAq4tUI3f9kc=;
        b=YcyHykJcGW6dvg5l+6eVeEGZXy3JVntamLO7FbHdJOBvI8KQWdvEYbRjXwsYElyby9
         Ed/vzFhjeBRCMCvh4PDj/Nj8oWxpFlXwRtAyUw+ZnFPaXzn3b0mqjE7LamQ0gCRi2epp
         LiKPhT51jkXhhik1ICQ06wB/qfHgHprjhxvAJI02yGbDt9zuZhx5NmCyLqUhr5aZbC7m
         6iV2TFgRU+862dqtrw52VFrT8PGgNFAyVYkxSv4o3/crC4qBT6SdFyyoor9/dTTS+1V+
         TNQ2fLUQD8hyTkb3jo+DLaYhB56HCMzDNN6NQ4QywZ2z/eeUd+hlNKcpi5XMx7ozmrfO
         ZRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p+3qxG4IVGjzzVjW9GQuIsYW/5Su4XmyAq4tUI3f9kc=;
        b=XaqfYGJCQbN3SO3/iN4goyz1ejbU12pa3t73ei2T6rxUDejLQmfMp8qtJDRDH7xp/a
         XU+uxEQOAwpYATjmd93eo0jfu7eVysnc3QOzOwOHpG9T6rYdabDVFl+dii0yZUYO4Zwj
         UrXM4eZvW00zPEj45OP0Vg7HootC0e0XsRcg6ZLiRx4t7KG1nXtHzD6DUQh0MtxynZBz
         GUodVl5w1qNWD3kErqPallYwlW1v8XISxv9JKd18qvgngh/g2KfbMKtyuM7o9S8A58hP
         C6SppbNh17MnLphUuPD86QhdYH+4Sf5qEfcaTQ3MLvzjCHfgoELD3wMv6T8HIq93vv0e
         UlIg==
X-Gm-Message-State: AOAM533tr5ks1fr4SNLkdOS+UZGRhoBl7STpn3gHWd3g33EmeE0TlHEr
        HUbcDcR6sORA5hmmv1K0KWPQ+g==
X-Google-Smtp-Source: ABdhPJwOKge6Hzbdo61zDo+biArgiANhUoagULJsDuRSfbmyRyi170/EUHj7g5antha/fljvEu9kYw==
X-Received: by 2002:a17:906:3483:: with SMTP id g3mr24541480ejb.373.1591699650514;
        Tue, 09 Jun 2020 03:47:30 -0700 (PDT)
Received: from localhost.localdomain (hst-221-69.medicom.bg. [84.238.221.69])
        by smtp.gmail.com with ESMTPSA id qt19sm12267763ejb.14.2020.06.09.03.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:47:29 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-acpi@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     Joe Perches <joe@perches.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Baron <jbaron@akamai.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/7] Venus dynamic debug
Date:   Tue,  9 Jun 2020 13:45:57 +0300
Message-Id: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here is the third version of dynamic debug improvements in Venus
driver.  As has been suggested on previous version by Joe [1] I've
made the relevant changes in dynamic debug core to handle leveling
as more generic way and not open-code/workaround it in the driver.

About changes:
 - added change in the dynamic_debug and in documentation
 - added respective pr_debug_level and dev_dbg_level

regards,
Stan

[1] https://lkml.org/lkml/2020/5/21/668

Stanimir Varbanov (7):
  Documentation: dynamic-debug: Add description of level bitmask
  dynamic_debug: Group debug messages by level bitmask
  dev_printk: Add dev_dbg_level macro over dynamic one
  printk: Add pr_debug_level macro over dynamic one
  venus: Add debugfs interface to set firmware log level
  venus: Make debug infrastructure more flexible
  venus: Add a debugfs file for SSR trigger

 .../admin-guide/dynamic-debug-howto.rst       | 10 +++
 drivers/media/platform/qcom/venus/Makefile    |  2 +-
 drivers/media/platform/qcom/venus/core.c      |  5 ++
 drivers/media/platform/qcom/venus/core.h      |  8 +++
 drivers/media/platform/qcom/venus/dbgfs.c     | 57 +++++++++++++++++
 drivers/media/platform/qcom/venus/dbgfs.h     | 12 ++++
 drivers/media/platform/qcom/venus/helpers.c   |  2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c  | 30 ++++-----
 drivers/media/platform/qcom/venus/hfi_venus.c | 27 ++++++--
 .../media/platform/qcom/venus/pm_helpers.c    |  3 +-
 drivers/media/platform/qcom/venus/vdec.c      | 63 +++++++++++++++++--
 drivers/media/platform/qcom/venus/venc.c      |  4 ++
 fs/btrfs/ctree.h                              | 12 ++--
 include/linux/acpi.h                          |  3 +-
 include/linux/dev_printk.h                    | 12 +++-
 include/linux/dynamic_debug.h                 | 55 +++++++++++-----
 include/linux/net.h                           |  3 +-
 include/linux/printk.h                        |  9 ++-
 lib/dynamic_debug.c                           | 30 +++++++++
 19 files changed, 289 insertions(+), 58 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h

-- 
2.17.1

