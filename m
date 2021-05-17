Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CEC3865D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 22:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhEQULH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 16:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236794AbhEQULH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 16:11:07 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A95C061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:49 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t11so4310663pjm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+urYn/auWJUjc3W4sdmPucnZoewzDoUKh0jwgsir+nQ=;
        b=RJIYA2O4giqjYO66q0SQpXcr1odgBXvF0aQ7MZWxCqHVao92mTCpdHiAQvvuOvnWb0
         VZxZOmXubCqnouWsB4I/kkQdT1Im1eoL3aSwrMtqJyVTC9wk2bixTA8YpNXujs3ebJNq
         UgdlMPwUrXlBTiOUWlGJKj96af58fxXxVUckM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+urYn/auWJUjc3W4sdmPucnZoewzDoUKh0jwgsir+nQ=;
        b=fjZn6ugd1nyc9DeHgboJe40UTRgagyHsDXzHQ1EFZ89k3jI/JIAM/3M8UV/Pks76kw
         3iFLOXpK8yzF9QStkndcio78Ar17P5OuKenMwi958ibtCXQZFHQW9z/tEnYKA//iCzI7
         +v5Hin1OuncAOYFV+8jRBb2vBt2khW42HQ/pm6zL/VdtQTMN0jxEXD927ZgnLE5NgVOR
         PjtezPJCGi8Pu8QGdyoXuFfFOmoCS1luV9iJLGH0C6Fm88shQoPNGeGc32FsR4eDB73y
         2kyOBMqDwFTa427TWDow1erMQpuk/rh2QkKf2BSZj/GfK5eQ42m2d8nsHFQ/Vpiow3ND
         tOhA==
X-Gm-Message-State: AOAM531anCMBZk99ZDIeSEfuYTtbR5pu8u7Czfn8c7FNCKH/iZ+L6cM9
        uAOCfBIeACyVvqoDuRM57LbRow==
X-Google-Smtp-Source: ABdhPJzqYY2WqAKQmfMbYwBASkiXd/jkLCuXy99v9JmQQ8Cmyq311d8LnPThMxqgk98rM3Md4cOG2w==
X-Received: by 2002:a17:90b:188f:: with SMTP id mn15mr1153919pjb.219.1621282189154;
        Mon, 17 May 2021 13:09:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:bc91:c597:ded0:7930])
        by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:09:48 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, robdclark@chromium.org,
        Steev Klimaszewski <steev@kali.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/10] dt-bindings: display: simple: List hpd properties in panel-simple
Date:   Mon, 17 May 2021 13:08:59 -0700
Message-Id: <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These are described in panel-common.yaml but if I don't list them in
panel-simple then I get yells when running 'dt_binding_check' in a
future patch. List them along with other properties that seem to be
listed in panel-simple for similar reasons.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I didn't spend tons of time digging to see if there was supposed to be
a better way of doing this. If there is, feel free to yell.

Changes in v7:
- List hpd properties bindings patch new for v7.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b3797ba2698b..4a0a5e1ee252 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -298,6 +298,8 @@ properties:
   enable-gpios: true
   port: true
   power-supply: true
+  no-hpd: true
+  hpd-gpios: true
 
 additionalProperties: false
 
-- 
2.31.1.751.gd2f1c929bd-goog

