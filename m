Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A064CC967
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 12:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfJEKlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 06:41:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39309 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfJEKlv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 06:41:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so9965156wrj.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2019 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aw37vOBbBkbz/6eeQpQQebEhTdPnXBVYhPJICR6GWEk=;
        b=iu2UidzNbGoPVZH9z3gqUJ4dpe50KWJPYLXeRPYzYh9rT+HybDZSElGqMpSeDFFwIJ
         TUv53EKs1WrMNI2mOPcN36Ax5Ad5hamKsBXWP89Lt8k+UFho4l63YF59+jH2dFa+BtD3
         anzJ7E5l1rgZJIWhGDH5VPWXYSXJQLCwX+djMRUIspe1j1qAGQyznx6VWSxDX/tSBuwC
         voVY43jzRv0fINz8ndCnpj7adNHCN+7uQTjsN+JhgI4Iu8CHBQXqOThWI2glgAl2YlPC
         4gqUtJYg+iSjHeMGIpvfpj5CpJVnyU246uL+80kVOOMk6g1yhZipAeRZPGliOHgwezz4
         nBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aw37vOBbBkbz/6eeQpQQebEhTdPnXBVYhPJICR6GWEk=;
        b=BW8ZEvv4m6mN7dj+2k487uX3xRcyEhYkdAHV2XHayfSDgKvbqcTyVg2VZrey+PXbL1
         fJE88dr/cAMf9ufi4W4UM99PF7Z1ZeCCTB/llPQynWz9YszsibsGRfNCM3Qsdg5Otxga
         Qq2PAnnZ0LEbZy0F1xGRSxkRNkZisErE1Xk9/uN9xR4RTaFbBIBmTGdwWqyECBqO3I15
         qfHyn/MLlDF8Vh2aFE1wl5jaCg+dfjqo4oTMRgsbGc6E+ldcsYVmNP3Z7skLTaVTl3Sy
         WcN18C2NBRCKNQej0NJBGY8P85jr4wMOBWK1zAQ7gSynmLh8DO8dfCvYLzXb6PhAwI9r
         CDTw==
X-Gm-Message-State: APjAAAWFoM5A62DQdYFzKi7IAs6SGftNlDzYiuY2HMnq5SUrsoeB1Z8u
        flIkimCWzdNTsFdzjL+PqzT+RrsfNzZjNA==
X-Google-Smtp-Source: APXvYqwWMl6ik/LLtJtzFhc/KnPTOdjgQenXo4JxDBnIYFvI0sScz71/ZtXVNlYbbvhogcvzgiv+uA==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr14966830wrr.152.1570272108520;
        Sat, 05 Oct 2019 03:41:48 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u4sm16471674wmg.41.2019.10.05.03.41.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 03:41:47 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH v3 0/3] Add TSENS support for MSM8956/76
Date:   Sat,  5 Oct 2019 12:41:30 +0200
Message-Id: <20191005104133.30297-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the TSENS support for MSM8956/76 using TSENS IP v1.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC.

Changes in v2:
- Switched documentation to YAML (Amit)
- Changed code style as per request (Amit)

Changes in v3:
- Added suggested kfree in calibrate_8976 (Amit)
- Also fixed the calibrate_v1 for missing kfree(s).

AngeloGioacchino Del Regno (3):
  thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976
  dt: thermal: tsens: Document compatible for MSM8976/56
  thermal: qcom: tsens-v1: Free memory in calibrate_v1 where required

 .../bindings/thermal/qcom-tsens.yaml          |   2 +
 drivers/thermal/qcom/tsens-v1.c               | 176 +++++++++++++++++-
 drivers/thermal/qcom/tsens.c                  |   3 +
 drivers/thermal/qcom/tsens.h                  |   2 +-
 4 files changed, 180 insertions(+), 3 deletions(-)

-- 
2.21.0

