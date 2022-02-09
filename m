Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D970B4AF806
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238137AbiBIRZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238138AbiBIRZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:21 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F5DC05CB8C
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:24 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f10so5539913lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6QoNkw201jmWYI2ZvFOwA35KwNfMMnBn8u5YRCFPRuo=;
        b=lekhbXiwBQhRlgUOFnQGhFF2kovB0evdrZ1prOnNfCG93Uplho9arDXFUwEwD8QK5+
         CL8ASVgUHtY7q97MaI/im2nZiNIIdSs1J8RS2gFLTmdrbAVOqthhla0K74B3FZ5+xPZ+
         4LjBDtIfK90r2gjzi6qpi5fKnft2Lxn6pPRkJsibAFxZ+xv4Y+sLsJeM9ubKSAU8WChw
         DkhfNOXtnG1G0N1EJjRBhT9BCD4L1EQg/IUjhqqjwyWmH7QQgaQKVk9UIsO58pKBIfaX
         JCwwZ/y88m+VRoWn589Zpm3A94Ad91AzgkQ9a/JPD/wO+TFTCDqTQfj8Gj5fkW2eZRDh
         67cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6QoNkw201jmWYI2ZvFOwA35KwNfMMnBn8u5YRCFPRuo=;
        b=IbV7NzIGBfCM9RUWnfU1OMABvfe1GhZMWosy9jDr3MmPg1VuwTSDYDFF1i4rh7TzwD
         cuhleKc61MPZdKDLeHKAutkMGCi7eQD9Ed4EuwScaSayB4kjoQl6Wog/5bsgVxjwX9k2
         AuiTkvMfuvkxcWxN0hr81/luMBu9PyZ6RSt8ik/QJWzCysvldCH6i9Va0X0KjqDDTNrG
         Pu9tE1lH+Ppeza81OKmpHYXui4aC4m05a5nuedbbgWpRdeloXobIPSPAnFXGxnp86ITo
         COMaUe/c0F6rGvLst9YXfLM+94D+kiHIrqFAllvrjBdaWObM2YyVk4Sffgkp1NW9uEsD
         9rfA==
X-Gm-Message-State: AOAM532/Pdo4EH+fwwxuTDKK+fkw/uS2WHGoeur3dyzV+tE+0Ym7KaQG
        86xI3H3CnnMgMGHODfQ5erP2zQ==
X-Google-Smtp-Source: ABdhPJzspwOL8tBkHWxdZzBiE7r2qRpMZRD1XKC34zQnA/D9jM2b8gDJpfLQEj5hRBo5pZZdjjXNFw==
X-Received: by 2002:a05:6512:3d17:: with SMTP id d23mr2261513lfv.76.1644427522431;
        Wed, 09 Feb 2022 09:25:22 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 00/25] drm/msm/dpu: wide planes support
Date:   Wed,  9 Feb 2022 20:24:55 +0300
Message-Id: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It took me a way longer to finish than I expected. And more patches that
I initially hoped. This patchset brings in multirect usage to support
using two SSPP rectangles for a single plane. Virtual planes support is
omitted from this pull request, it will come later.

Dmitry Baryshkov (25):
  drm/msm/dpu: rip out master planes support
  drm/msm/dpu: do not limit the zpos property
  drm/msm/dpu: add support for SSPP allocation to RM
  drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
  drm/msm/dpu: move pipe_hw to dpu_plane_state
  drm/msm/dpu: inline dpu_plane_get_ctl_flush
  drm/msm/dpu: drop dpu_plane_pipe function
  drm/msm/dpu: get rid of cached flush_mask
  drm/msm/dpu: dpu_crtc_blend_setup: split mixer and ctl logic
  drm/msm/dpu: introduce struct dpu_sw_pipe
  drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
  drm/msm/dpu: inline _dpu_plane_set_scanout
  drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
  drm/msm/dpu: move stride programming to
    dpu_hw_sspp_setup_sourceaddress
  drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
  drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: rework dpu_plane_atomic_check() and
    dpu_plane_sspp_atomic_update()
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: add support for wide planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 355 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   4 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  78 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 136 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  88 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 813 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  81 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
 15 files changed, 827 insertions(+), 863 deletions(-)

-- 
2.34.1

