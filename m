Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D9D262BCE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 11:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgIIJ2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 05:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgIIJ2b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 05:28:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D278C061573
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 02:28:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w11so1232047lfn.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MunoKbh/mt3H7lKJf79ktTfGntL6Z6LhfrQgiCHvIt0=;
        b=xYrRG15tBl3EKH48BODgSIXjSHK9GvhyCOHe98qe0iEPpBdwOu0PETaA4pgHWzJBBz
         mg3y5T3/xWTmCJ7Nona7QJzkKZys+nNojYOdussbzaEf3He8duDodk6+W82MeWu52xBH
         eeWoAn8la8U7AbWQArldO9G5zW91jXUJazs7jAaU7vFmtWrf2TPixkJeZz+uOrGDknpY
         ssw6O+bHoEjdDlUc1yCDsKW4SOmT/KdyXExA1e+cSRsf5sjUV/n80irrIfWUtMgnJZPv
         MJcunv4r9FjXYIc1ri1T63cGJfzyF3vBdsHZgR6O/poWKwiKTJSck35f2s+zedKfqmBL
         WU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MunoKbh/mt3H7lKJf79ktTfGntL6Z6LhfrQgiCHvIt0=;
        b=lzrLutwwrr+2lsGYV2Z38EJt8UqG2A1xT19/1qDOyCufCMaSiJ4WSUYUCU1Qesot04
         9qM2R37/fOt9HptBzjgUIZ5wUOdOzq3k3iofGmVxddmI0iiuhNaey4S3HrWOkeJPtsXN
         qdBUjVcRL3kNFVQLGx0qaJC4qF13aetAHA7JKGZf8EsoVa/MIpanLL53oQoPu+Ye7f3n
         WP/3eee2q0aBauqe3e27VIqJEpBk1Exqo+4RDb7PebFDX+AqaTmdrM4geL3Cgd3YX96n
         xqe9WHudszypIqQvyvDMxD0pmuLD+FLBgGnel9CXPJqcTokQZOQ6S3YUq22E2/qKSnRc
         Dwqg==
X-Gm-Message-State: AOAM532Jj73YTQs/PzLX2RFB9opYeghTAlgQxUevNR1S1eqhIdwQXaM0
        RVAzeEzCzKov1BLmfrhl4sce2w==
X-Google-Smtp-Source: ABdhPJyicE9PL6knTzn66V6urc6P++oQ12ZB7nsNSQ4c6++ZUi7LuVSJu+yJNh+4T8Ela5lSm+wg2w==
X-Received: by 2002:a19:8386:: with SMTP id f128mr1552340lfd.78.1599643709402;
        Wed, 09 Sep 2020 02:28:29 -0700 (PDT)
Received: from eriador.lan ([188.162.64.180])
        by smtp.gmail.com with ESMTPSA id s8sm595870ljo.11.2020.09.09.02.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 02:28:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 0/2] Add LT9611UXC DSI to HDMI bridge support
Date:   Wed,  9 Sep 2020 12:28:21 +0300
Message-Id: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
 - Squashed connector support into main patch
 - Added comment on modes table
 - Dropped display timings support, covered by EDID
 - Dropped sleep mode support
 - Dropped hpd_status reading from ISR handler
 - Added "sentinel" comments to empty table entries

Changes since v1:
 - Fix whitespaces/indentation
 - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR


