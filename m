Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67277217E2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 16:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjFDOpT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 10:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjFDOpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 10:45:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EB4B6
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 07:45:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f6148f9679so2640607e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685889915; x=1688481915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxZWGXFLzU5SjPv5ySU8WvbrkPwdtjbQ7fatHEgs/dk=;
        b=miw8oSyMD6hAqoknkccaxzELs8RXrO+IjJlpakE8SFO/lGd1TlTqBMTdOuC4kOuMfa
         CVMKCRZGtEjOC+BFuoc+cGBpIYmtLmOeIxOZ3df2MOv743FPnoXmos8mBG0z1rM80P8R
         vV5Y60uwGfwaTyheP6hK5yMwRxy63PllqJ967lvL3GtN4aODqJMgGoUTxGooZgocrTTy
         tKgJ1kJ0h2yReGPwBUCMOOGNwDG8LXKdBp0Ek7AE8UxwzKE0LuUvaWMm8xn1GAiy6HYk
         UqQzH1delj3v+3DsVs765Cg4+h5MUwJEyInFYIBFvkDmdD37rveYJABwbmsf913t+1CV
         hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685889915; x=1688481915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxZWGXFLzU5SjPv5ySU8WvbrkPwdtjbQ7fatHEgs/dk=;
        b=AMN2ZPOlu8d5GBH0+dZuE2fpdi9VHmVjOgNxN3Oylv92NaKVmKexRNxFCqIA3afLlo
         1csgA+r+YVjk7imA8oCC49UwJxwLEp5ikm26JuP+0i4R5bTJyOtA95UE7GYipjqVnAdK
         VU2X0NOtaemrKK6TqrXuetHm82OtbCbggeeFe7GM0/jN2eSzsVajMTEcWkE0UUbx9SVQ
         QJBOwqXzftDbFP7aBojTFtKaYoqAuWTRGnDctpq7HZhOIH018zMiSUGmM/z6IgJrnxjh
         F4hrMP3NkF8KqfGzK4dNirgO2AGERjb39L+GlAkt5HTEKjy11ReG12MqmipAc4yWikt0
         LrMg==
X-Gm-Message-State: AC+VfDxr0ndNpb1s+N4hrEMUZ87MX2rwa9YsAqVAWfQcMKQriwucl5WB
        BlpChKHNUuobOnaeTA3B/PVpoiacx2X4VSJg8CY=
X-Google-Smtp-Source: ACHHUZ7yILlKBacoYg0phC6bYxRhDyQn5tt//vNZh6TPswnOOCFQJt647INfiAG+7lN5v/5QT5N85A==
X-Received: by 2002:ac2:46e7:0:b0:4f1:3d7d:409e with SMTP id q7-20020ac246e7000000b004f13d7d409emr4493775lfo.0.1685889915437;
        Sun, 04 Jun 2023 07:45:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020ac25216000000b004f42718cbb1sm788912lfl.292.2023.06.04.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 07:45:14 -0700 (PDT)
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
Subject: [PATCH 0/3] drm/msm/dpu: remove dpu_encoder_phys_ops::atomic_mode_set callback
Date:   Sun,  4 Jun 2023 17:45:11 +0300
Message-Id: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

Dmitry Baryshkov (3):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 79 +++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 11 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 93 ++++++++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 61 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 34 +++----
 5 files changed, 152 insertions(+), 126 deletions(-)

-- 
2.39.2

