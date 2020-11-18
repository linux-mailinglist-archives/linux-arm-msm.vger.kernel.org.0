Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2DF2B8298
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 18:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgKRRDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 12:03:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgKRRDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 12:03:17 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55442C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 09:03:17 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id c17so2866405wrc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YU4/VDfrF6SXnta/ZtzFGixkNuFm7oEQTxiBQ1MOvE=;
        b=DcCauwZODG9C9KDCCHwf5zbBDn8+ph91my9YgOYBkYeuOJUURcKUXo2Q92GxqVrnT4
         6ESMO8UR63avWUk7hm5ljw5V4CLAzDaIqrMxuq3+NzNO5PvXxTDnFJubeqFAIb3QlTLw
         dFPCUU0hS0EipKsUFkmSV3YqEQ40L/K3O4bh91C2/adgPG+l2rwEECe1ry08I11rEfxV
         Hje9quBPbQIAsbe2KyS8hTv7qsyB26U+eJm+unm7TFLJ/0V8HYwudBUuBBMGTCYBL0rI
         70pnC1hGniV2kPvtYV36xscNR4X9B3gVWO7GrFpGbK83/mUmU+FnvihTcIf2jG13HdGj
         GEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YU4/VDfrF6SXnta/ZtzFGixkNuFm7oEQTxiBQ1MOvE=;
        b=KO3MbbeDxqH7WQ0UlKaU3XgCqcfXN1bJHZV8YMb5GPSSgHdoN9jLE0U6uSS9cclKB4
         guzLlozJqOFCCGL8g4nwIyVVTq1SE3NDM79OaCL/5wzHh2ZDn7YFeP80xxA4yJBm+rpO
         lmAJOdtYPqd1p/pgvG2Uk2pYlINwyVP87VbbX2w02Zsp9udxf5PH4RgjaDNQboZu2V2b
         D62sNCAyUqvz8R5g9BIzE2nLMYQXv80M0eDP2T4J4MuKRVMjgHg0OBA8Jy/4jJSyN8/4
         VmgCKq4p16VgAMfixGpc/jBdRUh7apm35OR0b+QDguE7sr40NQr/63mBErAmhkR23CkN
         Lm7w==
X-Gm-Message-State: AOAM5313yaG7BdgA76mXQwycH6X89T/PuQlXIRayeYBETIGbzAPcXxuT
        4DbMjfNUJsLRud31iLQKAQszgA==
X-Google-Smtp-Source: ABdhPJwyafVZ5A61NzcRtYd9kIdiWBDwYv7z0pyImojRPLzHk57fiuxR7JwVCGidvBGKaDcufEoR8w==
X-Received: by 2002:adf:8284:: with SMTP id 4mr5950124wrc.386.1605718995969;
        Wed, 18 Nov 2020 09:03:15 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id x13sm44233wmi.20.2020.11.18.09.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 09:03:15 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     srinivas.kandagatla@linaro.org, srini@kernel.org
Cc:     bjorn.andersson@linaro.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] slimbus: qcom-ngd: Add SSR and PDR support
Date:   Wed, 18 Nov 2020 17:02:44 +0000
Message-Id: <20201118170246.16588-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm DSPs support SSR(Subsystem Restart) and PDR(Protection Domain Restart)
which usually restart the associated services!
Current code does only relies on QMI channel notifications, but there could be
race conditions between QMI notifcations and actual PDR/SSR events.

This patchset adds support to these two events to address those race conditions.

Tested it on Dragon Board DB845c.

Srinivas Kandagatla (2):
  slimbus: qcom-ngd-ctrl: add Sub System Restart support
  slimbus: qcom-ngd-ctrl: add Protection Domain Restart Support

 drivers/slimbus/Kconfig         |   2 +
 drivers/slimbus/qcom-ngd-ctrl.c | 121 ++++++++++++++++++++++++++++++--
 2 files changed, 119 insertions(+), 4 deletions(-)

-- 
2.21.0

