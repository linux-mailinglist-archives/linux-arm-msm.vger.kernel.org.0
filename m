Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDBB37A87B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 16:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhEKOIY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 10:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhEKOIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 10:08:23 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A917C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:07:17 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o16so25291212ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hZ0fq1XLkr+7t54txjyF+prLq/e+EJtKN2/VBK9RqRA=;
        b=dJURLIRtSfLefeJ0dcskE0iV5FpV6mgBo25GlNtfOZjMliO6zTmKvVZVxFzlsB2bmo
         sUHy6L4LkcEF/kIY/vqeCXUVrkAwKP7ygfYDH/+Mdu5lIKnNlcWGmi7ixgVHk0DKlWLe
         2dYj6GkVqmw1bAI1c7v5rgWLPeEByxLJeZAneZKVPamkqLi/0AfYGIOTGVUWFbyowbzE
         9aLEiH9K0N2+AeJJNWtqu7yJFg2yzHPqsiXSYf+sxkO0NgNgPjB6y5850MMvqYhm9rL2
         qmTLS6hr5ucJzkW8B/pokv0fM9RmOzyIVRnXI0lrwS2bNAgTGUihkOhubKKlfasoBU2L
         bF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hZ0fq1XLkr+7t54txjyF+prLq/e+EJtKN2/VBK9RqRA=;
        b=nY4L8U4xeRtt/aDvv2H+hoQMUKz5eYGMGKnsOPyDG9N38FIBiEuOKoGdNFAF4f1SQB
         UDDF8AWQou1xhNhijCfrc3XQr+q/N6Mmc7V+aOju8XzcKbY74sbLQvmgE04n/ac894d2
         Ic21DUV2dFcTE/ZgeGzgbn5RlgPyPOEbksuxR+u7HJORNB71EUritI0dEmnZDwg0SpzZ
         SL1wbW7aHgifdc0LMt/r6D+XxRkwtOLPwDVfzNrRWyvbLUwwL457moMpniJAOuv9Ba1W
         6CvmW7Y9Aynv1I8J840HdZRfpujBrTzvQhg3OVrtiLyOhv1w4FooKP9QJciILe/JXWwt
         pDSw==
X-Gm-Message-State: AOAM531hKLtoA+iNkvjMK6s6Bjtt385/ilpFLkcy069DY4sSUOcWjsgf
        zFRCZiNISQ/MMtwDNrosVvRkug==
X-Google-Smtp-Source: ABdhPJz9YOOdjQ4oxmJ6lSPtpWVUQ0/h45QufJe3bMsUIvFF+oyfpJ6RYNrR7A6BWcRzy3v8BqdsAg==
X-Received: by 2002:a2e:5045:: with SMTP id v5mr24736463ljd.270.1620742035852;
        Tue, 11 May 2021 07:07:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w23sm3731989ljw.59.2021.05.11.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:07:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: rework clock handling
Date:   Tue, 11 May 2021 17:07:11 +0300
Message-Id: <20210511140713.627291-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify clocks handling
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 --------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 ++-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 ++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 ++-
 drivers/gpu/drm/msm/dp/dp_power.c             |  81 ++++++-----
 drivers/gpu/drm/msm/msm_drv.c                 |  49 +++++++
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 14 files changed, 164 insertions(+), 358 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h


