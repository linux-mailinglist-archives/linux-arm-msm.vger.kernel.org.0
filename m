Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5101F3433
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 08:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgFIGpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 02:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgFIGpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 02:45:02 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35309C03E969
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 23:45:02 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d66so9648029pfd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 23:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78YJd++6MCBi2czAoFZXzyiyrvV2k69cWVDs4OQn+lo=;
        b=t/nrsGr8iL1/BoJDB1p1upet1q7RmIROeK7bEKJ9cZ4CZDK9JDA7DrOHHZWQuRlJy9
         SHLBkPeQgt7/i735xV63sxeSrPW3aDxqIe2qafsUs40YBz+vR1+gFct+f3nhsfeb+FKd
         9L/vBl28GMgpO9ynJs0BhsnxOCam7/eBpT/N/CFXzk0+p2lxk5oNRydca6mFAnUyx4Bv
         Z7v+am3PKvBOAeuuOp2aN8STSymwCjhUsQbC4lLTp7S6HhrshxD11sjGZod8ffi3QTEw
         d6g9XbjM40uNjxg7LsuTUa4vxJHPmPy8vcH0BMkMzKFnmLukun+x2iCFe3YnrIDKmTfr
         CWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78YJd++6MCBi2czAoFZXzyiyrvV2k69cWVDs4OQn+lo=;
        b=WA92n+zJY1GKveA0V9ChOFyINOab28ysc/uYf0NKH9HAFYxkK4qKhPS/R/jFJ5xCFM
         JR2RKrzjLYOpT5LR5N+clN8ZgRq7xX12fnDKDOIujvRTu7SxPqmqHzfm38GWdMjuWCvL
         5UtapPaR6o/vemCSpO5eGtxFoHW1aPrY6KUcp4hnxZwb2sz5WksUqoFqEU1l5gsrGBMe
         nmYwxa168nzLD4rfvGmiAfWEetTAWGmLSdcm949vz6yrTCP+k9kN3JlIfZDvl7kD8IzK
         3RifvYcyhztR1pj541PQwuzmHL0LVnKNZnS7oBcgsD1uydEdb5P+/1987WsVIlwzhGau
         1OQA==
X-Gm-Message-State: AOAM532ac0/2OElRr/bc2oTMCjcmo+0UvItvAolXa/ECPa7nNgXn0MrX
        s66jnPQjrcEZRm664I7fjcK73A==
X-Google-Smtp-Source: ABdhPJzzHJ2cZxqknv0bUpqxO4eV9Txk0TkcHbipkebWGGkPuiPsGng15YmIaWcMDZ5/YRmsQqJMjA==
X-Received: by 2002:a62:cd87:: with SMTP id o129mr23636055pfg.74.1591685101324;
        Mon, 08 Jun 2020 23:45:01 -0700 (PDT)
Received: from localhost ([45.127.45.147])
        by smtp.gmail.com with ESMTPSA id b4sm8944451pfg.75.2020.06.08.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 23:45:00 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codeaurora.org,
        manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/3] Add thermal support for SM8150, SM8250
Date:   Tue,  9 Jun 2020 12:14:53 +0530
Message-Id: <cover.1591684754.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Add two new compatibles, the devicetree entries for the thermal zones and
wire it up to the cpufreq cooling device.

Amit Kucheria (3):
  dt-bindings: thermal: qcom-tsens: Add compatible for sm8150, sm8250
  arm64: dts: qcom: sm8150: Add thermal zones and throttling support
  arm64: dts: qcom: sm8250: Add thermal zones and throttling support

 .../bindings/thermal/qcom-tsens.yaml          |   2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 811 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 766 +++++++++++++++++
 drivers/thermal/qcom/tsens-v2.c               |   2 +-
 4 files changed, 1580 insertions(+), 1 deletion(-)

-- 
2.25.1

