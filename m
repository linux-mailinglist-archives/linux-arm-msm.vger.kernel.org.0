Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5443458E5A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 05:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiHJDri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 23:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiHJDrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 23:47:37 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E207FE71
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 20:47:36 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id u9so16260205oiv.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 20:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oqmMiH/UG5akAdTqRaQ83MpJc5vNolPSY4pZFXlMR3U=;
        b=d2yNKN82ZsRLLnQyeZHfug7oj60n9rVTtuJzZxuzdA2uZr+3pJ7kKuFjVbqmF3FSBW
         4skQlE5iUTHLGyp/FuF0QBnJeWk00M4vjhk812IJfF+zPejn9uTSTwnZdqkQWxEzzvWT
         +UJ8W/NctdKqU9QGFk/qBy7m9x4vbvftfyItSygujwwLdh9VWOuL5YV52XadM5Fk323+
         FLJz8pGe3QfKGa39qGrPpl3hIF48ZYWfFtwm8Fn8idGijDnTzFMIS/FhBBFt6hG3NI72
         e8JW9VKueRF6q0kqHz2ghhWbwbuZP8DiC416SnZKnUJWzly5Qivzk2EzOZlt5xBEGRUt
         5NbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oqmMiH/UG5akAdTqRaQ83MpJc5vNolPSY4pZFXlMR3U=;
        b=Bvmev7sjU+pJPNWTdYBzBzakt5qG5/xvOS5FGNEnbyZSJbaaC3xH2yAMszfzvu/5s5
         EzcebiEWio3mngE0G9IUzqCK49AgY37RSQVIWWlByDcJlF9hz+CIF7qmLu/kKlBr90Wf
         xr4mmyNegHqsvz3PoIj1/lGs2nBIqg5+sPv5gH644qpckI4x35PmMl9M52yGirkoS4YZ
         MKoa5r3qQY9ehAZKb3q/GYyaG3HkQ1JG/w2ZphPb2w54DJ7yf+MXdaRVRoAFZMdEVRDG
         V+sTItwNJXtBexiyqFN2EqzO7x3EkA+GFqJLoVA2WQO+lO5aRaFsrzYyKzpnyWZxS3/a
         IlhQ==
X-Gm-Message-State: ACgBeo3xN8v9JxT/HjSWfT3DbcDRLGg/ctjL+H8GroAEyBN65JdkiDQd
        +26h7iTj7eSdz9uM/gv4njaRmA==
X-Google-Smtp-Source: AA6agR6LW5x3u433YcgepMxhYX8BW9RBRp7nZ1Z8Bewtym4fkGsFpK5iTiXaqxM+6e7a63AdFH4k1A==
X-Received: by 2002:a05:6808:ec3:b0:2ec:8fcb:1d4a with SMTP id q3-20020a0568080ec300b002ec8fcb1d4amr681609oiv.162.1660103255928;
        Tue, 09 Aug 2022 20:47:35 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:47:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] drm/msm/dp: Support for external displays
Date:   Tue,  9 Aug 2022 20:50:06 -0700
Message-Id: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce support for DisplayPort on SDM845 and SC8280XP, followed by
introduction of drm_bridge based HPD handling.

The version of these patches are restarted, as the previous
drm_connector_oob_hotplug_event()-based approach was abandoned and this only
barely resembles that effort.

In this effort the HPD handling is based on the reliance of the hpd_notify()
being invoked by a downstream (next_bridge) drm_bridge implementation, such as
the standard display-connector, or a something like an USB Type-C controller
implementation.

Bjorn Andersson (7):
  dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
  drm/msm/dp: Stop using DP id as index in desc
  drm/msm/dp: Add DP and EDP compatibles for SC8280XP
  drm/msm/dp: Add SDM845 DisplayPort instance
  drm/msm/dp: Implement hpd_notify()
  drm/msm/dp: Don't enable HPD interrupts for edp
  drm/msm/dp: HPD handling relates to next_bridge

 .../bindings/display/msm/dp-controller.yaml   |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c           | 136 +++++++++++-------
 drivers/gpu/drm/msm/dp/dp_display.h           |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |   3 +
 drivers/gpu/drm/msm/dp/dp_drm.h               |   2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 6 files changed, 92 insertions(+), 54 deletions(-)

-- 
2.35.1

