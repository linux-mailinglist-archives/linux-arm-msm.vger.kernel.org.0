Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85975515472
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358307AbiD2Tcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 15:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239127AbiD2Tcu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 15:32:50 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA14CE48A
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 17so11673048lji.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3SvLk5TP6P/sVxT2lEncD+uRqoDF7TswQoR3K12ke84=;
        b=kOkUoiQ1zgTce1LEq2rQ1z8p6CJcKQFmPCJtg9pz5utZMffMXK2JVqROIrmEwNRvdJ
         tgyaTh7nwZMkv/Auvm2XGfYqHDe8NJEBiqkTj8wesaG8NlhfmyVfy8KhQfHQj2TB6o5o
         zvFoOYDJp+ROD0smBvQE3zbj1/9bCkly3WLJaGctXDuRG8EtsKpMeS1UidIY+GDYuetU
         pGJiTZvXBpuNI/Kvm4iLjiAE1L2qnkB2WSmQcPxutpNVqNjgWCJSxLNdeP2OwgSM/oZo
         ZanuA0xHZyYb6jxcBi6I9rYk1wjYbAAhgUM+MDoeIIysKVSsrum0bNvsbEiknkvOvO6X
         Q27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3SvLk5TP6P/sVxT2lEncD+uRqoDF7TswQoR3K12ke84=;
        b=wPGoHaVFj16Zf5IKnoVHWt8cxgaA+q7lm5NO0jRPPTWfTGONQsY3DWJ1nxYZX1sx7M
         ABA92MOLDyHZDUO05GPnyQHLw9FOQJMLxDfW3srBkmWphimYGtKQtrfeqHvzNRJiRe3q
         fFkeZU12XvvqUjQqskxv8Q5W4TrHjo3SHfF4Xm5ZBqmb6PjZam4yZuYt6cJB5CsBOvYy
         TmHcCzkIGfMeiZDxjCcizh1J/Pvv/mTydt+HEKOQjZ9GVC4cfMwWFPhGv05mo2AQp1hS
         Yn+3Z1bOJmgtnGNnUg/6QLnXhg9LrWGIBoiCir8Q4u5NzKdUd5UMfPW3RaQL+DJisTGX
         VCZg==
X-Gm-Message-State: AOAM532RTjFqMdUkJIgF035+Ftu2V5bKBda4hchqbC6drw9l4/0G2Gkg
        4e+FU+XIB+Qpu/roaQceR9ROrgA7+G0ATg==
X-Google-Smtp-Source: ABdhPJzmJFI1u3ls6UXLOa+wli7Vrojk5Tfom13j11M/XsobZcxiKnXIvykm4/P+EmLL8BF8Zm5Fjg==
X-Received: by 2002:a05:651c:311:b0:246:1250:d6f with SMTP id a17-20020a05651c031100b0024612500d6fmr411264ljp.455.1651260570270;
        Fri, 29 Apr 2022 12:29:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y10-20020ac24e6a000000b0047255d211e7sm5522lfs.278.2022.04.29.12.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:29:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 0/4] drm/msm/dp: implement HPD notifications handling
Date:   Fri, 29 Apr 2022 22:29:24 +0300
Message-Id: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
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
and use it to deliver altmode messages to the MSM DP driver

Bjorn Andersson (2):
  drm: Add HPD state to drm_connector_oob_hotplug_event()
  drm/msm/dp: Implement hpd_notify()

Dmitry Baryshkov (2):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event

 drivers/gpu/drm/drm_bridge_connector.c   | 17 ++++++++++++-----
 drivers/gpu/drm/drm_connector.c          |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
 drivers/gpu/drm/i915/i915_drv.h          |  3 +++
 drivers/gpu/drm/msm/dp/dp_display.c      | 11 +++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +++
 drivers/gpu/drm/msm/dp/dp_drm.h          |  2 ++
 drivers/gpu/drm/msm/dp/dp_hpd.c          | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_hpd.h          |  5 +++++
 drivers/usb/typec/altmodes/displayport.c | 10 +++-------
 include/drm/drm_connector.h              |  6 ++++--
 12 files changed, 83 insertions(+), 19 deletions(-)

-- 
2.35.1

