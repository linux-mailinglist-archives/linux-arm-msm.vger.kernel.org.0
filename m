Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF99192126
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 07:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgCYGfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 02:35:03 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:37914 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgCYGfC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 02:35:02 -0400
Received: by mail-pg1-f182.google.com with SMTP id x7so677206pgh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 23:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XDUtIM4paHW0qOUeTkKt8AFyM+VSRp0AScAk260LK2s=;
        b=CKVkfHoj/nZYW3irz1TY3+48Q6839881dDZMIU45L1EzcFqwV35P6C6D5VXZbnAfkI
         tu5oq99VfrqvYMrRTwHB+ffrmsUeO73kq5AywG8YIxrLJCU2JQ/m4mjDnhLIzlbXAzG5
         SRjKCWBaMUvDV2WOmQ4X6Q+w+Y9osPekTs/ID/BqAvIoLpSOxc4HnScud9yLgNY22BV3
         XhTQUN0ixUIwXaFqK8DGM6gfhGPLErBzVqy3pfNHNisbhISiExCGQI7vp9FMuVZt4C0C
         1SSrq1Tf/01TtmFIebam6DXTtX0/R7oIq+0/GGSm9kuQOxGawvfTylFbGYn01s8Kc9fv
         mqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XDUtIM4paHW0qOUeTkKt8AFyM+VSRp0AScAk260LK2s=;
        b=JBT/yupnJbb3rXd/cSH9eQ7G7fg0JfuZbYjXIaN8RH4KRS2qUQJf023GppZ9+GYE8J
         Rqc+pdMzZyKfH5nzYfyQD56UcIf6oPI3QcAtdMlt7IG6hvqX7WkkZ3MvpHrvey1KV55W
         YRRJzID6oHdfsWlCWQXfUAjjvQ8u95zltSTBdnPqQ+iaRS/OcTdsku7XfiSLqA97M9VZ
         LoGmqlfPVubKCePdmnV/R/8nzG1IdB+OxVIn+4VS9tjKotPOvkbJBmmMOOyxNGlTfDH1
         ZMRUZGeSE8y5mLgxn+65xo2Dhzl7gvWdha8qWA2A6JFNl2UUVJUttjKXRo1cJPct44EU
         D/ug==
X-Gm-Message-State: ANhLgQ2pew0Qv4MY51qlC41crbsPWL/oo17xRhsMcvjUKAx8hkLtqeUt
        HS0PrSTJ76MQCiFz6MXk52kecA==
X-Google-Smtp-Source: ADFU+vvN3H7QGlUvfXSacv91SL0XLSkc7dVACoE1ob84EaxILfcJuRko4ery4B/XIUxIwrAPyWlDqQ==
X-Received: by 2002:a63:da4d:: with SMTP id l13mr1705064pgj.216.1585118100212;
        Tue, 24 Mar 2020 23:35:00 -0700 (PDT)
Received: from localhost ([103.195.202.71])
        by smtp.gmail.com with ESMTPSA id d26sm4059263pfo.37.2020.03.24.23.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 23:34:58 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org, daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v3 0/3] Convert thermal bindings to yaml
Date:   Wed, 25 Mar 2020 12:04:51 +0530
Message-Id: <cover.1585117436.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

Here is a series splitting up the thermal bindings into 3 separate bindings
in YAML, one each of the sensor, cooling-device and the thermal zones.

A series to remove thermal.txt and change over all references to it will
follow shortly. Another series to fixup problems found by enforcing this
yaml definition across dts files will also follow.

Changes since v2:
- Addressed review comment from Rob
- Added required properties for thermal-zones node
- Added select: true to thermal-cooling-devices.yaml
- Fixed up example to pass dt_binding_check

Changes since v1:
- Addressed review comments from Rob
- Moved the license back to GPLv2, waiting for other authors to give
  permission to relicense to BSD-2-Clause as well
- Fixed up warnings thrown by dt_binding_check

I have to add that the bindings as they exist today, don't really follow
the "describe the hardware" model of devicetree. e.g. the entire
thermal-zone binding is a software abstraction to tie arbitrary,
board-specific trip points to cooling strategies. This doesn't fit well
into the model where the same SoC in two different form-factor devices e.g.
mobile and laptop, will have fairly different thermal profiles and might
benefit from different trip points and mitigation heuristics. I've started
some experiments with moving the thermal zone data to a board-specific
platform data that is used to initialise a "thermal zone driver".

In any case, if we ever move down that path, it'll probably end up being v2
of the binding, so this series is still relevant.

Please help review.

Regards,
Amit

Amit Kucheria (3):
  dt-bindings: thermal: Add yaml bindings for thermal sensors
  dt-bindings: thermal: Add yaml bindings for thermal cooling-devices
  dt-bindings: thermal: Add yaml bindings for thermal zones

 .../thermal/thermal-cooling-devices.yaml      | 116 +++++++
 .../bindings/thermal/thermal-sensor.yaml      |  72 ++++
 .../bindings/thermal/thermal-zones.yaml       | 324 ++++++++++++++++++
 3 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-zones.yaml

-- 
2.20.1

