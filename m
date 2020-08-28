Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0D8255E28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 17:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgH1PtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 11:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgH1PtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 11:49:15 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD42C061264
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 08:49:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h19so1799550ljg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DATJ7eGMNLZCyNQeCZmAD8QoZWEBPYduaVIGDRd+5bc=;
        b=nzknUlPzMEIXFNOmpAbizHT3DoDelUgK0gNjKN4NA28tF+mhCDf/obNn2844u6eUGX
         aNot7EshiEXSmo5UIm6ANs5Mh9g4rDHT6KoDEtILrgIGcRrZrhPsFD1v+jIpvWbzwjlK
         G4QakOu0thp0ddFdr+8CIXpkSqq3vYMvhqTTZLIKHm8sefuqUo9Na31PN2VilvVS/z2c
         PalifO5pdSm9IEnmr440qwaNW/A4hRIX1zpJqBF8culOIruNvswChUt7qD6DuL+hZZNr
         jxSkus74eluryEUOW6H2F5hrVi8xx0gJyrnKoImGkTJ64CwlWlQ5mnue74BSoqkeRVAc
         /DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DATJ7eGMNLZCyNQeCZmAD8QoZWEBPYduaVIGDRd+5bc=;
        b=ELcw8A16vrpvQqI6Hu1XMkuOJLHMMYG1PBzyUZiZwMieE4t7wihsKQh24gfjl8kSUR
         p5Yvv02z1ptseZGPFQxXh0aizSfUxQPBA5AS/yLhSZN/nT3encZXtrNDyd7gfLNaRCbY
         TGD0HXhS0AaSmoAlyI2ZhxH0R589GLPrSKL3OF+RfD7qffmLklmoZLk3X02iHareuPlv
         /FYlQX86VwhMqujm/kEt2jKiaC6jArFvTrnULrhe6aDV8LT2sROIWXhJ2XOuM+M3dW5u
         HG+vbprwR+DmmXqLSd9MnG76A4v02she7XdPhAvnuRW2EkaYODseWVyU2GVHLcUlYWQA
         WpnA==
X-Gm-Message-State: AOAM533k6dt7g2paf6RFrKn4tfq6hzkSk294QcKjfifIWkfRcQjUATjN
        KOjsKOqMTyk/3pMvCk0OCCcIng==
X-Google-Smtp-Source: ABdhPJziUwmaraoePdxpXH3+GScZIfhka4CTJabY988lQZeK6M/194Z8ps7rwFVxsT6VoII+kzN8kA==
X-Received: by 2002:a2e:9c96:: with SMTP id x22mr1228969lji.337.1598629753199;
        Fri, 28 Aug 2020 08:49:13 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id r16sm270215ljd.71.2020.08.28.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 08:49:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/3] Add LT9611UXC DSI to HDMI bridge support
Date:   Fri, 28 Aug 2020 18:49:03 +0300
Message-Id: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series adds support for Lontium LT9611UXC bridge chip which takes
MIPI DSI as input and provides HDMI signal as output.

The chip can be found in Qualcomm RB5 platform [1], [2].

[1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
[2] https://www.thundercomm.com/app_en/product/1590131656070623

Changes since v1:
 - Fix whitespaces/indentation
 - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR



