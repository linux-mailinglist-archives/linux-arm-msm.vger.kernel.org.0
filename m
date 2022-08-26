Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889735A249B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343577AbiHZJjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238963AbiHZJjc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:39:32 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573569DB41
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w22so1043860ljg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=VeJT6TambDYpE2R29D5H9btEkRqd26ppCcO4LObDeKk=;
        b=PqHJaHohZYwsm/CV439/jAsas87s0RNPbSrywTlt2XGjyomH/MTwJqOrsWzSFFQMTQ
         vaZmlQdxuPI7z3gmHCq3pbqaXk6Z2esxQhDPy7ETKu0O/Yo3My7k8JfAflQ//2hHenTy
         XMtzeSsgDdsn4VXR22zoazGO7Zy0hT52NHsfzgG8JV0MR3LQSdbJBqpZ8wj+uzxx542r
         ppMVtgIVH0sCPyzk4PHyrtgBBrX29Ap8PyM6QWxRclJYeBVU8t4sIm7sRDHi4e2X1JCb
         cM7ZY8VirzSqE6h9GyPWmR8mvCOVsyRu3Qr1Gae+I95bVyGN5kidODIYsmXxU0Fi0y3u
         bmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=VeJT6TambDYpE2R29D5H9btEkRqd26ppCcO4LObDeKk=;
        b=f2cI1KosXONPFuCDm/UPBdnmq47QrpzzLLMJQ6/ixMZM8/MC5l/KEuCkGNMO5fLMP6
         2rgygW7xzTQh8EUBdMAszVr6e26+uUncMItObkRs5WMwpiWRmdDNA8zS5l9tTVEJYgsr
         YTR3RcGi1BSER+fRyujC+GKUAtdgPTxty5UQrS90ejIPLvSpHNL0E7WgsffmWFRiosaq
         flymicp4K9J9TB7k7Ko8/ZYVMSrnMq2K5V/5eCv2+9Z+YGgajfT2pHlDkPi7VdGV9AXF
         oukGuhy04d2APW/hHa0wG15e3h8xACnKJVme/k6edDv6/Wl/lmtPEMvSFbQ2Jeuiczwt
         t9bw==
X-Gm-Message-State: ACgBeo2rVtGaWHs80yu1hicMBlMOdGjft1AsTgFbfVegxaRYYjqO0iMA
        lXmzPe8dU+hqUYzf1ZjFqqbxdA==
X-Google-Smtp-Source: AA6agR6PiH5e9EgjVJ3S1NHkzUw9Zid8iMhCu5LWfb+2bIn5w5XIKzzL7wkJNzmFuI8/wm+2YKr8gw==
X-Received: by 2002:a2e:8443:0:b0:25e:21ef:952d with SMTP id u3-20020a2e8443000000b0025e21ef952dmr2213447ljh.403.1661506769254;
        Fri, 26 Aug 2022 02:39:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 02:39:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/5] drm/msm/hdmi: move resource allocation to probe function
Date:   Fri, 26 Aug 2022 12:39:22 +0300
Message-Id: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

As pointed several times in the discussions, start moving resource
allocation from component bind to the probe function. This simplifies
boot process, as the component will not be registered until all
resources (clocks, regulators, IRQ, etc.) are not registered.

Changes since v1:
 - Moved a call to msm_hdmi_get_phy() to msm_hdmi_dev_probe() too.

Dmitry Baryshkov (5):
  drm/msm/hdmi: use devres helper for runtime PM management
  drm/msm/hdmi: drop constant resource names from platform config
  drm/msm/hdmi: move resource allocation to probe function
  drm/msm/hdmi: don't take extra reference on PHY device
  drm/msm/hdmi: move msm_hdmi_get_phy() to msm_hdmi_dev_probe()

 drivers/gpu/drm/msm/hdmi/hdmi.c | 348 +++++++++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |   3 -
 2 files changed, 161 insertions(+), 190 deletions(-)

-- 
2.35.1

