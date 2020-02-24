Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B424B169F01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 08:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgBXHUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 02:20:32 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53670 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgBXHUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 02:20:32 -0500
Received: by mail-pj1-f66.google.com with SMTP id n96so3774598pjc.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2020 23:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pp4OJKlkTUP/JKWBsfGX5IGPygvYeWUCLyYPIlFud78=;
        b=IZOmGdk3jvbALg78q+Ogcc/os8rR7kNvGziTpMuqqxVshDSb7T0/n5kLOgxiYvrD6L
         FsaIT/opnfyAbJqctDkl/nSg+/poz+r/XpgrWrCj0upAr29DF+L7hRl6W4XhxLudNiZy
         mQLaah2Y3ds1XjtYfOSm9hQLGA8Fp+1cwAg+ZoVnIAJkSf+i0RN6yxwnEfj9WAoj1QP9
         3cCkaSDjwRYAy9gTaNUU81Rp+oHJn4ppYGFivh0T0knTRTQnKpNsuGoto8fVCwI2NNKS
         N78wCh30Yi+vNrdi6ujUkU1bDTZ7+FjVlQRwtYpE3nNUngzpsG5Jp9vpFUfwl1Z8H12w
         8FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pp4OJKlkTUP/JKWBsfGX5IGPygvYeWUCLyYPIlFud78=;
        b=nED4rEOZRYbS5YLx7fgzE+HZhBgdXJmZ8Y2Z5KyzE6/A01M4FfMKCAZx1jGMS+FrdI
         073vTIpOD3MsbuqJjAskzgIYYI7CJ2AtRT4IOtBNCEnSLaSm77TeU3J90qplEGeSWjXb
         hmfEIFENNWARnjtIItI5qj1TQSR3BKB8uH+apU6S/p0Kzd+F3+A1pwEcC/n5iGDn66Tm
         /fLA3CA7nItdD7fXjfbhY47PqMiiSPDV9mvOu+NVT/MHSMJpIHMvKgZCFR6GHRxnTz4w
         cldACVXXduS6XCh8UlQVZhiauOqYI98lQ8cAsr2rqmX5l2ytyqECOIAuBjoOOj6kPxWk
         TFXg==
X-Gm-Message-State: APjAAAUq/U6xMFOP1dB+uB8BKkhmWObe0rCh697ebbwKFXBnfcWaSjkl
        3rDO3D8KmaTIiHTJXe1bK6ErGQ==
X-Google-Smtp-Source: APXvYqy3jXvJE7VyZtpKH6rIFhGNbXxpgKh1xaZZt9uPKJ3Z6xLRb6oa+wLz4XgROfrFkfGKGYes3Q==
X-Received: by 2002:a17:90b:4396:: with SMTP id in22mr18082228pjb.83.1582528831644;
        Sun, 23 Feb 2020 23:20:31 -0800 (PST)
Received: from localhost ([45.127.44.57])
        by smtp.gmail.com with ESMTPSA id p23sm11452767pgn.92.2020.02.23.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 23:20:30 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org, daniel.lezcano@linaro.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [RFC PATCH v5 0/3] Convert thermal bindings to yaml
Date:   Mon, 24 Feb 2020 12:50:24 +0530
Message-Id: <cover.1582527752.git.amit.kucheria@linaro.org>
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

