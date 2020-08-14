Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59FE4244F51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 22:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbgHNUyj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 16:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgHNUyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 16:54:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCACC061385
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2020 13:54:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w25so11264708ljo.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2020 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=1FDKw0O5eWt4YU9CAFYlMQLGqQJ37dmu6qNrHuMqcRQ=;
        b=arhmDL8vT23JBvzxpJv91eUUdxiZXfmUexqllb1641LB0jGGd+HkHFMfCe3n3UDz3S
         dMUKeWEZwQYhpfYmGD/43DeFiRPlX8/536nYrg/WvhEqZOabilD0V9JYMjINp7jEAjJ5
         uDZXWUSaRky02uqIayG9p8wT1uq7Uunp7ArTqKk5JGC1DT12IR6DRgqbmSgyakg9/Edm
         E7dhMR6zP+9azLjLYkWUGo/a0oUGBvdyP4INGy3FuSk1vYGE1x9a28udmHb7ZKW8R4GR
         yRt+5pQyM7pVx3Q7jjtkydu3a62isTD+46eotZSyNxw3sLYfrAReo52CNCK3txPlppq4
         WDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1FDKw0O5eWt4YU9CAFYlMQLGqQJ37dmu6qNrHuMqcRQ=;
        b=qcySTU7ehl2aDQxUEClGGBcWcAcXVAMwe0eDNYLed1oXWVysdPRgmYBCzTwMI/MwZ8
         QAMoFTPX8ZeOiYW9SNuHvvb1Nlypw0ZTYwovmDrZjtQpmPuQflz9OGmYHOEAfYaFuUpY
         ZZbjAepN64Vv4BS9c+x895FKu77NCiSVXPPF96ACNicWe/3PbpihFN82OwCPxJ8NRg0A
         ENF9+HixqyjgCbeF3WM3V5V70xWU2dlRE/FNKMKv976XAiUMeRPXXVpU/mKm264R5yOu
         YeHtZPGcWHoOSXb36c1kJZXa/NdeXphAOgr1NQs9mJx7r6tfofMUGmOYSueFVv9szg4i
         vbqA==
X-Gm-Message-State: AOAM531YYX3PY16zyXbz3YxcssoLYLDNx3jUEBdzr4Xws4+omOENjTLl
        FjP4gGb8IAOEJG1KJyfITRJ+ng==
X-Google-Smtp-Source: ABdhPJwBV78C0P4u8Hc+zfdCX6Itq38Fw/gxcSmfDj+x9xJUcP+9+mfQEk7F/t+DrDJiIOhXragm4A==
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr2054347ljq.289.1597438476455;
        Fri, 14 Aug 2020 13:54:36 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id j26sm1963601lja.111.2020.08.14.13.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 13:54:35 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 0/3] media: camss: extend VIDIOC_ENUM_* ioctls support
Date:   Fri, 14 Aug 2020 23:54:00 +0300
Message-Id: <20200814205403.27639-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first two patches add mbus_code filtering support to VIDIOC_ENUM_FMT
implementation, and VIDIOC_ENUM_FRAMESIZES support.

The minimum and the maximum frame size values are deduced from
__video_try_fmt() code.

The third patch replaces harcoded limits in __video_try_fmt() with
the definitions introduced by the second patch.

Andrey Konovalov (3):
  media: camss: Make use of V4L2_CAP_IO_MC
  media: camss: add support for vidioc_enum_framesizes ioctl
  media: camss: __video_try_fmt(): don't use hardcoded constants

 .../media/platform/qcom/camss/camss-video.c   | 112 +++++++++++++++---
 1 file changed, 95 insertions(+), 17 deletions(-)

-- 
2.17.1

