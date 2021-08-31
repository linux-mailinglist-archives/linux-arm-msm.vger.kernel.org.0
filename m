Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE993FCB42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 18:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239787AbhHaQNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 12:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239789AbhHaQNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 12:13:44 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB885C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:12:48 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id m4so10967601pll.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
        b=ShrvEdu4aBcZuH9JQOrGSy5IboFfiYymwSoisBjRrV5v7aapU7MLCcajLG+cvPcidq
         6rJkTEoUyl21HJ93R/q0D5Y0dWQvWFsLjCEc6TKpRrxYBI0LBoRc3lFXuolvQoZSaMjs
         M1v8rZ/k+KK/Y/wcAQj3jzeFJQjfRLhtkVmP39glhN52Lxmw+btmis/QMLmD2O2urNNj
         kmk6gx9Zxsti+4SHkTEVJ+DsZA67rCM1NthxOO8oieo+6RI/SHguz3UjMcgcImWQMG8L
         qpIPaewOz3j+3kFeitJN39iIt9RCrmEB7fw6jj9HVCp09nDNMknxvDIUhxKBt/PlEbQO
         AcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
        b=suOg4oYZSdIZqzLPItOZcwGXudOWn+y+qydHSi6SosZkOKLrYla+CbZaZWb552vX0H
         P0otLQLwyCAfDNPf8fz7mBrakleEJ8M3qxIvqQ6T0iVPyErSE6lDMtvcrIEpGNCQap0N
         gSQy5REGafmkcVahQDwFO7ghypBT7fvCd0P3kFL6J5U1iYOkfcVOi4Uw7CXid9zzRYy6
         AW12lT07b0ug7jNVioZDnjs5bcDcGdFkKSFQHDcXHcQkWv5MPQPyeG9imXnNAk1FehO/
         GVRrbMHh/f1OYH4eN7ufpISk9DUE2eU9rlc9SxChWUaVh2qLiV8nharH4q4T1FcEbK7z
         IJAA==
X-Gm-Message-State: AOAM532OiHwfl1/iqrQpfoyal00tM8mmY9zkZD28kJpvteyrdlr7Q3Kr
        is50AFpP72R/1t4Mn8MriLw=
X-Google-Smtp-Source: ABdhPJyfGDeblGXkDl4WZ1mV/1NAF3JEfJAqlDwzgZp48do1VYkeKvrEdCp7apeoDZQRlFawms82AQ==
X-Received: by 2002:a17:902:6b47:b0:12d:7aa6:1e45 with SMTP id g7-20020a1709026b4700b0012d7aa61e45mr5351215plt.80.1630426368260;
        Tue, 31 Aug 2021 09:12:48 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id v20sm21386083pgi.39.2021.08.31.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 09:12:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v4 0/3] Initial igt tests for drm/msm ioctls
Date:   Tue, 31 Aug 2021 09:17:13 -0700
Message-Id: <20210831161716.1400057-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the gpu SUBMIT ioctl.  There is
plenty more we can add, but need to start somewhere.

Rob Clark (3):
  drmtest: Add DRIVER_MSM support
  msm: Add helper library
  msm: Add submit ioctl tests

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/drmtest.c                                 |   3 +
 lib/drmtest.h                                 |   1 +
 lib/igt_msm.c                                 | 211 ++++++++++++++++++
 lib/igt_msm.h                                 | 142 ++++++++++++
 lib/meson.build                               |   1 +
 tests/meson.build                             |   1 +
 tests/msm_submit.c                            | 194 ++++++++++++++++
 8 files changed, 554 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

