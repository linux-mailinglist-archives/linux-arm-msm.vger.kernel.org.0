Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703FE38F699
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 02:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhEYAEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 20:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhEYAEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 20:04:08 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E18C06138E
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:38 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id f22so13799510pfn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W6ypAeNUyTw13+ot10ZJQCb7zwm92rirhMuMnGlmdIU=;
        b=FFPgxCLKPIvWnLs03iIgcyr6GE8zQUZQ8sRvcNzu/YD7cj4TPN4zWLQ3tH6so65zkb
         vJQaqSDWEWJD9nuU1vz0F+NdT65YWQM54V+JBtu3Ft2hIkfFeseFYai001oLOoRBfQ1F
         yreunhpuNrtcArkMUGoQaiZc8CD5Gi/QCl/ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W6ypAeNUyTw13+ot10ZJQCb7zwm92rirhMuMnGlmdIU=;
        b=P9a3p7vHQfyFZsBTGj3P/72ufCHYDIyLiDmWoqnslIz6TQplb+Abh98hDdLd/9l5pn
         O1CqvFJNgfLB7ntbVOpwwf5gZrCBAfnEJewwbyGu79YG/8vratMTKaKNWacw4/NIHpYX
         I0bWswk6JBmfIxHav2BwKhwHaOGJP3VnhLIQ2KeSDTH8h8ZVmQB2ocK7Mx7CC+1xJWAl
         KmRv1fuIypR6v6cZHleSCCjOgUM6FIq5gaUl//hrrSTf4iz/r+Tl5yD1YxqH9gMbP1HX
         wT5aSMmpi9GwaiY5+TnzY2ChPEbUkTpIV+tcOz0M39XcwnKpEOzouyKV+UkCvCo+z3O0
         pmCw==
X-Gm-Message-State: AOAM533KfVuL4mX5EQcwf8yNYDm3bsNBQLscPHLptkOzgUHlSvwM7d8z
        NapTkpUCrbM06R5oOULE8N0xlQ==
X-Google-Smtp-Source: ABdhPJz+LC13pDsPvIBJY/vfn0G6QTA8D2JN1gmx11Mo7iFbBxGuzCfte4L/NJ0jWk9GQJjvTVI8vw==
X-Received: by 2002:aa7:8556:0:b029:2e2:45aa:d01e with SMTP id y22-20020aa785560000b02902e245aad01emr25395634pfn.14.1621900957855;
        Mon, 24 May 2021 17:02:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
        by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 17:02:37 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 01/11] dt-bindings: display: simple: List hpd properties in panel-simple
Date:   Mon, 24 May 2021 17:01:49 -0700
Message-Id: <20210524165920.v8.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HPD (Hot Plug Detect) signal is present in many (probably even
"most") eDP panels. For eDP, this signal isn't actually used for
detecting hot-plugs of the panel but is more akin to a "panel ready"
signal. After you provide power to the panel, panel timing diagrams
typically say that you should wait for HPD to be asserted (or wait a
fixed amount of time) before talking to the panel.

The panel-simple bindings describes many eDP panels and many of these
panels provide the HPD signal. We should add the HPD-related
properties to the panel-simple bindings. The HPD properties are
actually defined in panel-common.yaml, so adding them here just
documents that they are OK for panels handled by the panel-simple
bindings.

NOTE: whether or not we'd include HPD properties in the panel node is
more a property of the board design than the panel itself. For most
boards using these eDP panels everything "magically" works without
specifying any HPD properties and that's been why we haven't needed to
allow the HPD properties earlier. On these boards the HPD signal goes
directly to a dedicated "HPD" input to the eDP controller and this
connection doesn't need to be described in the device tree. The only
time the HPD properties are needed in the device tree are if HPD is
hooked up to a GPIO or if HPD is normally on the panel but isn't used
on a given board. That means that if we don't allow the HPD properties
in panel-simple then one could argue that we've got to boot all eDP
panels (or at least all those that someone could conceivably put on a
system where HPD goes to a GPIO or isn't hooked up) from panel-simple.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- Explain better why HPD needs to be in panel-simple in commit msg.

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
2.31.1.818.g46aad6cb9e-goog

