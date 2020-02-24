Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5583169F23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 08:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgBXHZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 02:25:43 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35417 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgBXHZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 02:25:43 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so3688336plt.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2020 23:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pjmsw2c59UnP8bQTcR0v67l8n2Do0c3ipHd2w0BLgDw=;
        b=UAvCFsUkzi4NHTluHdWcn5wDT40ImYUMrkXDGvP+rlkh34aMNX7VR3G6cWJsG+C5kv
         VBXTaD07DS2Ntcv58V5c1jaoS+2kQSHxDDmLxOZ4MhBqVL+l7ozf3PlwOJYLy9Axl8QC
         raFopR/h6T4KN2OeT8yN+bdaxAvNCupz0mfDAv5/sdtuZjq7mSeAPkLD8VokSpzm3FSb
         XlfPvxQm2Rcbvwm+AusMJbH6xWMYEGJCldE481V0edXktO8xO3HyvQgC/Ni7+Jtb6wZh
         3MJ2Y9HI9QOABI4QjFkzEWy5Tglwf/5nGxtvr+SywIIkbcHru4PQnZ5rnMLXFcBXTTup
         ePPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pjmsw2c59UnP8bQTcR0v67l8n2Do0c3ipHd2w0BLgDw=;
        b=HtMayuOB6HH7hbRF3bCbDEmjHIa0lDgC8s3eDKNNyqBPVplBHFrQH3+aqxSgN11PVx
         NiyaR+3udr9O/F2m7IYb3nkggIX1V8ylPSKI/OYZo5jvGrwdvBwQYjsQ+AryzDn3aC+h
         zOufXRxNT6irFtqNKssMnDUFOFr/wzUQ9hAtJbkQM4QukioMoLC4D42Df4OXz2KmebKx
         roUaPgA+5oaSvP+V/oiMevj14I7t9KUw+gpxsZrzB83uiKBg2hCth5DLakdRN32oNFMe
         Yhxp8wVrYjjqOps9ngTsxT8GOrS/xJZJVPRaJ7sY693je2vgmzC4PYN2QCH77iETeVXO
         ujCA==
X-Gm-Message-State: APjAAAVUTtkpMoRreWgq18afIzn0GLZtdj55tTByGM2ItIGccYTepyIt
        OsPCInYgz6Ff1Xo5K4ulhqTYipgNkuU=
X-Google-Smtp-Source: APXvYqyuEjegHI+TTFtAPD15xyrk4kjVIQfTd/OCLyY41lTTSOjgFzLRwSNoHBoQ46H6DvZt+SXzKQ==
X-Received: by 2002:a17:90a:d801:: with SMTP id a1mr19064921pjv.34.1582529142409;
        Sun, 23 Feb 2020 23:25:42 -0800 (PST)
Received: from localhost ([45.127.44.57])
        by smtp.gmail.com with ESMTPSA id e6sm11360185pfh.32.2020.02.23.23.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 23:25:41 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org, daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [RFC PATCH v1 0/3] Convert thermal bindings to yaml
Date:   Mon, 24 Feb 2020 12:55:34 +0530
Message-Id: <cover.1582528977.git.amit.kucheria@linaro.org>
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
Since I was learning about YAML parsers while creating these bindings,
there are bound to be some issues.

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

 .../thermal/thermal-cooling-devices.yaml      | 114 +++++++
 .../bindings/thermal/thermal-sensor.yaml      |  70 ++++
 .../bindings/thermal/thermal-zones.yaml       | 302 ++++++++++++++++++
 3 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/thermal-zones.yaml

-- 
2.20.1

