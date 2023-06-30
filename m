Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91716744380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjF3Uz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjF3Uz2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A043C1B
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:26 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so3742211e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158525; x=1690750525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYtFgFK+NL5eYqb4xNnzL2p3K6aTu66Q2w04c7k1+g0=;
        b=hBGmOE4VZlSKM8yX0Hgd2jtXMt/Ai4Yqe4ZnOi4wL6mfEKcO9u+LIdwcgLcBf1/IBN
         NPC5G6CoKXJOPXyt0Exy43x2LsvGasIzMOy5yH2OngeAYrfnEGM7h5OY4njC6J2ebdtr
         JkUe7IXoo18legdHyhPcpURRqNcvC5dUOVzjJHA/TKH0xIAy5Jrh/h/RHJtadqjarpCQ
         0L4FWWZd7JHQzzsQ/dd0Okdm13RExLY08vC6EkjdkYg9PH+akWXmnBbNQM+xtZ9RUmOT
         Z8khraeHR0xinbSlvr1IQY5IVmxd78G8V5SmKaMi++MLJPy3Jzg5dzejrPfI1stp3AYt
         VNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158525; x=1690750525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYtFgFK+NL5eYqb4xNnzL2p3K6aTu66Q2w04c7k1+g0=;
        b=eshV6hXiKXM2sK+Z4kymk6jT4gumPxXdBHuMA5wYKSu0lbmdjpzkrT7qmN4ZrWJgJw
         bVkyweqajEDsAJaoeMbr7e+hI+wThuPCnG2e/OciIplbspDK6gPSbzRnATpMT6QbPMPK
         kLVJVooHqLgPYvgW7+xXwSpHb1ykDZPZNaNelvf862uWuFlvCXpmRs/kDD7rVqNK74GI
         DZJ66FS7+4zoDziDr4XiDsOsQq9OZJ+43sum0mM4v4dyxd42AghSNddIT1A2b8nvZPIe
         WAJz+vHO9e5+5mX5S0mhKd4g+rRYzOKOLiqeak7W1QevdqM6oqoqtYVw75yF27x1D7nr
         rQog==
X-Gm-Message-State: ABy/qLahMVXRHZqF2LnTriMteCjYG0/1DfQuUAaIbI/C3XOytXME04iU
        BMMWXbXnDzAEpKv12LWRe5C2DQ==
X-Google-Smtp-Source: APBJJlEjJEJbzJFN8+cyZiTlliH1NT5AXfoP1N+rUDn6ZmsCYiVJ08mX8buEls2jbxnQX9a5hjGvCQ==
X-Received: by 2002:a05:6512:39c3:b0:4f9:570c:7b28 with SMTP id k3-20020a05651239c300b004f9570c7b28mr3756503lfu.32.1688158524685;
        Fri, 30 Jun 2023 13:55:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 00/15] drm/msm/hdmi: rework and fix the HPD even generation
Date:   Fri, 30 Jun 2023 23:55:08 +0300
Message-Id: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. On APQ8064 in some
rare cases I get the backtrace logged at [2]. It is unclear if it is a
result of this series or not. I'll investigate it further later on.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/
[2] https://gitlab.freedesktop.org/drm/msm/-/issues/27

Dmitry Baryshkov (15):
  drm/msm/hdmi: move the alt_iface clock to the hpd list
  drm/msm/hdmi: simplify extp clock handling
  drm/msm/hdmi: correct indentation of HDMI bridge functions
  drm/msm/hdmi: switch to atomic_pre_enable/post_disable
  drm/msm/hdmi: set infoframes on all pre_enable calls
  drm/msm/hdmi: drop clock frequency assignment
  drm/msm/hdmi: switch to clk_bulk API
  drm/msm/hdmi: switch to pm_runtime_resume_and_get()
  drm/msm/hdmi: add runtime PM calls to DDC transfer function
  drm/msm/hdmi: implement proper runtime PM handling
  drm/msm/hdmi: rename hpd_clks to pwr_clks
  drm/msm/hdmi: expand the HDMI_CFG macro
  drm/msm/hdmi: drop hpd-gpios support
  drm/msm/hdmi: ensure that HDMI is one if HPD is requested
  drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 drivers/gpu/drm/msm/hdmi/hdmi.c        | 142 ++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  26 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  91 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 141 +++++-------------------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    |  14 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |   6 +-
 6 files changed, 160 insertions(+), 260 deletions(-)

-- 
2.39.2

