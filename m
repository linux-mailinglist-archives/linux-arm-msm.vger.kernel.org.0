Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC46C2F63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 10:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733193AbfJAI5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 04:57:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42323 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733158AbfJAI5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 04:57:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so14423395wrw.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jf0qq/6M1y/pYHL477ooXocXaFUXbSFNjwKwh+Yh2zQ=;
        b=bcdA2lm2hQRw0ifFn0Z8vkLiL1Qzbi87uSc3KQei7/kzjSuv1sE2VWXvwQg0mcrqQt
         SaAJ5irDLJFNw3c5Wdnh7ga2N82XbaUzxuWkTKcE68N2vC3ETa/s4vV9ViLgLMulHMAU
         qRNYXID+JHY8tshNYBWzvY3Vk1EqUp1loy/qww9qKj3VdNisY/BOJmGK3bF5iQE8QDoX
         JSkgNamX7MY2XGnktJqFQjmbFFCZu93N5jBRzqBj+Ewvv2rxvPdP4sHujBNb849emHuA
         MkzCgNIvjdGfxCAJ1UJZm+HKYDcxSBmH0ZFyqemokt3uwMZ3yOg8rGVqVrHAlyeq4ldB
         XomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jf0qq/6M1y/pYHL477ooXocXaFUXbSFNjwKwh+Yh2zQ=;
        b=ti/Djy2hJ7s6uSyKR4r4v0YfvCK+dH1NgwJKJpOYf0g5/1o9B5vKex/dFHedgk2RRg
         uBQ8VI79dVlZF9sY4uiTsdSbVomkqAmLnlhZ0ZIxwDPDodFsIpiFCK0ZuVoodHUaaRjV
         X0jaoExc0s/dfcjsmxPn06aRZ+R77XwIOwWH8FlqGaWJHrs/wmBJj7VIWhNpcvOQ+qtr
         I+fYoDFh1D3NlOqQQ6ye/oRCKb6Ut7U1bvqvwrL6qt+vGA75KZCPRhhq9geVuBbYJiDy
         gZlyTXFZDTCIXDpGSTbrzZkl42nxTOebyyQ8It7rrvWXmCHTvplw6uNaEAXnyLG51Sei
         S4aQ==
X-Gm-Message-State: APjAAAW+8A542e2R0DHACjdsWW3sKR8VTZspR8V2302Ws2530Nx9GbbC
        SRC4rXJW6vlv7Nm+SfIggahkY73LVi4=
X-Google-Smtp-Source: APXvYqyZGUoKzk1JPwZk0CZyDdRJyelt1MZM6g324TUm0Ameg+lYrmq7HMyFcJms/S41Y4bL3iLEeQ==
X-Received: by 2002:a5d:49cb:: with SMTP id t11mr16143620wrs.158.1569920238566;
        Tue, 01 Oct 2019 01:57:18 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u68sm4600611wmu.12.2019.10.01.01.57.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 01:57:17 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH v2 0/2] Add TSENS support for MSM8956/76
Date:   Tue,  1 Oct 2019 10:57:05 +0200
Message-Id: <20191001085707.8424-1-kholk11@gmail.com>
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

AngeloGioacchino Del Regno (2):
  thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976
  dt: thermal: tsens: Document compatible for MSM8976/56

 .../bindings/thermal/qcom-tsens.yaml          |   2 +
 drivers/thermal/qcom/tsens-v1.c               | 167 +++++++++++++++++-
 drivers/thermal/qcom/tsens.c                  |   3 +
 drivers/thermal/qcom/tsens.h                  |   2 +-
 4 files changed, 172 insertions(+), 2 deletions(-)

-- 
2.21.0

