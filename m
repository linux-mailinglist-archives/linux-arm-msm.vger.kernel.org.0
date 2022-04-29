Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3235154FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380443AbiD2UA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 16:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380444AbiD2UAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 16:00:54 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BD624F35
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:34 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id g16so6231906lja.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoZVXCo4PMfF55omjM7YESeLUJqhypGsaVY7dLN503Q=;
        b=bkgLHFwubWrPKnMuEYQefQWDeremPVQH/eSVjhBgMhUuK/sxKYpc66AmLZM5J1hpKS
         K3hpEuAZ6/osXCkuCDHm4KVG7Nk9alHhxQ0RsnHV64QQ3Nw0ciBSzti2EuXYVesmkJaP
         JP47+jP3nfFVgjq+9q+Xh6HossCwup/Q+7At4wl8gLwl5/HW7c/d9hkQZzzzgkoM00yK
         h9BYyatL93MDIHqwLIoCkdyNb54vvcRnx5zlTt91b9nc00oJ25cxDxt84dbpgOQcg0qp
         h3Oy6fLU8VAb+sSU0TjLiGyM8rV3BIlBEE0YfYJQNeOlzFQDBVDlknc+b3aFIafVI5Vr
         Tsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoZVXCo4PMfF55omjM7YESeLUJqhypGsaVY7dLN503Q=;
        b=Amx1ud7Kumq0Eemd7lA3T2LwAQLizswXEbQ2r40NJ48a0hgnnVsriYsJdqjHGoAyCs
         NAGVG88E6AH4AxH/xxBaXCa2C/6KOPlc1Jz24eKMYqUMPqE/jLx4tWELYWKOgkOPXpDS
         zidicJCBfihlfHzbF6TEktR6czkbueDso38wXypNpiG+AnfN0o7UhtpuIsZo5qCU+jCx
         +YJscYq0eADdvfrXqV34JDUf1n5kCWsjsWTV0QdzDHZFbodfJMJ2cSww72sqXMPijcir
         uuuzSQUWKz/29TOFW1dMKJfATOc3iylBbkjE4AWENlxp0ldjhQbeu3H4Z7zDNIZ23F7x
         NOwA==
X-Gm-Message-State: AOAM5330RB3KuKg/EvG7YqfrgJyQ5ce1qJpNoXsnmFbw5SsiREOZ9XLe
        5WHxihZMCJH0fXuudUAa6szL8w==
X-Google-Smtp-Source: ABdhPJz4llIbCvxmbrWzkABIucHFj0SM6GnoCuD0aecJuHKOPn5IQBJAd4jcKQJJytop9bGcBm3coA==
X-Received: by 2002:a2e:a30a:0:b0:24f:cf6:11ab with SMTP id l10-20020a2ea30a000000b0024f0cf611abmr474751lje.461.1651262252816;
        Fri, 29 Apr 2022 12:57:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:57:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 0/5] drm/msm/dp: implement HPD notifications handling
Date:   Fri, 29 Apr 2022 22:57:26 +0300
Message-Id: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

USB altmodes code would send OOB notifications to the drm_connector
specified in the device tree. However as the MSM DP driver uses
drm_bridge_connector, there is no way to receive these event directly.
Implement a bridge between oob_hotplug_event and drm_bridge's hpd_notify
and use it to deliver altmode messages to the MSM DP driver.

Note, I left the original 'bool connected' field to be used by the
notifiers. However I think that it should be replaced in favour of using
the dp->hpd_state properly.

Changes since RFC v1:
 - Incorporated old patch dropping old usbpd code. Most of it remained
   unused.

Bjorn Andersson (2):
  drm: Add HPD state to drm_connector_oob_hotplug_event()
  drm/msm/dp: Implement hpd_notify()

Dmitry Baryshkov (3):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event
  drm/msm/dp: remove most of usbpd-related remains

 drivers/gpu/drm/drm_bridge_connector.c   | 17 ++++--
 drivers/gpu/drm/drm_connector.c          |  6 +-
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 +++++-
 drivers/gpu/drm/i915/i915_drv.h          |  3 +
 drivers/gpu/drm/msm/Makefile             |  1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h         |  1 -
 drivers/gpu/drm/msm/dp/dp_debug.c        |  6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h        |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c      | 65 +++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +
 drivers/gpu/drm/msm/dp/dp_drm.h          |  2 +
 drivers/gpu/drm/msm/dp/dp_hpd.c          | 67 --------------------
 drivers/gpu/drm/msm/dp/dp_hpd.h          | 78 ------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h        |  1 -
 drivers/gpu/drm/msm/dp/dp_power.c        |  2 +-
 drivers/gpu/drm/msm/dp/dp_power.h        |  3 +-
 drivers/usb/typec/altmodes/displayport.c | 10 +--
 include/drm/drm_connector.h              |  6 +-
 19 files changed, 82 insertions(+), 211 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h

-- 
2.35.1

