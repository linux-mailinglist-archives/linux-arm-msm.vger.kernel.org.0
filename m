Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA12665C1DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237783AbjACOWd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237757AbjACOWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:22:33 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87276267E
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:22:31 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso13075279wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FOheBM0S2+JbMMoxIwLqXXDKGtNhRlPkusnCew5bM4=;
        b=ctNJKAEB0mC5xYQFtNHesl28Mc05r11ifa4IUriehLf+mhL5e6FKXp7H+WgunJWKUe
         OQ+rDSbO0PXbiAUHpFZnQ5oWutvB+cQF9Z1NnrKggR8ObQ7xWhcX6jLvHkullHf8fXkO
         GC7AQomyAL+o3uOPS74g6UEKvTm7Lr5pNhv9Tv/3fZxrX8iXMjzOjS5aIVwWEdE/OQSy
         NODstBHDq3QhRdsw74lzoJTC3RshAplsYgqVm58vuk6I6vgxBsHKnXc6FSgjSJF4nCXs
         BIZvyND0DA3SzfLcY57mFkwhoPs7qmRZcERRx+gYw+QJJ0kg5nFczeOUzqJnuaFlI3/8
         igUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FOheBM0S2+JbMMoxIwLqXXDKGtNhRlPkusnCew5bM4=;
        b=WVSD/0WY8a3gZYy0nQJYFSbuM73mALKuxRPFupPRX3EP6cI6G2UtABx4xoMppT36Si
         sahdQl5bf6XLTUjEEmfQcZI3UVWIvOT7m5yMs713xbAULy/J+S5icuYZrx2qc7cq/qWr
         WDYrb2n1OukmDXFupGc6BsjSn/zKGhzUyVVllJg97+E2nkNDCGauEbMvepCkPtL04E2t
         tpc5TSG3P0p7wqhZtMg5Wn0W+KvAPjb6+S+BcOLnNHMeu2R+q2OqdWjTXuepUioMcATJ
         xi0IYDflpycUdYmVmV1A6CLPfPs9bzoewzpJOHz73aac352jxX5MmxaixIP2leMdxa/u
         A+CQ==
X-Gm-Message-State: AFqh2kqGHFmiEchBBUku+LNSHGtS7Blp4fF8Q8pWGTKio6ObEpHQ/VPF
        /EfnFo+TgCMPZ/5QGlhJS4e12A==
X-Google-Smtp-Source: AMrXdXsKXqoBbrs912bxVrgViZoH9V38nCKH47rX6chFwc+h8PeTtZ9ZXS9djAEtUCr9hEqt9XJ7IA==
X-Received: by 2002:a05:600c:1e16:b0:3d1:d1a9:efde with SMTP id ay22-20020a05600c1e1600b003d1d1a9efdemr34972107wmb.12.1672755750093;
        Tue, 03 Jan 2023 06:22:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i6-20020a5d55c6000000b00283c7b5ee3bsm20182163wrw.101.2023.01.03.06.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:22:29 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] drm/panel: add support for the Visionox VTDR6130 AMOLED DSI panel
Date:   Tue, 03 Jan 2023 15:22:27 +0100
Message-Id: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACM6tGMC/x2NQQrDIBAAvxI8d0EjSdN+pfSw6qYRjJFdEwohf
 6/0OHOYOZUQRxL17E7FdESJW25gbp3yC+YPQQyNVa97q422ULcSPcg6DYOGvUhlwhWOGng0VkPB
 TAnmyQQMj/uILqiWcigEjjH7pcXynlKThWmO3//79b6uH1S6CNyLAAAA
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the 1080x2400 Visionox VTDR6130 AMOLED DSI panel
found on the Qualcomm SM8550 MTP board.

By default the the panel is configured to work with DSI compressed
streams, but can work in uncompressed video mode since 1080x2400 in
RGB888 fits in the 4 DSI lanes bandwidth.

While display compression is preferred for performance and power
reasons, let's start with the uncompressed video mode support and
add the DSC support later on.

To: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Neil Armstrong (2):
      dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel bindings
      drm/panel: add visionox vtdr6130 DSI panel driver

 .../bindings/display/panel/visionox,vtdr6130.yaml  |  53 +++
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    | 366 +++++++++++++++++++++
 4 files changed, 428 insertions(+)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230103-topic-sm8550-upstream-vtdr6130-panel-f81dad976abd

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
