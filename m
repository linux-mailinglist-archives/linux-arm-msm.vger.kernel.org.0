Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50EA3A47C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 19:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhFKRVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 13:21:18 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:44842 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhFKRVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 13:21:18 -0400
Received: by mail-pg1-f176.google.com with SMTP id y11so2978962pgp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 10:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSdDmWvM+qzpAmf31JtYtbWsLIaOjDvF/qkbEZxua7o=;
        b=ggi+grjzzCRdXuViwFNZ33p2WAyiVmcb/ctIQAx0vKFlNqqkWDAcOCQlJ2tD+tWH3f
         vHh3ZHEGEdsBHoQkEvf2aK5IrHI0b9Rp9HuEMrMx3Zg3QrgJ6HCD5ZHwoQ9iDYKKEGOL
         n4zZlGgTSOPC2tHPAi73dnkyRDdmTgC9zev+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSdDmWvM+qzpAmf31JtYtbWsLIaOjDvF/qkbEZxua7o=;
        b=VOwzAWv9cyRtxkdyRXj1uOfMOd09p3qt6nvjTu34ruq26awbdBOaKmI5ljA2I5BdZK
         6a5bpjxNYy/T+n7fg0x5GwaqHcQZykxoC9fNXrpdHExltCYy4dOvBwawhbvqWnAiM/pn
         huLYq260dTX0I6HE+/jM/v/0ajA0jI2orLeCw9XKdiLoUir/ciHNtcA3Dgy2mQfUGGds
         43cCTxRqinuDJvROnc+kn9egdvCuB5ykEikbjaewQOt4YaORL16Vn0aqkENjWq2KVSCW
         c4U6iJLD3qbJ3CyLnxQo2dbXaZJ/hf0lbLrwSRU8oytyAZEQDLnR8uzx6dWufP0opI1/
         9r4w==
X-Gm-Message-State: AOAM5302pCxRdrVvY6GZE6TWe9KWZMk4REe7/vPOvouoj3sVj9TfMgOc
        YwcJjgBjhnUuIgJFwP4U+uO49w==
X-Google-Smtp-Source: ABdhPJx78EglKulG9xe66rpTctZdSqRdhziUHbpBUTfaQeV6/K8y/AfhL7r9eoLmbB9vsD98/A0eBw==
X-Received: by 2002:a63:a50a:: with SMTP id n10mr4663164pgf.13.1623431885813;
        Fri, 11 Jun 2021 10:18:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:4128:5428:5cd0:cfa5])
        by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 10:18:05 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 02/11] dt-bindings: drm: Introduce the DP AUX bus
Date:   Fri, 11 Jun 2021 10:17:38 -0700
Message-Id: <20210611101711.v10.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We want to be able to list an eDP panel as a child of an eDP
controller node to represent the fact that the panel is connected to
the controller's DP AUX bus. Though the panel and the controller are
connected in several ways, the DP AUX bus is the primary control
interface between the two and thus makes the most sense to model in
device tree hierarchy.

Listing a panel in this way makes it possible for the panel driver to
easily get access to the DP AUX bus that it resides on, which can be
useful to help in auto-detecting the panel and for turning on various
bits.

NOTE: historically eDP panels were _not_ listed under their controller
but were listed at the top level of the device tree. This will still
be supported for backward compatibility (and while DP controller
drivers are adapted to support the new DT syntax) but should be
considered deprecated since there is no downside to listing the panel
under the controller.

For now, the DP AUX bus bindings will only support an eDP panel
underneath. It's possible it could be extended to allow having a DP
connector under it in the future.

NOTE: there is no "Example" in this bindings file. Yikes! This avoids
duplicating the same example lots of places. See users of the aux bus
(like ti-sn65dsi86) for examples.

The idea for this bus's design was hashed out over IRC [1].

[1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v9)

Changes in v9:
- Commit message now notes aux-bus yaml won't have an "Example".

Changes in v8:
- Separate DP AUX bus binding is new for v8.

 .../bindings/display/dp-aux-bus.yaml          | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.yaml

diff --git a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
new file mode 100644
index 000000000000..5e4afe9f98fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DisplayPort AUX bus
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description:
+  DisplayPort controllers provide a control channel to the sinks that
+  are hooked up to them. This is the DP AUX bus. Over the DP AUX bus
+  we can query properties about a sink and also configure it. In
+  particular, DP sinks support DDC over DP AUX which allows tunneling
+  a standard I2C DDC connection over the AUX channel.
+
+  To model this relationship, DP sinks should be placed as children
+  of the DP controller under the "aux-bus" node.
+
+  At the moment, this binding only handles the eDP case. It is
+  possible it will be extended in the future to handle the DP case.
+  For DP, presumably a connector would be listed under the DP AUX
+  bus instead of a panel.
+
+properties:
+  $nodename:
+    const: "aux-bus"
+
+  panel:
+    $ref: panel/panel-common.yaml#
+
+additionalProperties: false
+
+required:
+  - panel
-- 
2.32.0.272.g935e593368-goog

